if place_meeting(x,y,obj_player) {
	if !lastCollide {
		onOffState = !onOffState
		lastCollide = 1;
		game_pause = 10;
		
		audio_play_sound(snd_onoff,2,0);
	}
} else {
	lastCollide = 0;
}