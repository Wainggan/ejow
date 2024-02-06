image_alpha = (life/TLife);

motion_blur(life,dir);


life -= 1;
if life <= 0 {
	instance_destroy();
}