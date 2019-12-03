var WS = global.WSCALE;
var HS = global.HSCALE;

with(zui_create(WS/2-WS*.1,HS/2,obj_uiWindow,-1))
{
    wID = "Ultimate News";
    callback = arena_ui;
    zui_set_size(600,600);
    with(zui_create(0,0,obj_uiWindowCaption))
    {
        caption = "Ultimate News";
        draggable = 1;
    }
    zui_create(0,0,obj_uiExitButton,-1);
}
