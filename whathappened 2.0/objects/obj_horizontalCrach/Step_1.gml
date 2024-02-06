if game_pause exit;

{ // calculate next velocity
	var _xx = x;
	var i = 0;
	if state = 0 {
		do {
		    x += hSpeed;
			if place_meeting(x,y,obj_player){
				state = 1;
				time = length;
				break;
			}
			i += 1;
		} until (i > length);
	}
	x = _xx

	if state = 1 {
		x_vel = hSpeed;
		time -= 1;
		if time <= 0 {
			state = -1;
			time = backLength
			
			screenShake = abs(x_vel)*2;
		}
	} else if state = -1 {
		x_vel = backHSpeed;
		time -= 1;
		if time <= 0 {
			state = 0;
			
			screenShake = abs(x_vel)*2;
		}
	} else {
		x_vel = 0;
		x = xstart;
	}
}

if instance_exists(obj_player) {
	if place_meeting(x+x_vel,y, obj_player) {
		with obj_player {
			moveCollide_x(-other.x_vel);
		}
	}
	
	if wallCollide() || lastStand {
		var _col = wallCollide()
		
		mask_index = mask_empty;
		with obj_player {
			moveCollide_x(other.x_vel);
		}
		mask_index = sprite_index;
		
		if !_col && lastStand {
			obj_player.platX_vel = x_vel;
		}
		
		
	}
}

x += x_vel;

lastStand = wallCollide();