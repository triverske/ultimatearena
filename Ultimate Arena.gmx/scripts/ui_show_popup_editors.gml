///ui_show_popup(caption)

with(obj_uiMain) 
{
    var _black = zui_create(0, 0, obj_uiBlack, -1000);
    
    with (zui_create(__width * 0.5, __height * 0.5, obj_uiWindow, -1001)) 
    {
        zui_set_size(500, 300);
        
        black = _black;
        
        with (zui_create(0, 0, obj_uiWindowCaption)) 
        caption = "Editors List";

        with (zui_create(zui_get_width() * 0.5, zui_get_height() - 250, obj_uiButton)) 
        {
            zui_set_size(250, 28);
            caption = "Fighter Editor";
            bID = 1;
            callback = title_buttons;
        }
        with (zui_create(zui_get_width() * 0.5, zui_get_height() - 210, obj_uiButton)) 
        {
            zui_set_size(250, 28);
            caption = "Map Editor";
            bID = 15;
            callback = title_buttons;
        }
        with (zui_create(zui_get_width() * 0.5, zui_get_height() - 170, obj_uiButton)) 
        {
            zui_set_size(250, 28);
            caption = "Event Editor";
            bID = 7;
            callback = title_buttons;
        }
        with (zui_create(zui_get_width() * 0.5, zui_get_height() - 130, obj_uiButton)) 
        {
            zui_set_size(250, 28);
            caption = "Text Editor";
            bID = 16;
            callback = title_buttons;
        }
        
        with (zui_create(zui_get_width() * 0.5, zui_get_height() - 24, obj_uiButton)) 
        {
            zui_set_size(250, 28);
            caption = "Return to Main Menu";
            callback = ui_popup_close;
        }
    }
}
