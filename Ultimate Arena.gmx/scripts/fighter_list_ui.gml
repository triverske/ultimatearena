///fighter_list_ui

// Whenever you click on a name in the fighter list, this is the code that runs.


var WS = global.WSCALE;
var HS = global.HSCALE;

d = sID;
if (global.DEATH_ARRAY[d] == 0 && d > 0 && d < global.fighters)
{
    with (zui_main()) 
    {
        d = other.d;
        with(zui_create(WS/2-WS*.1,HS/2,objUIWindow,-1))
        {
            fighter = other.d;
            zui_set_size(312,174);
            callback = arena_ui;
            with (zui_create(0, 0, objUIWindowCaption)) 
            {
                caption = global.NAMES[other.fighter] + " - Fighter \#" + string(other.fighter);
                draggable = 1;
            }
            zui_create(0, 0, oUIExitButton);
            
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
            
            with (zui_create(156, 106, objUIButton))
            {
                zui_set_anchor(0,0);
                zui_set_size(150, 24);
                caption = "Give Food & Water";
                callback = arena_fighter_ui;
                bID = 0;
                fID = other.fID
            }
            
            with (zui_create(156, 134, objUIButton))
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
    }
}

