/// @description Insert description here
// You can write your code in this editor
if(!gameStart){
	global.initialTime = get_timer();
}
gameStart = true;

//hp += other.hpToRecover * microSecondsConversion;
//with(other){
//	audio_play_sound(snd_essence, 10, false);
//	instance_destroy();
//}

if(hp < maxHp){
	hp += other.hpToRecover * microSecondsConversion;
	if( hp > maxHp){
		hp = maxHp;
	}
	with(other){
		audio_play_sound(snd_essence, 10, false);
		instance_destroy();
	}
}
