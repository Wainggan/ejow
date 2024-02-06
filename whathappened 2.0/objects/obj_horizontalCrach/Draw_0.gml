var _density = 10

var _xx = x;
var i = 0;
do {
    _xx += dir*_density;
	i += _density;
} until (meeting(_xx,y) or i > length*abs(hSpeed)*3);

draw_rectangle(bbox_left,bbox_top,bbox_left,_xx,0);

draw_9slice(x,y,sprite_width,sprite_height,sprite_index,image_index);