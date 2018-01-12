/// @description Insert description here
// You can write your code in this editor

with(oPlatform){
	
	//other.down used to fall from platforms. Might be needed one day.
	if ( (round(other.y + (other.sprite_height/2)) > y)){// || (other.down != 0)){	//We do round in order to be an integer pixel
		sprite_index = -1;
	}
}
with(oEnemyColision){
	sprite_index = -1;
}

if(keyboard_check_pressed(reset_key_ctrl) || gamepad_button_check_pressed(type, reset_key_ctrl_ps)){
	game_restart();
}


if(!playerControl){
	//Keys
	key_left = keyboard_check(left_key_ctrl);
	key_right = keyboard_check(right_key_ctrl);
	key_jump = keyboard_check_pressed(jump_key_ctrl);
	key_jump_pressed = keyboard_check(jump_key_ctrl);
	key_down = keyboard_check(down_key_ctrl);
	dash = keyboard_check_pressed(dash_key_ctrl);
	attack = mouse_check_button_pressed(attack_key_ctrl);
	bow = mouse_check_button_pressed(bow_key_ctrl);

	//Controller or keyboard checker
	if (key_left || key_right || key_jump || key_jump_pressed || key_down || dash || attack || bow){
		controller = 0;

	}else{
		var horizontalValue = gamepad_axis_value(type, left_right_ctrl_ps);
		if( abs(horizontalValue) > deadZone){
	
		key_left = abs(min(horizontalValue, 0));
		key_right = abs(max(horizontalValue, 0));
	
		}
	
		if( gamepad_button_check_pressed(type, jump_key_ctrl_ps)){
			key_jump=1;
		}
		
		if(gamepad_button_check(type, jump_key_ctrl_ps)){
			key_jump_pressed = 1;
		}
		
		if(gamepad_button_check(type, attack_key_ctrl_ps)){
			attack = 1;
		}
		
		if(gamepad_button_check_pressed(type, dash_key_ctrl_ps)){
			dash = true;
		}
		
		if( gamepad_button_check(type, bow_key_ctrl_ps)){
			bow = true;
		}

	
		var verticalValue = gamepad_axis_value(type, up_down_ctrl_ps);
		if( abs(verticalValue) > downDeadZone){
	
		//key_up = abs(min(verticalValue, 0));
		key_down = abs(max(verticalValue, 0));
		}
		controller = 1;
	}
}else{
	key_left=0;
	key_right=0;
	key_jump=0;
	key_down=0;
	key_jump_pressed=1;
	//if(vsp < 0){ //Don't reset falling
	//	vsp=0;
	//}
	hsp=0;
	down=0;
	dash = 0;
	attack = 0;
	bow=0;
}


if(down || key_down != 0 && grounded){
	down = 1;
}else{
	down =0;
}

//Make an attack



//Health loss
if(gameStart){
	hp -= delta_time;
	trueHp = hp/1000000;
	
}

if( hp < 0 ){
	with(oGameEnd){
		end_game=1;
		victory=0;
		global.endTime = get_timer();
		break;
		//game_restart();
	}

}


////Movement
if(!playerControl){
	move = key_right - key_left;
}

if(sign(move) != 0){
	dir = sign(move)
}

if (picked_dash && dash && can_dash && !down) {
	hsp = dir* vdash;

}else{
	dash = false;
	if(down){
		hsp = move * 1/2*walkspd;
	}else {
		hsp = move * walkspd;
	}
}


vsp = vsp + grv;


if(key_jump){
	if(grounded){
		audio_play_sound(snd_jump, 10, false);
		if(down){
			vsp = dwnJmpSp;
		}else{
			vsp = jmpsp;
		}
	}else{
		if(dJump && vsp > jmpsp/2){
			audio_play_sound(snd_jump_2, 10, false);
			vsp = jmpsp+4;
			dJump--;
		}
	}
	
}

if( (vsp < 0) && (!key_jump_pressed)){
	vsp= max(vsp,jmpsp/4);
}



//Horizontal Collision
var wallCheck = place_meeting(x+hsp, y, oWall);

if(can_dash && dash && sign(hsp) != 0){
	audio_play_sound(snd_dash, 10, false);
	var futureX = x;
	var endX = round(x+hsp);
	while(!place_meeting(futureX+dir, y, oWall) && (round(futureX) != endX)){
		futureX +=dir;
		
	}
	x = futureX;
	vsp = 0;
	can_dash = false;
	//alarm[2] = room_speed * dash_cooldown;
	current_dash_cooldown = 0;
	image_index = 0;
}else{
	if(!wallCheck){
		x += hsp;
	}else{
		while(!place_meeting(x+dir, y, oWall)){
			x+= dir;
		}
		hsp=0;
	}
}
dash = false;



//Vertical Collision

wallCheck = place_meeting(x, y+vsp, oWall);
if(!wallCheck){
	y += vsp;
	grounded = false;
}else{
	while(!place_meeting(x, y+sign(vsp), oWall)){
		y+= sign(vsp);
	}
	if(sign(vsp) == 1){
		grounded = true;
		dJump = maxJumps;
	}

	//reset vertical speed if there's a collision
	vsp=0;
}

//Weapons
if(attack){
	if(!is_her_weapon_a_sword){
		is_her_weapon_a_sword = true;
		with(current_weapon){
			instance_destroy();
		}
	
		var newX;
		var newY;
		if(sprite_index == sCrouch){
			newY = y+abs(sprite_height/4);
		}else{
			newY = y;
		}
		newX = script0(sPlayer, sSword);
		current_weapon = instance_create_layer(newX,newY, "Weapon", oSword);
	}
	if(current_weapon.can_attack){
		
		with(current_weapon){
			attack = true;
		}
	}
	
}else if(bow && munition>0){
	if(is_her_weapon_a_sword){
		is_her_weapon_a_sword = false;
		with(current_weapon){
			instance_destroy();
		}
	
		var newX;
		var newY;
		if(sprite_index == sCrouch){
			newY = y+abs(sprite_height/4);
		}else{
			newY = y;
		}
		newX = script0(sPlayer, sBow);
		current_weapon = instance_create_layer(newX,newY+5, "Weapon", oBow);
	}
	if(current_weapon.cooldown = false){
		
		with(current_weapon){
			attack = true;
		}
	}
}




//Sprites

if(hsp != 0){
	image_xscale = dir;
}

if(key_down && grounded){
	var current_image_index = image_index;
	sprite_index = sCrouch;
	image_index = current_image_index;
}else{
	var current_image_index = image_index;
	sprite_index = sPlayer;
	image_index = current_image_index;
	if(place_meeting(x,y,oWall)){
		var current_image_index = image_index;
		sprite_index = sCrouch
		image_index = current_image_index;
	}else{
		down=0;
	}
}


//Restore platform sprites
with(oPlatform){
	sprite_index = sPlatform;
}

with(oEnemyColision){
	sprite_index = sEnemyColision;
}

if(current_dash_cooldown < room_speed * dash_cooldown) {
	current_dash_cooldown++;
} else {
	can_dash = true;
}

if(image_index == 30) {
	image_index = 29;
}