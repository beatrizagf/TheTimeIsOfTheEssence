// if the player collides with a ghost
//hp--
//////////////TODO
//x = real(x&$ffffffc0)+(sprite_get_width(sprite_index)/2);					// player cant move (=reduce the players health)
with(other){			// destroy the ghost
	instance_destroy();
}
alarm[0] = 3;
xspeed=6;