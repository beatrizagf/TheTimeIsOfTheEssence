/// @description Insert description here
// You can write your code in this editor

cooldown=false;

attackTime = 0.5;
attackRetry = 0.75

attack = false;

dir=0;
if(instance_exists(oPlayer)){
	with(oPlayer){
		other.dir = dir;
	}
}