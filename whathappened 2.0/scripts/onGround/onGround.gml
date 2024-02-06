
function meeting(xPos,yPos) {
	return tile_meeting(xPos,yPos,collisionLayer) || place_meeting(xPos,yPos,obj_wall);
}

function onGround(){
	return meeting(x,y+1)
}

function canUncrouch() {
	var _out, _prev;
	_prev = mask_index
	mask_index = mask_playerNormal;
	_out = meeting(x, y);
	mask_index = _prev;
	return !_out;
}

function nearWall(_distance) {
	return meeting(x-_distance,y) || meeting(x+_distance,y);
}

function clipOut() {
	var _topLeft, _topRight, _bottomLeft, _bottomRight, _mask;
	
	_topLeft = bbox_left
	_topRight = bbox_right
	_bottomLeft = bbox_bottom
	_bottomRight = bbox_top
	
	_mask = mask_index;
	mask_index = spr_pixel;
	
	_topLeft = meeting(_topLeft,_bottomRight);
	_topRight = meeting(_topRight,_bottomRight);
	_bottomLeft = meeting(_topLeft,_bottomLeft);
	_bottomRight = meeting(_topRight,_bottomLeft);
	
	mask_index = _mask;
	
	
	if _topLeft && _topRight && _bottomLeft && _bottomRight {
		return false;
	}
	
	if _topLeft && _topRight {
		while meeting(x,y) {
			y += 1;
		}
		return true;
	}
	if _topLeft && _bottomLeft {
		while meeting(x,y) {
			x += 1;
		}
		return true;
	}
	if _topRight && _bottomRight {
		while meeting(x,y) {
			x -= 1;
		}
		return true;
	}
	if _bottomLeft && _bottomRight {
		while meeting(x,y) {
			y -= 1;
		}
		return true;
	}
}