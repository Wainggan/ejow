if game_pause exit;


if instance_exists(obj_player) and timer > 20 {
	x = lerp(x,obj_player.xprevious,0.15)
}
if instance_exists(obj_player) {
	with obj_player {
		if place_meeting(x,y,obj_laserOverride) {
			instance_destroy(other);
		}
	}
}
timer -= 1;
if timer = 0 {
	audio_play_sound(snd_laser,1,0)
	screenShake = 6;
	if collision_line(x,0,x,room_height,obj_player,0,1) {
		player_death();
	}
}
if timer = -1 {
	instance_destroy()
}