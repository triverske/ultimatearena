///mapedit_ui(id)
with(oUIListBox){
    if(argument0 == id){
        if(global.IDselected == sID){
            global.IDselected = -1;
        }
        else{
            global.IDselected = sID;
            ini_open(working_directory+"maps\"+global.MAPS[sID]+'\'+global.MAPS[sID]+'.ini')
            var mname = global.MAPS[sID];
            var mcolors = "";
            for(var i=0; i<256; i++){
                mcolors[i] = ini_read_string("Map","Colors"+string(i),"");
            }
            oMapedit.treeArray = 0;
            for(var i=0; i<30; i++){
                if(ini_read_string("Trees",string(i),"ERROR") == "ERROR")
                    break;
                oMapedit.treeArray[i,0] = real(string_copy(ini_read_string("Trees",string(i),"00000"),1,3));
                oMapedit.treeArray[i,1] = real(string_copy(ini_read_string("Trees",string(i),"000000"),4,3));
            }
            ini_close();
            keyboard_string = "";
            with(objUIField){
                if(fID == 0)
                    content = mname;
            }
            with(objUILabel){
                if(lID == 1)
                    caption = string(array_height_2d(oMapedit.treeArray))+"/30 Trees";
            }
            with(oMapedit){
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
                if(overlayImage != sBlankMap)
                    sprite_delete(overlayImage);
                overlayImage = sBlankMap;
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
                }
                with(objUIButton){
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
        }
    }
}
with(objUIButton){
    if(argument0 == id){
        if(bID == 0){//Go Back
            var c = instance_create(0,0,oRoomTransition);
            c.gotoroom = rm_title;
        }
        else if(bID == 1){ //Delete Event
            if(global.IDselected != -1){
                directory_destroy(working_directory+"maps\"+global.MAPS[global.IDselected]);
                keyboard_string = "";
                if(overlayImage != sBlankMap)
                    sprite_delete(overlayImage);
                surface_free(mapeditSurf);
                ds_grid_destroy(mapGrid);
                initialize_maps();
                room_restart();
            }
        }
        else if(bID == 2) //Water
            oMapedit.cursorType = 0;
        else if(bID == 3) //Sand
            oMapedit.cursorType = 1;
        else if(bID == 4) //Grass
            oMapedit.cursorType = 2;
        else if(bID == 5) //Mountain 1
            oMapedit.cursorType = 3;
        else if(bID == 6) //Mountain 2
            oMapedit.cursorType = 4;
        else if(bID == 7) //Mountain 3
            oMapedit.cursorType = 5;
        else if(bID == 8) //Trees
            oMapedit.cursorType = 6;
        else if(bID == 9){//Create New Map
            with(oMapedit){
                keyboard_string = "";
                if(overlayImage != sBlankMap)
                    sprite_delete(overlayImage);
                surface_free(mapeditSurf);
                ds_grid_destroy(mapGrid);
                initialize_maps();
                room_restart();
            }
        }
        else if(bID == 10){//Save Map
            with(objUIField){
                if(content == "")
                    exit;
            }
            with(oMapedit){
                var name = keyboard_string;
                ini_open(working_directory+"maps\"+name+'\'+name+'.ini');
                surface_save(mapeditSurf,working_directory+"maps\"+name+'\'+name+'.png');
                if(overlayImage != sBlankMap){
                    sprite_save(overlayImage,0,working_directory+"maps\"+name+'\'+name+'overlay.png');
                    sprite_delete(overlayImage);
                }
                var str = "";
                for(var i=0; i<256; i++){
                    for(var j=0; j<256; j++){
                        str+=string(ds_grid_get(mapGrid,i,j));
                    }
                    ini_write_string("Map","Colors"+string(i),str);
                    str = "";
                }
                for(var i=0; i<array_height_2d(treeArray); i++)
                    ini_write_string("Trees",string(i),string_format(treeArray[i,0],3,0)+string_format(treeArray[i,1],3,0));
                ini_close();
                keyboard_string = "";
                surface_free(mapeditSurf);
                ds_grid_destroy(mapGrid);
            }
            initialize_maps();
            room_restart();
        }
        else if(bID == 11){//Import Image Overlay
            with(oMapedit){
                var file = get_open_filename("Image File|*.png;*.jpg;*.jpeg", "");
                if(file != ""){
                    if(overlayImage != sBlankMap)
                        sprite_delete(overlayImage);
                    overlayImage = sprite_add(file,0,0,0,0,0);
                    var surf = surface_create(256,256);
                    surface_set_target(surf);
                    draw_sprite_stretched(overlayImage,0,0,0,256,256);
                    surface_reset_target();
                    sprite_delete(overlayImage);
                    overlayImage = sprite_create_from_surface(surf,0,0,256,256,0,0,0,0);
                    surface_free(surf);
                    with(objUIButton){
                        if(bID == 12)
                            caption = "Overlay: On";
                    }
                    overlayOn = true;
                }
            }
        }
        else if(bID == 12){//Toggle Overlay
            if(oMapedit.overlayImage != sBlankMap){
                oMapedit.overlayOn = !oMapedit.overlayOn;
                if(oMapedit.overlayOn)
                    caption = "Overlay: On";
                else
                    caption = "Overlay: Off";
            }
        }
        else if(bID == 13){//Clear Trees
            oMapedit.treeArray = 0;
        }
        else if(bID == 14)//Brush 1
            oMapedit.cursorSize = 0;
        else if(bID == 15)//Brush 2
            oMapedit.cursorSize = 1;
        else if(bID == 16)//Brush 3
            oMapedit.cursorSize = 2;
        else if(bID == 17)//Brush 4
            oMapedit.cursorSize = 3;
        else if(bID == 18){//Generate Map From Overlay
            with(oMapedit){
                surface_set_target(mapeditSurf);
                draw_clear(green);
                surface_reset_target();
                treeArray = 0;
                ds_grid_clear(mapGrid,0);
                overlayOn = false;
                with(objUIButton){
                    if(bID == 12)
                        caption = "Overlay: Off";
                }
                generate_map_from_sprite(overlayImage);
                with(objUILabel){
                    if(lID == 1)
                        caption = "30/30 Trees";
                }
            }
        }
    }
}
