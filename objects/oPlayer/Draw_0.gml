/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_healthbar(oPlayer.x - 15, oPlayer.y-35, oPlayer.x + 15, oPlayer.y - 25, (hp/maxHp)*100,c_black, c_red, c_lime,0, true, true);
//draw arrows above healthbar
if(oPlayer.munition == 1){
draw_sprite_ext(sArrow,0 , oPlayer.x-8, oPlayer.y-43, 1.2, 1.2, 45, c_white,1);	
}
if(oPlayer.munition == 2){
draw_sprite_ext(sArrow,0 , oPlayer.x-8, oPlayer.y-43, 1.2, 1.2, 45, c_white,1);
draw_sprite_ext(sArrow,0 , oPlayer.x+7, oPlayer.y-43, 1.2, 1.2, 45, c_white,1);	
}

if(playerControl){
	draw_sprite(sStun,0,x,y-20);
}