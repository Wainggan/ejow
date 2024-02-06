if game_pause exit;

if place_meeting(x,y,obj_player) && active = 0 {
	if key_bufferJump {
		key_bufferJump = 0
		with obj_player {
			y_vel = -jumpVel-1.2
		}
		active = 120;
		game_pause = 4;
		set_vibrate(0.3,0.3,4);
		
		audio_play_sound(snd_collect,2,0);
	}
}
active = max(active-1,0);

if active = 0 {
	rotationSpeed = lerp(rotationSpeed,5,0.1)
} else {
	rotationSpeed = lerp(rotationSpeed,0 ,0.1)
}
dir += (active/120)*5+1