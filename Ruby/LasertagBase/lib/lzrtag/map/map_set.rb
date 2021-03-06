
require_relative 'map_zone.rb'
require_relative 'myMaps_parser.rb'

module LZRTag
	module Map
		class Set
			attr_reader :zones

			attr_accessor :centerpoint

			def initialize(mqtt, zones = Array.new())
				@mqtt = mqtt;
				@zones = zones;

				@centerpoint = Array.new();
			end

			def to_h()
				outData = Hash.new();

				if(@centerpoint.length != 3)
					raise ArgumentError, "Center point needs to be set!"
				end

				outData[:centerpoint] = @centerpoint

				outData[:zones] = Array.new();
				@zones.each do |z|
					outData[:zones] << z.to_h;
				end

				return outData;
			end

			def to_json()
				return self.to_h().to_json();
			end

			def publish()
				@mqtt.publish_to "Lasertag/Zones", self.to_json, qos: 1, retain: true;
			end
			def clear()
				@mqtt.publish_to "Lasertag/Game/Zones", "", retain: true;
			end
		end
	end
end
