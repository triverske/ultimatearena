with (zui_main()) 
{
    if (!instance_exists(obj_uiWindow))
    {
                with (zui_create(zui_get_width() * 0.5, zui_get_height() * 0.5, obj_uiWindow, -1)) 
                    {
                        zui_set_size(240, 200);
                        zui_create(0,0,obj_uiExitButton,-5);
                        callback = title_buttons;
                        wID = "Settings";
                        tooltip = "Opens the settings menu";
            
                        with (zui_create(5, __height - 135, obj_uiButton)) 
                        {
                            zui_set_anchor(0,0);
                            zui_set_size(230, 30);
                            caption = "View Credits";
                            callback = title_buttons;
                            bID = 9;
                        }
                        /* No one used VSYNC anyway
                        with (zui_create(5, __height - 70, obj_uiButton)) 
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
                        with (zui_create(5, __height - 170, obj_uiButton)) 
                        {
                            zui_set_anchor(0,0);
                            zui_set_size(230, 30);
                            caption = "Toggle Fullscreen";
                            callback = title_buttons;
                            bID = 2;
                            tooltip = "Switches between windowed and fullscreen mode";
                        }    
                        
                        with(zui_create(120,__height - 30, obj_uiLabel))
                        {
                            zui_set_anchor(.5,.5);
                            color = c_white;
                            caption = "NOTE: Hold TAB to move window#while in windowed mode.";
                            valign = fa_middle;
                            halign = fa_center;
                        }


                        with (zui_create(0, 0, obj_uiWindowCaption)) 
                        {
                            caption = "Settings";
                            draggable = 1;
                        }
                    }
                }
            }
