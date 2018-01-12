/// @description Insert description here
// You can write your code in this editor

with(oPlayer){
	//dirty hack to lower weapons y
	if(sprite_index == sCrouch){
		other.y = oPlayer.y+abs(sprite_height/4);
	}else{
		other.y = oPlayer.y;
	}
	other.x = x + dir*(abs(sprite_width/2) + abs(other.sprite_width/2));
	other.dir = dir;
	
}


if(updateHitbox){
	hitbox.image_xscale = dir;
	hitbox.x = x;
	hitbox.y = y;
}


if(can_attack && attack /*&& !cooldown*/){
	audio_play_sound(snd_swing, 10, false);
	hitbox = instance_create_layer(x, y, "Attacks", oSwordHitbox);
	hitbox.image_xscale = dir;
	hitbox.attackRetry = attackRetry;
	hitbox.attackTime = attackTime;
	hitbox.alarm[0] = room_speed * attackTime;
	alarm[0] = room_speed * attackTime;
	//alarm[1] = room_speed * attackRetry;
	attack = false;
	cooldown = true;
	updateHitbox = true;
	
	can_attack = false;
	//alarm[0] = room_speed * attack_cooldown;
	current_attack_cooldown = 0;
	image_index = 0;
}
image_xscale = dir;

if(current_attack_cooldown < room_speed * attack_cooldown) {
	current_attack_cooldown++;
} else {
	can_attack = true;
}

if(image_index >= 60) {
	image_index = 58;
}
