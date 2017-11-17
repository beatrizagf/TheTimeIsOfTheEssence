/// @description Insert description here
// You can write your code in this editor

with(oPlayer){
	other.x = x + dir*(sprite_width/2 + other.sprite_width/2);
	show_debug_message(dir*(sprite_width/2 + other.sprite_width/2));
	show_debug_message(dir);
	other.y = oPlayer.y;
}