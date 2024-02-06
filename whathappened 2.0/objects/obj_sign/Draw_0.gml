draw_self()

if place_meeting(x,y,obj_player) {
	draw_set_font(ft_main)
	
	draw_set_valign(fa_bottom)
	draw_set_color(color)

	draw_text_ext(x-(width/2),y-sprite_height-16,text,16,width)
}

draw_set_color(c_white)
draw_set_font(ft_console)
draw_set_halign(fa_left)
draw_set_valign(fa_center)

