/// @description Insert description here
// You can write your code in this editor
if(hp<=0){
	CommonRoll = random_range(0,100);
	if (CommonRoll >= 50) {instance_create_layer(x,y,"PickUps", oPickUpArrow);}
	global.count_enemy++;
	instance_destroy();
	if(instance_exists(oPlayer)){
		oPlayer.current_dash_cooldown = room_speed * oPlayer.dash_cooldown;
		oPlayer.can_dash = true;
		oPlayer.image_index = 29;
	}
}