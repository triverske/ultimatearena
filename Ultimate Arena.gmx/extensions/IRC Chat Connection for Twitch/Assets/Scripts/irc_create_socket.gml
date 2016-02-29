///irc_create_socket(serverip,port,username,password,channel,ircv3)
///
///Example:
///create_irc_socket("irc.twitch.tv",6667,"chatbot123","oauth:564asd464","LoLStream24",true);
///
///If you use twitch, you can get the oauth here: http://twitchapps.com/tmi/
///
///Warning:
///You can only use IRCv3 with Twitch.
///
///Important: Channel without "#" in front

serverip = argument0;
serverport = argument1;
username = string_lower(argument2);
password = argument3;
channelname = string_lower(argument4);
ircv3 = argument5;

map = ds_map_create()

getuser = -1;
viewercount = 0;
mods = ds_list_create()
viewers = ds_list_create()

getfollowers = -1;
followercount = 0;
followers = ds_list_create()

//Create TCP Socket

irc_socket = network_create_socket(network_socket_tcp);
irc = network_connect_raw(irc_socket, serverip, serverport);


//Send packets required for IRC connection

irc_send_packet("PASS " + password)
irc_send_packet("USER " + username + " 0 * :" + username)
irc_send_packet("NICK " + username)
irc_send_packet("JOIN #" + channelname)
if ircv3
{
    irc_send_packet("CAP REQ :twitch.tv/tags")
}