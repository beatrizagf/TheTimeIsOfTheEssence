/// @description Insert description here
// You can write your code in this editor
//draw_set_font(fTahoma24);											// set the font to draw text with
//draw_set_valign(fa_middle);											// use the middle to position vertically
//draw_set_halign(fa_right);											// use the right to position horizontally
//draw_set_colour(c_black);											// set the colour to draw text

if(victory){
	instance_destroy(oPlayer);	
	
	draw_set_colour(c_black);
	draw_rectangle(0,0,5000,5000,false)
	
	draw_set_colour(c_white);
	draw_text(view_wport[0]-580,300, "Victory!");
	draw_text(view_wport[0]-480,400, "x/x enemies defeated");
}
