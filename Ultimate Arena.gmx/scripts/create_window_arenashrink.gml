var WS = global.WSCALE;
var HS = global.HSCALE;

with(zui_create(WS/2-WS*.1,HS/2,obj_uiWindow,-1))
{
    wID = "Shrinking Arena";
    callback = arena_ui;
    zui_set_size(335,180);
    with(zui_create(0,0,obj_uiWindowCaption))
    {
        caption = "Shrinking Arena";
        draggable = 1;
    }
    with(zui_create(99,__height - 25,obj_uiButton))
    {
        bID = 70;
        zui_set_size(187,40);
        callback = arena_ui;

        if(global.arenaShrink)
        {
            caption = "Shrinking Arena On";
            type = 3;
        }
        else
        {
            caption = "Shrinking Arena Off";
            type = 2;
        }
    }
    with(zui_create(264,__height - 25,obj_uiButton))
    {
        bID = 71;
        zui_set_size(119,40);
        callback = arena_ui;
        caption = "Reset Size";
    }
    with(zui_create(83,70,obj_uiSlider))
    {
        zui_set_size(168, 26);
        zui_set_anchor(0,0);
        callback = arena_ui;
        slID = 1;
        with(obj_arenaShrink)
            other.pos = 1 - (ticksUntilShrink / 300);
    }
    with(zui_create(83,100,obj_uiLabel))
    {
        halign = fa_center;
        caption = "SLOW";
    }
    with(zui_create(83*3,100,obj_uiLabel))
    {
        halign = fa_center;
        caption = "FAST";
    }
    zui_create(0,0,obj_uiExitButton,-1);
}
