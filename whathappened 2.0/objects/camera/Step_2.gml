if !game_pause {

var _targetX = x;
var _targetY = y;
if instance_exists(target) {
	_targetX = target.x
	_targetY = target.y
}
if instance_exists(target) && !lastExist {
	x = _targetX;
	y = _targetY;
}
if suc = -1 {
	if instance_exists(target) {
		if target = obj_player {
			with obj_player {
				other.checkFix = 0;
				
				if place_meeting(x,y,obj_cameraDirRight) {
					
					other.checkFix = 1;
				} else if place_meeting(x,y,obj_cameraDirLeft) {
					
					other.checkFix = -1;
				}
			}
			_targetX += 128 * checkFix;
			x = lerp(x, _targetX+(directionAmount*target.dir)+((target.dashX_vel+target.platX_vel)*speedAmount), 1/spdX);
			
			with obj_player {
				other.checkFix = 0;
				
				if place_meeting(x,y,obj_cameraDirdown) {
					other.checkFix = 1;
				}
			}
			_targetY += 256 * checkFix;
			
			
			y = lerp(y, _targetY-32, 1/spdY);
		} else {
			x = lerp(x, _targetX, 1/spdX);
			y = lerp(y, _targetY, 1/spdX);
		}
	}
}
suc = -1;

var _cameraX, _cameraY, _offX, _offY, _roomLX, _roomLY;
_cameraX = camera_get_view_x(view_camera[0]);
_cameraY = camera_get_view_y(view_camera[0]);
_offX = camera_get_view_width(view_camera[0])/2;
_offY = camera_get_view_height(view_camera[0])/2;
_roomLX = -_offX + x;
_roomLY = -_offY + y;

camera_set_view_pos(view_camera[0],clamp(x-_offX,0,room_width-_offX*2),clamp(y-_offY,0,room_height-_offY*2));
_cameraX = camera_get_view_x(view_camera[0]);
_cameraY = camera_get_view_y(view_camera[0]);


screenShake = max(screenShake-1,0);
if screenShake != 0 {
	camera_set_view_pos(view_camera[0],_cameraX+irandom_range(-screenShake,screenShake),_cameraY+irandom_range(-screenShake,screenShake));
}
}


var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
if layer_exists("parallax1") {
	layer_x("parallax1", _cam_x * 0.18);
	layer_y("parallax1", _cam_y * 0.18);
}
if layer_exists("parallax2") {
	layer_x("parallax2", _cam_x * 0.3);
	layer_y("parallax2", _cam_y * 0.3);
}
if layer_exists("parallax3") {
	layer_x("parallax3", _cam_x * 0.5);
	layer_y("parallax3", _cam_y * 0.5);
}
if layer_exists("parallax4") {
	layer_x("parallax4", _cam_x * 0.7);
	layer_y("parallax4", _cam_y * 0.7);
}


if (layer_sequence_exists("transition",global.sequenceLayer)) {
	layer_sequence_x(global.sequenceLayer,camera_get_view_x(view_camera[0])+384);
	layer_sequence_y(global.sequenceLayer,camera_get_view_y(view_camera[0])+256);
}

lastExist = instance_exists(target);

audio_listener_position(x, y, 0);