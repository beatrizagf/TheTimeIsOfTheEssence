/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_healthbar(oPlayer.x - 15, oPlayer.y-35, oPlayer.x + 15, oPlayer.y - 25, (hp/maxHp)*100,c_black, c_red, c_lime,0, true, true);

if(playerControl){
	draw_sprite(sStun,0,x,y-20);
}