var _camX = camera_get_view_x(view_camera[0])
var _camY = camera_get_view_y(view_camera[0])

if state = 0 {
	startTimer = max(startTimer-1,0)
	if startTimer = 0 {
		guiY = min(guiY+1,boxHeight)
		if guiY = 0 {
			state = 1;
			startTimer = 60;
		}
	}
} else if state = 1{
	startTimer = max(startTimer-1,0)
	if startTimer = 0 {
		state = 2;
	}
} else {
	guiY = max(guiY-1,-boxHeight-offsetY*2)
	if guiY = -boxHeight-offsetY*2 {
		instance_destroy()
	}
}

draw_set_font(ft_main)

draw_set_color(0x191919)
draw_rectangle(_camX,_camY+guiY,_camX+string_width(levelName)+(offsetX*2),_camY+boxHeight+guiY+(offsetY*2),0)

draw_set_color(c_white)

draw_rectangle(_camX,_camY+guiY,_camX+string_width(levelName)+(offsetX*2),_camY+boxHeight+guiY+(offsetY*2),1)
draw_text(_camX+offsetX,_camY+guiY+offsetY,levelName)
