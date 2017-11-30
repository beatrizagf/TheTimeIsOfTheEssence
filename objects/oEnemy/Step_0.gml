/// @description Insert description here
// You can write your code in this editor

if(hp<=0){
	CommonRoll = random_range(0,100);
	if (CommonRoll >= 50) {instance_create_layer(x,y,"Attacks", oPickUpArrow);}
	instance_destroy();
}

with(oPlatform){
	
	//other.down used to fall from platforms. Might be needed one day.
	if ( (round(other.y + (other.sprite_height/2)) > y)){// || (other.down != 0)){	//We do round in order to be an integer pixel
		sprite_index = -1;
	}
}

////Movement
vsp = vsp + grv;
hsp = walkspd * dir;

//Horizontal Collision
var wallCheck = place_meeting(x+hsp, y, oWall);

if(!wallCheck){
	x += hsp;
}else{
		while(!place_meeting(x+sign(hsp), y, oWall)){
			x+= sign(hsp);
		}
		dir= -dir;
		oldDirection = dir;
		//hsp=-hsp;
}


//Vertical Collision

wallCheck = place_meeting(x, y+vsp, oWall);
if(!wallCheck){
	y += vsp;
}else{
	while(!place_meeting(x, y+sign(vsp), oWall)){
		y+= sign(vsp);
	}
	if(sign(vsp) == 1 && hit){
		hit = false;
	}
	//reset vertical speed if there's a collision
	vsp=0;
}







//Sprite
if(true){
	sprite_index = sEnemy;
}
if( hsp == 0){
	sprite_index = sEnemy;
}else{
	sprite_index = sEnemy;
}
if(hsp != 0){
	image_xscale = sign(hsp);
}

with(oPlatform){
	sprite_index = sPlatform;
}