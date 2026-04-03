global.EVENT = 0;
global.eTYPE = 0;
global.eNAME = 0;

directory = 0;
directory[0] = "";
var l = initialize_directory("events");

for(var i=0;i<l;i++)
{
    global.EVENT[i] = working_directory+"events\" + directory[i] + "\" + directory[i] + ".ini";
    ini_open(global.EVENT[i])
    if(ini_read_real("event","creator",-1) == steam_get_user_account_id() && ini_read_real("event","workshopID",-1) != -1)
        workshop_add_created_item(ini_read_real("event","workshopID",-1));
    ini_close();
    
    global.eNAME[i] = directory[i];
    global.eTYPE[i] = 0;
}

steam_list = ds_list_create();
steam_ugc_get_subscribed_items(steam_list);

var s = ds_list_size(steam_list);
for(h=0;h<s;h++)
{
    steam_map = ds_map_create();
    steam_ugc_get_item_install_info(steam_list[| h], steam_map); 
    //show_debug_message(steam_map [? "folder"]);
    
    
    var f = file_find_first(steam_map [? "folder"] + "\*.ini", 0);
    if(f != "")
    {
        var loc = steam_map [? "folder"] + "\";
        ini_open(steam_map [? "folder"] + "\" + f)
        
        if(ini_section_exists("event"))
        {
            show_debug_message("EVENT!");
            var in = steam_map [? "folder"] + "\" + f;
            var name = ini_read_string("event","name","NAMING ERROR");
            show_debug_message(name);
            if(name == "NAMING ERROR")
            {
                ini_close();
                f = file_find_next();
                continue;
            }
            global.EVENT[i] = steam_map [? "folder"] + "\" + f;
            global.eNAME[i] = name;
            global.eTYPE[i] = 1;
            i++;
        }
        ini_close();
        f = file_find_next();
        
    }
    file_find_close();
    ds_map_destroy(steam_map);
}
ds_list_destroy(steam_list);
 
global.EVENT_COUNT = i;
