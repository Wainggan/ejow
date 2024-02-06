var _color = c_white
if active != 0 {
	_color = c_gray
}

//draw_sprite_ext(sprite_index,0,x,y+wave(-1,1,3,0),1,1,direction,_color,1);
//draw_sprite_ext(sprite_index,1,x,y+wave(-1,1,3,2),1,1,-direction,_color,1);
draw_sprite_wave(sprite_index,(active == 0 ? 0 : 1),x,y,0,6,1+(active/120)*2,time/20);
draw_sprite_ext(sprite_index,2,x,y+wave(-1,1,3,2),1,1,-direction,_color,1);

if game.hidden {
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1)
}