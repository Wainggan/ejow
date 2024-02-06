function player_free(__time) {

switch __time {
case 0:
	
	var _yMove = 0;
	if key_jump || controlJump { //controlled jumps
		if (y_vel < peakThresh && y_vel > -peakThresh) && !controlJump { //extra air time
			_yMove += peakGrav
		} else {
			_yMove += holdGrav;
		}
	} else {
		_yMove += grav
	}
	var _term = terminalVel;
	if key_down {
		_term = fastTerminalVel
		if y_vel > 0 {
			_yMove = fastGrav
		}
		
		
	}
	var _spd = y_vel
	y_vel = approach(y_vel,_term,_yMove);
	if y_vel = fastTerminalVel && _spd != fastTerminalVel {
		part_particles_create(pSystem, x, y, particle[pType.dashParticle], 10);
	}
	
	if onGround() {
		
		
		if key_down {
			if crouch = 0 {
				xScale = duckXScale;
				yScale = duckYScale;
			}
			crouch = 1;
		} else if canUncrouch() {
			if crouch {
				xScale = lookUpXScale;
				yScale = lookUpYScale;
			}
			crouch = 0;
		}
	} else {
		if y_vel > terminalVel/2 {
			controlJump = 0;
		}
		if y_vel > 0 {
			if !key_down && canUncrouch() {
				if crouch {
					xScale = lookUpXScale;
					yScale = lookUpYScale;
				}
				crouch = 0;
			}
		}
	}
	if coyoteTime {
		if key_bufferJump {
			if superLongJump = 0 {
				y_vel = -jumpVel;
			
				if !onGround() { //putting you back up if you almost miss
					y = lastYGround;
				}
				coyoteTime = 0;
				key_bufferJump = 0
				
				
				if !place_meeting(x,y+1,obj_slipwall) {
					dashLeft = normalDash;
					lastDashTimer = 0;
				} else {
					platX_vel += iceJumpMo*sign(x_vel);
				}
				if abs(platX_vel) < jumpMo {
					platX_vel = jumpMo*sign(x_vel);
				}
		
				xScale = jumpXScale;
				yScale = jumpYScale;
				
				
			} else {
				superLongJump = 0
				longJump();
				longJump();
				crouch = 1;
				part_particles_create(pSystem, x, y-overWallFix, particle[pType.dashPop], 15);
				
				audio_play_sound(snd_longjump,2,0);
				
				
			}
			audio_stop_sound(snd_land);
			audio_play_sound(snd_jump,1,0)
		}
	}
	
	
	
	var mydir = 0;
	if !wallKeyLock {
		mydir = key_right - key_left;
		if crouch && mydir = -dir {
			xScale = duckXScale;
			yScale = duckYScale;
		}
	} else {
		mydir = dir;
	}

	if mydir != 0 {
		dir = mydir;
	}
	if mydir != 0 && (!crouch || !onGround()) {
		if !place_meeting(x,y+1,obj_slipwall) {
			x_vel += accel * mydir;
		} else {
			x_vel += slipAccel * mydir;
		}
	} else {
		var _hold = sign(x_vel)
		if !place_meeting(x,y+1,obj_slipwall) {
			x_vel -= _hold * deccel;
		} else {
			x_vel -= _hold * slipDeccel;
		}
		if sign(x_vel) != _hold {
			x_vel = 0; //bug fix
		}
	}
	x_vel = min(abs(x_vel),topSpeed)*sign(x_vel); //velocity cap
	
	if nearWall(walljumpDistance) {
		if key_bufferJump { //walljump
			y_vel = -jumpVel;
			if meeting(x-walljumpDistance,y) {
				dir = 1;
			} else {
				dir = -1;
			}
			x_vel = topSpeed * dir;
			key_bufferJump = 0;
		
			controlJump = 1;
			
			currentDirScale = dir;
		
			wallKeyLock = TWallKeyLock;
			
			if !(place_meeting(x-walljumpDistance,y,obj_slipwall) || place_meeting(x+walljumpDistance,y,obj_slipwall)) {
				dashLeft = 1;
			}
			xScale = jumpXScale;
			yScale = jumpYScale;
			
			
			audio_stop_sound(snd_land);
			audio_play_sound(snd_jump,1,0)
		}
	}
	
break;
case 1:
	if yCollision {
		if y_vel >= terminalVel / 2 {
			xScale = landXScale;
			yScale = landYScale;
			
			floorAnimation = TFloorAnimation
			
			audio_play_sound(snd_land,1,0)
		}
		y_vel = 0;
	}
	if xCollision {
		if meeting(x+(key_right-key_left),y) && y_vel > 0 && crouch = 0 && !key_bufferJump && !onGround() && !place_meeting(x+(key_right-key_left),y,obj_slipwall) {
			playerState = player_grip; //we grip when there is a wall and we are moving down
		}
		x_vel = 0;
	}
	
	if onGround() {
		coyoteTime = TCoyoteTime; //coyote time, google it
		lastYGround = y;
		controlJump = 0;
		if !place_meeting(x,y+1,obj_slipwall) && lastDashTimer==0 {
			dashLeft = normalDash;
		}
		
		
		if sign(x_vel) != sign(dashX_vel + platX_vel) {
			
			dashX_vel = lerp(dashX_vel,0,dashMDampGround);
			
			platX_vel = lerp(platX_vel,0,dashMDampGround);
		} else {
			
			dashX_vel = lerp(dashX_vel,0,dashMDamp*4);
			platX_vel = lerp(platX_vel,0,dashMDamp*5);
		}
		
		platY_vel = lerp(platY_vel,0,dashMDampGround);
	} else {
		
		if sign(x_vel) != sign(dashX_vel + platX_vel) {
			
			dashX_vel = lerp(dashX_vel,0,dashMDampGround);
			
			platX_vel = lerp(platX_vel,0,dashMDampGround*0.9);
		} else {
			
			dashX_vel = lerp(dashX_vel,0,dashMDamp);
			
			platX_vel = lerp(platX_vel,0,dashMDamp);
		}
		
		platY_vel = lerp(platY_vel,0,dashMDamp);
	}
	
	
	coyoteTime = max(coyoteTime - 1, 0);
	floorAnimation = max(floorAnimation - 1, 0);
	lastDashTimer = max(lastDashTimer - 1, 0);
	
	superLongJump = max(superLongJump-1,0);
	var _prevWall = wallKeyLock;
	wallKeyLock = max(wallKeyLock - 1, 0);
	if wallKeyLock = 0 && wallKeyLock != _prevWall {
		var _key = key_right - key_left;
		if _key != dir {
			x_vel = _key * hijackXVel;
			y_vel += -hijackYAdd;
		} else {
			controlJump = 0;
		}
	}
break;

}

}