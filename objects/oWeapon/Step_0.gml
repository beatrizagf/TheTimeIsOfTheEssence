/// @description Insert description here
// You can write your code in this editor

with(oPlayer){
	//dirty hack to lower weapons y
	if(sprite_index == sCrouch){
		other.y = oPlayer.y+abs(sprite_height/4);
	}else{
		other.y = oPlayer.y;
	}
	other.x = x + dir*(abs(sprite_width/2) + abs(other.sprite_width/2));
	other.dir = dir;
	
}