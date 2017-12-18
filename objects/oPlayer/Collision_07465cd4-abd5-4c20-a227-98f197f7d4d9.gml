/// @description Insert description here
// You can write your code in this editor
if(!gameStart){
	global.initialTime = get_timer();
}
gameStart = true;

hp += other.hpToRecover * microSecondsConversion;
with(other){
	instance_destroy();
}
/*
if(hp < maxHp){
	hp += other.hpToRecover * microSecondsConversion;
	if( hp > maxHp){
		hp = maxHp;
	}
	with(other){
		instance_destroy();
	}
}
*/