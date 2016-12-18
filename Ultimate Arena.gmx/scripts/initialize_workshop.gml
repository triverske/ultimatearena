global.cNAME = 0;

steam_list = ds_list_create();
steam_ugc_get_subscribed_items(steam_list);


//I'm so sorry it had to be this way....
var s = ds_list_size(steam_list);
for(i=0;i<s;i++)
{
    steam_map = ds_map_create();
    steam_ugc_get_item_install_info(steam_list[| i], steam_map); 
    //show_debug_message(steam_map [? "folder"]);
    
    
    var f = file_find_first(steam_map [? "folder"] + "\*.ini", 0);
    if(f != "")
    {
        ini_open(steam_map [? "folder"] + "\" + f)
        
        if(ini_section_exists("character"))
            var type = "character";
        else if(ini_section_exists("event"))
            var type = "event";
        else if(ini_section_exists("Map"))
            var type = "Map";
            
        var name = ini_read_string(type,"name","NAMING ERROR");
        ini_close();
        
        file_find_close();
        
        //show_debug_message(game_save_id + type + "s\" + name + "\");
        if(!directory_exists(game_save_id + type + "s\" + name + "\"))
        {
            directory_create(game_save_id + type + "s\" + name + "\");
        
            var f = file_find_first(steam_map [? "folder"] + "\*", 0);
            
            file_copy_win(steam_map [? "folder"] + "\" + f,game_save_id + type + "s\" + name + "\" + f);
            
            var f = file_find_next();
            while(f != "")
            {
                file_copy_win(steam_map [? "folder"] + "\" + f,game_save_id + "\" + type + "s\" + name + "\" + f);
                var f = file_find_next();
            }
            file_find_close();
        }
    }
    file_find_close();
    ds_map_destroy(steam_map);
}
