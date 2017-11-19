/// @description Insert description here
// You can write your code in this editor

with(oPlayer){
	other.x = x + dir*(abs(sprite_width/2) + abs(other.sprite_width/2));
	other.y = oPlayer.y;
}
