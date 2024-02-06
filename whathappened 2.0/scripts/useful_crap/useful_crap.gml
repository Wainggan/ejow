function approach(a,b,amount) {
	if (a < b)
	{
	    a += amount;
	    if (a > b)
	        return b;
	}
	else
	{
	    a -= amount;
	    if (a < b)
	        return b;
	}
	return a;
}

function wave(from,to,duration,offset) {
	var a4 = (to - from) * 0.5;
	return from + a4 + sin((((current_time * 0.001) + duration * offset) / duration) * (pi*2)) * a4;
}

function draw_sprite_wave(sprite,image,posx,posy,axis,wavelength,amplitude,phase) {
//      sprite      sprite index, real
//      subimg      sprite subimage, real
//      x,y         position, real
//      axis        0 = horizontal wave, 1 = vertical wave, real
//      wavelength  length of wave in pixels, real
//      amplitude   height of wave in pixels, real
//      phase       wave position offset, real
    var width,height,xoff,yoff,size,i,shift,sx,sy;
    width  = sprite_get_width(sprite);
    height = sprite_get_height(sprite);
    xoff   = sprite_get_xoffset(sprite);
    yoff   = sprite_get_yoffset(sprite);
    if (axis) size = height else size = width;
 
    for (i=0; i<size; i+=1) {
        shift = amplitude*sin(2*pi*((i/wavelength)+phase));
        if (axis) {
            sx = shift-xoff+posx;
            sy = i-yoff+posy;
            draw_sprite_part(sprite,image,0,i,width,1,sx,sy);
        }else{
            sx = i-xoff+posx;
            sy = shift-yoff+posy;
            draw_sprite_part(sprite,image,i,0,1,height,sx,sy);
        }
    }
}

function is_Computer() {
	return 
        os_type == os_windows or
        os_type == os_win8native or
        os_type == os_macosx or
        os_type == os_linux;
}