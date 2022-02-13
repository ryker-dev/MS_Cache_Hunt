call compile preprocessFileLineNumbers "Engima\Civilians\Init.sqf";
call compile preprocessFileLineNumbers "Engima\Traffic\Init.sqf";

if (isServer) then {
	execVM "MS\MS_Caches\init.sqf";
};