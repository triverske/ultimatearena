var WS = global.WSCALE;
var HS = global.HSCALE;

with(zui_create(WS/2-WS*.1,HS/2,obj_uiWindow,-1))
{
    wID = "Map Window";
    zui_set_size(HS*(512/720),HS*(512/720)+24);
    zui_set_position(WS*.75,HS / 2);
    callback = fighter_select_buttons;
    
    with (zui_create(0, 0, obj_uiWindowCaption)) 
    {
        caption = "Map Settings";
        draggable = 0; 
    }
}
