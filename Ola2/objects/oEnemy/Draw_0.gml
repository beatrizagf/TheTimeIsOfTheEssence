/// @description Insert description here
// You can write your code in this editor

draw_self();

if(hp<maxHp){
	draw_healthbar(oEnemy.x - 15, oEnemy.y-45, oEnemy.x + 15, oEnemy.y - 35, (hp/maxHp)*100,c_black, c_red, c_lime,0, true, true);
}