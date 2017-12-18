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
	attack = mouse_check_button_pressed(attack_key_ctrl);
	toggle = mouse_check_button_pressed(toggle_key_ctrl);

	//Controller or keyboard checker
	if (key_left || key_right || key_jump || key_jump_pressed || key_down || attack || toggle){
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
		
		if( gamepad_button_check(type, attack_key_ctrl_ps)){
			attack = 1;
		}
		
		if( gamepad_button_check(type, dash_key_ctrl_ps)){
			dash = true;
		}
		
		if( gamepad_button_check_pressed(type, toggle_key_ctrl_ps)){
			toggle = true;
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
	attack = 0;
	toggle=0;
}


if(down || key_down != 0 && grounded){
	down = 1;
}else{
	down =0;
}

//Make an attack

if(attack){
	//with(oSword){
	//	if(!cooldown){
	//		sprite_index = sSword;
	//		alarm[0] = room_speed * attackTime;
	//		cooldown = true;
	//		alarm[1] = room_speed * attackRetry;
	//	}
	//}
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

	with(current_weapon){
		attack = true;
	}
}

//Health loss
if(gameStart){
	hp -= delta_time;
	trueHp = hp/1000000;
	
}

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
if(!playerControl){
	move = key_right - key_left;
}

if (dash && can_dash && !down) {
	hsp = move * vdash;

}else{
	dash = false;
	if(down){
		hsp = move * 1/2*walkspd;
	}else {
		hsp = move * walkspd;
	}
}


vsp = vsp + grv;

var signHsp = sign(hsp);
if(signHsp != 0){
	dir = sign(hsp);
}

if(key_jump){
	if(grounded){
		if(down){
			vsp = dwnJmpSp;
		}else{
			vsp = jmpsp;
		}
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

if(can_dash && dash && sign(hsp) != 0){
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






//Sprite
//if(true){
//	sprite_index = sPlayer;
//}
//if( hsp == 0){
//	sprite_index = sPlayer;
//}else{
//	sprite_index = sPlayer;
//}



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
if(toggle) {
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
	with(current_weapon){
		attack = true;
	}
	/*
	if(is_her_weapon_a_sword) {
		
		newX = script0(sPlayer, sBow);
		
		//sprite_index = sPlayerWithBow;
		is_her_weapon_a_sword = false;
		current_weapon = instance_create_layer(newX,newY+5, "Weapon", oBow);
		
	} else {
		newX = script0(sPlayer, sSword);
		//sprite_index = sPlayerWithSword;
		is_her_weapon_a_sword = true;
		current_weapon = instance_create_layer(newX,newY, "Weapon", oSword);
	}*/
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