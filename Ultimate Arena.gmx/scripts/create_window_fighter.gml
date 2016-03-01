///create_window_fighter(fighterID)

var WS = global.WSCALE;
var HS = global.HSCALE;


with(zui_create(WS/2-WS*.1,HS/2,objUIWindow,-1))
{
    fighter = argument0;
    zui_set_size(312,174);
    callback = arena_ui;
    with (zui_create(0, 0, objUIWindowCaption)) 
    {
        caption = global.NAMES[other.fighter] + " - Fighter \#" + string(other.fighter);
        draggable = 1;
    }
    zui_create(0,0,oUIExitButton,-1);
    

    with(oFighter)
    {
        if (other.fighter == fighterID)
            other.fID = id;
    }

    with (zui_create(0, 24, oUIImage)) 
    {
        type = 2;
        image = oGraphicsController.realmap;
        left = other.fID.x - 75 - (500 - (other.fID.x - 75));
        top = other.fID.y - 75- (500 - (other.fID.y - 75));
        width = 150;
        height = 150;
        fID = other.fID
        other.xID = id;
    }
    
    with (zui_create(156, 90, objUIButton))
    {
        zui_set_anchor(0,0);
        zui_set_size(150, 24);
        caption = "Move";
        callback = arena_fighter_ui;
        bID = 2;
        fID = other.fID
    }
    
    with (zui_create(156, 118, objUIButton))
    {
        zui_set_anchor(0,0);
        zui_set_size(150, 24);
        caption = "Give Food & Water";
        callback = arena_fighter_ui;
        bID = 0;
        fID = other.fID
    }
    
    with (zui_create(156, 146, objUIButton))
    {
        zui_set_anchor(0,0);
        zui_set_size(150, 24);
        caption = "Kill";
        callback = arena_fighter_ui;
        bID = 1;
        fID = other.fID
    }
    
    wID = "FIGHTER";
}
            
