/// @description Insert description here
// You can write your code in this editor

cooldown=false;

attackTime = 0.5;
attackRetry = 1.3;

attack = false;

hitbox = -1; //No hitbox on start;
updateHitbox = false;

dir=0;
if(instance_exists(oPlayer)){
	with(oPlayer){
		other.dir = dir;
	}
}

can_attack = true;
attack_cooldown = 1.3;
current_attack_cooldown = room_speed * attack_cooldown;
image_index = 58;