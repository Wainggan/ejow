if !game_pause {
	
	
	if teleDash = 0 {
		if key_bufferDash and dashLeft != 0 {
			key_bufferDash = 0;
			playerState = player_dash;
		}
	} else {
		if key_bufferDash and !meeting(x+teleDistance*dir,y) {
			key_bufferDash = 0;
			playerState = player_tele;
			teleDash = 0;
		}
	}
	script_execute(playerState,0);
	
	
	var _amount = (x_vel - frac(x_vel)) +
				(dashX_vel-frac(dashX_vel)) +
				(platX_vel-frac(platX_vel));
	
	xCollision = moveCollide_x(_amount)
	
	
	_amount = (y_vel-frac(y_vel)) +
				(dashY_vel-frac(dashY_vel)) +
				(platY_vel-frac(platY_vel));
	
	
	var _mask = mask_index;
	var _collide = meeting(x,y+_amount) && _amount < 0 ;
	var _direction = 0;
	mask_index = mask_playerRepo;
	if _collide {
		if !meeting(x,y+_amount) {
			mask_index = mask_playerLeftRepo;
			if meeting(x,y+_amount) {
				_direction = 1;
			} else {
				_direction = -1
			}
			mask_index = _mask;
			while meeting(x,y+_amount) {
				x += _direction;
			}
		}
	}
	mask_index = _mask;
	
	yCollision = moveCollide_y(_amount)
	
	lastState = playerState;
	
	script_execute(playerState,1);
	
	
	xScale = lerp(xScale,xScaleTarget,scaleAmount);
	yScale = lerp(yScale,yScaleTarget,scaleAmount);
	
	currentDirScale = approach(currentDirScale,dir,currentDirScaleSpeed)
	
	xSpeed = (x-xprevious)+frac(x_vel);
	ySpeed = (y-yprevious)+frac(y_vel);
	
	
	
	if crouch {
		mask_index = mask_playerDuck;
	} else {
		mask_index = mask_playerNormal;
	}
	
	var _col, _out;
	_col = tile_pixel(bbox_left,bbox_top,collisionLayer)
	_out = 0;
	if _col >= 2 {
		_out = player_check_dead(_col);
	}
	if _out = 0 {
		_col = tile_pixel(bbox_right,bbox_top,collisionLayer)
		_out = 0;
		if _col >= 2 {
			_out = player_check_dead(_col);
		}
		if _out = 0 {
			_col = tile_pixel(bbox_left,bbox_bottom,collisionLayer)
			_out = 0;
			if _col >= 2 {
				_out = player_check_dead(_col);
			}
			if _out = 0 {
				_col = tile_pixel(bbox_right,bbox_bottom,collisionLayer)
				_out = 0;
				if _col >= 2 {
					_out = player_check_dead(_col);
				}
			}
		}
	}
	if place_meeting(x,y,obj_death) {
		_out = 1;
	}
	if _out != 0 {
		deathTimer += 1;
		if playerState = player_dash {
			if deathTimer > deathTimerThreshDash {
				player_death();
			}
		} else {
			if deathTimer > deathTimerThresh {
				player_death();
			}
		}
	} else {
		deathTimer = 0;
	}
	

	if layer_exists("secret") {
		layer_set_visible("secret",!tile_pixel(x,y-overWallFix,"secret"));
	}
}