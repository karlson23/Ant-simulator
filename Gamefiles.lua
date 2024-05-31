
--Player health
local HealthTable = {}
HealthTable.current_hp = 4
HealthTable.HealthLimit = 4 --Limit of HealthTable player can have
HealthTable.DeathNumber = 0 --number where game ends.
HealthTable.damageHealth = 1 --Amount to remove player HealthTable.

--mini game timer
local Timer = {}
Timer.current_Time = 6
Timer.LastTimer = Timer.current_Time -- number of timer used for resetting the timer
Timer.TimerEnd = 0 --number when timer ends.
Timer.SubtractTimer = 1 -- Amount to remove from timer.

local GameTable = {
	current_hp = HealthTable.current_hp,
	HealthLimit = HealthTable.HealthLimit,
	DeathNumber = HealthTable.DeathNumber,
	damageHealth = HealthTable.damageHealth,

	current_Time = Timer.current_Time,
	LastTimer = Timer.LastTimer,
	TimerEnd = Timer.TimerEnd,
	SubtractTimer = Timer.SubtractTimer
}


return GameTable