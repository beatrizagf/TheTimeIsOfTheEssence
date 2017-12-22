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