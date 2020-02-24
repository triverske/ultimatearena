///arena_ui(id)

//Controls the UI for most of the arena-related things

var WS = global.WSCALE;
var HS = global.HSCALE;

with (obj_uiButton)
{
    if (argument0 == id)
    {
        if (bID == 0)
        {
            if(global.extraFrames > 0)
                global.extraFrames--;
            else if(global.GAME_SPEED != 0 && global.GAME_SPEED < 40)
                global.GAME_SPEED++;
        }
        if (bID == 1)
        {
            if (global.GAME_SPEED == 0)
            {
                if(global.SAVE_SPEED < 1)
                    global.SAVE_SPEED = 12;
                global.GAME_SPEED = global.SAVE_SPEED;
            }
        }
        if (bID == 2)
        {
            if (global.GAME_SPEED != 0)
            {
                global.SAVE_SPEED = global.GAME_SPEED;
                global.GAME_SPEED = 0;
            }
        }
        if (bID == 3)
        {
            if (global.GAME_SPEED != 0 && global.GAME_SPEED > 1)
                global.GAME_SPEED--;
            else if(global.GAME_SPEED == 1)
            {
                if(global.extraFrames < 3)
                    global.extraFrames++;
            }
        }
        if (bID == 4)
        {
            with(obj_uiWindow)
            {
                if(wID == "Map")
                    zui_destroy();
            }
            with (zui_main()) 
            {
                create_window_map();
            }
        }
        if (bID == 5)
        {
            with(obj_uiWindow)
            {
                if(wID == "Stats")
                    zui_destroy();
            }
            with (zui_main()) 
            {
                with(zui_create(445,348,obj_uiWindow,-1)) 
                {
                    wID = "Stats";
                    callback = arena_ui;
                    zui_set_size(140,524);
                    with(zui_create(0,0,obj_uiWindowCaption))
                    {
                        caption = "Stats";
                        draggable = 1;
                    }
                    zui_create(0,0,obj_uiExitButton,-1);
                }
            }
        }
        if (bID == 6)
        {
            with(obj_uiWindow)
            {
                if(wID == "Sponsor Menu" || wID == "Sandbox")
                    zui_destroy();
            }
            with (zui_main()) 
            {
                create_window_sandbox();
            }
        }
        if (bID == 7)
        {
            with(obj_uiWindow)
            {
                if(wID == "Fighter List")
                    zui_destroy();
            }
            with (zui_main()) 
            {
                create_window_fighterlist();
            }
       
        
        }
        if (bID == 8)
        {
            with(obj_uiWindow)
            {
                if(wID == "Updates")
                    zui_destroy();
            }
            with (zui_main()) 
            {
                 create_window_updates();
            }
        }
        if (bID == 9)
        {
            with(obj_arenaController)
                showGroups = !showGroups;
        }
        if (bID == 10)
        {
            with(obj_uiWindow)
            {
                if(wID == "Shrinking Arena")
                    zui_destroy();
            }
            with (zui_main()) 
            {
                 create_window_arenashrink();
            }
        }
        if(bID == 11) //Newspaper
        {
            with(obj_uiWindow)
            {
                if(wID == "Ultimate News")
                    zui_destroy();
            }
            with (zui_main()) 
            {
                 create_window_newspaper();
            }
        }
        if (bID == 12)
        {
            with(obj_uiWindow)
            {
                if(wID == "3D Map")
                    zui_destroy();
            }
            with (zui_main()) 
            {
                create_window_3dmap();
            }
        }
        if(bID == 65)
        {
            with(obj_fighter)
                cameraFollow = 0;
            with(obj_mapcamera)
            {
                followRandom = false;
                followFighter = noone;
                followFighterId = -1;
                cx = 256;
                cy = 256;
                cz = buffer_get_height(obj_maptest.hBuff,cx,cy) * 128 / 255;
            }
            
        }
        if(bID == 66)
        {
            with(obj_fighter)
                cameraFollow = 0;
            with(obj_mapcamera)
            {
                followCPU = false;
                followRandom = true;
                followFighter = noone;
                followFighterId = -1;
            }
            
        }
        if(bID == 67)
        {
            with(obj_fighter)
                cameraFollow = 0;
            with(obj_mapcamera)
            {
                followCPU = true;
                followRandom = true;
                followFighter = noone;
                followFighterId = -1;
            }
            
        }
        if (bID == 70)
        {
            if (type == 2)
            {
                type = 3;
                global.arenaShrink = 1;
                caption = "Shrinking Arena On";
            }
            else
            {
                type = 2;
                global.arenaShrink = 0;
                caption = "Shrinking Arena Off";
            }
        }
        if (bID == 71)
        {
            with(obj_arenaShrink)
                radius = 300;
        }
        if (bID == 79)
        {
            if (type == 2)
            {
                type = 3;
                global.otherUpdates = 1;
                caption = "Other Updates On";
            }
            else
            {
                type = 2;
                global.otherUpdates = 0;
                caption = "Other Updates Off";
            }
        }
        if (bID == 80)
        {
            if (type == 2)
            {
                type = 3;
                global.deadUpdates = 1;
                caption = "Death Updates On";
            }
            else
            {
                type = 2;
                global.deadUpdates = 0;
                caption = "Death Updates Off";
            }
        }
        if (bID == 81)
        {
            if (!instance_exists(obj_placeItem))
            {
                var e = instance_create(0,0,obj_placeItem);
                e.image = spr_itemBag;
            }
        }
        if (bID == 82)
        {
            if (!instance_exists(obj_placeItem))
            {
                var e = instance_create(0,0,obj_placeItem);
                e.image = spr_landmine;
            }
        }
        if (bID == 83)
        {
            with (zui_main()) 
            {
                with(zui_create(445,348,obj_uiWindow,-1)) 
                {
                    wID = "Event List";
                    zui_set_size(260,420);/*
                    with (zui_create(0, 0, obj_uiWindowCaption)) 
                    {
                        caption = "Event List";
                        draggable = 1;
                    }*/
                    zui_create(0,0,obj_uiExitButton,-1);
                    with(zui_create(0,24,obj_uiListbox))
                    {
                        //draw_callback = tag_draw_ui;
                        callback = evselect_ui;
                        zui_set_anchor(0,0);
                        zui_set_size(260,356);
                        type = 0;

                        initialize_listbox(global.eNAME,0,array_length_1d(global.eNAME)-1);
                        other.listID = id;
                        with(zui_create(0,0,obj_uiListboxScroll)){} 
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
        if(wID == "Map")
        {
            draw_surface_stretched(obj_arenaController.map,0,24,HS*(512/720),HS*(512/720));
        }
        
        if(wID == "3D Map")
        {
            draw_surface_stretched(obj_mapcamera.testSurf,0,24,HS*(512/720),HS*(512/720));
            draw_set_font(font0);
            
            if(instance_exists(obj_arenaEvent))
            {
                var fl = floor(HS*(512/720)) + 24
                
                draw_set_alpha(.6)
                draw_rectangle_colour(0,fl-24,HS*(512/720),fl,c_red,c_red,c_maroon,c_maroon,0);
                draw_set_alpha(1);
                draw_set_halign(fa_middle);
                draw_set_valign(fa_bottom);
                draw_text_colour((HS*(512/720))/2,fl-4,"Arena Event! " + obj_arenaEvent.description,c_white,c_white,c_silver,c_silver,1);
                
                with(obj_mapcamera)
                {
                    if(followFighterId != -1)
                    {
                        
                        fl -= 5;
                    
                        var caption = "Following: " + global.NAMES[followFighterId] + "#";
                        texture_set_interpolation(1);
                        draw_sprite_stretched(global.IMAGES[followFighterId],0,5,fl-89,64,64);
                        texture_set_interpolation(0);
                        if(instance_exists(followFighter))
                            caption += followFighter.caption;
                        else
                            caption += global.deathCause[followFighterId];
                        draw_set_valign(fa_bottom);
                        draw_set_halign(fa_left);
                        draw_set_color(c_black);
                        draw_text(74,fl-25,caption);
                        draw_text(74,fl-27,caption);
                        draw_text(73,fl-26,caption);
                        draw_text(75,fl-26,caption);
                        draw_set_color(c_white);
                        draw_text(74,fl-26,caption);
                    }
                }
            }
            else
            {
                with(obj_mapcamera)
                {
                    if(followFighterId != -1)
                    {
                        
                        var fl = floor(HS*(512/720)) + 24
                    
                        var caption = "Following: " + global.NAMES[followFighterId] + "#";
                        texture_set_interpolation(1);
                        draw_sprite_stretched(global.IMAGES[followFighterId],0,5,fl-69,64,64);
                        texture_set_interpolation(0);
                        if(instance_exists(followFighter))
                            caption += followFighter.caption;
                        else
                            caption += global.deathCause[followFighterId];
                        draw_set_valign(fa_bottom);
                        draw_set_halign(fa_left);
                        draw_set_color(c_black);
                        draw_text(74,fl-5,caption);
                        draw_text(74,fl-7,caption);
                        draw_text(73,fl-6,caption);
                        draw_text(75,fl-6,caption);
                        draw_set_color(c_white);
                        draw_text(74,fl-6,caption);
                    }
                }
            }
        }
        
        if(wID == "Ultimate News")
        {
            var px = __x - 300;
            var py = __y - 276;
            
            
            draw_surface_stretched(obj_arenaController.news,0,24,600,600);
            draw_sprite(spr_cameraButton,1,0,24);
            
            if(mouse_check_button_pressed(mb_left))
            {
                show_debug_message(string(px) + ", " + string(py) + " - " + string(mouse_x) + ", " + string(mouse_y));
                //Screenshot News
                if(point_in_rectangle(mouse_x,mouse_y,px,py,px+14,py+14))
                {
                    var file = get_save_filename("Screenshot|*.png", "pic.png");
                    if(file != "")
                    {
                        surface_save(obj_arenaController.news,file);
                    }
                }
            }
        }
    
        if(wID == "Stats")
        {
    
            draw_surface_ext(obj_sideMenu.sidemenu,20,24,1,1,0,c_white,1);
            
        }
        if(wID == "Updates")
        {
            draw_surface_part(global.surf_updates,0,0,390,HS*(512/720) - 75,0,24);
            
        }
        if(wID == "Sandbox")
        {
            draw_set_valign(fa_top);
            draw_text(70,77,"Care Package");
            draw_text(70,215,"Land Mine");
            draw_text(70,355,"Begin Event");
        }
        if(wID == "FIGHTER")
        {
            if(instance_exists(xID.fID) && xID.fID != -1)
            {   
                xID.left = xID.fID.x;
                xID.top = xID.fID.y;
                draw_statbars(xID.fID.HP,xID.fID.HUNGER,xID.fID.THIRST,xID.fID.SANITY,0);   
            }
            else
            {
                draw_statbars(0,0,0,0,1);
            }
        }
    }
}

with(obj_uiSlider)
{
    if(argument0 == id)
    {
        if(slID == 1) //Shrink Ticks
        {
            with(obj_arenaShrink)
                ticksUntilShrink = 301-round(300*argument1);
        }
    }
}
