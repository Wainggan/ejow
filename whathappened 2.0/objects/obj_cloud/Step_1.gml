if game_pause exit;

coolDown = max(coolDown - 1, 0)

if place_meeting(x,y,obj_player) {
	if coolDown == 0 {
	
		with obj_player {
		
			var _dir = round(point_direction(other.x,other.y,x,y-overWallFix)/45)
			if _dir == 5 {
				_dir = 4
			} else if _dir == 7 {
				_dir = 0
			}
			_dir *= 45
		
			platX_vel = lengthdir_x(other.force,_dir) //((x-other.x)/other.radius)*other.force*3
			x_vel = sign(platX_vel)*topSpeed
			if sign(x_vel) != 0 {
				dir = sign(x_vel)
			}
			dashX_vel = 0;
			if platX_vel != 0 {
				wallKeyLock = TWallKeyLock
			}
			y_vel = lengthdir_y(other.force,_dir)//((y-other.y)/other.radius)*other.force/1.5
			if y_vel >= 0 {
				y_vel = -jumpVel
			}
			controlJump = 1;
		
			dashLeft = 1;
			state = player_free;
		}
		coolDown = 60
		game_pause = 8;
		screenShake = 6;
		
		audio_play_sound(snd_pop,2,0);
	}
}