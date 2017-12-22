/// @description Insert description here
// You can write your code in this editor

hsp = 0;
vsp = 0;
grv = 2;
walkspd = 4;
jmpsp = -16;
dwnJmpSp = jmpsp/2;
grounded = false;
dir=1;

tap_r = 0;
tap_l = 0;
vdash = 100;
can_dash = true;
dash = false;
dash_cooldown = 2;
dash_time = 1000000; //1 segundo em microssegundos
maxMunition=2;
munition = maxMunition;	
maxJumps = 1; //0 = no double jump, 1+ number of jumps after initial one
dJump = maxJumps;

weaponOutOfCooldown=true;

controller = 0;

gameStart = false;
global.initialTime = 0;
move=0;

down = 0;

//Stats
microSecondsConversion = 1000000;
maxHp = 10 * microSecondsConversion; //10 seconds in microseconds
trueHp = 10;
hp = maxHp;
imune = false;
imuneTime = 2;
playerControl = false;
playerControlTime = 0.75;
global.myscore = 0;
is_her_weapon_a_sword = true;
current_weapon = instance_create_layer(x,y, "Weapon", oSword);
victory=0;
end_game=0;
end_time=0;

//Commands
//left_key_ctrl = vk_left;
//right_key_ctrl = vk_right;
//jump_key_ctrl = vk_up;
//down_key_ctrl = vk_down;

left_key_ctrl = ord("A");
right_key_ctrl = ord("D");
jump_key_ctrl = ord("W");
down_key_ctrl = ord("S");
reset_key_ctrl = ord("R");
attack_key_ctrl = mb_left; //left mouse button;
bow_key_ctrl = mb_right; //right mouse button;

//Controler
left_right_ctrl_ps = gp_axislh; //Analog, if changed, movement needs to be changed
jump_key_ctrl_ps = gp_face1; //X on Ps
up_down_ctrl_ps = gp_axislv;
attack_key_ctrl_ps = gp_face2; //O on Ps
dash_key_ctrl_ps = gp_face3; //Square on Ps
bow_key_ctrl_ps = gp_face4; //Triangle on Ps
reset_key_ctrl_ps = gp_select;
deadZone = 0.3;
downDeadZone = 0.4;
type =0;
//Dash
current_dash_cooldown = room_speed * dash_cooldown;
image_index = 29;