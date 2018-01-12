/// @description Insert description here
// You can write your code in this editor

with(other){
	if(!(other.munition==other.maxMunition)){
		audio_play_sound(snd_shoot, 10, false);
		other.munition += munitionValue;
		instance_destroy();
	}
}
if(munition>maxMunition){
			munition=maxMunition;
		}