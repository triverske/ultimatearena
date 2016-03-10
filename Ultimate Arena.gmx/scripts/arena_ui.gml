///arena_ui(id)

//Controls the UI for most of the arena-related things

var WS = global.WSCALE;
var HS = global.HSCALE;

with (objUIButton)
{
    if (argument0 == id)
    {
        if (bID == 0)
        {
            if(global.GAME_SPEED != 0 && global.GAME_SPEED < 20)
                global.GAME_SPEED++;
        }
        if (bID == 1)
        {
            if (global.GAME_SPEED == 0)
            {
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
        }
        if (bID == 4)
        {
            with(objUIWindow)
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
            with(objUIWindow)
            {
                if(wID == "Stats")
                    zui_destroy();
            }
            with (zui_main()) 
            {
                with(zui_create(445,348,objUIWindow,-1)) 
                {
                    wID = "Stats";
                    callback = arena_ui;
                    zui_set_size(140,524);
                    with(zui_create(0,0,objUIWindowCaption))
                    {
                        caption = "Stats";
                        draggable = 1;
                    }
                    zui_create(0,0,oUIExitButton,-1);
                }
            }
        }
        if (bID == 6)
        {
            with(objUIWindow)
            {
                if(wID == "Sponsor Menu" || wID == "Sandbox")
                    zui_destroy();
            }
            with (zui_main()) 
            {
                
            }
        }
        if (bID == 7)
        {
            with(objUIWindow)
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
            with(objUIWindow)
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
            with(oGraphicsController)
                showGroups = !showGroups;
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
            if (!instance_exists(oPlaceItem))
            {
                var e = instance_create(0,0,oPlaceItem);
                e.image = sItems;
            }
        }
        if (bID == 82)
        {
            if (!instance_exists(oPlaceItem))
            {
                var e = instance_create(0,0,oPlaceItem);
                e.image = sMine;
            }
        }
        if (bID == 83)
        {
            if (!instance_exists(oArenaEvent))
                if(global.arena_events)
                    oGraphicsController.event_timer = 1;
        }
        
        
    }
}
with (objUIWindow)
{
    if (argument0 == id)
    {
        if(wID == "Map")
        {
    
            draw_surface_stretched(oGraphicsController.map,0,24,HS*(512/720),HS*(512/720));
            
        }
    
        if(wID == "Stats")
        {
    
            draw_surface_ext(oSideMenu.sidemenu,20,24,1,1,0,c_white,1);
            
        }
        if(wID == "Updates")
        {
            draw_surface_part(global.surf_updates,0,0,390,HS*(512/720) - 75,0,24);
            
        }
        if(wID == "Sponsor Menu")
        {
    
            draw_surface_ext(oSponsorMenu.sponsormenu,0,24,1,1,0,c_white,1);
            
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
