///create_window_fighter(fighterID)

var WS = global.WSCALE;
var HS = global.HSCALE;


with(zui_create(WS/2-WS*.1,HS/2,obj_uiWindow,-1))
{
    fID = -1;
    fighter = argument0;
    zui_set_size(312,228);
    callback = arena_ui;
    with (zui_create(0, 0, obj_uiWindowCaption)) 
    {
        caption = global.NAMES[other.fighter] + " - Fighter \#" + string(other.fighter);
        draggable = 1;
    }
    zui_create(0,0,obj_uiExitButton,-1);
    
    with(obj_fighter)
    {
        if (other.fighter == fighterID)
            other.fID = id;
    }
    
    with (zui_create(0, 202, obj_uiImage)) 
    {
        type = 0;
        image = spr_nameBar;
    }
    with(zui_create(156, 214, obj_uiLabel))
    {
        caption = "Wandering";
        halign = fa_center;
        callback = arena_fighter_ui;
        fighter = other.fID;
        fighterID = other.fighter;
    }

    with (zui_create(0, 24, obj_uiImage)) 
    {
        if(other.fID < 0)
        {
            show_debug_message(string(other.fighter));
            var xPos = global.DEADLOC[other.fighter,0]
            var yPos = global.DEADLOC[other.fighter,1]
            type = 2;
            image = obj_arenaController.realmap;
            left = xPos;
            top = yPos;
            show_debug_message(string(left));
            show_debug_message(string(top));
            width = 150;
            height = 150;
            fID = other.fID
            other.xID = id;
        }
        else
        {
            type = 2;
            image = obj_arenaController.realmap;
            left = other.fID.x - 75 - (500 - (other.fID.x - 75));
            top = other.fID.y - 75- (500 - (other.fID.y - 75));
            width = 150;
            height = 150;
            fID = other.fID
            other.xID = id;
        }
    }
    
    with (zui_create(156, 90, obj_uiButton))
    {
        zui_set_anchor(0,0);
        zui_set_size(150, 24);
        caption = "Move";
        callback = arena_fighter_ui;
        tooltip = "Pick up the fighter and move them.";
        bID = 2;
        fID = other.fID
    }
    
    with (zui_create(156, 118, obj_uiButton))
    {
        zui_set_anchor(0,0);
        zui_set_size(150, 24);
        caption = "Give Food & Water";
        callback = arena_fighter_ui;
        tooltip = "Fills the fighter's food and water meters.";
        bID = 0;
        fID = other.fID
    }
    
    with (zui_create(156, 146, obj_uiButton))
    {
        zui_set_anchor(0,0);
        zui_set_size(150, 24);
        caption = "Kill";
        callback = arena_fighter_ui;
        tooltip = "Immediately kills the fighter. Careful!";
        bID = 1;
        fID = other.fID
    }
    with (zui_create(156, 174, obj_uiButton))
    {
        zui_set_anchor(0,0);
        zui_set_size(150, 24);
        caption = "Remove from Team";
        callback = arena_fighter_ui;
        tooltip = "Immediately ends the fighters relationship with their team.";
        bID = 3;
        fID = other.fID
    }
    with (zui_create(3, 174, obj_uiButton))
    {
        zui_set_anchor(0,0);
        zui_set_size(150, 24);
        caption = "Center 3D Camera";
        callback = arena_fighter_ui;
        tooltip = "Follow this fighter on the 3D map.";
        bID = 4;
        fID = other.fID
    }
    
    wID = "FIGHTER";
}
            
