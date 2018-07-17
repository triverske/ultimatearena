///fighter_select_buttons(id)

var WS = global.WSCALE;
var HS = global.HSCALE;

with (obj_uiButton)
{
    if (argument0 == id)
    {
        if (bID == 0) //return to title
        {
            var c = instance_create(0,0,obj_roomTransition);
            c.gotoroom = rm_title;
        }
        else if (bID == 1) //regen map
        {
            obj_fighterSelect.regen = 1;
        }
        else if (bID == 2) //tag
        {
            if(global.TAG_COUNT > 0)
            {
            with (zui_main()) 
            {
                with(zui_create(WS/2,HS/2,obj_uiWindow,-1))
                {
                    wID = "Search By Tag";
                    //callback = fighter_select_buttons;
                    zui_set_size(160,224);
                    with(zui_create(0,0,obj_uiWindowCaption))
                    {
                        caption = "Search By Tag";
                        draggable = 1;
                    }
                    with(zui_create(0,24,obj_uiListbox))
                    {
                        zui_set_anchor(0,0);
                        zui_set_size(160,200);
                        callback = tag_ui;
                        initialize_listbox(global.TAGS);
                
                        with(zui_create(0,0,obj_uiListboxScroll)){} 
                    }
                    zui_create(0,0,obj_uiExitButton,-1);
                }
            }
            }
            else
            {
                ui_show_popup("No Tags Found");
            }
        }
        else if (bID == 3)
        {
            obj_fighterSelect.startgame = 1;
        }
        else if (bID == 4)
        {
            if (type == 2)
            {
                type = 3;
                global.arena_events = 1;
                caption = "Arena Events On";
            }
            else
            {
                type = 2;
                global.arena_events = 0;
                caption = "Arena Events Off";
            }
        }
        else if (bID == 5)
        {
            if (type == 2)
            {
                type = 3;
                global.landmines = 1;
                caption = "Inital Landmines On";
            }
            else
            {
                type = 2;
                global.landmines = 0;
                caption = "Inital Landmines Off";
            }
        }
        else if (bID == 6)
        {
            if (type == 2)
            {
                type = 3;
                caption = "Custom Sounds On";
                global.custom_sounds = 1;
            }
            else
            {
                type = 2;
                caption = "Custom Sounds Off";
                global.custom_sounds = 0;
            }
        }
        else if (bID == 7)
        {
            if (type == 2)
            {
                type = 3;
                global.custom_updates = 1;
                caption = "Custom Updates On";
            }
            else
            {
                type = 2;
                global.custom_updates = 0;
                caption = "Custom Updates Off";
            }
        }
        else if (bID == 8)
        {
            var w = get_integer_async("Enter A Seed",0);
        }
        else if (bID == 9)
        {
            if(global.SAVE_SPEED < 20)
                global.SAVE_SPEED++;
        }
        if (bID == 10)
        {
            if (global.SAVE_SPEED != 0 && global.SAVE_SPEED > 1)
                global.SAVE_SPEED--;
        }
        else if (bID == 12)
        {
            if (type == 2)
            {
                type = 3;
                global.fighterGroups = 1;
                caption = "Groups On";
            }
            else
            {
                type = 2;
                global.fighterGroups = 0;
                caption = "Groups Off";
            }
        }
        else if(bID == 13){//Select Map
            if(global.MAP_COUNT > 0){
                with(zui_main()){
                    with(zui_create(WS/2,HS/2,obj_uiWindow,-1)){
                        wID = "Select Map";
                        //callback = fighter_select_buttons;
                        zui_set_size(160,224);
                        with(zui_create(0,0,obj_uiWindowCaption)){
                            caption = "Select Map";
                            draggable = 1;
                        }
                        with(zui_create(0,24,obj_uiListbox)){
                            zui_set_anchor(0,0);
                            zui_set_size(160,200);
                            callback = map_ui;
                            initialize_listbox(global.mapNAME,0,global.MAP_COUNT-1);
                            with(zui_create(0,0,obj_uiListboxScroll)){} 
                        }
                        zui_create(0,0,obj_uiExitButton,-1);
                    }
                }
            }
            else
                ui_show_popup("No Maps Found");
        }
        else if(bID == 14){ //random 50
            with (obj_uiListbox){
                var t = 0;
                if(length < 50)
                    ui_show_popup("You need at least 50 fighters#to use this option.");
                else{
                    for (i = 0;i < length; i++)
                        selected[i] = 1;
                        
                    while(t < 50){
                        var w = irandom(length-1);
                        if(selected[w] == 1)
                        {
                            t++
                            selected[w] = 0;
                        }
                    }
                }
            }      
        }
        else if(bID == 15){ //random 100
            with (obj_uiListbox){
                var t = 0;
                if(length < 100)
                    ui_show_popup("You need at least 100 fighters#to use this option.");
                else{
                    for (i = 0;i < length; i++)
                        selected[i] = 1;
                        
                    while(t < 100){
                        var w = irandom(length-1);
                        if(selected[w] == 1)
                        {
                            t++
                            selected[w] = 0;
                        }
                    }
                }
            }      
        }
        else if(bID == 16){ //random 250
            with (obj_uiListbox){
                var t = 0;
                if(length < 250)
                    ui_show_popup("You need at least 250 fighters#to use this option.");
                else{
                    for (i = 0;i < length; i++)
                        selected[i] = 1;
                        
                    while(t < 250){
                        var w = irandom(length-1);
                        if(selected[w] == 1)
                        {
                            t++
                            selected[w] = 0;
                        }
                    }
                }
            }      
        }
    }
}
with (obj_uiWindow)
{
    if (argument0 == id)
    {
    if(wID == "Selected Character")
    {
        //CHARACTER SELECTION
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        if (global.IDselected == -1)
        {
            draw_sprite_stretched(spr_defaultFighterImage,0,5,29,64,64);
            draw_text(73,29,"NO FIGHTER SELECTED");
            draw_text(73,44,"Gender:");
            draw_text(73,59,"STR: ");
            draw_text(133,59,"AGI: ");
            draw_text(193,59,"END: ");
            draw_text(103,74,"SKL: ");
            draw_text(163,74,"LCK: ");
        }
        else
        {
            ini_open(global.fNAME[global.IDselected]);
            if (ini_read_real("character","gender",0))
                var gen = "Female";
            else
                var gen = "Male";
            draw_sprite_stretched(global.cIMAGES[global.IDselected],0,5,29,64,64);
            draw_text(73,29,global.cNAME[global.IDselected]);
            draw_text(73,44,"Gender: " + gen);
            draw_text(73,59,"STR: "+string_format(ini_read_real("character","strength",5),2,0));
            draw_text(133,59,"AGI: "+string_format(ini_read_real("character","agility",5),2,0));
            draw_text(193,59,"END: "+string_format(ini_read_real("character","endurance",5),2,0));
            draw_text(103,74,"SKL: "+string_format(ini_read_real("character","skill",5),2,0));
            draw_text(163,74,"LCK: "+string_format(ini_read_real("character","luck",5),2,0));
            ini_close();
            
        }
    }
    if(wID == "Map Window")
    {
        if(!surface_exists(global.mapsurf))
            obj_fighterSelect.regen = 1;
        else
            draw_surface_stretched(global.mapsurf,0,24,HS*(512/720),HS*(512/720));
    }
    }
}

with (obj_uiListbox)
{
    if (argument0 == id )
    {
        if(sID != -1)
        {
            global.IDselected = sID;
        }
    }
}

with (obj_uiLabel)
{
    if (argument0 == id)
    {
        if (lID == "fightercount")
        {
            caption = "Fighter Count: " + string(global.fighters) + " / " + string(fcount);
        }
        else if (lID == "seed")
        {
            caption = "Seed: " +  string(random_get_seed());
        }
        else if (lID == "gamespeed")
        {
            caption = string(floor(60/global.SAVE_SPEED*10)) + "X SPEED";
        }
    }
}
