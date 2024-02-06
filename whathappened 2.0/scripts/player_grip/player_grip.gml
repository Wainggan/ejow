// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_grip(__time){
	
switch __time {

case 0:
	if lastState != player_grip {
		xScale = jumpXScale;
		yScale = jumpYScale;
		
		audio_play_sound(snd_land,1,0)
	}

	controlJump = 1;
	coyoteTime = 0; //bugfixes
	x_vel = 0;
	dashLeft = normalDash;

	var mydir = key_right - key_left; //checking what they are doing

	if mydir = -dir {
		wallStick = max(0, wallStick - 1); //timer
	} else {
		wallStick = TWallStick;
	}

	var vkey = key_down - key_up; //climbing

	switch vkey {
		case -1:
			y_vel = -climbUpSpd;
			break;
		case 1:
			y_vel = climbDownSpd;
			break;
		default:
			y_vel = 0;
			if !meeting(x+dir,y-overWallFix) {
				y_vel = climbDownSpd;
			}
			break;
	}
	
	if key_bufferJump { //jump
		y_vel = -jumpVel;
		dir = -dir;
		x_vel = topSpeed * dir;
		key_bufferJump = 0;
		
		wallKeyLock = TWallKeyLock;
		
		xScale = jumpXScale;
		yScale = jumpYScale;
		
		currentDirScale = dir;
		
		playerState = player_free;
		
		audio_stop_sound(snd_land);
		audio_play_sound(snd_jump,1,0)
	}

break;
case 1:
	if yCollision {
		if meeting(x,y+1) {
			playerState = player_free; //this means we are on the ground
		}
		y_vel = 0;
	} else {
		if !meeting(x+dir,y) {
			if y_vel < 0 {
				wallKeyLock = TClimbPlatformTime; //we are climbing up the platform, so push
				y_vel = -climbPlatformY;
				x_vel = climbPlatformX * dir;
				
				coyoteTime = TCoyoteTime
				lastYGround = y
			}
			playerState = player_free; //we are not on a wall -or- we are pushing away from wall
		}
	}
	
	if wallStick = 0 {
		playerState = player_free; //we are not on a wall -or- we are pushing away from wall
	}
	
	
break;

}


}

