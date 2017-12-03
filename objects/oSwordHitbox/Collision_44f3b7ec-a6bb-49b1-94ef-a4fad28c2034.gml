/// @description Insert description here
// You can write your code in this editor

with(other){
	if(!imune){
		hp -= other.damage;
		if(hp>0){
			oldDirection = dir;
			vsp=-3;
			dir = sign(x- other.x);
			imune = true;
			hit = true;
			alarm[0] = room_speed * (abs(other.attackRetry-other.attackTime) + other.attackTime);
		}
	}
}