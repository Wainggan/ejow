function goto_room(rm) {
	if instance_exists(obj_player) {
		var _inst = instance_create_layer(obj_player.x,obj_player.y-16,"flags",obj_roomTransition);
		_inst.targetRoom = rm;
		_inst.winner = 0;
	}
}
function add_option(name) {
	options[optionHelper] = name;
	optionHelper += 1;
}