function player_tele(__time){
	
switch __time {

case 0:
	if lastState != player_tele {
		game_pause = 8;
		screenShake = 10;
	} else {
		if (key_right - key_left) != 0 {
			dir = key_right - key_left
		}
		x += teleDistance*dir;
		y_vel = -longJumpYVel
		controlJump = 1
		playerState = player_free;
		
		audio_play_sound(snd_teleport,1,0)
	}

break;
case 1:
	
break;

}


}

