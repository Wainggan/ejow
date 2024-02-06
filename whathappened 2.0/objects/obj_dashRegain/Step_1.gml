if game_pause exit;

if place_meeting(x,y,obj_player) && active = 0 {
	if obj_player.dashLeft != 1 {
		obj_player.dashLeft = 1;
		active = 120;
		game_pause = 4;
		set_vibrate(0.3,0.3,4);
		
		audio_play_sound(snd_collect,2,0);
	}
}
active = max(active-1,0);