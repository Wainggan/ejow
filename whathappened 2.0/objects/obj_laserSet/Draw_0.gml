var _color = merge_color(c_red,c_maroon,timer/50)
draw_set_color(_color)

if timer > 0 {
	if timer < 20 {
		draw_set_color(c_white)
	}
	draw_line(x,0,x,room_height)
	
} else {
	draw_set_color(c_red)
	draw_rectangle(x-4,0,x+4,room_height,0)
}

draw_set_color(c_white)