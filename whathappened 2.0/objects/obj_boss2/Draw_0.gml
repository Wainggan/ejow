var _look = 0;
if instance_exists(obj_player) {
	_look = (obj_player.x - x)/16;
}
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0+clamp(_look,-45,45), c_white, 1)

//-24 13

_look = 0;
if instance_exists(obj_player) {
	_look = point_direction(x,y,obj_player.x,obj_player.y)
}
draw_sprite_ext(spr_dolphinDownArm,0,x-10,y+3,1,1,_look, c_white, 1)

