global.TEXT = 0;
global.TEXTTOGGLE = 0;
global.TEXT_COUNT = 0;

directory = 0;
directory[0] = "";
var l = initialize_directory("texts");

global.TEXTNAME[0] = "Default Updates";
global.TEXT[0] = "DefaultText.ini";
global.tTYPE[0] = 0;
ini_open("settings.ini");
global.TEXTTOGGLE[0] = ini_read_real("defaulttext","togglefile",1);
ini_close();

for(var i=1; i<=l; i++)
{
    global.TEXTNAME[i] = directory[i-1];
    global.TEXT[i] = working_directory+"texts\"+global.TEXTNAME[i]+"\"+global.TEXTNAME[i]+".ini"
    ini_open(global.TEXT[i]);
    
    if(ini_read_real("text","creator",-1) == steam_get_user_account_id() && ini_read_real("text","workshopID",-1) != -1)
        workshop_add_created_item(ini_read_real("text","workshopID",-1));
        
    global.TEXTTOGGLE[i] = ini_read_real("toggle","toggle",1);
    ini_close();
    global.tTYPE[i] = 0;
}
global.TEXT_COUNT = i;
//194 total default texts

steam_list = ds_list_create();
steam_ugc_get_subscribed_items(steam_list);

var s = ds_list_size(steam_list);
for(h=0;h<s;h++)
{
    steam_map = ds_map_create();
    steam_ugc_get_item_install_info(steam_list[| h], steam_map); 
    
    var f = file_find_first(steam_map [? "folder"] + "\*.ini", 0);
    if(f != "")
    {
        var loc = steam_map [? "folder"] + "\";
        ini_open(steam_map [? "folder"] + "\" + f)
        
        if(ini_section_exists("text"))
        {
            var in = steam_map [? "folder"] + "\" + f;
            var name = ini_read_string("text","name","NAMING ERROR");
            show_debug_message(name);
            if(name == "NAMING ERROR")
            {
                ini_close();
                f = file_find_next();
                continue;
            }
            global.TEXT[i] = steam_map [? "folder"] + "\" + f;
            global.TEXTNAME[i] = name;
            global.TEXTTOGGLE[i] = ini_read_real("toggle","toggle",1);
            global.tTYPE[i] = 1;
            i++;
        }
        ini_close();
        f = file_find_next();
        
    }
    file_find_close();
    ds_map_destroy(steam_map);
}
global.TEXT_COUNT = i;
