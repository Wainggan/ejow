/// @description game save

ini_open(FILE_NAME)

ini_write_real(string(room),"checkpoint",currentCheckpoint);

ini_write_real("game","room",room);

ini_close()