direction += max(active/2,3);

var _color = c_white
if active != 0 {
	_color = c_gray
}

draw_sprite_ext(sprite_index,0,x,y,1,1,direction,_color,1);
draw_sprite_ext(sprite_index,1,x,y,1,1,-direction,_color,1);

if game.hidden {
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1)
}