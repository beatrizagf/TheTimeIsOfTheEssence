/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_healthbar(oPlayer.x - 15, oPlayer.y-45, oPlayer.x + 15, oPlayer.y - 35, (hp/maxHp)*100,c_black, c_red, c_lime,0, true, true);

draw_healthbar(oPlayer.x - 15, oPlayer.y-55, oPlayer.x + 15, oPlayer.y - 45, (current_dash_cooldown/(room_speed * dash_cooldown))*100, c_black, c_aqua, c_aqua, 0, true, true);