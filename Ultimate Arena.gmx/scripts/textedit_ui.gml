///textedit_ui(id)
with(objUIListBox){
    if(argument0 == id){
        if(listID == 0){
            global.IDselected = sID;
            global.TEXTTOGGLE[sID] = !selected[sID];
            
            with(oTextedit){
                if(other.sID == 0)
                    array_from_update_file("DefaultText.ini");
                else
                    array_from_update_file(global.TEXT[other.sID]);
                array_from_section();
            }
            
            with(objUIWindowCaption){
                if(__parent != other.__parent)
                    caption = global.TEXTNAME[other.sID];
            }
            
            with(objUIListBox){
                if(listID == 1){
                    initialize_listbox(oTextedit.currentList);
                    sID = -1;
                    selected = 0;
                    for(var i=array_length_1d(oTextedit.currentList)-1; i>-1; i--)
                        selected[i] = !oTextedit.toggleList[i];
                }
            }
            
            keyboard_string = "";
            with(objUIField)
                content = "";
        }
        else if(listID == 1){
            if(oTextedit.currentList[sID] != "")
                oTextedit.toggleList[sID] = !selected[sID];
            else
                selected[sID] = 1;
                
        }
    }
}
with(objUIButton){
    if(argument0 == id){
        if(bID == 0){ //Go Back
            ini_open("settings.ini");
            ini_write_real("defaulttext","togglefile",global.TEXTTOGGLE[0]);
            ini_close();
            for(var i=1; i<global.TEXT_COUNT; i++){
                ini_open(global.TEXT[i]);
                ini_write_real("toggle","toggle",global.TEXTTOGGLE[i]);
                ini_close();
            }
            c = instance_create(0,0,oRoomTransition);
            c.gotoroom = rm_title;
        }
        else if(bID == 1){ //Delete Update File
            if(global.IDselected > 0){
                directory_destroy(global.TEXT[global.IDselected]);
                initialize_texts();
                keyboard_string = "";
                room_restart();
            }
        }
        else if(bID == 2){ //Cycle Commands Left
            with(oTextedit){
                array_to_section();
                
                command--;
                if(command < 0)
                    command = 54;
                    
                array_from_section();
                
                with(objUIListBox){
                    if(listID == 1){
                        initialize_listbox(other.currentList);
                        sID = -1;
                        selected = 0;
                        for(var i=array_length_1d(other.currentList)-1; i>-1; i--)
                            selected[i] = !other.toggleList[i];
                    }
                }
                
                with(objUILabel){
                    if(lID == 1)
                        caption = other.sectionName[other.command];
                    else if(lID == 2){
                        switch(other.command){
                            case 11: 
                            case 15: case 16: case 17: case 18: case 19: case 20: case 21: case 22: case 23: case 24: case 25: case 26: case 27: case 28: case 29: case 30: 
                            case 34: case 36: case 42: case 43: case 50: case 51: case 52: case 53: case 54:
                                caption = "(Two fighters)"; break;
                            default:
                                caption = "(One fighter)"; break;
                        }
                    }
                }
            }
            
            keyboard_string = "";
            with(objUIField)
                content = "";
        }
        else if(bID == 3){ //Cycle Commands Right
            with(oTextedit){
                array_to_section();
                
                command++;
                if(command > 54)
                    command = 0;
                    
                array_from_section();
                
                with(objUIListBox){
                    if(listID == 1){
                        initialize_listbox(other.currentList);
                        sID = -1;
                        selected = 0;
                        for(var i=array_length_1d(other.currentList)-1; i>-1; i--)
                            selected[i] = !other.toggleList[i];
                    }
                }
                
                with(objUILabel){
                    if(lID == 1)
                        caption = other.sectionName[other.command];
                    else if(lID == 2){
                        switch(other.command){
                            case 11: 
                            case 15: case 16: case 17: case 18: case 19: case 20: case 21: case 22: case 23: case 24: case 25: case 26: case 27: case 28: case 29: case 30: 
                            case 34: case 36: case 42: case 43: case 50: case 51: case 52: case 53: case 54:
                                caption = "(Two fighters)"; break;
                            default:
                                caption = "(One fighter)"; break;
                        }
                    }
                }
            }
            
            keyboard_string = "";
            with(objUIField)
                content = "";
        }
        else if(bID == 4){ //Add update
            if(global.IDselected > 0){
                with(objUIField){
                    if(fID == 0){
                        if(content != ""){
                            if(oTextedit.currentList[0] == ""){
                                oTextedit.currentList[0] = content;
                                oTextedit.toggleList[0] = 1;
                            
                            }
                            else{
                                oTextedit.currentList[array_length_1d(oTextedit.currentList)] = content;
                                oTextedit.toggleList[array_length_1d(oTextedit.toggleList)] = 1;
                            }
                            content = "";
                            
                            with(objUIListBox){
                                if(listID == 1){
                                    initialize_listbox(oTextedit.currentList);
                                    sID = array_length_1d(oTextedit.currentList)-1;
                                    selected = 0;
                                    for(var i=array_length_1d(oTextedit.currentList)-1; i>-1; i--)
                                        selected[i] = !oTextedit.toggleList[i];
                                }
                            }
                        }
                    }
                }
            }
        }
        else if(bID == 5){ //Delete Update
            if(global.IDselected > 0){
                with(objUIListBox){
                    if(listID == 1){
                        if(sID != -1){
                            with(oTextedit){
                                var copy1 = currentList;
                                var copy2 = toggleList;
                                currentList = 0;
                                toggleList = 0;
                                
                                for(var i=array_length_1d(copy1)-2; i>-1; i--){
                                    if(i < other.sID){
                                        currentList[i] = copy1[i];
                                        toggleList[i] = copy2[i];
                                    }
                                    else{
                                        currentList[i] = copy1[i+1];
                                        toggleList[i] = copy2[i+1];
                                    }
                                }
                                
                                if(!is_array(currentList)){
                                    currentList[0] = "";
                                    toggleList[0] = 0;
                                }
                            }
                            initialize_listbox(oTextedit.currentList);
                            sID = -1;
                            selected = 0;
                            for(var i=array_length_1d(oTextedit.currentList)-1; i>-1; i--)
                                selected[i] = !oTextedit.toggleList[i];
                        }
                    }
                }
            }
        }
        else if(bID == 6){ //New Update File
            keyboard_string = "";
            ui_show_popup_textedit("Please name new update file");
        }
        else if(bID == 7){ //Save Update File
            with(oTextedit){
                array_to_section();
                if(global.IDselected == 0){
                    ini_open("settings.ini");
                    var t = "";
                    for(var i=0; i<55; i++){
                        if(textList[i,0] != "")
                            t+=textList[i,0];
                    }
                    ini_write_string("defaulttext","toggle",t);
                    ini_close();
                }
                else{
                    ini_open(global.TEXT[global.IDselected]);
                    for(var i=0; i<55; i++){
                        if(textList[i,0] != ""){
                            ini_write_real(section[i],"total",string_length(textList[i,0]));
                            ini_write_string(section[i],"toggle",textList[i,0]);
                            for(var j=0; j<string_length(textList[i,0]); j++){
                                ini_write_string(section[i],"s"+string(j+1),textList[i,j+1]);
                            }
                        }
                    }
                    ini_write_real("text","version",global.charVersion + 1);
                    ini_write_real("text","creator",steam_get_user_account_id());
                    ini_close();
                    global.charname = global.TEXTNAME[global.IDselected]; 
                    var ename = global.TEXTNAME[global.IDselected];
                }
                with(objUIListBox){
                    if(listID == 1)
                        sID = -1;
                }
                
                if(global.workshop)
                {
                    if(global.workshopID == -1)
                    {
                        with(oSetup)
                        {
                            var app_id = steam_get_app_id(); 
                            new_item = steam_ugc_create_item(app_id, ugc_filetype_community);
                            
                            workshopName = ename;
                            workshopType = 0;
                        }
                    }
                    else
                    {
                        if(global.uploadImage == -1)
                        {
                            var tempSprite = sprite_duplicate(sUpdateFile);
                            sprite_save(tempSprite,0,working_directory + "texts\" + ename+ "\" + ename + ".png");
                            sprite_delete(tempSprite);
                        }
                        else
                        {
                            sprite_save(global.uploadImage,0,working_directory + "texts\" + ename+ "\" + ename + ".png");
                        }
                    
                        var workshopName = ename;
                        
                        var app_id = steam_get_app_id();
                        updateHandle = steam_ugc_start_item_update(app_id, global.workshopID);
                        
                        steam_ugc_set_item_title(updateHandle, workshopName );
                        steam_ugc_set_item_description( updateHandle, "Adds " + workshopName + " update file to Ultimate Arena");
                        steam_ugc_set_item_visibility(updateHandle, ugc_visibility_public);
                        
                        var tagArray;
                        tagArray[0] = "Update";
                        
                        steam_ugc_set_item_tags(updateHandle, tagArray);
                        steam_ugc_set_item_preview(updateHandle, working_directory + "texts\" + workshopName + "\" + workshopName + ".png");
                        steam_ugc_set_item_content(updateHandle, working_directory + "texts\" + workshopName + "\");
                        
                        requestId = steam_ugc_submit_item_update(updateHandle, "Version " + string(global.charVersion));
                    }
                }
                
                ui_show_popup("Successfully saved");
            }
        }
        else if(bID == 8){ //New Update File Popup
            with(objUIField){
                if(fID == 1){
                    if(content == "")
                        exit;
                    var nam = content;
                    global.TEXTNAME[global.TEXT_COUNT] = nam;
                    global.TEXT[global.TEXT_COUNT] = working_directory+"texts\"+nam+"\"+nam+".ini";
                    global.TEXTTOGGLE[global.TEXT_COUNT] = 1;
                    global.TEXT_COUNT++; 
                    //directory_create(working_directory+"texts\"+nam+"\");
                    ini_open(working_directory+"texts\"+nam+"\"+nam+".ini");
                    ini_write_real("toggle","toggle",1);
                    ini_write_string("text","name",nam);
                    ini_close();
                    
                    keyboard_string = "";
                }
            }
            with(zui_get_parent()) {
                with(black)
                    zui_destroy();
                zui_destroy();
            }
            
            with(oTextedit){
                array_from_update_file(working_directory+"texts\"+nam+"\"+nam+".ini");
                array_from_section();
                
                with(objUIListBox){
                    if(listID == 0){
                        initialize_listbox(global.TEXT);
                        sID = global.TEXT_COUNT-1;
                        global.IDselected = sID;
                        for(var i=length-1;i>=0; i--)
                        {
                            if(global.TEXTTOGGLE[i])
                                selected[i] = 0;
                            else
                                selected[i] = 1;
                        }
                    }
                    else if(listID == 1){
                        initialize_listbox(other.currentList);
                        selected = 0;
                        for(var i=array_length_1d(other.currentList)-1; i>-1; i--)
                            selected[i] = !other.toggleList[i];
                    }
                }
                
                with(objUIWindowCaption){
                    if(__parent.wID == "Editor Window")
                        caption = nam;
                }
            }
        }
    }
}

with(objUICheckbox)
{
    if(bID == 1)
        global.workshop = value;
}
