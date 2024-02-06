// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function motion_blur(_length,_direction){

/// motion_blur(length,direction)
//
//  Draws the assigned sprite of the calling instance, using its
//  subimage, position, scaling, rotation, and blending settings,
//  with a motion blur effect applied to it.
//
//      length      length of blur, real
//      direction   direction of blur in degrees, real
//
/// GMLscripts.com/license
{
    var length = _length;
 
    if (length > 0) {
        var step = 3;
        var dir = degtorad(_direction);
        var px = cos(dir);
        var py = -sin(dir);
 
        var a = image_alpha/(length/step);
        if (a >= 1) {
            draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,
                image_yscale,image_angle,image_blend,image_alpha);
            a /= 2;
        }
 
        for(var i=length;i>=0;i-=step) {
            draw_sprite_ext(sprite_index,image_index,x+(px*i),y+(py*i),
                image_xscale,image_yscale,image_angle,image_blend,a);
        }
    } else {    
        draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,
            image_yscale,image_angle,image_blend,image_alpha);
    }
    return 0;
}

}