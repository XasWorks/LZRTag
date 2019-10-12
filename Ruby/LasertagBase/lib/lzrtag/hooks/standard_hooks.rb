
require_relative 'base_hook.rb'

module LZRTag
	module Hook
		class Debug < Base
			attr_accessor :eventWhitelist
			attr_accessor :eventBlacklist

			def initialize()
				super();

				@eventWhitelist = Array.new();
				@eventBlacklist = Array.new();
			end

			def consume_event(evtName, data)
				super(evtName, data);

				return if @eventBlacklist.include? evtName
				unless(@eventWhitelist.empty?)
					return unless @eventWhitelist.include? evtName
				end

				puts "Caught event: #{evtName} with data: #{data}";
			end
		end

		class TeamSelector < Base
			describe_option :possibleTeams, "List of teams that can be selected", {
				type: Array
			}

			def initialize(handler, possibleTeams: [1, 2, 3, 4])
				super(handler);

				@possibleTeams = possibleTeams;
			end

			on :gamePhaseEnds do |oldPhase, nextPhase|
				if((oldPhase == :teamSelect) && (nextPhase != :idle))
					puts "Selecting active players!"

					@handler.gamePlayers = Array.new();
					@handler.each do |pl|
						if(pl.brightness == :active)
							@handler.gamePlayers << pl;
						end
					end

					puts "Game players are: #{@handler.gamePlayers}"
				end
			end

			on :gamePhaseStarts do |nextPhase, oldPhase|
				case(nextPhase)
				when :teamSelect
					@handler.each do |pl|
						pl.brightness = :idle;

						if(!@possibleTeams.include?(pl.team))
							pl.team = @possibleTeams.sample();
						end
					end
				when :idle
					@handler.each do |pl|
						pl.brightness = :idle;
					end
				end
			end

			on :poseChanged do |pl, nPose|
				next if(@handler.gamePhase != :teamSelect)
				next if(pl.brightness == :active)

				pl.brightness = (pl.gyroPose == :laidDown) ? :idle : :teamSelect;
			end

			on :navSwitchPressed do |player, dir|
				next if(@handler.gamePhase != :teamSelect)
				next unless [:teamSelect, :idle].include? player.brightness

				newTeam = @possibleTeams.find_index(player.team) || 0;

				newTeam += 1 if(dir == 2)
				newTeam -= 1 if(dir == 3)

				player.team = @possibleTeams[newTeam % @possibleTeams.length]
				if(dir == 1)
					player.brightness = :active
				else
					player.brightness = :teamSelect
				end
			end
		end

		class Regenerator < Base

			describe_option :regRate, "Regeneraton rate, HP per second"
			describe_option :regDelay, "Healing delay, in s, after a player was hit"
			describe_option :healDead, "Whether or not to heal dead players"

			describe_option :autoReviveThreshold, "The HP a player needs before he is revived"

			describe_option :teamFilter, "Which teams this regenerator belongs to"
			describe_option :phaseFilter, "During which phases this hook should be active"

			def initialize(handler, **options)
				super(handler);

				@regRate = options[:regRate] || 1;
				@regDelay = options[:regDelay] || 10;

				@healDead = options[:healDead] || false;
				@autoReviveThreshold = options[:autoReviveThreshold] || 30;

				@teamFilter = options[:teamFilter] || (0..7).to_a
				@phaseFilter = options[:phaseFilter] || [:running]
			end

			on :gameTick do |dT|
				next unless @phaseFilter.include? @handler.gamePhase

				@handler.each_participating do |pl|
					next unless @teamFilter.include? pl.team

					if((Time.now() - pl.lastDamageTime) >= @regDelay)
						pl.regenerate(dT * @regRate);
					end

					if(pl.dead and pl.life >= @autoReviveThreshold)
						pl.dead = false;
					end
				end
			end
		end

		class Damager < Base
			describe_option :dmgPerShot, "Base damage per shot"
			describe_option :useDamageMultiplier, "Shall shots be adjusted per-gun?"
			describe_option :friendlyFire, "Shall friendly-fire be enabled"
			describe_option :hitThreshold, "Limit below dead players will not be hit"

			def initialize(handler, **options)
				super(handler);

				@dmgPerShot = options[:dmgPerShot] || 40;
				@useDamageMultiplier = options[:useDamageMultiplier] || true;
				@friendlyFire = options[:friendlyFire] || false;
				@hitThreshold = options[:hitThreshold] || 10;
			end

			def process_raw_hit(hitPlayer, sourcePlayer)
				unless(@friendlyFire)
					return false if hitPlayer.team == sourcePlayer.team
				end
				return false if(hitPlayer.dead && (hitPlayer.life < @hitThreshold));

				return true;
			end

			on :playerHit do |hitPlayer, sourcePlayer|
				shotMultiplier = 1;

				if((@useDamageMultiplier) && (!sourcePlayer.nil?))
					shotMultiplier = sourcePlayer.gunDamage();
				end

				hitPlayer.damage_by(@dmgPerShot * shotMultiplier, sourcePlayer);
				hitPlayer.hit();
			end
		end
	end
end
