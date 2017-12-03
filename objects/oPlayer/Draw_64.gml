/// @description Insert description here
// You can write your code in this editor
draw_set_font(fTahoma24);											// set the font to draw text with
draw_set_valign(fa_middle);											// use the middle to position vertically
draw_set_halign(fa_right);											// use the right to position horizontally
//draw_set_colour(c_black);											// set the colour to draw text


//Life left coordenates
hx = 110;
hy = 70;

if (instance_exists(oPlayer)){
	var hp =0;
	if(oPlayer.trueHp>1){
		hp = round(oPlayer.trueHp);
		draw_sprite_ext(sTime,0 , hx, hy, 3, 3, 0, c_white,1);						// draw the heart sprite
		draw_text(hx+10,hy,hp);	// draw the remaining life time
	}
	else{
		hp = oPlayer.trueHp;
		draw_sprite_ext(sTime,0 , hx, hy, 3, 3, 0, c_white,1);						// draw the heart sprite
		draw_text(hx+40,hy-10,hp);	// draw the remaining life time
	}
	

	draw_sprite(sStar,0,view_wport[0]-70,50);						// draw the star sprite
	draw_text(view_wport[0]-40-sprite_get_width(sStar),57,global.myscore);	// draw the number of stars collected
	
	draw_sprite(sArrow,0,view_wport[0]-200,50);						// draw the star sprite
	draw_text(view_wport[0]-200-sprite_get_width(sArrow),50,oPlayer.munition);	// draw the number of stars collected
	
}
/*
if(hp < 0){
	draw_set_color(c_black);
	draw_rectangle(0,0,5000,500,false);
	draw_rectangle(0,0,5000,display_get_gui_height()-500,false);
}
draw_set_color(c_white);*/