if game_pause exit

x = xstart;
y = ystart;

direction += speedRot;
x += lengthdir_x(length,direction)
y += lengthdir_y(length,direction)

image_angle -= wave(7,12,1,0);

audio_emitter_position(s_emit, x, y, 0);