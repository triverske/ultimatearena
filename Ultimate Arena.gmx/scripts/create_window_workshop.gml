var WS = global.WSCALE;
var HS = global.HSCALE;
var createdItems = argument0;

with(zui_main())
{
    with(zui_create(0,0,obj_uiWindow))
    {
        wID = "Return To Menu";
        zui_set_size(150,150);
        zui_set_position(WS / 14,(HS / 12) * 10);
        callback = workshop_ui;
        
        with(zui_create(10,10,obj_uiButton))
        {
            zui_set_size(130,60);
            zui_set_anchor(0,0);
            callback = workshop_ui;
            bID = 4;
            caption = "Add New Fighter";
        }
        with(zui_create(10,80,obj_uiButton))
        {
            zui_set_size(130,60);
            zui_set_anchor(0,0);
            callback = workshop_ui;
            bID = 0;
            caption = "Return To Menu";
        }
    }
    
    

    with(zui_create(WS/3-WS*.1,HS/2,obj_uiWindow))
    {
        wID = "Workshop Items";
        zui_set_size(300,700);
        zui_set_position(floor(WS / 3.9),HS / 2);
        callback = workshop_ui;
        
        with(zui_create(0, 0, obj_uiWindowCaption)) 
        {
            caption = "Your Workshop Items (0)";
            draggable = 0; 
            type = 99;
        }
        return id;
    }
    
    
}
