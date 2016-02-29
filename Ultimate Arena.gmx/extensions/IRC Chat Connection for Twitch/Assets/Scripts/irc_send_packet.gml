///irc_send_packet(string)
///
///Sends a raw packet to the IRC Server

var str = argument0

var buff = buffer_create(1024, buffer_grow, 1);
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_string, str + chr(13) + chr(10));
network_send_raw(irc_socket, buff, buffer_get_size(buff));
buffer_delete(buff);