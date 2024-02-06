if game_pause exit;

{ // calculate next velocity
	var _yy = y;
	var i = 0;
	if state = 0 {
		do {
		    y += vSpeed;
			if place_meeting(x,y,obj_player){
				state = 1;
				time = length;
				break;
			}
			i += 1;
		} until (i > length);
	}
	y = _yy

	if state = 1 {
		y_vel = vSpeed;
		time -= 1;
		if time <= 0 {
			state = -1;
			time = backLength
			
			screenShake = abs(y_vel)*2;
		}
	} else if state = -1 {
		y_vel = backVSpeed;
		time -= 1;
		if time <= 0 {
			state = 0;
			
			screenShake = abs(y_vel)*2;
		}
	} else {
		y_vel = 0;
		y = ystart;
	}
}

if instance_exists(obj_player) {
	if place_meeting(x,y+y_vel, obj_player) {
		with obj_player {
			moveCollide_y(-other.y_vel);
		}
	}
	
	if wallCollide() || lastStand {
		var _col = wallCollide()
		
		mask_index = mask_empty;
		with obj_player {
			moveCollide_y(other.y_vel);
		}
		mask_index = sprite_index;
		
		if !_col && lastStand {
			if y_vel < 0 {
				obj_player.y_vel += y_vel;
			}
		}
		
		
	}
}

y += y_vel;

lastStand = wallCollide();