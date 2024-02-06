// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_death(){
	with obj_player {
		part_particles_create(pSystem,obj_player.x,obj_player.y-obj_player.overWallFix,particle[pType.deathPop],50)
		screenShake = 14;
		instance_destroy(obj_player);
		transition_begin(room, sq_TRANS_deathIn, sq_TRANS_slideOut);
		
		audio_play_sound(snd_death,2,0);
	}
	onOffState = 1;
}