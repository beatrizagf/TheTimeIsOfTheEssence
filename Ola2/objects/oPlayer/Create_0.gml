/// @description Insert description here
// You can write your code in this editor

hsp = 0;
vsp = 0;
grv = 2;
walkspd = 6;
jmpsp = -22;
grounded = false;
dir=1;

maxJumps = 1; //0 = no double jump, 1+ number of jumps after initial one
dJump = maxJumps;

controller = 0;

down = 0;

//Stats
microSecondsConversion = 1000000;
maxHp = 100 * microSecondsConversion; //10 seconds in microseconds
trueHp = 10;
hp = maxHp;
imune = false;
imuneTime = 4;
playerControl = false;
playerControlTime = 2;


//Commands
//left_key_ctrl = vk_left;
//right_key_ctrl = vk_right;
//jump_key_ctrl = vk_up;
//down_key_ctrl = vk_down;

left_key_ctrl = ord("A");
right_key_ctrl = ord("D");
jump_key_ctrl = ord("W");
down_key_ctrl = ord("S");
attack_key_ctrl = mb_left; //left mouse button;

//Controler
left_right_ctrl_ps = gp_axislh; //Analog, if changed, movement needs to be changed
jump_key_ctrl_ps = gp_face1; //X on Ps
up_down_ctrl_ps = gp_axislv;
attack_key_ctrl_ps = gp_face1; //O on Ps
deadZone = 0.2;
downDeadZone = 0.7;