/// @description Insert description here
// You can write your code in this editor

event_inherited();

if(updateHitbox){
	hitbox.image_xscale = dir;
	hitbox.x = x;
	hitbox.y = y;
}


if(attack && !cooldown){
	hitbox = instance_create_layer(x, y, "Attacks", oSwordHitbox);
	hitbox.image_xscale = dir;
	hitbox.attackRetry = attackRetry;
	hitbox.attackTime = attackTime;
	hitbox.alarm[0] = room_speed * attackTime;
	alarm[0] = room_speed * attackTime;
	alarm[1] = room_speed * attackRetry;
	attack = false;
	cooldown = true;
	updateHitbox = true;
}



