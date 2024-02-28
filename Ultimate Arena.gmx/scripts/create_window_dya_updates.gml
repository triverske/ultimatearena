var WS = global.WSCALE;
var HS = global.HSCALE *global.gs;

with(zui_create(WS - 200,HS/2,obj_uiWindow,-1))
{
    wID = "Updates";
    callback = dya_ui;
    zui_set_size(390,HS*(512/720));
    with(zui_create(0,0,obj_uiWindowCaption))
    {
        caption = "Updates";
        draggable = 1;
    }
    zui_create(0,0,obj_uiExitButton,-1);
    with(zui_create(5,__height - 45,obj_uiButton))
    {
        zui_set_anchor(0,0);
        bID = 80;
        zui_set_size(186,40);
        callback = dya_ui;

        if(global.deadUpdates)
        {
            caption = "Death Updates On";
            type = 3;
        }
        else
        {
            caption = "Death Updates Off";
            type = 2;
        }
    }
    with(zui_create(__width - 5,__height - 45,obj_uiButton))
    {
        zui_set_anchor(1,0);
        bID = 79;
        if(global.otherUpdates)
        {
            caption = "Other Updates On";
            type = 3;
        }
        else
        {
            caption = "Other Updates Off";
            type = 2;
        }
        zui_set_size(186,40);
        callback = arena_ui;
    }
} 
