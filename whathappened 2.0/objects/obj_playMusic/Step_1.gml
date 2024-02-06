if playMusic {
	if !audio_is_playing(musicToPlay) {
		audio_play_sound(musicToPlay,20,1)
	}
} else {
	if audio_is_playing(musicToPlay) {
		audio_stop_all();
	}
}