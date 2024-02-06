if wallCollidePlayerStand() && state = 0{
	state = 1;
	debugMode = 1;
	var _file = file_text_open_write(DEBUG_FILE_NAME);
	file_text_close(_file)
}

if state {
	mask_index = spr_squish 
} else {
	mask_index = spr_squishbighitbox
}