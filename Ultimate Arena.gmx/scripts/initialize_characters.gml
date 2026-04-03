global.cNAME = 0;
global.cTYPE = 0;
global.cSPRITES = 0;
global.TAGS = 0;
global.TAG_LIST = 0;
global.TAG_COUNT = 0;
global.fNAME = 0;

if(is_array(global.cIMAGES)){
    for(var i=0; i<array_length_1d(global.cIMAGES); i++){
        if(global.cIMAGES[i] != spr_defaultFighterImage)
            sprite_delete(global.cIMAGES[i]);
    }
}
global.cIMAGES = 0;

directory = 0;
directory[0] = "";
var l = initialize_directory("characters");
var i = 0;

for(var h=0;h<l;h++)
{
    var in = working_directory + "characters\" + directory[h] + "\" + directory[h] + ".ini";
    ini_open(in);
    var name = ini_read_string("character","name","NAMING ERROR");
    if(name == "NAMING ERROR")
    {
        ini_close();
        continue;
    }
    
    if(ini_read_real("character","creator",-1) == steam_get_user_account_id() && ini_read_real("character","workshopID",-1) != -1)
        workshop_add_created_item(ini_read_real("character","workshopID",-1));
    
    global.cNAME[i] = name;
    global.cTYPE[i] = 0;
    global.fNAME[i] = in;
    global.cSOUNDS[i] = ini_read_string("character","deathsound","");
    global.cIMAGESP[i] = 0;
    
    initialize_sprites(i,working_directory + "characters\" + directory[h] + "\")
    
    var cImage = ini_read_string("character","image","spr_defaultFighterImage");
    var cAnimated = ini_read_real("character","animated",0);
    var cAnimationSpeed = ini_read_real("character","animationspeed",0);
    
    if(cAnimated)
    {
        var temp = sprite_add(working_directory + "characters\" + directory[h] + "\" + directory[h] + ".png",1,0,0,0,0);
        var wd = round(sprite_get_width(temp) / 128);
        global.cIMAGES[i] = sprite_add(working_directory + "characters\" + directory[h] + "\" + directory[h] + ".png",wd,0,0,0,0);
        global.cIMAGESP[i] = cAnimationSpeed;
        sprite_delete(temp);
    }
    else if(cImage != "spr_defaultFighterImage")
        global.cIMAGES[i] = sprite_add(working_directory + "characters\" + directory[h] + "\" + directory[h] + ".png",1,0,0,0,0);
    else
        global.cIMAGES[i] = spr_defaultFighterImage; 
        
    if(global.cIMAGES[i] == -1)
    {
        var tempSprite = sprite_duplicate(spr_defaultFighterImage);
        sprite_save(tempSprite,0,working_directory + "characters\" + directory[h] + "\" + directory[h] + ".png");
        sprite_delete(tempSprite);
        global.cIMAGES[i] = sprite_add(working_directory + "characters\" + directory[h] + "\" + directory[h] + ".png",1,0,0,0,0);
    }
    
    var tags = ini_read_string("character","tags","");
    if (tags != ""){
        var tagcount = string_parse_number(tags,",",true);
        for(r = 0; r < tagcount; r++){
            var curtag = string_extract(tags,",",r);
            var notInArray = 1;
            for(c = 0;c < global.TAG_COUNT; c++){
                if(global.TAGS[c] == curtag){
                    notInArray = 0
                    global.TAG_LIST[c,array_length_2d(global.TAG_LIST, c)] = i;
                }
            }
            if(notInArray){
                global.TAGS[global.TAG_COUNT] = curtag;
                global.TAG_LIST[global.TAG_COUNT,0] = i;
                global.TAG_COUNT++;
            }    
        }
    }
    ini_close();
    i++;
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
        
        if(ini_section_exists("character"))
        {
    
            var in = steam_map[? "folder"] + "\" + f;
            var name = ini_read_string("character","name","NAMING ERROR");
            show_debug_message(name);
            if(name == "NAMING ERROR")
            {
                ini_close();
                f = file_find_next();
                continue;
            }
            
            global.cNAME[i] = name;
            global.cTYPE[i] = 0;
            global.fNAME[i] = in;
            global.cSOUNDS[i] = ini_read_string("character","deathsound","");
            global.cIMAGESP[i] = 0;
            
            initialize_sprites(i,steam_map [? "folder"] + "\");
            
            var cImage = ini_read_string("character","image","spr_defaultFighterImage");
            var cAnimated = ini_read_real("character","animated",0);
            var cAnimationSpeed = ini_read_real("character","animationspeed",0);
            
            //BUG
            if(cAnimated)
            {
                var temp = sprite_add(steam_map[? "folder"] + "\" + name + ".png",1,0,0,0,0);
                var wd = round(sprite_get_width(temp) / 128);
                global.cIMAGES[i] = sprite_add(steam_map[? "folder"] + "\" + name + ".png",wd,0,0,0,0);
                global.cIMAGESP[i] = cAnimationSpeed;
                sprite_delete(temp);
            }
            else if(cImage != "spr_defaultFighterImage")
                global.cIMAGES[i] = sprite_add(steam_map[? "folder"] + "\" + name + ".png",1,0,0,0,0);
            else
                global.cIMAGES[i] = spr_defaultFighterImage; 
            
            var tags = ini_read_string("character","tags","");
            if (tags != "")
            {
                var tagcount = string_parse_number(tags,",",true);
                for(r = 0; r < tagcount; r++){
                    var curtag = string_extract(tags,",",r);
                    var notInArray = 1;
                    for(c = 0;c < global.TAG_COUNT; c++)
                    {
                        if(global.TAGS[c] == curtag)
                        {
                            notInArray = 0
                            global.TAG_LIST[c,array_length_2d(global.TAG_LIST, c)] = i;
                        }
                    }
                    if(notInArray)
                    {
                        global.TAGS[global.TAG_COUNT] = curtag;
                        global.TAG_LIST[global.TAG_COUNT,0] = i;
                        global.TAG_COUNT++;
                    }    
                }
            }
            i++;
        }
        ini_close();
        f = file_find_next();
    }
    file_find_close();
    ds_map_destroy(steam_map);
}
ds_list_destroy(steam_list);

global.lNAME = i;
global.fighters = i;
global.FIGHTER_COUNT = i;

for(i = 0;i < global.FIGHTER_COUNT;i++)
    global.menuTeams[i] = "";//choose("","RED","ORANGE","YELLOW","GREEN","BLUE","PURPLE");
