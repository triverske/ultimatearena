var WS = global.WSCALE;
var HS = global.HSCALE;

with(zui_create(WS/2-WS*.1,HS/2,obj_uiWindow,-1))
{
    wID = "Map";
    callback = dya_ui;
    global.mapwindow = id;
    zui_set_anchor(0,0);
    zui_set_position((WS/2-WS*.1) - (HS*(1) /2),(HS/2)- (HS*(440/720) /2));
    zui_set_size(HS*(1),HS*(440/720)+24);
    with(zui_create(0,0,obj_uiWindowCaption))
    {
        caption = "Map";
        draggable = 1;
    }
    zui_create(0,0,obj_uiExitButton,-1);
}
