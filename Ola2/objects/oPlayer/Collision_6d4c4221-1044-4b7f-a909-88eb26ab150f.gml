/// @description Insert description here
// You can write your code in this edit

if(!imune){
	show_debug_message(other.damageDone);
	hp -= other.damageDone * microSecondsConversion;
	imune = true;
	playerControl = true;
	alarm[0] = room_speed * imuneTime;
	alarm[1] = room_speed * playerControlTime;
}