//draw_self();
if playerState = player_free {
	if !crouch {
		if meeting(x,y+4) {
			if sign(round(x_vel)) = 0 {
				sprite_index = spr_playerIdle;
				if key_up {
					sprite_index = spr_playerLookUp;
					if lastAnimation != spr_playerLookUp {
						xScale = lookUpXScale;
						yScale = lookUpYScale;
					}
				}
			} else {
				if floorAnimation {
					sprite_index = spr_playerLand;
				} else {
					sprite_index = spr_playerWalk;
				}
			}
		} else {
			if y_vel < peakThresh && y_vel > -peakThresh {
				sprite_index = spr_playerPeak;
			} else {
				if y_vel < 0 {
					sprite_index = spr_playerJump;
				} else {
					sprite_index = spr_playerFall;
				}
			}
		}
	} else {
		sprite_index = spr_playerDuck;
	}
} else if playerState = player_grip {
	if y_vel >= 0 {
		sprite_index = spr_playerGrip;
	} else if y_vel < 0 {
		sprite_index = spr_playerClimb;
	}
} else if playerState = player_dash {
	sprite_index = spr_playerLand;
}
/*
if sprite_index = spr_playerWalk {
	if image_index = 3 {
		audio_play_sound(snd_step,7,0)
	} else if image_index = 7{
		audio_play_sound(snd_step1,7,0)
	}
}*/

if win {
	sprite_index = spr_playerVictory;
	xScale = 1;
	yScale = 1;
	dashLeft = 1;
}

if sprite_index != lastAnimation {
	image_index = 0;
}

lastAnimation = sprite_index;

var _color = 0xFFFFFF
if dashLeft = 0 {
	_color = 0xafafaf
}


draw_sprite_ext(sprite_index,image_index,x,y,xScale*currentDirScale,yScale,0,_color,1);

if teleDash != 0 {
	draw_circle(x+teleDistance*dir,y-overWallFix,6,1);
}



if game.hidden {
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1)
}

/*
//debug hitbox
var _x = x;
var _y = y;

x = mouse_x;
y = mouse_y;
draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,0)

x = _x;
y = _y;
*/