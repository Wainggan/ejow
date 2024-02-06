draw_sprite_ext(sprite_index,image_index,x,y+wave(-3,2,3,0),1,1,0,c_white,(coolDown == 0 ? 1 : 0.4));

if coolDown != 0 {
	draw_sprite_ext(sprite_index,image_index,x,y+wave(-3,2,3,0),1-(coolDown/60),1-(coolDown/60),0,c_white,1);
}