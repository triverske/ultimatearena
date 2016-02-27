///fighter_select_buttons(id)

var WS = global.WSCALE;
var HS = global.HSCALE;

with (objUIButton)
{
    if (argument0 == id)
    {
        if (bID == 0) //return to title
        {
            c = instance_create(0,0,oRoomTransition);
            c.gotoroom = rm_title;
        }
        else if (bID == 1) //regen map
        {
            oCharselect.regen = 1;
        }
        else if (bID == 2) //tag
        {
            if(global.TAG_COUNT > 0)
            {
            with (zui_main()) 
            {
                with(zui_create(445,348,objUIWindow,-1))
                {
                    wID = "Search By Tag";
                    //callback = fighter_select_buttons;
                    zui_set_size(160,224);
                    with(zui_create(0,0,objUIWindowCaption))
                    {
                        caption = "Search By Tag";
                        draggable = 1;
                    }
                    with(zui_create(0,24,oUIListBox))
                    {
                        zui_set_anchor(0,0);
                        zui_set_size(160,200);
                        callback = tag_ui;
                        initialize_listbox(global.TAGS);
                
    
                        with(zui_create(0,0,oUIListBoxScroll))
                        {
        
                        } 
                    }
                    zui_create(0,0,oUIExitButton,-1);
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
            oCharselect.startgame = 1;
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
            
        }
    }
}
with (objUIWindow)
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
            draw_sprite_stretched(sFighterImage,0,5,29,64,64);
            draw_text(73,29,"NO FIGHTER SELECTED");
            draw_text(73,44,"GENDER:");
        }
        else
        {
            ini_open(working_directory + "characters\" + global.fNAME[global.IDselected]);
            if (ini_read_real("character","gender",0))
                gen = "Female";
            else
                gen = "Male";
            draw_sprite_stretched(global.cIMAGES[global.IDselected],0,5,29,64,64);
            draw_text(73,29,global.cNAME[global.IDselected]);
            draw_text(73,44,"Gender: " + gen);
            ini_close();
            
        }
    }
    if(wID == "Map Window")
    {
        if(!surface_exists(global.mapsurf))
            oCharselect.regen = 1;
        else
            draw_surface_stretched(global.mapsurf,0,24,HS*(512/720),HS*(512/720));
    }
    }
}

with (oUIListBox)
{
    if (argument0 == id )
    {
        if (selected[argument0.sID] == 0)
        {
            selected[argument0.sID] = 1;
            global.IDselected = argument0.sID;
        }
        else
        {
            selected[argument0.sID] = 0;
            global.IDselected = argument0.sID;
        }
    }
}

with (objUILabel)
{
    if (argument0 == id)
    {
        if (lID == "fightercount")
        {
            caption = "Fighter Count: " + string(global.fighters) + " / " + string(fcount);
        }
    }
}
