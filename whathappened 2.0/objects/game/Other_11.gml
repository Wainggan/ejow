/// @description game load

ini_open(FILE_NAME)

currentCheckpoint = ini_read_real(string(room),"checkpoint",-1);

newRoom = ini_read_real("game","room",ROOM_START)

ini_close()