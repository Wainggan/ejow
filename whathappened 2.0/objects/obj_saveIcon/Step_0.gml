//image_angle = sin(frames / 3.14) * 20
image_angle = wave(-20,20,0.3,0)


frames += 1;
timeLeft -= 1;

if timeLeft <= 0 {
	instance_destroy();
}