///charedit_ui(id)
with(obj_uiListbox)
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
                obj_fighterEditor.tempTags = 0;
                
                ini_open(global.fNAME[sID])
                global.editStats[0] = min(10,ini_read_real("character","strength",5));
                global.editStats[1] = min(10,ini_read_real("character","agility",5));
                global.editStats[2] = min(10,ini_read_real("character","endurance",5));
                global.editStats[3] = min(10,ini_read_real("character","skill",5));
                global.editStats[4] = min(10,ini_read_real("character","luck",5));
                var gen = ini_read_real("character","gender",0)
                //var s1 = ini_read_string("think","s1","");
                global.creator = ini_read_real("character","creator",-1);
                global.charVersion = ini_read_real("character","version",1);
                global.workshopID = ini_read_real("character","workshopID",-1);
                ini_close();
                
                obj_uiImage.image = global.cIMAGES[sID]
                    
                with(obj_uiField)
                {
                    if(fID == 0)
                        content = global.cNAME[other.sID];
                    //else if(fID == 1)
                        //content = s1;
                    else if(fID == 3)
                        content = "";
                }
                
                with(obj_uiCheckbox)
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
                            with(obj_uiLabel)
                            {
                                if(caption == "Add to Steam Workshop")
                                    __visible = 0;
                            }
                            global.copyProtection = 1;
                            __visible = 0;
                        }
                        else
                        {
                            with(obj_uiLabel)
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
                with(obj_fighterEditor){
                    array_from_update_file(global.fNAME[other.sID]);
                    array_from_section();
                }
                var ts = 0;
                with(obj_uiListbox){
                    if(listID == 1){
                        for(var i=0; i<global.TAG_COUNT; i++){
                            selected[i] = 1;
                            for(var j=0; j<array_length_2d(global.TAG_LIST,i); j++){
                                if(global.TAG_LIST[i,j] == other.sID){
                                    ts++;
                                    selected[i] = 0;
                                    break;
                                }
                            }
                        }
                    }
                    else if(listID == 2){
                        initialize_listbox(obj_fighterEditor.currentList);
                        for(var i=array_length_1d(obj_fighterEditor.currentList)-1; i>-1; i--)
                            selected[i] = !obj_fighterEditor.toggleList[i];
                    }
                }
                with(obj_uiLabel){
                    if(lID > 0 && lID < 6)
                        caption = string(global.editStats[lID - 1]);
                    else if(lID == 6)
                        caption = string(ts)+'/'+string(global.TAG_COUNT)+' Tags';
                }
            }
        }
        else if(listID == 1)
        {
            if(sID != -1){
                var ts = 0;
                for(var i=0; i<length; i++){
                    if(selected[i] == 0)
                        ts++;
                }
                with(obj_uiLabel){
                    if(lID == 6)
                        caption = string(ts)+'/'+string(other.length)+' Tags';
                }
            }
        }
        else if(listID == 2){
            if(obj_fighterEditor.currentList[sID] != "")
                obj_fighterEditor.toggleList[sID] = !selected[sID];
            else
                selected[sID] = 1;
        }
    }
}
with(obj_uiButton)
{
    if(argument0 == id)
    {
        if(bID == 0) //Go Back
        {
            initialize_characters();
            c = instance_create(0,0,obj_roomTransition);
            c.gotoroom = rm_title;
        }
        else if(bID == 1) // Change Image
        {
            //var charname = keyboard_string;
            var file = get_open_filename("Image File|*.png;*.jpg;*.jpeg", "");
            if(file != "")
            {
                var newsp = sprite_add(file,0,0,0,0,0);
                var surf = surface_create(128,128);
                surface_set_target(surf);
                draw_sprite_stretched(newsp,0,0,0,128,128);
                surface_reset_target();
                
                if(obj_fighterEditor.newImage != spr_defaultFighterImage)
                    sprite_delete(obj_fighterEditor.newImage);
                obj_fighterEditor.newImage = sprite_create_from_surface(surf,0,0,128,128,0,0,0,0);
                
                sprite_delete(newsp);
                surface_free(surf);
            }
            else{
                if(obj_fighterEditor.newImage != spr_defaultFighterImage)
                    sprite_delete(obj_fighterEditor.newImage);
                obj_fighterEditor.newImage = spr_defaultFighterImage;
            }
            
            obj_uiImage.image = obj_fighterEditor.newImage;
        }
        else if(bID == 2) //Save Character
        {
            with(obj_uiField)
                if(fID == 0)
                    var name = content;
            
                    
            if(name != "")
            {
                global.charname = name;
                ini_open(working_directory + "characters\" + name + "\" + name + ".ini");
                ini_write_string("character","name",name);
                ini_write_string("character","image",name+".png");
                
                ini_write_real("character","colorr",global.editColors[global.editColor,0]);
                ini_write_real("character","colorg",global.editColors[global.editColor,1]);
                ini_write_real("character","colorb",global.editColors[global.editColor,2]);
                
                global.charVersion++;
                ini_write_real("character","version",global.charVersion);
                
                global.workshopID = ini_read_real("character","workshopID",-1);
                
                newGender = 0;
                with(obj_uiCheckbox)
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
                
                with(obj_fighterEditor){
                    array_to_section();
                    for(var i=0; i<55; i++){
                        if(textList[i,0] != ""){
                            ini_write_real(section[i],"total",string_length(textList[i,0]));
                            ini_write_string(section[i],"toggle",textList[i,0]);
                            for(var j=0; j<string_length(textList[i,0]); j++){
                                ini_write_string(section[i],"s"+string(j+1),textList[i,j+1]);
                            }
                        }
                    }
                }
                
                var tagstring = "";
                with(obj_uiListbox){
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
                        for(var i=0; i<array_length_1d(obj_fighterEditor.tempTags); i++){
                            if(selected[i+global.TAG_COUNT] == 0){
                                if(tagstring == "")
                                    tagstring += obj_fighterEditor.tempTags[i];
                                else
                                    tagstring += ','+obj_fighterEditor.tempTags[i];
                            }
                        }
                    }
                    else if(listID == 2)
                        sID = -1;
                }
                ini_write_string("character","tags",tagstring);
                ini_close();
                
                for(i=0;i<5;i++)
                    global.editStats[i] = 5;
                    
                with(obj_uiLabel)
                    if(lID > 0 && lID < 6)
                        caption = "5";
                    
                if(obj_fighterEditor.newImage != spr_defaultFighterImage)
                {
                    sprite_save(obj_fighterEditor.newImage,0,working_directory + "characters\" + name + "\" + name + ".png");
                    sprite_delete(obj_fighterEditor.newImage);
                    obj_fighterEditor.newImage = spr_defaultFighterImage;
                }
                else
                {
                    if(obj_uiImage.image != spr_defaultFighterImage)
                        sprite_save(obj_uiImage.image,0,working_directory + "characters\" + name + "\" + name + ".png");
                    else{
                        //Gamemaker doesn't let you save images from the resource tree.
                        var tempSprite = sprite_duplicate(spr_defaultFighterImage);
                        sprite_save(tempSprite,0,working_directory + "characters\" + name + "\" + name + ".png");
                        sprite_delete(tempSprite);
                    }
                }
                
                /*
                if(global.workshop && !global.copyProtection)
                {
                    if(global.workshopID == -1)
                    {
                        with(obj_setup)
                        {
                            var app_id = steam_get_app_id(); 
                            new_item = steam_ugc_create_item(app_id, ugc_filetype_community);
                            
                            workshopName = name;
                            workshopType = 0;
                        }
                    }
                    else
                    {
                        var workshopName = name;
                        
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
                        
                        requestId = steam_ugc_submit_item_update(updateHandle, "Version " + date_datetime_string(date_current_datetime()) );
                    }
                } */
                
                initialize_characters();
                room_restart();
                keyboard_string = "";
            }
            else
            {
                ui_show_popup("Please enter a name.");
            }
        }
        else if(bID == 4)//New Character
        {
            if(obj_fighterEditor.newImage != spr_defaultFighterImage)
                sprite_delete(obj_fighterEditor.newImage);
            obj_fighterEditor.newImage = spr_defaultFighterImage;
            keyboard_string = "";
            room_restart();
        }
        else if(bID == 5)//Delete Character
        {
            if(global.IDselected != -1)
            {
                directory_destroy(working_directory + "characters\" + global.cNAME[global.IDselected]);
                
                initialize_characters();
                keyboard_string = "";
                room_restart();
            }
        }
        else if(bID == 6) //Add sound (depreciated?)
        {
            //file = get_open_filename("Sound File|*.ogg", "");
        }
        else if(bID == 7) //Increase Stat
        {
            global.editStats[stat]++;
            
            if(global.editStats[stat] > 10)
                global.editStats[stat] = 10;
                
            with(obj_uiLabel)
                if(lID == other.stat + 1)
                    caption = string(global.editStats[other.stat]);
        }
        else if(bID == 8) //Decrease Stat
        {
            global.editStats[stat]--;
            
            if(global.editStats[stat] < 1)
                global.editStats[stat] = 1;
                
            with(obj_uiLabel)
                if(lID == other.stat + 1)
                    caption = string(global.editStats[other.stat]);
        }
        else if(bID == 9) //Fighter Color
        {
            global.editColor = type;
            with(obj_uiImageButton)
            {
                if(global.editColor != type)
                    color = c_gray;
                else
                    color = c_white;
            }
        }
        else if(bID == 10) //Change catchphrase
        {
            get_string_async("Enter a catchphrase","");
        }
        else if(bID == 11) //Delete Tag
        {
            with(obj_uiListbox)
            {
                if(listID == 1)
                {
                    delete_tag(sID);
                    initialize_listbox(global.TAGS);
                    selected = 0;
                    for(var i=0; i<global.TAG_COUNT; i++){
                        selected[i] = 1;
                        for(var j=0; j<array_length_2d(global.TAG_LIST,i); j++){
                            if(global.TAG_LIST[i,j] == global.IDselected){
                                selected[i] = 0;
                                break;
                            }
                        }
                    }
                }
            }
        }
        else if(bID == 12) //Add Tag
        {
            if(global.IDselected==-1){
                with(obj_uiField){
                    if(fID == 2){
                        if(content == ""){
                            ui_show_popup("Please enter a tag name.");
                            exit;
                        }
                        else{
                            obj_fighterEditor.tempTags[array_length_1d(obj_fighterEditor.tempTags)] = content;
                            content = "";
                        }
                    }
                }
                with(obj_uiListbox){
                    if(listID == 1){
                        list[array_length_1d(list)] = obj_fighterEditor.tempTags[array_length_1d(obj_fighterEditor.tempTags)-1];
                        selected[array_length_1d(list)-1]=0;
                        sID = length;
                        length++;
                        with(__child[0])
                            sliderPos = __height/2 - 23;
                        var ts = 0;
                        for(var i=0; i<length; i++){
                            if(selected[i] == 0)
                                ts++;
                        }
                        with(obj_uiLabel){
                            if(lID == 6)
                                caption = string(ts)+'/'+string(other.length)+' Tags';
                        }
                    }
                }
            }
            else{
                with(obj_uiField){
                    if(fID == 2){
                        if(content == ""){
                            ui_show_popup("Please enter a tag name.");
                            exit;
                        }
                        else{
                            global.TAGS[global.TAG_COUNT] = content;
                            content = "";
                        }
                    }
                }
                global.TAG_LIST[global.TAG_COUNT,0] = global.IDselected;
                global.TAG_COUNT++;
                ini_open(global.fNAME[global.IDselected]);
                var prevtag = ini_read_string("character","tags","");
                if(prevtag!= "")
                    ini_write_string("character","tags",prevtag+","+global.TAGS[global.TAG_COUNT-1]);
                else
                    ini_write_string("character","tags",global.TAGS[global.TAG_COUNT-1]);
                ini_close();
                with(obj_uiListbox){
                    if(listID == 1){
                        initialize_listbox(global.TAGS);
                        selected=0;
                        var ts = 0;
                        for(var i=0; i<global.TAG_COUNT; i++){
                            selected[i] = 1;
                            for(var j=0; j<array_length_2d(global.TAG_LIST,i); j++){
                                if(global.TAG_LIST[i,j] == global.IDselected){
                                    ts++;
                                    selected[i] = 0;
                                    break;
                                }
                            }
                        }
                        with(obj_uiLabel){
                            if(lID == 6)
                                caption = string(ts)+'/'+string(global.TAG_COUNT)+' Tags';
                        }
                        with(__child[0])
                            sliderPos = __height/2 - 23;
                    }
                }
            }
        }
        else if(bID == 13){ //Cycle commands left
            with(obj_fighterEditor){
                array_to_section();
                
                command--;
                if(command < 0)
                    command = 54;
                    
                array_from_section();
                
                with(obj_uiListbox){
                    if(listID == 2){
                        initialize_listbox(other.currentList);
                        sID = -1;
                        selected = 0;
                        for(var i=array_length_1d(other.currentList)-1; i>-1; i--)
                            selected[i] = !other.toggleList[i];
                    }
                }
                
                with(obj_uiLabel){
                    if(lID == 7)
                        caption = other.sectionName[other.command];
                    else if(lID == 8){
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
            with(obj_uiField){
                if(fID == 3)
                    content = "";
            }
        }
        else if(bID == 14){ //Cycle commands right
            with(obj_fighterEditor){
                array_to_section();
                
                command++;
                if(command > 54)
                    command = 0;
                    
                array_from_section();
                
                with(obj_uiListbox){
                    if(listID == 2){
                        initialize_listbox(other.currentList);
                        sID = -1;
                        selected = 0;
                        for(var i=array_length_1d(other.currentList)-1; i>-1; i--)
                            selected[i] = !other.toggleList[i];
                    }
                }
                
                with(obj_uiLabel){
                    if(lID == 7)
                        caption = other.sectionName[other.command];
                    else if(lID == 8){
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
            with(obj_uiField){
                if(fID == 3)
                    content = "";
            }
        
        }
        else if(bID == 15){ //Add update
            with(obj_uiField){
                if(fID == 3){
                    if(content != ""){
                        if(obj_fighterEditor.currentList[0] == ""){
                            obj_fighterEditor.currentList[0] = content;
                            obj_fighterEditor.toggleList[0] = 1;
                        
                        }
                        else{
                            obj_fighterEditor.currentList[array_length_1d(obj_fighterEditor.currentList)] = content;
                            obj_fighterEditor.toggleList[array_length_1d(obj_fighterEditor.toggleList)] = 1;
                        }
                        content = "";
                        
                        with(obj_uiListbox){
                            if(listID == 2){
                                initialize_listbox(obj_fighterEditor.currentList);
                                sID = array_length_1d(obj_fighterEditor.currentList)-1;
                                selected = 0;
                                for(var i=array_length_1d(obj_fighterEditor.currentList)-1; i>-1; i--)
                                    selected[i] = !obj_fighterEditor.toggleList[i];
                            }
                        }
                    }
                }
            }
        }
        else if(bID == 16){ //Delete update
            with(obj_uiListbox){
                if(listID == 2){
                    if(sID != -1){
                        with(obj_fighterEditor){
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
                        initialize_listbox(obj_fighterEditor.currentList);
                        sID = -1;
                        selected = 0;
                        for(var i=array_length_1d(obj_fighterEditor.currentList)-1; i>-1; i--)
                            selected[i] = !obj_fighterEditor.toggleList[i];
                    }
                }
            }
        }
    }
}
/*
with(obj_uiImage)
{
    if(argument0 == id)
    {
        if(global.IDselected >= 0)
            image = obj_fighterEditor.newImage;
    }
}*/

with(obj_uiCheckbox)
{
    if(bID == 1)
        global.workshop = value;
}
