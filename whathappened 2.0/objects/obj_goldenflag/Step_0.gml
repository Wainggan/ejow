if currentCheckpoint == -1 {
	if place_meeting(x,y,obj_player) {
		transition_begin(targetRoom,sq_TRANS_fadeIn,sq_TRANS_slideOut)
		game_pause = 20
	}
}

image_index = (currentCheckpoint != -1);