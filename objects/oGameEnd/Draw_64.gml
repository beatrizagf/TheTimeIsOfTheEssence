/// @description Insert description here
// You can write your code in this editor
//draw_set_font(fTahoma24);											// set the font to draw text with
//draw_set_valign(fa_middle);											// use the middle to position vertically
//draw_set_halign(fa_right);											// use the right to position horizontally
//draw_set_colour(c_black);											// set the colour to draw text

if(end_game == 1){
	var time = (global.endTime-global.initialTime)/1000000;
	instance_destroy(oPlayer);	
	
	draw_set_colour(c_black);
	draw_rectangle(0,0,5000,5000,false)
	if(victory){
	draw_set_colour(c_white);
	draw_text(view_wport[0]-580,200, "Victory!");
	draw_text(view_wport[0]-580,300, time);
	draw_text(view_wport[0]-765,350, global.myscore);
	draw_text(view_wport[0]-500,350, "/3 stars collected");
	draw_text(view_wport[0]-780,400, global.count_enemy);
	draw_text(view_wport[0]-470,400,"/8 enemies defeated");
	draw_text(view_wport[0]-350,450, "Press R / select to restart the demo.");
	}else{
		draw_set_colour(c_white);
		draw_text(view_wport[0]-580,200, "Defeat!");
		draw_text(view_wport[0]-350,450, "Press R / select to restart the demo.");
	}
	if(keyboard_check_pressed(reset_key_ctrl) || gamepad_button_check_pressed(0, reset_key_ctrl_ps)) {
		game_restart();
	}
}