target = obj_player;

if instance_exists(target) {
	x = target.x;
	y = target.y;
}
lastExist = instance_exists(target);

tX = x;
tY = y;

spdX = 16;
spdY = 20;

checkFix = 0


directionAmount = 16;
speedAmount = 12;


suc = -1;

audio_listener_orientation(0,1,0,0,0,1);