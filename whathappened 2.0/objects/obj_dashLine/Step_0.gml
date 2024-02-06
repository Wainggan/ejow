repeat 4 {
part_particles_create(pSystem, x, y, particle[pType.dashParticle], 10);
x += lengthdir_x(4,direction);
y += lengthdir_y(4,direction);
}

amount --;
if amount == 0 {
	instance_destroy()
}