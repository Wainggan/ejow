if place_meeting(x,y,obj_player) {
	if onOffState != 1 {
		onOffState = 1;
		audio_play_sound(snd_onoff,2,0)
	}
}