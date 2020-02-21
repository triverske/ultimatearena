var WS = global.WSCALE;
var HS = global.HSCALE;

with(zui_create(WS/2-WS*.1,HS/2,obj_uiWindow,-1))
{
    wID = "3D Map";
    callback = arena_ui;

    zui_set_anchor(0,0);
    zui_set_position((WS/2-WS*.1) - (HS*(512/720) /2),(HS/2)- (HS*(512/720) /2));
    zui_set_size(HS*(512/720),HS*(512/720)+24);
    with(zui_create(0,0,obj_uiWindowCaption))
    {
        caption = "3D Map";
        draggable = 1;
    }
    with (zui_create(5 , 29, obj_uiButton))
    {
        zui_set_anchor(0,0);
        zui_set_size(150, 24);
        caption = "Center Camera";
        callback = arena_ui;
        bID = 65;
    }
    with (zui_create(160 , 29, obj_uiButton))
    {
        zui_set_anchor(0,0);
        zui_set_size(150, 24);
        caption = "Follow Random";
        callback = arena_ui;
        bID = 66;
    }
    with (zui_create(315 , 29, obj_uiButton))
    {
        zui_set_anchor(0,0);
        zui_set_size(150, 24);
        caption = "Follow CPU's Choice";
        callback = arena_ui;
        bID = 67;
    }
    
    zui_create(0,0,obj_uiExitButton,-1);
}
