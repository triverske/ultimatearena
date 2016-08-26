///eventedit_ui(id)
with(oUIListBox)
{
    if(argument0 == id)
    {
        if(global.IDselected == argument0.sID)
        {
            global.IDselected = -1;
        }
        else
        {
            global.IDselected = argument0.sID;
            ini_open(working_directory + "events\" + global.EVENT[sID])
            var ename = ini_read_string("event","name","");
            var edesc = ini_read_string("event","description","");
            var eperc = ini_read_real("event","death_percentage",0);
            var etotl = ini_read_real("text","total",0);
            var etxt;
            
            for(var i=etotl; i>0; i--)
                etxt[i] = ini_read_string("text","s"+string(i),"");
                
            global.creator = ini_read_real("event","creator",-1);
            global.charVersion = ini_read_real("event","version",1);
            global.workshopID = ini_read_real("event","workshopID",-1);
            
            
            ini_close();
            
            with(objUIField)
            {
                if(fID == 0)
                    content = ename;
                if(fID == 1)
                    content = edesc;
                if(fID == 2)
                    content = string(eperc);
            }
            with(objUIMultiField)
            {
                if(mID == 0)
                {
                    activeField = 0;
                    fields = etotl;
                    for(i=0; i<etotl; i++)
                        content[i] = etxt[i+1];
                }
            }
            with(objUILabel)
                if(lID == 1)
                    caption = string(objUIMultiField.activeField+1)+"/"+string(objUIMultiField.fields);
                
            with(objUICheckbox)
            {
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
                        show_debug_message("event created by user");
                    }
                }
            }
        }
    }
}
with(objUIButton)
{
    if(argument0 == id)
    {
        if(bID == 0)//Go Back
        {
            c = instance_create(0,0,oRoomTransition);
            c.gotoroom = rm_title;
        }
        if(bID == 1)//Delete Event
        {
            if(global.IDselected != -1)
            {
                directory_destroy(working_directory + "events\" + global.eNAME[global.IDselected]);
                initialize_events();
                keyboard_string = "";
                room_restart();
            }
        }
        if(bID == 2) //Save Event
        {
            with(objUIField)
            {
                if(fID == 0)
                    var ename = content;
                if(fID == 1)
                    var edesc = content;
                if(fID == 2)
                    var eperc = content;
            }
            
            if(ename != "")
            {
            
                global.charname = ename;
                ini_open(working_directory + "events\" + ename + "\" + ename + ".ini");
                ini_write_string("event","name",ename);
                ini_write_string("event","description",edesc);
                ini_write_real("event","death_percentage",real(eperc));
                
                ini_write_real("text","total",objUIMultiField.fields);
                if(ini_section_exists("text"))
                    ini_section_delete("text");
                for(var i=1; i<=objUIMultiField.fields; i++){
                    ini_write_string("text","s"+string(i),objUIMultiField.content[i-1]);
                }
                ini_write_real("text","total",objUIMultiField.fields);
                
                if(global.creator == -1)
                {
                    ini_write_real("event","creator",steam_get_user_account_id());
                    global.creator = steam_get_user_account_id();
                }
                
                ini_close();
                
                tempSprite = sprite_duplicate(sArenaEvent);
                sprite_save(tempSprite,0,working_directory + "events\" + ename+ "\" + ename + ".png");
                sprite_delete(tempSprite);
                
                if(global.workshop && !global.copyProtection)
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
                        var workshopName = ename;
                        
                        var app_id = steam_get_app_id();
                        updateHandle = steam_ugc_start_item_update(app_id, global.workshopID);
                        
                        steam_ugc_set_item_title(updateHandle, workshopName );
                        steam_ugc_set_item_description( updateHandle, "Adds " + workshopName + " event to Ultimate Arena");
                        steam_ugc_set_item_visibility(updateHandle, ugc_visibility_public);
                        
                        var tagArray;
                        tagArray[0] = "Event";
                        
                        steam_ugc_set_item_tags(updateHandle, tagArray);
                        steam_ugc_set_item_preview(updateHandle, working_directory + "events\" + workshopName + "\" + workshopName + ".png");
                        steam_ugc_set_item_content(updateHandle, working_directory + "events\" + workshopName + "\");
                        
                        requestId = steam_ugc_submit_item_update(updateHandle, "Version " + string(global.charVersion));
                    }
                }
                
                initialize_events();
                keyboard_string = "";
                room_restart();
            }
            else
            {
                ui_show_popup("Please enter a name.");
            }
        }
        if(bID == 3) //New Event
        {
            keyboard_string = "";
            room_restart();
        }
        if(bID == 4) //Add Update
        {
            with(objUIMultiField){
                if(mID == 0){
                    fields++;
                    activeField = fields-1;
                    content[activeField]="";
                }
            }
            with(objUILabel){
                if(lID == 1){
                    caption = string(objUIMultiField.activeField+1)+"/"+string(objUIMultiField.fields);
                }
            }
        }
        if(bID == 5) //Delete Update
        {
            with(objUIMultiField){
                if(mID == 0){
                    if(fields <= 1){
                        content[0] = "";
                        fields = 0;
                    }
                    else{
                        for(var i=activeField; i<fields-1; i++){
                            content[i] = content[i+1];
                        }
                        content[fields-1] = "";
                        fields--;
                        activeField = max(0,--activeField);
                    }
                }
            }
            with(objUILabel){
                if(lID == 1){
                    caption = string(objUIMultiField.activeField+1)+"/"+string(objUIMultiField.fields);
                }
            }
        }
        if(bID == 6) //Last Update
        {
            with(objUIMultiField){
                if(mID == 0){
                    activeField--;
                    if(activeField<0)
                        activeField = fields-1;
                }
            }
            with(objUILabel){
                if(lID == 1){
                    caption = string(objUIMultiField.activeField+1)+"/"+string(objUIMultiField.fields);
                }
            }
        }
        if(bID == 7) //Next Update
        {
            with(objUIMultiField){
                if(mID == 0){
                    activeField++;
                    if(activeField>fields-1)
                        activeField = 0;
                }
            }
            with(objUILabel){
                if(lID == 1){
                    caption = string(objUIMultiField.activeField+1)+"/"+string(objUIMultiField.fields);
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
