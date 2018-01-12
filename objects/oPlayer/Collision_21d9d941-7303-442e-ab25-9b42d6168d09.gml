/// @description Insert description here
// You can write your code in this editor
audio_play_sound(snd_coin, 10, false);
global.myscore++;						// increase the players score
with(other){					// destroy the pickup
	instance_destroy();
}
