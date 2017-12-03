/// @description Insert description here
// You can write your code in this editor
global.myscore++;						// increase the players score
with(other){					// destroy the pickup
	instance_destroy();
}
