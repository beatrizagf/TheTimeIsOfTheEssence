/// @description Insert description here
// You can write your code in this editor

with(oPlatform){
	
	//other.down used to fall from platforms. Might be needed one day.
	if ( (round(other.y + (other.sprite_height/2)) > y)){// || (other.down != 0)){	//We do round in order to be an integer pixel
		sprite_index = -1;
	}
}

if(place_meeting(x,y, oWall)){
	instance_destroy();
}

//Restore platform sprites
with(oPlatform){
	sprite_index = sPlatform;
}