globalvar game_pause, collisionLayer, currentCheckpoint;
game_pause = 0;
collisionLayer = "collision";

globalvar screenShake;
screenShake = 0;

globalvar onOffState;
onOffState = 1;

globalvar debugMode;
debugMode = 0;
if file_exists(DEBUG_FILE_NAME) {
	debugMode = 1;
}

globalvar playMusic;
playMusic = 1;

/*globalvar talkAmount;
talkAmount = 0
var _file = file_text_open_read(WAINGGANTALK_FILE_NAME)
if _file != -1 {
	talkAmount = file_text_read_real(_file)
	file_text_close(_file)
}*/

globalvar beatGame;
beatGame = 0;
if file_exists(BEATGAME_FILE_NAME) {
	beatGame = 1;
}

globalvar bloom;
bloom = true;
if file_exists(BLOOM_OFF) {
	bloom = false;
}

mask_index = spr_pixel


layer_create(-1000,"imadeamistake")

instance_create_layer(0,0,"imadeamistake",particles)
instance_create_layer(0,0,"imadeamistake",shader)

lastRoom = -1;

newRoom = -1;

currentFrameRate = 60;

event_user(1);
transition_begin(newRoom,sq_TRANS_fadeIn,sq_TRANS_slideOut);

hidden = 0;

resetTimer = 0;

depth = -999999999

lastMouseX = 0;
lastMouseY = 0;
lastButtonClick = 0;