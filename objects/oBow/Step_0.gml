/// @description Insert description here
// You can write your code in this editor

event_inherited();
if(instance_exists(oPlayer)){
	with(oPlayer){
		other.munition = munition;
	}
}

if(attack && !cooldown && munition>0){
	with(instance_create_layer(x,y, "Attacks", oArrow)){
		speed = 25;
		if(other.dir == -1){
			direction = 180;
		}else{
			direction = 0;
		}
		attackRetry = other.attackRetry;
		attackTime = 0;
		//image_xscale = direction;
	}
	if(instance_exists(oPlayer)){
	with(oPlayer){
		munition--;
	}
}
	cooldown = true;
	alarm[0] = room_speed * attackRetry;
}