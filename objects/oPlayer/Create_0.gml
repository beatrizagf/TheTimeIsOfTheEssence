/// Init
dir = -1;					// direction the player is facing
spd = 5;					// speed the player will move at
g = 0.2;					// gravity that applies to the player
sprite_index = sIdle1;		// animation to play
anim_speed = 0.7;			// default speed of the animation
image_speed = anim_speed;	// animation speed
hp = 10;						// time life of the player
showhp=hp;						// only one digit
//dragonshadow=false;				// to appear the shadow of the dragon
myscore = 0;				// score of the player
can_climb = false;			// flag if the player can climb
climbing = false;			// flag if the player is climbing
xspeed = 6;					// horizontal speed of the player
yspeed = -6;				// vertical speed of the player	
fall = false;				// flag if the player is falling
grav=0;						// gravity that applies to the player
gravmax=12;					// terminal velocity when falling
gravdelta=1.2;				// difference in gravity
grav_jump = -18;			// jump gravity
jump=false;					// flag if the player is jumping
// camera that follows the player
view_camera[0] = camera_create_view(x-500,y-200,1000,400,0,oPlayer,-1,-1,100,100);