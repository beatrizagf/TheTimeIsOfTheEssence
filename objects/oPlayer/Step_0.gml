/// @description Insert description here
// You can write your code in this editor


with(oPlatform){
	//other.down!=0 to make down key cross platforms
	if ( (round(other.y + (other.sprite_height/2)) > y)){// || (other.down != 0)){	//We do round in order to be an integer pixel
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
	if (key_left || key_right || key_jump || key_jump_pressed || key_down || attack){
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
		
		if( gamepad_button_check(0, attack_key_ctrl_ps)){
			attack = 1;
		}
		if( gamepad_button_check(0, dash_key_ctrl_ps)){
			dash = true;
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


//Dash with double tap
if(controller = 0){
	if (keyboard_check_pressed(right_key_ctrl)){
		if (tap_r == 0){
			time1 = get_timer();
			tap_r = 1;
			tap_l = 0
		}else if (tap_r == 1) {
			if (((get_timer() - time1) < dash_time) and can_dash) {
				dash = true;
				tap_r = 0;			
			} else {
				tap_r = 0;
			}
		}
	}else if (keyboard_check_pressed(left_key_ctrl)){
		if (tap_l == 0){
			time1 = get_timer();
			tap_l = 1;
			tap_r = 0
		}else if (tap_l == 1) {
			if (((get_timer() - time1) < dash_time) and can_dash) {
				dash = true;
				tap_l = 0;
			}else {
				tap_l = 0;
			}
		}
	}
}

////Movement
var move = key_right - key_left;

if (dash && can_dash) {
	hsp = move * vdash;
} else {
	hsp = move * walkspd;
}

vsp = vsp + grv;

var signHsp = sign(hsp);
if(signHsp != 0){
	dir = sign(hsp);
}

//JUMP
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




var wallCheck = place_meeting(x+hsp, y, oWall);

//DASH collisions
if(can_dash && dash && sign(hsp) != 0){
	var futureX = x;
	var endX = round(x+hsp);
	show_debug_message(endX);
	//show_debug_message(futureX);
	//show_debug_message(dir);
	while(!place_meeting(futureX+dir, y, oWall) && (round(futureX) != endX)){
		futureX +=dir;
		show_debug_message(futureX);
		//show_debug_message((futureX == endX));
	}
	x = futureX;
	can_dash = false;
	alarm[2] = room_speed * dash_cooldown;
}
//Horizontal Collision
else{
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