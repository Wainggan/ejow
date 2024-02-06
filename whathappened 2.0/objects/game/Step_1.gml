game_pause = max(game_pause-1,0);
if keyboard_check(ord("Q")) {
	game_pause = 1
}

if keyboard_check_pressed(ord("R")) {
	if resetTimer != 0 {
		game_restart();
	} else {
		resetTimer = 14;
	}
}
resetTimer = max(resetTimer-1,0)

if key_pause {
	if instance_exists(menu) {
		instance_destroy(menu)
	} else {
		instance_create_depth(0,0,-10000,menu)
	}
}

if key_uped || key_downed || key_lefted || key_righted || key_jumped || key_dashed {
	lastButtonClick = 1;
}
if lastMouseX != device_mouse_x_to_gui(0) || lastMouseY != device_mouse_y_to_gui(0) {
	lastButtonClick = 0;
}

lastMouseX = device_mouse_x_to_gui(0);
lastMouseY = device_mouse_y_to_gui(0);

if room_speed != currentFrameRate {
	room_speed = currentFrameRate;
}