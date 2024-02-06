if game_pause exit;

{ // calculate next velocity
	if wallCollide() && state = 0 && x = xstart {
		state = 1;
		time = length;
	}

	if state = 1 {
		x_vel = hSpeed;
		time -= 1;
		if time <= 0 {
			state = -1;
			time = backLength
			
			screenShake = abs(x_vel)*2;
			
			
			audio_play_sound(snd_crash,2,0);
		}
	} else if state = -1 {
		x_vel = backHSpeed;
		time -= 1;
		if time <= 0 {
			state = 0;
			
			screenShake = abs(x_vel)*2;
			
			audio_play_sound(snd_lessercrash,2,0);
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