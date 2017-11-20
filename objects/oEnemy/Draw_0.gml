/// @description Insert description here
// You can write your code in this editor

draw_self();

if(hp<maxHp){
	draw_healthbar(x - 15, y-45, x + 15, y - 35, (hp/maxHp)*100,c_black, c_red, c_lime,0, true, true);
}