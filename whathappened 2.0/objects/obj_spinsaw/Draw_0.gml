draw_set_color(0x363636) //color of saw

draw_line_width(xstart,ystart,x,y,5)
draw_set_color(c_white)
draw_self()

if game.hidden {
	var rad = y - bbox_top
	
	draw_circle(x,y,rad,1)
}