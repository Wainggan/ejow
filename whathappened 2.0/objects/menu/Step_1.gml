holdKey = 0;
if key_down - key_up != 0 {
	if holdKeyReload = 0 {
		holdKeyReload = FirstTHoldKeyReload
	}
	if holdKeyReload < 0 {
		holdKeyReload += 1;
		if holdKeyReload = -1 {
			holdKeyReload = THoldKeyReload;
			holdKey = 1
		}
	} else if holdKeyReload > 0 {
		holdKeyReload -= 1;
		if holdKeyReload = 1 {
			holdKeyReload = THoldKeyReload;
			holdKey = 1
		}
	}
} else {
	holdKeyReload = 0;
}


options = -1
optionHelper = 0;
if startMenu {
	add_option("Continue")
	add_option("Restart")
	add_option("Exit")
} else {
	add_option("Continue")
	add_option("Retry")
	add_option("Restart Level")
	add_option("Reset Game")
	add_option("Exit")
	add_option("  Settings")
	if debugMode {
		add_option("  Teleport")
		add_option("  Debug")
	} else {
		add_option("  --")
		add_option("  --")
	}
	lastOption = optionHelper;
	if settingOption {
		add_option("    Toggle Full-Screen")
		add_option("    Toggle Bloom")
		add_option("    Toggle Music")
	}
	if teleportOption {
		add_option("    1-1")
		add_option("    1-2")
		add_option("    1-3")
		add_option("    1-4")
					    
		add_option("    2-1")
		add_option("    2-2")
		add_option("    2-3")
		add_option("    2-4")
					    
		add_option("    3-1")
		add_option("    3-2")
		add_option("    3-3")
		add_option("    3-4")
					    
		add_option("    4-1")
		add_option("    4-2")
		add_option("    4-3")
		add_option("    4-4")
		
		add_option("    Game End")
	}
	if debugOption {
		add_option("    Toggle Debug View")
		add_option("    FPS = 30")
		add_option("    FPS = 10")
		add_option("    FPS = 60")
		add_option("    Force Restart Game")
	}
}
selectionMax = array_length(options)

var _lastSelection = selection
if key_downed - key_uped == 0 && holdKey {
	selection += key_down - key_up;
} else {
	selection += key_downed - key_uped;
}

selection = clamp(selection, 0, selectionMax-1);
if selection != _lastSelection {
	audio_play_sound(snd_select,50,0)
}
scroll = lerp(scroll,selection-round(maxSelectionsOnScreen/2),0.1)

scroll = max(scroll,0)

game_pause = 10;


if key_jumped {
	if startMenu {
		switch selection {
			case 0:
				instance_create_depth(0,0,-9999,game);
				break;
			case 1:
				file_delete(FILE_NAME)
				instance_create_depth(0,0,-9999,game);
				audio_play_sound(snd_click,50,0)
				break;
			case 2:
				game_end();
				break;
		}
	} else {
		var _fix = 0;
		switch selection {
			case 0:
				audio_play_sound(snd_exit,50,0)
				instance_destroy();
				break;
			case 1:
				player_death();
				audio_play_sound(snd_click,50,0)
				instance_destroy();
				break;
			case 2:
				currentCheckpoint = -1
				game_save_file();
				player_death()
				audio_play_sound(snd_click,50,0)
				instance_destroy();
				break;
			case 3:
				with game {
					event_user(2)
				}
				audio_play_sound(snd_click,50,0)

				instance_destroy();
				break;
			case 4:
				game_end();
				break;
			case 5:
				settingOption = 1;
				teleportOption = 0;
				debugOption = 0;
				selection = lastOption
				_fix = 1;
				audio_play_sound(snd_click,50,0)
				break;
			case 6:
				if debugMode {
					settingOption = 0;
					teleportOption = 1;
					debugOption = 0;
					selection = lastOption
					_fix = 1;
					audio_play_sound(snd_click,50,0)
				}
				break;
			case 7:
				if debugMode {
					settingOption = 0;
					teleportOption = 0;
					debugOption = 1;
					selection = lastOption
					_fix = 1;
					audio_play_sound(snd_click,50,0)
				}
				break;
		}
		if _fix = 0 {
		if teleportOption {
			switch selection-lastOption {
				case 0:
					goto_room(rm_1_1)
					instance_destroy();
					break;
				case 1:
					goto_room(rm_1_2)
					instance_destroy();
					break;
				case 2:
					goto_room(rm_1_3)
					instance_destroy();
					break;
				case 3:
					goto_room(rm_1_4)
					instance_destroy();
					break;
				
				
				case 4:
					goto_room(rm_2_1a)
					instance_destroy();
					break;
				case 5:
					goto_room(rm_2_2)
					instance_destroy();
					break;
				case 6:
					goto_room(rm_2_3)
					instance_destroy();
					break;
				case 7:
					goto_room(rm_2_4)
					instance_destroy();
					break;
				
				
				case 8:
					goto_room(rm_3_1)
					instance_destroy();
					break;
				case 9:
					goto_room(rm_3_2)
					instance_destroy();
					break;
				case 10:
					goto_room(rm_3_3)
					instance_destroy();
					break;
				case 11:
					goto_room(rm_3_4)
					instance_destroy();
					break;
					
					
				case 12:
					goto_room(rm_4_1a)
					instance_destroy();
					break;
				case 13:
					goto_room(rm_4_2)
					instance_destroy();
					break;
				case 14:
					goto_room(rm_4_3)
					instance_destroy();
					break;
				case 15:
					goto_room(rm_4_4)
					instance_destroy();
					break;
					
				case 16:
					goto_room(rm_sandwich)
					instance_destroy();
					break;
			}
		} else if debugOption {
			switch selection-lastOption {
				case 0:
					with game {
						hidden = !hidden;
						layer_set_visible("collision",hidden);
						layer_set_visible("camera",hidden);
						layer_set_visible("flags",hidden);
					}
					instance_destroy()
					break;
				case 1:
					game.currentFrameRate = 30;
					instance_destroy()
					break;
				case 2:
					game.currentFrameRate = 10;
					instance_destroy()
					break;
				case 3:
					game.currentFrameRate = 60;
					instance_destroy()
					break;
				case 4:
					game_restart()
					break;
					
			}
		} else if settingOption {
			switch selection-lastOption {
				case 0:
					window_set_fullscreen(!window_get_fullscreen());
					instance_destroy()
					break;
				case 1:
					if file_exists(BLOOM_OFF) {
						file_delete(BLOOM_OFF)
						bloom = true
					} else {
						var _file = file_text_open_write(BLOOM_OFF)
						file_text_close(_file)
						bloom = false
					}
					instance_destroy()
					break;
				case 2:
					playMusic = !playMusic
					instance_destroy()
					break;
			}
		}
		
		}
		
	}
	key_jumped = 0;
}