if musicToPlay = -1 {
	audio_stop_all()
}
if !audio_is_playing(musicToPlay) {
	audio_stop_all()
	if playMusic {
		audio_play_sound(musicToPlay,20,1)
	}
}