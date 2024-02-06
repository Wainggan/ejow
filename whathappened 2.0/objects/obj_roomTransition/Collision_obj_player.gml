var _trans = sq_TRANS_winIn;
obj_player.win = 1;
if !winner {
	_trans = sq_TRANS_slideIn;
	obj_player.win = 0;
} else {
	if lastSound = 0 {
		audio_play_sound(snd_levelwin,2,0);
		lastSound = 1;
	}
}
transition_begin(targetRoom,_trans,sq_TRANS_slideOut);
game_pause = 15;