globalvar debugConsole;
debugConsole = 0;

function init_log(){
	debugConsole = 0;
}

function increment_console() {
	debugConsole += 12
}

function write_console(_text,_xPos,_yPos) {
	draw_set_font(ft_console)
	draw_text(_xPos,debugConsole+_yPos,_text)
	increment_console()
}