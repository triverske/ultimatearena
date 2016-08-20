///charedit_ui(id)
with(oUIListBox)
{
    if(argument0 == id)
    {
        if(listID == 0)
        {
            if(global.IDselected == sID)
            {
                global.IDselected = -1;
            }
            else
            {
                global.IDselected = sID;
                global.newImage = global.cIMAGES[sID];
                
                ini_open(working_directory + "characters\" + global.fNAME[sID])
                global.editStats[0] = min(10,ini_read_real("character","strength",5));
                global.editStats[1] = min(10,ini_read_real("character","agility",5));
                global.editStats[2] = min(10,ini_read_real("character","endurance",5));
                global.editStats[3] = min(10,ini_read_real("character","skill",5));
                global.editStats[4] = min(10,ini_read_real("character","luck",5));
                var gen = ini_read_real("character","gender",0)
                var s1 = ini_read_string("think","s1","");
                global.creator = ini_read_real("character","creator",-1);
                global.charVersion = ini_read_real("character","version",1);
                global.workshopID = ini_read_real("character","workshopID",-1);
                ini_close();
                
                with(objUIField)
                {
                    if(fID == 0)
                        content = global.cNAME[other.sID];
                    if(fID == 1)
                        content = s1;
                }
                
                with(objUICheckbox)
                {
                    if(bID == 0)
                    {
                        if(gen == cID)
                            value = 1;
                        else
                            value = 0;
                    }
                    if(bID == 1)
                    {
                        if(global.workshopID != -1)
                            value = 1;
                        else
                            value = 0;
                            
                        if(global.creator != steam_get_user_account_id() && global.creator != -1)
                        {
                            with(objUILabel)
                            {
                                if(caption == "Add to Steam Workshop")
                                    __visible = 0;
                            }
                            global.copyProtection = 1;
                            __visible = 0;
                        }
                        else
                        {
                            with(objUILabel)
                            {
                                if(caption == "Add to Steam Workshop")
                                    __visible = 1;
                            }
                            global.copyProtection = 0;
                            __visible = 1;
                            show_debug_message("character created by user");
                        }
                    }
                }
                with(oUIListBox)
                {
                if(listID == 1)
                {
                    for(var i=0; i<global.TAG_COUNT; i++){
                        selected[i] = 1;
                        for(var j=0; j<array_length_2d(global.TAG_LIST,i); j++){
                            if(global.TAG_LIST[i,j] == other.sID){
                                selected[i] = 0;
                                break;
                            }
                        }
                    }
                }
                }
                with(objUILabel)
                    if(lID > 0)
                        caption = string(global.editStats[lID - 1]);
            }
        }
        else if(listID == 1)
        {
            if(sID != -1){
                if(selected[sID] == 0)
                    selected[sID] = 1;
                else
                    selected[sID] = 0;
            }
        }
    }
}
with(objUIButton)
{
    if(argument0 == id)
    {
        if(bID == 0)
        {
            c = instance_create(0,0,oRoomTransition);
            c.gotoroom = rm_title;
        }
        if(bID == 1)
        {
            //var charname = keyboard_string;
            file = get_open_filename("Image File|*.png;*.jpg;*.jpeg", "");
            if(file != "")
            {
                var newsp = sprite_add(file,0,0,0,0,0);
                var surf = surface_create(128,128);
                surface_set_target(surf);
                draw_sprite_stretched(newsp,0,0,0,128,128);
                surface_reset_target();
                
                global.newImage = sprite_create_from_surface(surf,0,0,128,128,0,0,0,0);
                
                sprite_delete(newsp);
                surface_free(surf);
            }
            else
            {
                global.newImage = sFighterImage;
            }
            
            with(oUIImage)
            {
                if(bID == 0)
                {
                
                    image = global.newImage;
                }
            }
            //keyboard_string = charname;
        }
        if(bID == 2) //Save Character
        {
            with(objUIField)
                if(fID == 0)
                    var charname = content;
            
            global.charname = charname;
            ini_open(working_directory + "characters\" + charname + "\" + charname + ".ini");
            ini_write_string("character","name",charname);
            ini_write_string("character","image",charname+".png");
            
            ini_write_real("character","colorr",global.editColors[global.editColor,0]);
            ini_write_real("character","colorg",global.editColors[global.editColor,1]);
            ini_write_real("character","colorb",global.editColors[global.editColor,2]);
            
            global.charVersion++;
            ini_write_real("character","version",global.charVersion);
            
            global.workshopID = ini_read_real("character","workshopID",-1);
            
            newGender = 0;
            with(objUICheckbox)
            {
                if(bID == 0)
                    if(value == 1)
                        other.newGender = cID;
            }
            ini_write_real("character","gender",newGender)
            
            ini_write_real("character","strength",global.editStats[0]);
            ini_write_real("character","agility",global.editStats[1]);
            ini_write_real("character","endurance",global.editStats[2]);
            ini_write_real("character","skill",global.editStats[3]);
            ini_write_real("character","luck",global.editStats[4]);
            
            if(global.creator == -1)
            {
                ini_write_real("character","creator",steam_get_user_account_id());
                global.creator = steam_get_user_account_id();
            }
            
            with(objUIField)
            {
                if(fID == 1)
                {
                    if(content != "")
                    {
                        ini_write_string("think","s1",content);
                        ini_write_real("think","total",1);
                    }
                }
            }
            var tagstring = "";
            with(oUIListBox){
                if(listID == 1){
                    for(var i=0; i<global.TAG_COUNT; i++){
                        if(selected[i] == 0){
                            if(tagstring == "")
                                tagstring+= global.TAGS[i];
                            else
                                tagstring+= ","+global.TAGS[i];
                        }
                        selected[i]=1;
                    }
                }
            }
            ini_write_string("character","tags",tagstring);
            ini_close();
            
            for(i=0;i<5;i++)
                global.editStats[i] = 5;
                
            with(objUILabel)
                if(lID > 0)
                    caption = "5";
                
            if(global.newImage != sFighterImage)
            {
                sprite_save(global.newImage,0,working_directory + "characters\" + charname + "\" + charname + ".png");
            }
            else
            {
                //Gamemaker doesn't let you save images from the resource tree.
                tempSprite = sprite_duplicate(sFighterImage);
                sprite_save(tempSprite,0,working_directory + "characters\" + charname + "\" + charname + ".png");
                sprite_delete(tempSprite);
            }
            
            if(global.workshop && !global.copyProtection)
            {
                if(global.workshopID == -1)
                {
                    with(oSetup)
                    {
                        var app_id = steam_get_app_id(); 
                        new_item = steam_ugc_create_item(app_id, ugc_filetype_community);
                        
                        workshopName = charname;
                        workshopType = 0;
                    }
                }
                else
                {
                    var workshopName = charname;
                    
                    var app_id = steam_get_app_id();
                    updateHandle = steam_ugc_start_item_update(app_id, global.workshopID);
                    
                    steam_ugc_set_item_title(updateHandle, workshopName );
                    steam_ugc_set_item_description( updateHandle, "Adds " + workshopName + " character to Ultimate Arena");
                    steam_ugc_set_item_visibility(updateHandle, ugc_visibility_public);
                    
                    var tagArray;
                    tagArray[0] = "Character";
                    
                    steam_ugc_set_item_tags(updateHandle, tagArray);
                    steam_ugc_set_item_preview(updateHandle, working_directory + "characters\" + workshopName + "\" + workshopName + ".png");
                    steam_ugc_set_item_content(updateHandle, working_directory + "characters\" + workshopName + "\");
                    
                    requestId = steam_ugc_submit_item_update(updateHandle, "Version " + string(global.charVersion));
                }
            }
            
            initialize_characters();
            room_restart();
            keyboard_string = "";
        }
        if(bID == 4)
        {
            global.newImage = sFighterImage;
            keyboard_string = "";
            room_restart();
        }
        if(bID == 5)
        {
            if(global.IDselected != -1)
            {
                directory_destroy(working_directory + "characters\" + global.cNAME[global.IDselected]);
                initialize_characters();
                keyboard_string = "";
                room_restart();
            }
        }
        if(bID == 6) //Add sound
        {
            file = get_open_filename("Sound File|*.ogg", "");
            if(file != "")
            {
                //with the current setup I don't think it's possible to get a file then save it in the character directory
            }
        }
        if(bID == 7) //Increase Stat
        {
            global.editStats[stat]++;
            
            if(global.editStats[stat] > 10)
                global.editStats[stat] = 10;
                
            with(objUILabel)
                if(lID == other.stat + 1)
                    caption = string(global.editStats[other.stat]);
        }
        if(bID == 8) //Decrease Stat
        {
            global.editStats[stat]--;
            
            if(global.editStats[stat] < 1)
                global.editStats[stat] = 1;
                
            with(objUILabel)
                if(lID == other.stat + 1)
                    caption = string(global.editStats[other.stat]);
        }
        if(bID == 9) //Fighter Color
        {
            global.editColor = type;
            with(oUIImageButton)
            {
                if(global.editColor != type)
                    color = c_gray;
                else
                    color = c_white;
            }
        }
        if(bID == 10) //Change catchphrase
        {
            get_string_async("Enter a catchphrase","");
        }
        if(bID == 11)
        {
            with(oUIListBox)
            {
                if(listID == 1)
                {
                    delete_tag(sID);
                    initialize_listbox(global.TAGS);
                }
            }
        }
        if(bID == 12)
        {
            get_string_async("Enter tag name","");
        }
    }
}
with(oUIImage)
{
    if(argument0 == id)
    {
        if(global.IDselected >= 0)
            image = global.cIMAGES[global.IDselected];
    }
}

with(objUICheckbox)
{
    if(bID == 1)
        global.workshop = value;
}
