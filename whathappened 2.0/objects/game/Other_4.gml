if room != room_first {
	layer_set_visible("collision",hidden);
	layer_set_visible("camera",hidden);
	layer_set_visible("flags",hidden);

	if room != lastRoom && lastRoom != -1 {
		currentCheckpoint = -1;
		game_save_file();
	}
	
	game_load_file();

	instance_create_layer(obj_playerSpawn.x,obj_playerSpawn.y,"instances",obj_player);
	
	lastRoom = room
}

game_pause = 0;