
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
    alarm[0] = 2;
    zui_create(0,0,obj_uiExitButton,-1);
}

