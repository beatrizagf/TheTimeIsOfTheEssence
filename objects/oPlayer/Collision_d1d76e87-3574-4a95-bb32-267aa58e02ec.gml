// if the player collides with a ghost
//hp--
//////////////TODO
//x = real(x&$ffffffc0)+(sprite_get_width(sprite_index)/2);					// player cant move (=reduce the players health)
with(other){			// destroy the ghost
	instance_destroy();
}

alarm[0] = room_speed * 2; // 2-Seconds before player input is enabled. 
PlayerInput = "Disabled"; // Played input is disabled in the meantime. 