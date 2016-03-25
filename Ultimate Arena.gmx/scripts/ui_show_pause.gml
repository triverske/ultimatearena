///ui_show_pause();

var exitcheck = 0;

with(objUIWindowCaption)
    if(caption == "PAUSED")
        exitcheck = 1;
        
if(exitcheck == 0)
{
    global.SAVE_SPEED = global.GAME_SPEED;
    global.GAME_SPEED = 0;
    with (objZUIMain) 
    {
        var _black = zui_create(0, 0, objUIBlack, -1000);
    
        with (zui_create(__width * 0.5, __height * 0.5, objUIWindow, -1001)) 
        {
            zui_set_size(256, 148);
      
            black = _black;
      
            with (zui_create(0, 0, objUIWindowCaption)) 
            {
                caption = "PAUSED";
            }
      
            with (zui_create(zui_get_width() * 0.5, zui_get_height() - 100, objUIButton)) 
            {
               zui_set_size(196, 28);
               zui_set_anchor(.5,.5);
               caption = "Continue";
               callback = ui_resume;
            }
            with (zui_create(zui_get_width() * 0.5, zui_get_height() - 62, objUIButton)) 
            {
               zui_set_size(196, 28);
               zui_set_anchor(.5,.5);
               caption = "Save Game";
               callback = ui_save;
            }
            with (zui_create(zui_get_width() * 0.5, zui_get_height() - 24, objUIButton)) 
            {
               zui_set_size(196, 28);
               zui_set_anchor(.5,.5);
               caption = "Return to Title";
               callback = ui_exit;
            }
        }
    }
}
