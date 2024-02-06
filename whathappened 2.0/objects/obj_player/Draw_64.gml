if game.hidden {
	
draw_set_font(ft_console)
init_log()

write_console(string(xSpeed),8,8)
write_console(string(ySpeed),8,8)
increment_console()

write_console(string(x_vel+dashX_vel+platX_vel),8,8)
write_console(string(y_vel),8,8)
increment_console()

write_console(string(x_vel),8,8)
write_console(string(y_vel),8,8)
increment_console()

write_console(string(dashX_vel),8,8)
write_console(string(dashY_vel),8,8)
increment_console()

write_console(string(platX_vel),8,8)
write_console(string(platY_vel),8,8)
increment_console()

write_console(string(playerState),8,8)
increment_console()

write_console(string(x),8,8)
write_console(string(y),8,8)
increment_console()

write_console(string(superLongJump),8,8)
write_console(string(coyoteTime),8,8)
write_console(string(key_bufferJump),8,8)
increment_console()
}