///irc_send_message(msg)
///
///Sends a message straight to the chat of the channel.

var msg = argument0
with(oTwitchController)
{
    var buff = buffer_create(1024, buffer_grow, 1);
    buffer_seek(buff, buffer_seek_start, 0);
    buffer_write(buff, buffer_string, "PRIVMSG #" + channelname + " :" + msg + chr(13) + chr(10));
    network_send_raw(irc_socket, buff, buffer_get_size(buff));
    buffer_delete(buff);
}
