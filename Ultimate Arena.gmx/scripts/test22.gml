///title_buttons(id)

d = ceil(random(global.fighters))
if (global.DEATH_ARRAY[d] == 0)
{
with (zui_main()) 
{
    d = other.d;
        with(zui_create(display_get_gui_width()/2+350,348+i*194,objUIWindow,-1)) 
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
            
            wID = "FIGHTER";
        }
    }
}

