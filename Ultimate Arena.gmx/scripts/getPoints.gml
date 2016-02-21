var q1 = argument0;
ini_open("twitch.ini")
var q2 = ini_read_real(q1,"points",0);
ini_close();
irc_send_message(q1 + " has " + string(q2) + " point(s)");
