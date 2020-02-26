///mapedit_ui(id)
with(obj_uiListbox)
{
    if(argument0 == id)
    {
        if(global.IDselected == sID)
        {
            global.IDselected = -1;
        }
        else
        {
            global.IDselected = sID;
            var mname = global.MAPS[sID];
            var mcolors = "";
            ini_open(working_directory+"maps\"+mname+'\'+mname+'.ini');
            
            for(var i=0; i<256; i++)
                mcolors[i] = ini_read_string("Map","Colors"+string(i),"");
            
            obj_mapEditor.treeArray = 0;
            for(var i=0; i<30; i++){
                if(ini_read_string("Trees",string(i),"ERROR") == "ERROR")
                    break;
                obj_mapEditor.treeArray[i,0] = real(string_copy(ini_read_string("Trees",string(i),"000000"),1,3));
                obj_mapEditor.treeArray[i,1] = real(string_copy(ini_read_string("Trees",string(i),"000000"),4,3));
            }
            
            global.creator = ini_read_real("map","creator",-1);
            global.charVersion = ini_read_real("map","version",1);
            global.workshopID = ini_read_real("map","workshopID",-1);
            
            ini_close();
            keyboard_string = "";
            with(obj_uiField){
                if(fID == 0)
                    content = mname;
            }
            with(obj_uiLabel){
                if(lID == 1)
                    caption = string(array_height_2d(obj_mapEditor.treeArray))+"/30 Trees";
            }
            with(obj_mapEditor){
                var c = "";
                for(var i=0; i<256; i++){
                for(var j=0; j<256; j++){
                    c = string_char_at(mcolors[i],j+1);
                    ds_grid_set(mapGrid,i,j,real(c))
                }
                }
                var map = sprite_add(working_directory+"maps\"+mname+"\"+mname+".png",1,0,0,0,0);
                surface_set_target(mapeditSurf);
                draw_sprite(map,0,0,0);
                surface_reset_target();
                sprite_delete(map);
                if(overlayImage != spr_blankMap)
                    sprite_delete(overlayImage);
                overlayImage = spr_blankMap;
                overlayOn = false;
                if(file_exists(working_directory+"maps\"+mname+"\"+mname+"overlay.png")){
                    overlayImage = sprite_add(working_directory+"maps\"+mname+"\"+mname+"overlay.png",1,0,0,0,0);
                    var surf = surface_create(256,256);
                    surface_set_target(surf);
                    draw_sprite_stretched(overlayImage,0,0,0,256,256);
                    surface_reset_target();
                    sprite_delete(overlayImage);
                    overlayImage = sprite_create_from_surface(surf,0,0,256,256,0,0,0,0);
                    surface_free(surf);
                    overlayOn = true;
                    with(obj_uiButton){
                        if(bID == 11)
                            caption = "Remove Overlay Image";
                    }
                }
                with(obj_uiButton){
                    if(bID == 12){
                        if(other.overlayOn)
                            caption = "Overlay: On";
                        else
                            caption = "Overlay: Off";
                    }
                }
                cursorType = 0;
                cursorSize = 0;
            }
            
            with(obj_uiCheckbox)
            {
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
                        show_debug_message("map created by user");
                    }
                }
            }
        }
    }
}
with(obj_uiButton){
    if(argument0 == id){
        if(bID == 0){//Go Back
            var c = instance_create(0,0,obj_roomTransition);
            c.gotoroom = rm_title;
        }
        else if(bID == 1){ //Delete Event
            if(global.IDselected != -1){
                directory_destroy(working_directory+"maps\"+global.MAPS[global.IDselected]);
                keyboard_string = "";
                with(obj_mapEditor){
                    if(overlayImage != spr_blankMap)
                        sprite_delete(overlayImage);
                    surface_free(mapeditSurf);
                    ds_grid_destroy(mapGrid);
                    initialize_maps();
                    room_restart();
                }
            }
        }
        else if(bID == 2) //Water
            obj_mapEditor.cursorType = 0;
        else if(bID == 3) //Sand
            obj_mapEditor.cursorType = 1;
        else if(bID == 4) //Grass
            obj_mapEditor.cursorType = 2;
        else if(bID == 5) //Mountain 1
            obj_mapEditor.cursorType = 3;
        else if(bID == 6) //Mountain 2
            obj_mapEditor.cursorType = 4;
        else if(bID == 7) //Mountain 3
            obj_mapEditor.cursorType = 5;
        else if(bID == 8) //Trees
            obj_mapEditor.cursorType = 6;
        else if(bID == 9){//Create New Map
            with(obj_mapEditor){
                keyboard_string = "";
                if(overlayImage != spr_blankMap)
                    sprite_delete(overlayImage);
                surface_free(mapeditSurf);
                ds_grid_destroy(mapGrid);
                initialize_maps();
                room_restart();
            }
        }
        else if(bID == 10)
        {//Save Map
            with(obj_uiField)
            {
                if(content == "")
                {
                    ui_show_popup("Please enter a name.");
                    exit;
                }
                else
                    global.charname = content;
            }
            with(obj_mapEditor)
            {
                var name = global.charname;
                
                ini_open(working_directory+"maps\"+name+'\'+name+'.ini');
                surface_save(mapeditSurf,working_directory+"maps\"+name+'\color.png');
                ini_write_string("Map","name",name);
                ini_write_real("Map","Version",1);
                sprite_save(overlayImage,0,working_directory+"maps\"+name+'\height.png');
                sprite_delete(overlayImage);
                
                var str = "";

                for(var i=0; i<array_height_2d(treeArray); i++)
                    ini_write_string("Trees",string(i),string_format(treeArray[i,0],3,0)+string_format(treeArray[i,1],3,0));
                ini_close();
                keyboard_string = "";
                surface_free(mapeditSurf);
                ds_grid_destroy(mapGrid);
            }
            
            if(global.creator == -1)
            {
                ini_open(working_directory+"maps\"+name+'\'+name+'.ini');
                ini_write_real("map","creator",steam_get_user_account_id());
                global.creator = steam_get_user_account_id();
                ini_close();
            }
            
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
                    steam_ugc_set_item_description( updateHandle, "Adds " + workshopName + " map to Ultimate Arena");
                    steam_ugc_set_item_visibility(updateHandle, ugc_visibility_public);
                    
                    var tagArray;
                    tagArray[0] = "Map V2";
                    
                    steam_ugc_set_item_tags(updateHandle, tagArray);
                    
                    if(file_exists(working_directory+"maps\"+name+'\color.png'))
                        steam_ugc_set_item_preview(updateHandle, working_directory+"maps\"+name+'\color.png');
                    else
                        steam_ugc_set_item_preview(updateHandle, working_directory + "maps\" + workshopName + "\" + name + ".png");
                        
                    steam_ugc_set_item_content(updateHandle, working_directory + "maps\" + workshopName + "\");
                    
                    requestId = steam_ugc_submit_item_update(updateHandle, "Version " + string(global.charVersion));
                }
            }
            initialize_maps();
            room_restart();
        }
        else if(bID == 11){//Import Image Overlay
            with(obj_mapEditor){
                if(overlayImage != spr_blankMap){
                    sprite_delete(overlayImage);
                    overlayImage = spr_blankMap;
                    overlayOn = false;
                    with(obj_uiButton){
                        if(bID == 12)
                            caption = "Overlay: Off";
                    }
                    other.caption = "Import Overlay Image";
                }
                else{
                    var file = get_open_filename("Image File|*.png;*.jpg;*.jpeg", "");
                    if(file != ""){
                        if(overlayImage != spr_blankMap)
                            sprite_delete(overlayImage);
                        overlayImage = sprite_add(file,0,0,0,0,0);
                        var surf = surface_create(256,256);
                        surface_set_target(surf);
                        draw_sprite_stretched(overlayImage,0,0,0,256,256);
                        surface_reset_target();
                        sprite_delete(overlayImage);
                        overlayImage = sprite_create_from_surface(surf,0,0,256,256,0,0,0,0);
                        surface_free(surf);
                        overlayOn = true;
                        with(obj_uiButton){
                            if(bID == 12)
                                caption = "Overlay: On";
                        }
                    }
                    other.caption = "Remove Overlay Image";
                }
            }
        }
        else if(bID == 12){//Toggle Overlay
            if(obj_mapEditor.overlayImage != spr_blankMap){
                obj_mapEditor.overlayOn = !obj_mapEditor.overlayOn;
                if(obj_mapEditor.overlayOn)
                    caption = "Overlay: On";
                else
                    caption = "Overlay: Off";
            }
        }
        else if(bID == 13){//Clear Trees
            obj_mapEditor.treeArray = 0;
            with(obj_uiLabel){
                if(lID == 1)
                    caption = "0/30 Trees";
            }
        }
        else if(bID == 14)//Brush 1
            obj_mapEditor.cursorSize = 0;
        else if(bID == 15)//Brush 2
            obj_mapEditor.cursorSize = 1;
        else if(bID == 16)//Brush 3
            obj_mapEditor.cursorSize = 2;
        else if(bID == 17)//Brush 4
            obj_mapEditor.cursorSize = 3;
        else if(bID == 18){//Generate Map From Overlay
            with(obj_mapEditor){
                surface_set_target(mapeditSurf);
                draw_clear(green);
                surface_reset_target();
                treeArray = 0;
                ds_grid_clear(mapGrid,0);
                overlayOn = false;
                with(obj_uiButton){
                    if(bID == 12)
                        caption = "Overlay: Off";
                }
                generate_map_from_sprite(overlayImage);
                with(obj_uiLabel){
                    if(lID == 1)
                        caption = "30/30 Trees";
                }
            }
        }
    }
}

with(obj_uiCheckbox)
{
    if(bID == 1)
        global.workshop = value;
}
