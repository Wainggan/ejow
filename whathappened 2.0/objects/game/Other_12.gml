/// @description destroy game file

if (!layer_sequence_exists("transition",global.sequenceLayer)) {
	with obj_player {
		part_particles_create(pSystem,obj_player.x,obj_player.y-obj_player.overWallFix,particle[pType.deathPop],50)
		screenShake = 14;
		instance_destroy(obj_player);
		transition_begin(rm_1_1, sq_TRANS_deathIn, sq_TRANS_slideOut);
		
		audio_play_sound(snd_death,2,0);
	}
	file_delete(FILE_NAME)
}