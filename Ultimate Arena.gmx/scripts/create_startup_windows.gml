create_window_map();
create_window_updates();
create_window_stats();

with(zui_create(0,0,obj_uiWindow,-100))
{
    wID = "Arena UI";
    callback = arena_ui;
    zui_set_size(global.WSCALE,55);
    zui_set_anchor(0,0);
    for(var i=0;i<4;i++)
    {
        with (zui_create(120+20*i,35,obj_uiImageButton))
        {
            type = i;
            bID = i;
            callback = arena_ui;
            image = spr_gameSpeedButtons;
            zui_set_size(18,18);
        }
    } 
    for(var i=0;i<9;i++)
    {
        with (zui_create(240+44*i,28,obj_uiImageButton))
        {
            type = i;
            bID = i + 4;
            callback = arena_ui;
            image = spr_gameButtons;
            tooltip = obj_arenaController.tt[i];
            zui_set_size(42,42);
        }
    } 
}
