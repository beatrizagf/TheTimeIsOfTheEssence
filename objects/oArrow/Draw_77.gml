/// @description Insert description here
// You can write your code in this editor

with(oPlatform){
	sprite_index = -1;
}
with(oEnemyColision){
	sprite_index = -1;
}

if(place_meeting(x,y, oWall)){
	instance_destroy();
}

//Restore platform sprites
with(oPlatform){
	sprite_index = sPlatform;
}
with(oEnemyColision){
	sprite_index = sEnemyColision;
}