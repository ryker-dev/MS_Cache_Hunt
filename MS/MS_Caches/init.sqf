if !(isServer) exitWith {};

_handle = execVM "MS\config.sqf";
waitUntil {scriptDone _handle};

_allAreas = [];
ALL_AREAS = [];
CACHES = [];
//MARKERS = [];
call MS_fnc_hideAreaMarkers;
_allAreas call MS_fnc_updateCacheAreas; //Sets the updates list into global ALL_AREAS variable
ALL_AREAS = _allAreas;
//systemChat format ["ALL AREAS: %1", ALL_AREAS];

call MS_fnc_createParentTask;
call MS_fnc_spawnCrates;

call MS_fnc_createTasks;
call MS_fnc_createAttackerTask;
call MS_fnc_createMarkers;

sleep 1;

[] spawn {
	waitUntil {count CACHES <= 0};
	call MS_fnc_endMission;
};

/*
	NOTES 
	1. Get cache areas format [markerName, [ [markerName, [0,0,0], [0,0,0]], [markerName, [0,0,0], [0,0,0]] ]
*/