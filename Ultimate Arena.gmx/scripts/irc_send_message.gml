///irc_send_message(message)

str = argument0;
user = oTwitchController.user;

var buff = buffer_create(1024, buffer_grow, 1);
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_string, "PRIVMSG #" + user + " :" + str + chr(13) + chr(10));
network_send_raw(oTwitchController.irc_socket, buff, buffer_get_size(buff));
buffer_delete(buff); 
