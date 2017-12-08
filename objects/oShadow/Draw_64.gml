/// @description Insert description here
// You can write your code in this editor
surface_set_target(surf);
draw_clear(c_black);
	gpu_set_blendmode(bm_src_color);
	
	/*
	draw_set_color(c_white);
	draw_circle(oPlayer.x,oPlayer.y,2,false);
	gpu_set_blendmode(bm_normal);
	*/
	
with(oPlayer){
	gpu_set_blendmode(bm_src_color);
	//draw_sprite_ext(sGlow,0,oPlayer.x-camera_get_view_x(view_camera[0]),oPlayer.y-camera_get_view_y(view_camera[0]),5,5,0,c_white,1);
	//draw_sprite_ext(sGlow,0,oPlayer.x*3.5,oPlayer.y*2.5,5,5,0,c_white,1);
	//draw_sprite_ext(sGlow,0,x*other.surf_scale,y*other.surf_scale,5,5,0,c_white,1);
	gpu_set_blendmode(bm_normal);
}



with(oTime){
	gpu_set_blendmode(bm_src_color);
	//draw_sprite_ext(sGlow,0,x*1/2,y*1/2,5,5,0,c_white,1);
	//draw_sprite_ext(sGlow,0,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]),1,1,0,c_white,1);
	 
	//draw_set_color(c_white);
	//draw_circle(230,1300,2,false)
	gpu_set_blendmode(bm_normal);
}

surface_reset_target();
draw_surface_ext(surf,0,0,1,1,0,c_white,alpha);
//draw_surface_ext(surf,camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]),1,1,0,c_white,alpha);

