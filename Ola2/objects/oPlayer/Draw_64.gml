/// @description Insert description here
// You can write your code in this editor

//Life left coordenates
hx = 50;
hy = 50;

if (instance_exists(oPlayer)){
	draw_sprite_ext(sTime,0 , hx, hy, 2, 2, 0, c_white,1);						// draw the heart sprite
	draw_text(hx-17,hy-14,oPlayer.trueHp);	// draw the remaining life time

	
}