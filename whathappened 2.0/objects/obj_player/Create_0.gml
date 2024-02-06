playerState = player_free;

x_vel = 0;
y_vel = 0;
x_velFraction = 0;
y_velFraction = 0;

dashX_vel = 0;
dashY_vel = 0;
dashX_velFraction = 0;
dashY_velFraction = 0;

platX_vel = 0;
platY_vel = 0;
platX_velFraction = 0;
platY_velFraction = 0;


if currentCheckpoint != -1 {
	x = currentCheckpoint.x;
	y = currentCheckpoint.y;
}

//state
dir = 1;
controlJump = 0;

crouch = 0;

dashLeft = 0;
normalDash = 1;

teleDash = 0;

win = 0;


//movement

jumpVel = 4.5; //jumping
grav = 0.75;
holdGrav = 0.25;
peakThresh = 0.3;
peakGrav = 0.1;
terminalVel = 4.5;
fastGrav = 0.5;
fastTerminalVel = 6;

jumpMo = 1.02;
iceJumpMo = 0.4;

accel = 0.5; //left-right
deccel = 1;
slipAccel = 0.05;
slipDeccel = 0.1;
topSpeed = 3;

climbUpSpd = 2; //climbing
climbDownSpd = 3;

climbPlatformX = 4;
climbPlatformY = 1.2;

TClimbPlatformTime = 3;

walljumpDistance = 3;
superWalljumpDistance = 6;
overWallFix = 17;

dashSpeed = 8;
longJumpSpeed = 7;
longJumpYVel = 3.5;

dashMDamp = 0.008;
dashMDampGround = 0.3;

dashMTopSpeed = 6.5;

teleDistance = 14*8;

//record

lastYGround = y;
lastState = playerState;

lastGround = 0;

xCollision = 0;
yCollision = 0;

xSpeed = 0;
ySpeed = 0;

//timers

coyoteTime = 0;
TCoyoteTime = 6;

wallStick = 0;
TWallStick = 6;

wallKeyLock = 0; //hijack
TWallKeyLock = 7;
TSuperWallBounceLock = 15;
hijackXVel = 0.5;
hijackYAdd = 0.5;

floorAnimation = 0;
TFloorAnimation = 6;

dashStartTimer = 0;
TDashStartTimer = 4;
dashTimer = 0;
TDashTime = 7;

superLongJumpStart = 5;
superLongJump = 0;
TSuperLongJump = 3;

lastDashTimer = 0;
TlastDashTimer = 16;

deathTimer = 0;
deathTimerThresh = 1;
deathTimerThreshDash = 3;


//graphics

xScale = 1; //squish
yScale = 1;

currentDirScale = dir;
currentDirScaleSpeed = 0.7

xScaleTarget = 1;
yScaleTarget = 1;
scaleAmount = 0.18;

jumpXScale = 0.7;
jumpYScale = 1.3;
landXScale = 1.2;
landYScale = 0.8;

duckXScale = 1.2;
duckYScale = 0.8;
lookUpXScale = 0.8;
lookUpYScale = 1.2;

depth = depth - 50

//animations

lastAnimation = sprite_index;

//enum
enum spikes {
	normal = 5,
	up = 2,
	right = 3,
	left = 7,
	down = 6
}