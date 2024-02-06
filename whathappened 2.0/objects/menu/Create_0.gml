startMenu = 0;

globalvar pauseMenu;
pauseMenu = 0;

selection = 0;
selectionMax = 0;

scroll = 0;

holdKey = 0;
holdKeyReload = 0;
FirstTHoldKeyReload = -20;
THoldKeyReload = 6;


maxSelectionsOnScreen = 16

windowWidth = camera_get_view_width(view_camera[0])
windowHeight = camera_get_view_height(view_camera[0])

optionHelper = 0;
lastOption = -1;

options = -1;

teleportOption = 0;
debugOption = 0;
settingOption = 0;

selectionMax = 0;

audio_play_sound(snd_menuEnter,50,0)