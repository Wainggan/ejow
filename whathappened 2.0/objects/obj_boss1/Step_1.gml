if !game_pause {
	if instance_exists(obj_player) {
		fTime -= 1;
		if fTime = 0 {
			var _dir = point_direction(x,y,obj_player.x,obj_player.y);
			var _inst = instance_create_layer(x,y,"instances",obj_bullet);
			_inst.direction = _dir;
			fTime = fireRate
			screenShake = 5;
			audio_play_sound(snd_shoot,1,0)
		}
		
		
		x = lerp(x,camera_get_view_x(view_camera[0])+32,0.1);
		y = lerp(y,obj_player.y,0.03);
	}
	
	part_particles_create(pSystem, x-23, y+10, particle[pType.fire], 11);
}
