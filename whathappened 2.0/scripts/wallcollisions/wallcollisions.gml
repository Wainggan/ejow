// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wallCollidePlayerGrip() {
	var _out = place_meeting(x+1,y,obj_player) || place_meeting(x-1,y,obj_player);
	if !instance_exists(obj_player) {
		_out = false
	} else {
		_out = _out && (obj_player.playerState == player_grip)
	}
	return _out;
}
function wallCollidePlayerStand() {
	return place_meeting(x,y-1,obj_player);
}

function wallCollide() {
	return wallCollidePlayerStand() || wallCollidePlayerGrip();
}