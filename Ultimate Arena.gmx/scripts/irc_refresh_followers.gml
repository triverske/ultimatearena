///irc_refresh_followers()
///
///Twitch IRC only!
///
///This method will send a http request to the Twitch API, which will be handled in irc_handle_http()

getfollowers = http_get("https://api.twitch.tv/kraken/channels/"+channelname+"/follows")
