function player_dash(__time){

switch __time {
case 0:
	if lastState != player_dash { //pause
		dashStartTimer = 2;
		game_pause = TDashStartTimer;
		
		xScale = landXScale;
		yScale = landYScale;
		
		dashLeft -= 1;
		coyoteTime = 0;
		
		superLongJump = superLongJumpStart;
		
		lastGround = onGround() || nearWall(superWalljumpDistance);
		
		part_particles_create(pSystem, x, y-overWallFix, particle[pType.dashPop], 15);
		
		screenShake = 9;
	} else {
		if dashStartTimer != 0 {
			dashStartTimer -= 1;
			if dashStartTimer = 0 { // dash start
				//find direction
				var _dir = point_direction(0,0,key_right-key_left,key_down-key_up);
				if key_right-key_left = 0 && key_down-key_up = 0 {
					_dir = point_direction(0,0,dir,0);
				}
				x_vel = lengthdir_x(dashSpeed,_dir);
				y_vel = lengthdir_y(dashSpeed,_dir);
				if dir != sign(x_vel) and sign(x_vel) != 0 {
					dir = sign(x_vel);
				}
				dashTimer = TDashTime;
				
				superLongJump = superLongJumpStart;
			
				instance_create_depth(x,y-overWallFix,-10,obj_dashLine);
				
				audio_play_sound(snd_dash,0,0)
			}
		} else {
			instance_create_depth(x,y,depth+1,obj_playerBlur);
			
			dashTimer -= 1;
			
			superLongJump = max(superLongJump-1,0);
		
			if dashTimer = 0 { //end of dash
				controlJump = 1;
				if sign(x_vel) = 0 {
					dashX_vel = 0;
				}
				dashX_vel += (abs(x_vel) - topSpeed) * sign(x_vel) / 2;
				dashX_vel = clamp(dashX_vel, -dashMTopSpeed, dashMTopSpeed);
				if y_vel < 0 {
					y_vel *= 0.4;
				}
				
				lastDashTimer = TlastDashTimer;
				
				superLongJump = TSuperLongJump;
			
				playerState = player_free;
			}
		}
	}
	
	if key_bufferJump and (onGround() or nearWall(superWalljumpDistance)) {
		controlJump = 0;
		longJump();
		if superLongJump = 0 or !lastGround {
			longJump();
			crouch = 1;
			part_particles_create(pSystem, x, y-overWallFix, particle[pType.dashPop], 15);
		}
		audio_play_sound(snd_longjump,2,0);
	}
break;
case 1:
	
break;
}

}

function longJump() {
	if nearWall(superWalljumpDistance) {
		if meeting(x-superWalljumpDistance,y) {
			dir = 1;
		} else {
			dir = -1;
		}
		wallKeyLock = TSuperWallBounceLock;
	}
	key_bufferJump = 0;

	x_vel = longJumpSpeed * dir;
	dashX_vel += (abs(x_vel) - topSpeed) * sign(x_vel);
	dashX_vel = clamp(dashX_vel, -dashMTopSpeed*1.25, dashMTopSpeed*1.25);

	y_vel = -longJumpYVel;

	crouch = 0;

	dashLeft = 0;

	playerState = player_free;
}