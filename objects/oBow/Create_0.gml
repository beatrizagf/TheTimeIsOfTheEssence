/// @description Insert description here
// You can write your code in this editor


cooldown=false;

attackTime = 0.5;
attackRetry = 0.5;

attack = false;

munition=0;

dir=0;
if(instance_exists(oPlayer)){
	with(oPlayer){
		other.dir = dir;
	}
}