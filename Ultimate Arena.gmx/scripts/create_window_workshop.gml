var WS = global.WSCALE;
var HS = global.HSCALE;
var createdItems = argument0;


with(zui_main())
{
    with(zui_create(WS/2-WS*.1,HS/2,obj_uiWindow))
    {
        wID = "Workshop Items";
        zui_set_size(300,700);
        zui_set_position(WS / 2,HS / 2);
        callback = workshop_ui;
        
        with (zui_create(0, 0, obj_uiWindowCaption)) 
        {
            caption = "Your Workshop Items (" + string(createdItems) + ")";
            draggable = 0; 
        }
        return id;
    }
}
