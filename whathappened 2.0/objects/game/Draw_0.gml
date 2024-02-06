if lastButtonClick != 1 {
	var _inst = instance_place(mouse_x,mouse_y,obj_clickable)
	if _inst != noone {
		draw_sprite(spr_mouse,1,mouse_x,mouse_y)
		if mouse_check_button_pressed(mb_left) {
			
			with _inst {
				url_open(_inst.link);
			}
		}
	} else {
		draw_sprite(spr_mouse,0,mouse_x,mouse_y)
	}
}