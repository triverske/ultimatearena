
with(obj_uiListbox)
{
    if(argument0 == id)
    {
        if(listID == 0)
        {
            if(global.cTYPE[sID] != 0)
            {
                ui_show_popup("Fighter must be user-created#and not from the Workshop.");
            }
            else
            {
                if(global.IDselected == sID)
                    global.IDselected = -1;
                else
                    global.IDselected = sID;
            }
        }
    }
}

with(obj_uiLabel)
{
    if(lID == 1)
    {
        if(global.IDselected != -1)
            caption = "Fighter: " + global.cNAME[global.IDselected];
        else
            caption = "";
    }
}

with(obj_uiButton)
{
    if(argument0 == id)
    {
        if(bID == 0)//Go Back
        {
            c = instance_create(0,0,obj_roomTransition);
            c.gotoroom = rm_title;
        }
        if(bID == 1) //view workshop page
        {
            steam_activate_overlay_browser("https://steamcommunity.com/sharedfiles/filedetails/?id=" + workshopID);
        }
        else if(bID == 2) //update item
        {
            with(zui_main())
            {
                with(zui_create(0, 0, obj_uiWindow))
                {
                    zui_set_anchor(0, 0);
                    zui_set_size(260, window_get_height());
                    zui_set_position(window_get_width()-260, 0);
                    wID = "Fighter List";
                    with(zui_create(0, 0, obj_uiWindowCaption))
                        caption = "Update From Fighter";
                    with(zui_create(0, 24, obj_uiListbox))
                    {
                        zui_set_anchor(0, 0);
                        zui_set_size(260, window_get_height());
                        callback = workshop_ui;
                        listID = 0;
                        initialize_listbox(global.cNAME);
                        with(zui_create(0, 0, obj_uiListboxScroll)){}
                    }
                }
            }
        }
        else if(bID == 3) //submit update
        {
            global.charname = global.cNAME[global.IDselected]
            with(obj_setup)
                event_user(0);
                
            with(obj_workshop)
                alarm[1] = 600;
                
            with (obj_uiMain) 
            {
                var _black = zui_create(0, 0, obj_uiBlack, -1000);
                with (zui_create(__width * 0.5, __height * 0.5, obj_uiWindow, -1001)) 
                {
                    zui_set_size(256, 112);   
                    black = _black;
                    with (zui_create(zui_get_width() * 0.5, zui_get_height() * 0.5 - 8, obj_uiLabel))
                        caption = "Submitting Fighter Update";
                }
            }
        }
        else if(bID == 4)
        {
            with(obj_setup)
            {
                var app_id = steam_get_app_id(); 
                new_item = steam_ugc_create_item(app_id, ugc_filetype_community);
            }
        }
    }
}
