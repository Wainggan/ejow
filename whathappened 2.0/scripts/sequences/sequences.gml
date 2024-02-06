global.midTransition = false;
global.roomTarget = -1;
global.sequenceLayer = -1;

function transition_create(_type) {
	if layer_exists("transition") {
		layer_destroy("transition");
	}
	var _lay = layer_create(-9999,"transition");
	var _cam = view_camera[0];
	global.sequenceLayer = layer_sequence_create(_lay,camera_get_view_x(_cam),camera_get_view_y(_cam),_type);

}

function transition_begin(_roomTarget, _typeIn, _typeOut) {
	if !global.midTransition {
		global.midTransition = true;
		global.roomTarget = _roomTarget;
		transition_create(_typeIn);
		layer_set_target_room(_roomTarget);
		transition_create(_typeOut);
		layer_reset_target_room();
		return true;
	}
	return false;
}

function transition_change_room() {
	room_goto(global.roomTarget);
}

function transition_finish() {
	layer_sequence_destroy(self.elementID);
	global.midTransition = false;
}