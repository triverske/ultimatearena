///irc_get_viewers()
///
///Twitch IRC only!
///
///This method will send a http request to the Twitch API, which will be handled in irc_handle_http()

getusers = http_get("https://tmi.twitch.tv/group/user/"+channelname+"/chatters")