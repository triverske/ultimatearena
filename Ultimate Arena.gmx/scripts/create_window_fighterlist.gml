var WS = global.WSCALE;
var HS = global.HSCALE;

with(zui_create(WS/2-WS*.1,HS/2,objUIWindow,-1))
{
    wID = "Fighter List";
    zui_set_size(260,HS*(512/720));
    with(zui_create(0,24,oUIListBox))
    {
        zui_set_anchor(0,0);
        zui_set_size(260,HS*(512/720));
        caption = "TEST";
        callback = fighter_list_ui;
        draw_callback = drawcall_fighter;
        initialize_listbox(global.NAMES,0,global.fighters+2);

        with(zui_create(0,50,oUIListBoxScroll))
        {
        
        }
    }                
    with(zui_create(0,0,objUIWindowCaption))
    {
        caption = "Fighter List";
        draggable = 1;
    }
    zui_create(0,0,oUIExitButton,-1);
}

