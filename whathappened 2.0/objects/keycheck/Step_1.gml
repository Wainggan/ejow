key_left =   keyboard_check(ord("A"))
			 || keyboard_check(vk_left)
			 || (-thumbstickThresh > gamepad_axis_value(0,gp_axislh));
key_right =  keyboard_check(ord("D"))
			 || keyboard_check(vk_right)
			 || (thumbstickThresh < gamepad_axis_value(0,gp_axislh));
key_up =     keyboard_check(ord("W"))
			 || keyboard_check(vk_up)
		     || (-thumbstickThresh > gamepad_axis_value(0,gp_axislv));
key_down =   keyboard_check(ord("S"))
			 || keyboard_check(vk_down)
		     || (thumbstickThresh < gamepad_axis_value(0,gp_axislv));
			 
if kLeft {
	key_lefted = 0;
	if !key_left {
		kLeft = 0;
	}
} else {
	if key_left {
		kLeft = 1;
		key_lefted = 1;
	}
}
if kRight {
	key_righted = 0;
	if !key_right {
		kRight = 0;
	}
} else {
	if key_right {
		kRight = 1;
		key_righted = 1;
	}
}
if kUp {
	key_uped = 0;
	if !key_up {
		kUp = 0;
	}
} else {
	if key_up {
		kUp = 1;
		key_uped = 1;
	}
}
if kDown {
	key_downed = 0;
	if !key_down {
		kDown = 0;
	}
} else {
	if key_down {
		kDown = 1;
		key_downed = 1;
	}
}


key_jump =   keyboard_check(ord("U"))
			 || keyboard_check(ord("C"))
			 || keyboard_check(ord("O"))
			 || keyboard_check(ord("Z"))
		     || gamepad_button_check(0, gp_face4)
			 || gamepad_button_check(0, gp_face1);
key_jumped = keyboard_check_pressed(ord("U"))
			 || keyboard_check_pressed(ord("C"))
			 || keyboard_check_pressed(ord("O"))
			 || keyboard_check_pressed(ord("Z"))
		     || gamepad_button_check_pressed(0, gp_face4)
			 || gamepad_button_check_pressed(0, gp_face1);
			 
key_dash =   keyboard_check(ord("I"))
			 || keyboard_check(ord("X"))
		     || gamepad_button_check(0, gp_face3)
			 || gamepad_button_check(0, gp_face2);
key_dashed = keyboard_check_pressed(ord("I"))
			 || keyboard_check_pressed(ord("X"))
		     || gamepad_button_check_pressed(0, gp_face3)
			 || gamepad_button_check_pressed(0, gp_face2);
			 
key_pause = keyboard_check_pressed(ord("P"))
			 || keyboard_check_pressed(ord("V"))
		     || gamepad_button_check_pressed(0, gp_start)
			 || gamepad_button_check_pressed(0, gp_select);


key_bufferJump = max(0, key_bufferJump - 1, key_jumped * TBufferTime);
key_bufferDash = max(0, key_bufferDash - 1, key_dashed * TBufferDashTime);