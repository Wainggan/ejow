depth = -1000000

globalvar pSystem;
pSystem = part_system_create_layer(layer, true);

enum pType {
	dashPop,
	dashParticle,
	deathPop,
	fire,
}

globalvar particle;

particle[pType.dashPop] = part_type_create();
part_type_shape(particle[pType.dashPop], pt_shape_flare);
part_type_size(particle[pType.dashPop], 0.005, 0.01, 0, 0.25);
part_type_color3(particle[pType.dashPop], c_aqua, c_lime, c_red);
part_type_alpha3(particle[pType.dashPop], 0.5, 1, 0);
part_type_speed(particle[pType.dashPop], 2, 5, -0.10, 0);
part_type_direction(particle[pType.dashPop], 0, 359, 0, 20);
part_type_blend(particle[pType.dashPop], true);
part_type_life(particle[pType.dashPop], 5, 10);

particle[pType.dashParticle] = part_type_create();
part_type_shape(particle[pType.dashParticle], pt_shape_disk);
part_type_size(particle[pType.dashParticle], 0.05, 0.05, 0, 0);
part_type_color1(particle[pType.dashParticle], c_white);
part_type_alpha3(particle[pType.dashParticle], 0, 1, 0.5);
part_type_speed(particle[pType.dashParticle], 0, 1, 0, 0);
part_type_direction(particle[pType.dashParticle], 0, 359, 0, 0);
part_type_blend(particle[pType.dashParticle], true);
part_type_life(particle[pType.dashParticle], 4, 8);

particle[pType.deathPop] = part_type_create();
part_type_shape(particle[pType.deathPop], pt_shape_sphere);
part_type_size(particle[pType.deathPop], 0.08, 0.2, -0.01, 0.1);
part_type_color2(particle[pType.deathPop], c_aqua, 0xFF69B4);
part_type_alpha3(particle[pType.deathPop], 0.5, 1, 0);
part_type_speed(particle[pType.deathPop], 0, 5, 0, 0);
part_type_direction(particle[pType.deathPop], 0, 359, 0, 0);
part_type_gravity(particle[pType.deathPop], 0.3, 270);
part_type_blend(particle[pType.deathPop], true);
part_type_life(particle[pType.deathPop], 5, 15);

particle[pType.fire] = part_type_create();
part_type_shape(particle[pType.fire], pt_shape_sphere);
part_type_size(particle[pType.fire], 0.08, 0.1, -0.01, 0);
part_type_color2(particle[pType.fire], c_red, c_grey);
part_type_alpha2(particle[pType.fire], 1,0.7);
part_type_speed(particle[pType.fire], 3, 5, -0.4, 0);
part_type_direction(particle[pType.fire], 180+45, 360-45, 0, 0);
part_type_gravity(particle[pType.fire], 0.3, 270);
part_type_blend(particle[pType.fire], true);
part_type_life(particle[pType.fire], 5, 15);