// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tile_meeting(xpos,ypos,tilemap){

var _xx, _yy, _meet;

_xx = x;
_yy = y;

x = xpos;
y = ypos;

_meet = tile_line(bbox_right,bbox_top, bbox_right,bbox_bottom,tilemap,5);
if _meet != 1 {
	_meet = tile_line(bbox_right,bbox_bottom, bbox_left,bbox_bottom,tilemap,5);
	
	if _meet != 1 {
		_meet = tile_line(bbox_left,bbox_bottom, bbox_left,bbox_top,tilemap,5);
		
		if _meet != 1 {
			_meet = tile_line(bbox_left,bbox_top, bbox_right,bbox_top,tilemap,5);
		
			if _meet != 1 {
				_meet = 0
			}
		}
	}
}
		
x = _xx;
y = _yy;

return _meet;

}

function tile_pixel(xpos,ypos,tilemap){

var _out = layer_get_id(tilemap);
_out = layer_tilemap_get_id(_out);
return tilemap_get_at_pixel(_out,xpos,ypos);

}

function tile_line(_x1,_y1,_x2,_y2,_tilemap,_amount) {
	var _lenX, _lenY, _posX, _posY;
	_lenX = (_x2 - _x1) / _amount;
	_lenY = (_y2 - _y1) / _amount;
	_posX = _x1;
	_posY = _y1;
	
	var _out;
	repeat _amount {
		_out = tile_pixel(_posX, _posY, _tilemap);
		
		_posX += _lenX;
		_posY += _lenY;
		
		if _out {
			return _out;
		}
	}
	return false;
}