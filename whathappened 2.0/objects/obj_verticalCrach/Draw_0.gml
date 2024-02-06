var _density = 10

var _yy = y;
var i = 0;
do {
    _yy += dir*_density;
	i += _density;
} until (meeting(x,_yy) or i > length*abs(vSpeed)*3);

draw_rectangle(bbox_left,bbox_top,bbox_right,_yy,0)


draw_9slice(x,y,sprite_width,sprite_height,sprite_index,image_index)

