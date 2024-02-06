if instance_exists(obj_player) {
	var _dir = obj_player.x - x;
	dir = sign(_dir)
}

var _prevState = state

draw_sprite_ext(sprite_index,image_index,x,y,dir,1,0,c_white,1)

if place_meeting(x,y,obj_player) {
	sprite_index = spr_waingganTalk
	
	draw_set_font(ft_main)
	
	draw_set_valign(fa_bottom)
	draw_set_color(color)

	draw_text_ext(x-(width/2),y-sprite_height-16,text,16,width)
	
	state = 1
} else {
	sprite_index = spr_waingganIdle
}

if state = 1 && _prevState = 0 {
	talkAmount += 1;
	
	var _file = file_text_open_write(WAINGGANTALK_FILE_NAME)
	file_text_write_real(_file,talkAmount)
	file_text_close(_file)
	
	ini_open(FILE_NAME)
	ini_write_real("universe","talk",1);
	ini_close();
	
}
if state = 1 {
	if instance_exists(obj_player) {
		if distance_to_object(obj_player) > 48 {
			instance_destroy()
		}
	}
}

draw_set_color(c_white)
draw_set_font(ft_console)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

