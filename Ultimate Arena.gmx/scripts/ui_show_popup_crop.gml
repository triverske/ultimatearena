///ui_show_popup(caption)

with (obj_uiMain) 
{
    var _black = zui_create(0, 0, obj_uiBlack, -1000);
    
    with (zui_create(__width * 0.5, __height * 0.5, obj_uiWindow, -1001)) 
    {
        zui_set_size(512, 512);
        
        black = _black;
        
        with (zui_create(0, 0, obj_uiWindowCaption)) 
            caption = "Crop Image";
    
        with (zui_create(zui_get_width() * 0.5, zui_get_height() * 0.1 - 8, obj_uiLabel)) 
            caption = "Move Image With Mouse/WASD, Enlarge/Shrink with Mouse Wheel";
            
        zui_create(zui_get_width() * 0.5, zui_get_height() * 0.5, obj_uiCrop)

  
        with (zui_create(zui_get_width() * 0.5, zui_get_height() - 24, obj_uiButton)) 
        {
            zui_set_size(96, 28);
            caption = "OK";
            callback = ui_popup_close_crop;
            bID = 0;
        }
    }
}
