///ui_show_pause();

var exitcheck = 0;

with(obj_uiWindowCaption)
    if(caption == "PAUSED")
        exitcheck = 1;
        
if(exitcheck == 0)
{
    global.SAVE_SPEED = global.GAME_SPEED;
    global.GAME_SPEED = 0;
    with (obj_uiMain) 
    {
        var _black = zui_create(0, 0, obj_uiBlack, -1000);
    
        with (zui_create(__width * 0.5, __height * 0.5, obj_uiWindow, -1001)) 
        {
            zui_set_size(256, 148);
      
            black = _black;
      
            with (zui_create(0, 0, obj_uiWindowCaption)) 
            {
                caption = "PAUSED";
            }
      
            with (zui_create(zui_get_width() * 0.5, zui_get_height() - 100, obj_uiButton)) 
            {
               zui_set_size(196, 28);
               zui_set_anchor(.5,.5);
               caption = "Continue";
               callback = ui_resume;
            }
            with (zui_create(zui_get_width() * 0.5, zui_get_height() - 62, obj_uiButton)) 
            {
               zui_set_size(196, 28);
               zui_set_anchor(.5,.5);
               caption = "Restart Game";
               callback = ui_restart;
            }
            with (zui_create(zui_get_width() * 0.5, zui_get_height() - 24, obj_uiButton)) 
            {
               zui_set_size(196, 28);
               zui_set_anchor(.5,.5);
               caption = "Return to Title";
               callback = ui_exit;
            }
        }
    }
}
