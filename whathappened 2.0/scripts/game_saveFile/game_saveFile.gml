// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function game_save_file(){
with game {
	event_user(0);
}
instance_create_depth(0,0,-1,obj_saveIcon);
}
function game_load_file(){
with game {
	event_user(1);
}
}