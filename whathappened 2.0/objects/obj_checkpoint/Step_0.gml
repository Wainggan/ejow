if place_meeting(x,y,obj_player) {
	with obj_player {
		other.checkGround = onGround();
	}
	if !lastCollide {
		if checkGround == 1 && !(key_down && obj_player.x_vel = 0 && obj_player.playerState = player_dash) {
			if currentCheckpoint != id {
				currentCheckpoint = id;
				game_save_file();
				
				audio_play_sound(snd_checkpoint,2,0);
			}
		}
	}
} else {
	lastCollide = 0;
}

image_index = (currentCheckpoint == id);