// if the player collides with a ghost
hp--;				// reduce the players health
with(other){			// destroy the ghost
	instance_destroy();
}