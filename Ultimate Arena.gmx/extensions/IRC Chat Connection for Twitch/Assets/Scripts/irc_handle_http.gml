///irc_handle_http()

var Id = ds_map_find_value(async_load, "id")
var str = ds_map_find_value(async_load, "result")

if Id = getusers
{
    map = json_decode(str)
    if map != -1
    {
        ds_list_destroy(mods)
        ds_list_destroy(viewers)
        viewercount = real(ds_map_find_value(map,"chatter_count"))
        mods = ds_map_find_value(ds_map_find_value(map,"chatters"),"moderators")
        viewers = ds_map_find_value(ds_map_find_value(map,"chatters"),"viewers")
        ds_map_destroy(map)
    }
}
else if Id = getfollowers
{  
    map = json_decode(str)
    if map != -1
    {
        followercount = real(ds_map_find_value(map,"_total"))
        
        var followerlist = ds_map_find_value(map,"follows")
        
        ds_list_clear(followers)
        
        for(i = 0; i < ds_list_size(followerlist); i++)
        {
            var key = followerlist[| i]
            ds_list_add(followers,ds_map_find_value(ds_map_find_value(key,"user"),"name"))
        }
        
        ds_list_destroy(followerlist)
        ds_map_destroy(map)
    }
}

return "other"