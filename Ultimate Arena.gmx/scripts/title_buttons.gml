///title_buttons(id)

with (obj_uiButton)
{
    if (argument0 == id)
    {
        if (bID == 0) // Quick Game
        {
            if(global.lNAME < 4)
            {
                ui_show_popup("You don't have enough fighters#for a quick match.");
            }
            else
            {  
                var c = instance_create(0,0,obj_roomTransition);
                c.gotoroom = rm_charselect;
                global.GAMETYPE = 0;
                global.ENDLESS = 0;
            }
        }
        else if (bID == 1) // Edit Characters
        {
            if(window_get_fullscreen())
            {
                ui_show_popup("The editors are not available#in fullscreen mode.");
            }
            else
            {
                var c = instance_create(0,0,obj_roomTransition);
                c.gotoroom = rm_charedit;
                global.GAMETYPE = 0;
            }
        }
        else if (bID == 2)//Fullscreen
        {
            ini_open("settings.ini")
        
            if window_get_fullscreen()
            {
                window_set_fullscreen(false);
                ini_write_real("settings","fullscreen",0);
            }
            else
            {
                window_set_fullscreen(true);
                ini_write_real("settings","fullscreen",1);
            }
                
            ini_close();

            
            with(obj_setup)
                event_user(1);
        }
        else if (bID == 3)//Exit Game
        {
            game_end();
        }
        else if (bID == 4)//Editors
        {
            ui_show_popup_editors();
        }
        else if (bID == 5)//Settings
        {
            create_window_settings();
        }
        else if (bID == 7) // Edit Events
        {
            if(window_get_fullscreen())
            {
                ui_show_popup("The editors are not available#in fullscreen mode.");
            }
            else
            {
                var c = instance_create(0,0,obj_roomTransition);
                c.gotoroom = rm_eventedit;
                global.GAMETYPE = 0;
            }
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
            if (global.lNAME < 4)
            {
                ui_show_popup("You don't have enough fighters#for endless arena.");
            }
            else
            {  
                var c = instance_create(0,0,obj_roomTransition);
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
        else if(bID == 15)//Map Editor
        {
            if(window_get_fullscreen())
            {
                ui_show_popup("The editors are not available#in fullscreen mode.");
            }
            else
            {
                var c = instance_create(0,0,obj_roomTransition);
                c.gotoroom = rm_mapedit;
                global.GAMETYPE = 0;
            }
        }
        else if(bID == 16)//Update Editor
        {
            if(window_get_fullscreen())
            {
                ui_show_popup("The editors are not available#in fullscreen mode.");
            }
            else
            {
                var c = instance_create(0,0,obj_roomTransition);
                c.gotoroom = rm_textedit;
                global.GAMETYPE = 0;
            }
        }
        else if (bID == 17)
        {

        }
        else if (bID == 18)//Discord
        {
            url_open("http://discord.gg/Q8xTZFp");
        }
        else if (bID == 19)//Twitch
        {
            url_open("http://twitch.tv/triverske");
        }
        else if(bID == 20)//Steam Workshop
        {
            var c = instance_create(0,0,obj_roomTransition);
            c.gotoroom = rm_workshop;
            global.GAMETYPE = 0;  
        }
        else if (bID == 21)
        {
            
        }
        else if(bID == 22)//Defend Your Arena
        {
            var c = instance_create(0,0,obj_roomTransition);
            c.gotoroom = rm_dyaCharselect;
            global.GAMETYPE = 2;  
        }
        else if(bID == 23)//Steam Workshop
        {
            steam_activate_overlay_browser("https://steamcommunity.com/workshop/browse/?appid=385240");
        }
    }
}

