///title_buttons(id)

with (objUIButton)
{
    if (argument0 == id)
    {
        if (bID == 0) // Quick Game
        {
            if (global.lNAME < 2)
            {
                ui_show_popup("You don't have enough fighters#for a quick match.");
            }
            else
            {  
                c = instance_create(0,0,oRoomTransition);
                c.gotoroom = rm_charselect;
                global.GAMETYPE = 0;
                global.ENDLESS = 0;
            }
        }
        else if (bID == 1) // Edit Characters
        {
            c = instance_create(0,0,oRoomTransition);
            c.gotoroom = rm_charedit;
            global.GAMETYPE = 0;
        }
        else if (bID == 2)
        {
            if window_get_fullscreen()
            {
                window_set_fullscreen(false);
                display_set_gui_size(1280,720);
                room_goto(rm_fullscreen);
            }
            else
            {
                window_set_fullscreen(true);
                display_set_gui_size(SW,SH);
                room_goto(rm_fullscreen);
            }
        }
        else if (bID == 3)
        {
            game_end();
        }
        else if (bID == 4)
        {
            c = instance_create(0,0,oRoomTransition);
            c.gotoroom = rm_twitchCharselect;
            global.GAMETYPE = 1;
            //ui_show_popup("This mode has been disabled#in the current build.");
        }
        else if (bID == 5) 
        {
            with (zui_main()) 
            {
                
                if (!instance_exists(objUIWindow))
                {
                with (zui_create(zui_get_width() * 0.5, zui_get_height() * 0.5, objUIWindow, -1)) 
                    {
                        zui_set_size(240, 100);
                        zui_create(0,0,oUIExitButton,-5);
                        callback = title_buttons;
                        wID = "Settings";
            
                        with (zui_create(5, __height - 35, objUIButton)) 
                        {
                        zui_set_anchor(0,0);
                        zui_set_size(230, 30);
                        caption = "View Credits";
                        callback = title_buttons;
                        bID = 9;
                        }
                        with (zui_create(5, __height - 70, objUIButton)) 
                        {
                        zui_set_anchor(0,0);
                        zui_set_size(230, 30);
                        if (global.vsync == 0)
                        {
                            caption = "VSYNC Off";
                            type = 2
                        }
                        else
                        {
                            caption = "VSYNC On";
                            type = 3;
                        }
                        callback = title_buttons;
                        bID = 10;
                        }

                        with (zui_create(0, 0, objUIWindowCaption)) 
                        {
                            caption = "Settings";
                            draggable = 1;
                        }
                    }
                }
            }
        }
        else if (bID == 7)
        {
            //var file;
            //file = get_open_filename_ext("*.ini", "",global.path, "Open character file");
            //ini_open(file);
            //name = ini_read_string("character","name","NAMING ERROR");
            
        }
        else if (bID == 8)
        {
            ini_open(working_directory + "characters\" + name + ".ini");
            ini_write_string("character","name",name);
            ini_close();
            
            
        }
        else if (bID == 9)
        {
            ui_show_popup("Ultimate Arena - Copyright 2015#Developed by House Bonneau & Triverske#Programmers: Troy Bonneau, Matt Mozingo");
            
            
        }
        else if (bID == 10)
        {
            
            
            if (type == 2)
            {
                type = 3;
                display_reset(0, 1);
                global.vsync = 1;
                ini_open("settings.ini")
                ini_write_real("settings","vsync",global.vsync);
                ini_close();
                caption = "VSYNC On";
            }
            else
            {
                type = 2;
                display_reset(0, 0);
                global.vsync = 0;
                ini_open("settings.ini")
                ini_write_real("settings","vsync",global.vsync);
                ini_close();
                caption = "VSYNC Off";
            }
            
            
        }
        else if (bID == 11)
        {
            url_open("http://steamcommunity.com/sharedfiles/filedetails/?id=434032565");
            
        }
        if (bID == 12) // Endless Arena
        {
            if (global.lNAME < 2)
            {
                ui_show_popup("You don't have enough fighters#for endless arena.");
            }
            else
            {  
                c = instance_create(0,0,oRoomTransition);
                c.gotoroom = rm_charselect;
                global.GAMETYPE = 0;
                global.ENDLESS = 1;
            }
        }
    }
}

with (objUIWindow)
{
    if (argument0 == id)
    {
        if(wID == "Fighter Create") 
        {
        name = keyboard_string;
        draw_text(4,40,name);
        
        
        }
    }
}
