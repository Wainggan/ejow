if instance_exists(obj_player) {
	if place_meeting(x,y,obj_player) && obj_player.y_vel >= 0 {
		
		with obj_player {
			while place_meeting(x,y,other) {
				y -= 1;
			}
			y_vel = -8;
			controlJump = 1;
			dashLeft = 1;
			
			playerState = player_free;
		}
		
		audio_play_sound(snd_bounce,2,0);
		
		image_xscale = 1.4;
		image_yscale = 0.6;
		
	}
}

image_xscale = lerp(image_xscale,1,0.1);
image_yscale = lerp(image_yscale,1,0.1);