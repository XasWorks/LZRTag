

triggerPressed = false;
shotsRunning	= false;

shotTimer = tmr.create();

lastHitTimestamp = 0;

disableTime = 4000;

munition = 8;

function timeSinceLastHit()
	tSinceHit = tmr.now() - lastHitTimestamp;
	if(tSinceHit < 0) then
		tSinceHit = tSinceHit + 2147483647;
	end

	return tSinceHit;
end

function canShoot()
	if(not gameRunning) then
		return false;
	end

	if(timeSinceLastHit() < disableTime*1000) then
		return false;
	end

	if(munition == 0) then
		return false;
	end

	return true;
end

function shootIfValid()
	if(not triggerPressed or not canShoot()) then
		shotTimer:stop();
		shotsRunning = false;
	else
		munition = munition -1;
		fireWeapon();
	end
end
function startShottimerIfVald()
	if(triggerPressed and not shotsRunning and canShoot()) then
		shootIfValid();
		shotTimer:start();
		shotsRunning = true;
	end
end

function blibIfCanShoot()
	if(canShoot()) then
		ping(500, 4000, 200);
	end
end

tmr.create():alarm(1500, tmr.ALARM_AUTO,
	function()
		if(munition < 8) then
			munition = munition + 1;
			startShottimerIfVald();
			if(munition == 8) then
				blibIfCanShoot();
			end
		end
	end
)

registerUARTCommand(0, 1,
	function(data)
		if(invertButton) then
			triggerPressed = (data:byte() == 0);
		else
			triggerPressed = (data:byte() ~= 0);
		end

		startShottimerIfVald();
	end
);

shotTimer:register(250, tmr.ALARM_AUTO, shootIfValid);

registerUARTCommand(1, 2,
	function(data)
		if(timeSinceLastHit() < disableTime*1000) then
			return;
		end

		lastHitTimestamp = tmr.now();

		sec, usec, rate = rtctime.get();
		eventData = {
			type		 = "hit",
			shooterID = data:byte(1),
			target  	 = playerID,
			arbCode 	 = data:byte(2),
			time 		 =	sec + usec/1000000.0;
		};
		homeQTT:publish(lasertagTopic .. "/Game/Events", sjson.encode(eventData), 0, 0);
		vibrate(1000);
		overrideVest(500, 10);
		tmr.create():alarm(500, tmr.ALARM_SINGLE,
			function()
				overrideVest(disableTime - 500, 0);
			end
		);
		tmr.create():alarm(disableTime + 5, tmr.ALARM_SINGLE, blibIfCanShoot);
	end
);
