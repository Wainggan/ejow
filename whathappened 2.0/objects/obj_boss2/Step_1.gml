if !game_pause {
	if instance_exists(obj_player) {
		fTime = max(fTime-1,0);
		
		fix = 0
		with obj_player {
			if place_meeting(x,y,obj_laserOverride) {
				other.fix = 1;
			}
		}
		
		if fTime = 0 && fix != 1 {
			var _dir = point_direction(x,y,obj_player.x,obj_player.y);
			var _inst = instance_create_layer(x,y-10,"instances",obj_bullet2);
			_inst.direction = _dir;
			fTime = fireRate
			screenShake = 5;
			audio_play_sound(snd_shoot,1,0)
			laserTime += 1
			if laserTime % 2 = 0 {
				instance_create_layer(x,y,"instances",obj_laserSet)
				//audio_play_sound(snd_laserStart,1,0)
			}
		}
		x = lerp(x,camera_get_view_x(view_camera[0])+(camera_get_view_width(view_camera[0])/2),0.1);
		y = lerp(y,camera_get_view_y(view_camera[0])+48,0.2);
	}
}
