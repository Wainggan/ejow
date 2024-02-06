text = "you must be quite cool, breaking the laws of this universe to read this";
color = c_black

state = 0;

dir = -1

width = 256

mask_index = sprite_index

talkAmount = 0;
var _file = file_text_open_read(WAINGGANTALK_FILE_NAME)
if _file != -1 {
	talkAmount = file_text_read_real(_file)
	file_text_close(_file)
}


ini_open(FILE_NAME)
var _out = ini_read_real("universe","talk",0);
ini_close();

if _out {
	instance_destroy()
}