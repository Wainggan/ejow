if place_meeting(x,y,obj_player) {
	with camera {
		suc = other;
		x = lerp(x, other.x, 1/spdX);
		y = lerp(y, other.y, 1/spdX);
	}
}