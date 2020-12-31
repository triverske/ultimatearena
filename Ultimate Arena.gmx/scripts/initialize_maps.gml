directory = 0;
directory[0] = "";
var l = initialize_directory("maps");

for(var i=0;i<l;i++)
{
    global.MAPS[i] = working_directory+"maps\" + directory[i] + "\" + directory[i] + ".ini";
    
    ini_open(global.MAPS[i]);
    version = ini_read_real("Map","Version",0); //0 - Old, 1 - New
    if(ini_read_real("Map","creator",-1) == steam_get_user_account_id() && ini_read_real("Map","workshopID",-1) != -1)
        workshop_add_created_item(ini_read_real("Map","workshopID",-1));
    ini_close();
    
    global.mapNAME[i] = directory[i];
    global.mapTYPE[i] = version;
    
    if(version == 0)
    {
        global.mapPICS[i] = working_directory+"maps\" + directory[i] + "\" + directory[i] + ".png";
        if(file_exists(working_directory+"maps\" + directory[i] + "\" + directory[i] + "overlay.png"))
            global.mapOVERLAY[i] = working_directory+"maps\" + directory[i] + "\" + directory[i] + "overlay.png";
        else
            global.mapOVERLAY[i] = noone;
    }
    else if(version == 1)
    {
        global.mapPICS[i] = sprite_add(working_directory+"maps\" + directory[i] + "\height.png",0,0,0,0,0);
        global.mapOVERLAY[i] = working_directory+"maps\" + directory[i] + "\color.png";
    }
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
        
        if(ini_section_exists("Map"))
        {
            version = ini_read_real("Map","Version",0); //0 - Old, 1 - New
            var in = steam_map [? "folder"] + "\" + f;
            var name = string_replace(f,".ini","");//ini_read_string("event","name","NAMING ERROR");
            show_debug_message(name);
            if(name == "NAMING ERROR")
            {
                ini_close();
                f = file_find_next();
                continue;
            }
            global.MAPS[i] = steam_map [? "folder"] + "\" + f;
            global.mapTYPE[i] = version;
            global.mapNAME[i] = name;
            if(version == 0)
            {
                global.mapPICS[i] = steam_map [? "folder"] + "\" + name + ".png";
                if(file_exists(steam_map [? "folder"] + "\"  + "\overlay.png"))
                    global.mapOVERLAY[i] = steam_map [? "folder"] + "\overlay.png";
                else
                    global.mapOVERLAY[i] = noone;
            }
            else if(version == 1)
            {
                global.mapPICS[i] = sprite_add(steam_map [? "folder"] + "\height.png",0,0,0,0,0);
                global.mapOVERLAY[i] = steam_map[? "folder"] + "\color.png";
            }
            
            i++;
        }
        ini_close();
        f = file_find_next();
        
    }
    file_find_close();
    ds_map_destroy(steam_map);
}

global.MAP_COUNT = i;
