/// @description Insert description here
// You can write your code in this editor

if(instance_exists(oPlayer)){
	with(oPlayer){
		other.munition = munition;
		
		//dirty hack to lower weapons y
	if(sprite_index == sCrouch){
		other.y = oPlayer.y+abs(sprite_height/4);
	}else{
		other.y = oPlayer.y;
	}
	other.x = x + dir*(abs(sprite_width/2) + abs(other.sprite_width/2));
	other.dir = dir;
	}
	
}

if(attack && !cooldown && munition>0){
	with(instance_create_layer(x,y, "Attacks", oArrow)){
		speed = 25;
		if(other.dir == -1){
			direction = 180;
		}else{
			direction = 0;
		}
		attackRetry = other.attackRetry;
		attackTime = 0;
		//image_xscale = direction;
	}
	if(instance_exists(oPlayer)){
	with(oPlayer){
		munition--;
	}
}
	cooldown = true;
	alarm[0] = room_speed * attackRetry;
}

image_xscale = dir;