/// @description Insert description here
// You can write your code in this editor
gameStart = true;
if(hp < maxHp){
	hp += other.hpToRecover * microSecondsConversion;
	if( hp > maxHp){
		hp = maxHp;
	}
	with(other){
		instance_destroy();
	}
}