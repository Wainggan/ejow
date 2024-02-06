// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_check_dead(_input){

	if _input = spikes.normal {
		return true;
	}
	switch _input {
		case spikes.up:
			if ySpeed >= 0 {
				return true;
			}
			break;
		case spikes.down:
			if ySpeed <= 0 {
				return true;
			}
			break;
		case spikes.left:
			if xSpeed >= 0 {
				return true;
			}
			break;
		case spikes.right:
			if xSpeed <= 0 {
				return true;
			}
			break;
	}
	
	return false;

}