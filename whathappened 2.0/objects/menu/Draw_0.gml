var _camX = camera_get_view_x(view_camera[0])
var _camY = camera_get_view_y(view_camera[0])

draw_set_alpha(0.75)
draw_set_color(c_black)
draw_rectangle(_camX,_camY,_camX+windowWidth,_camY+windowHeight,0)
draw_set_alpha(1)

draw_set_font(ft_main)

var _i = 0;

repeat selectionMax {
	if _i = selection {
		draw_set_color(c_red)
	} else {
		draw_set_color(c_white)
	}
	draw_text(_camX+8,_camY+(8+_i*32)-scroll*32,options[_i])
	_i += 1
}

draw_set_color(c_white)