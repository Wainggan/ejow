TLife = 3;
life = TLife;

if instance_exists(obj_player) {
	sprite_index = obj_player.sprite_index;
	image_index = obj_player.image_index;

	image_xscale = obj_player.xScale * obj_player.dir;
	image_yscale = obj_player.yScale;

	var xV = obj_player.x_vel;
	var yV = obj_player.y_vel;
	
	dir = point_direction(0,0,xV,yV);
} else {
	instance_destroy();
}