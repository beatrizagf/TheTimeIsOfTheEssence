/// @description Insert description here
// You can write your code in this editor

with(oPlatform){
	
	if ( (round(other.y + (other.sprite_height/2)) > y) || (other.down != 0)){	//We do round in order to be an integer pixel
		sprite_index = -1;
	}
}


if(!playerControl){
	//Keys
	key_left = keyboard_check(left_key_ctrl);
	key_right = keyboard_check(right_key_ctrl);
	key_jump = keyboard_check_pressed(jump_key_ctrl);
	key_jump_pressed = keyboard_check(jump_key_ctrl);
	key_down = keyboard_check(down_key_ctrl);
	attack = mouse_check_button(attack_key_ctrl);



	//Controller or keyboard checker
	if (key_left || key_right || key_jump){
		controller = 0;
	}else{
		var horizontalValue = gamepad_axis_value(0, left_right_ctrl_ps);
		if( abs(horizontalValue) > deadZone){
	
		key_left = abs(min(horizontalValue, 0));
		key_right = abs(max(horizontalValue, 0));
	
		}
	
		if( gamepad_button_check_pressed(0, jump_key_ctrl_ps)){
			key_jump=1;
		}
		
		if(gamepad_button_check(0, jump_key_ctrl_ps)){
			key_jump_pressed = 1;
		}
	
		var verticalValue = gamepad_axis_value(0, up_down_ctrl_ps);
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
	if(vsp < 0){ //Don't reset falling
		vsp=0;
	}
	hsp=0;
	down=0;
	attack = 0;
}

if(key_down != 0){
	down = 1;
}else{
	down =0;
}

//Make an attack

if(attack){
	with(oSword){
		if(!cooldown){
			sprite_index = sSword;
			alarm[0] = room_speed * attackTime;
			cooldown = true;
			alarm[1] = room_speed * attackRetry;
		}
	}
}

//Health loss
hp -= delta_time;
trueHp = hp/1000000;

if( hp < 0 ){
	game_restart();
}


////Movement
var move = key_right - key_left;

hsp = move * walkspd;

vsp = vsp + grv;

if(key_jump){
	if(grounded){
		vsp = jmpsp;
	}else{
		if(dJump && vsp > jmpsp/2){
			vsp = jmpsp+4;
			dJump--;
		}
	}
	
}

if( (vsp < 0) && (!key_jump_pressed)){
	vsp= max(vsp,jmpsp/2);
}


//Horizontal Collision
var wallCheck = place_meeting(x+hsp, y, oWall);

if(!wallCheck){
	x += hsp;
}else{
	while(!place_meeting(x+sign(hsp), y, oWall)){
		x+= sign(hsp);
	}
	hsp=0;
}


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


var signHsp = sign(hsp);
if(signHsp != 0){
	dir = sign(hsp);
}
show_debug_message(dir);


//Sprite
if(true){
	sprite_index = sPlayer;
}
if( hsp == 0){
	sprite_index = sPlayer;
}else{
	sprite_index = sPlayer;
}
if(hsp != 0){
	image_xscale = dir;
}

//Restore platform sprites
with(oPlatform){
	sprite_index = sPlatform;
}