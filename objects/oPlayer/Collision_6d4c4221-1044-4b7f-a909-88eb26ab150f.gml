/// @description Insert description here
// You can write your code in this edit

if(!imune){
	//hp -= other.damageDone * microSecondsConversion;
	imune = true;
	playerControl = true;
	alarm[0] = room_speed * imuneTime;
	alarm[1] = room_speed * playerControlTime;
	move = sign(x-other.x);
	vsp = -8;
}