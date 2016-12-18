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
                var c = instance_create(0,0,oRoomTransition);
                c.gotoroom = rm_charselect;
                global.GAMETYPE = 0;
                global.ENDLESS = 0;
            }
        }
        else if (bID == 1) // Edit Characters
        {
            var c = instance_create(0,0,oRoomTransition);
            c.gotoroom = rm_charedit;
            global.GAMETYPE = 0;
        }
        else if (bID == 2)//Fullscreen
        {
            if window_get_fullscreen()
            {
                window_set_fullscreen(false);
                display_set_gui_size(1280,720);
                room_restart();
            }
            else
            {
                window_set_fullscreen(true);
                display_set_gui_size(SW,SH);
                room_restart();
            }
        }
        else if (bID == 3)//Exit Game
        {
            game_end();
        }
        else if (bID == 4)//Twitch
        {
            if(global.fighters > 60)
            {
                var c = instance_create(0,0,oRoomTransition);
                c.gotoroom = rm_twitchCharselect;
                global.GAMETYPE = 1;
            }
            else
            {
                ui_show_popup("You need at least 60 fighters#to do a Twitch match.");
            }
        }
        else if (bID == 5)//Settings
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
                        /* No one used VSYNC anyway
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
                        */
                        with (zui_create(5, __height - 70, objUIButton)) 
                        {
                            zui_set_anchor(0,0);
                            zui_set_size(230, 30);
                            caption = "Toggle Fullscreen";
                            callback = title_buttons;
                            bID = 2;
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
        else if (bID == 6) //Load Game
        {
            if(!directory_exists("saves"))
                directory_create("saves");
            var file = get_open_filename_ext("ini file|*.ini","",working_directory+"saves","Load Game");
            if(file != "")
                load_game(file);
        }
        else if (bID == 7) // Edit Events
        {
            var c = instance_create(0,0,oRoomTransition);
            c.gotoroom = rm_eventedit;
            global.GAMETYPE = 0;
        }
        else if (bID == 9)//Credits
        {
            ui_show_popup_credits();     
            global.CREDITS = 1;
        }
        else if (bID == 10)//VSYNC
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
        else if (bID == 11)//Github
        {
            url_open("https://github.com/triverske/ultimatearena");
            global.GITHUB = 1;
        }
        else if (bID == 12) // Endless Arena
        {
            if (global.lNAME < 2)
            {
                ui_show_popup("You don't have enough fighters#for endless arena.");
            }
            else
            {  
                var c = instance_create(0,0,oRoomTransition);
                c.gotoroom = rm_charselect;
                global.GAMETYPE = 0;
                global.ENDLESS = 1;
            }
        }
        else if (bID == 13)//Facebook
        {
            url_open("https://www.facebook.com/Triverske/");
            global.FACEBOOK = 1;
        }
        else if (bID == 14)//Twitter
        {
            url_open("https://www.twitter.com/triverske/");
            global.TWITTER = 1;
        }
        else if(bID == 15){//Map Editor
            var c = instance_create(0,0,oRoomTransition);
            c.gotoroom = rm_mapedit;
            global.GAMETYPE = 0;
        }
        else if(bID == 16){//Update Editor
            var c = instance_create(0,0,oRoomTransition);
            c.gotoroom = rm_textedit;
            global.GAMETYPE = 0;
        }
    }
}

