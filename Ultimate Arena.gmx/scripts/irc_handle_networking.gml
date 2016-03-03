///irc_handle_networking()
///
///Handles incoming Server packets, like messages and the ping request
///Call this script in the networking event of your IRC object.

var data = ds_map_find_value(async_load, "buffer")
var str = buffer_read(data, buffer_string)

if string_count("PRIVMSG",str) > 0
{
    color = ""
    displayname = ""
    emotes = ""
    subscriber = ""
    turbo = ""
    sender = ""
    msg = ""
    if ircv3
    {
        var pos;
        pos = string_pos(";",str)
        color = string_copy(str,1,pos-1)
        str = string_delete(str,1,pos)
        pos = string_pos(";",str)
        displayname = string_copy(str,1,pos-1)
        str = string_delete(str,1,pos)
        pos = string_pos(";",str)
        emotes = string_copy(str,1,pos-1)
        str = string_delete(str,1,pos)
        pos = string_pos(";",str)
        subscriber = string_copy(str,1,pos-1)
        str = string_delete(str,1,pos)
        pos = string_pos(";",str)
        turbo = string_copy(str,1,pos-1)
        str = string_delete(str,1,pos)
        
        color = string_copy(color,string_pos("=",color)+1,string_length(color)-string_pos("=",color))
        subscriber = real(string_copy(subscriber,string_pos("=",subscriber)+1,string_length(subscriber)-string_pos("=",subscriber)))
        turbo = real(string_copy(turbo,string_pos("=",turbo)+1,string_length(turbo)-string_pos("=",turbo)))
             
        if color = "" color = "#000000"
        
        sender = ""
        pos1 = string_pos(":",str)
        pos2 = string_pos("!",str)
        for(i=pos1+1;i<pos2;i++)
        {
            sender += string_char_at(str,i)   
        }
        
        str = string_replace(str,":","")
        pos1 = string_pos(":",str)
        msg = ""
        msg = string_delete(str,1,pos1)
        msg = string_delete(msg,string_length(msg)-1,1)
        msg = string_replace(msg,chr(13),"")
        msg = string_replace(msg,chr(10),"")    
    }
    else
    {
        //The following lines extract the sender and the message out of the incoming packet
        sender = ""
        pos1 = string_pos(":",str)
        pos2 = string_pos("!",str)
        for(i=pos1+1;i<pos2;i++)
        {
            sender += string_char_at(str,i)   
        }
        str = string_replace(str,":","")
        pos1 = string_pos(":",str)
        msg = ""
        msg = string_delete(str,1,pos1)
        msg = string_delete(msg,string_length(msg)-1,1)
        msg = string_replace(msg,chr(13),"")
        msg = string_replace(msg,chr(10),"")
    }
    return "message"
}
if string_count("PING",str) > 0
{
    irc_send_packet("PONG :"+serverip)
    return "ping"
}
return "other"
