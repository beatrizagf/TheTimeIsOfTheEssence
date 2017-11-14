draw_set_font(fTahoma24);											// set the font to draw text with
draw_set_valign(fa_middle);											// use the middle to position vertically
draw_set_halign(fa_right);											// use the right to position horizontally
draw_set_colour(c_black);											// set the colour to draw text

if instance_exists(oPlayer)
{
draw_sprite_ext(sHeart,0,30+sprite_get_width(sHeart),50, 2,2,0,c_white,1);						// draw the heart sprite
draw_text(50+sprite_get_width(sHeart),57,oPlayer.showhp);	// draw the remaining life time	
	
draw_sprite(sPickupStar,0,view_wport[0]-50,50);						// draw the star sprite
draw_text(view_wport[0]-20-sprite_get_width(sPickupStar),57,oPlayer.myscore);	// draw the number of stars collected
}

//if dragonshadow draw_sprite(sDragonShadow,0,200,50);	