///arena_ui(id)
var WS = global.WSCALE;
var HS = global.HSCALE;

with (objUIButton)
{
    if (argument0 == id)
    {
        if (bID == 0)
        {
            if(global.GAME_SPEED != 0)
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
                    zui_create(0,0,oUIExitButton);
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
                with(zui_create(445,348,objUIWindow,-1))
                {
                    if (global.GAMETYPE == 0)
        {
        wID = "Sandbox";
        callback = arena_ui;
        zui_set_size(140,524);
        with(zui_create(0,0,objUIWindowCaption))
        {
            caption = "Sandbox";
            draggable = 1;
        }
        with(zui_create(70,151,oUIImageButton,-1))
        {
            zui_set_size(90,90);
            image = sSandboxButton;
            callback = arena_ui;
            bID = 11;
        }
        with(zui_create(70,289,oUIImageButton,-1))
        {
            zui_set_size(90,90);
            image = sSandboxButton;
            callback = arena_ui;
            bID = 12;
        }
        with(zui_create(70,429,oUIImageButton,-1))
        {
            zui_set_size(90,90);
            image = sSandboxButton;
            callback = arena_ui;
            bID = 13;
        }
        }
        else if (global.GAMETYPE == 1)
        {
        wID = "Sponsor Menu";
        callback = arena_ui;
        zui_set_size(140,524);
        with(zui_create(0,0,objUIWindowCaption))
        {
            caption = "Sponsor";
            draggable = 1;
        }
        }
        zui_create(0,0,oUIExitButton);
                }
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
        if (bID == 10)
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
        if (bID == 11)
        {
            if (!instance_exists(oPlaceItem))
            {
                var e = instance_create(0,0,oPlaceItem);
                e.image = sItems;
            }
        }
        if (bID == 12)
        {
            if (!instance_exists(oPlaceItem))
            {
                var e = instance_create(0,0,oPlaceItem);
                e.image = sMine;
            }
        }
        if (bID == 13)
        {
            if (!instance_exists(oArenaEvent))
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

        draw_surface_stretched(oGraphicsController.map,0,24,HS*.8,HS*.8);
        
    }

    if(wID == "Stats")
    {

        draw_surface_ext(oSideMenu.sidemenu,20,24,1,1,0,c_white,1);
        
    }
    if(wID == "Updates")
    {
        draw_surface_part(global.surf_updates,0,0,390,HS*.8 - 75,0,24);
        
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
        if(instance_exists(xID.fID))
        {
            
                xID.left = xID.fID.x;
                
            
                xID.top = xID.fID.y;
            
            
            //xID.top = xID.fID.y - 75 - (500 - (other.fID.y - 75));
            //draw_sprite(sStatusCheck,0,153,75);
            draw_statbars(xID.fID.HP,xID.fID.HUNGER,xID.fID.THIRST,xID.fID.SANITY,0);
            //draw_statbars(50,50,50,50);

            
        
            
        }
        else
        {
            draw_statbars(0,0,0,0,1);
        }
        
        draw_sprite_stretched(global.IMAGES[fighter],0,155,74,58,58);
    
        
        //draw_surface_part(oGraphicsController.map,fID.x - 50,fID.y-50,100,100,0,24);
        
    }
    }
}
