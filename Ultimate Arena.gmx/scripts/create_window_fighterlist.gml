var WS = global.WSCALE;
var HS = global.HSCALE;

with(zui_create(WS/2-WS*.1,HS/2,objUIWindow,-1))
{
    wID = "Fighter List";
    zui_set_size(260,HS*(512/720));               
    with(zui_create(0,0,objUIWindowCaption))
    {
        caption = "Fighter List";
        draggable = 1;
    }
    zui_create(0,0,oUIExitButton,-1);
    with(zui_create(0,24,objUIListBox))
    {
        zui_set_anchor(0,0);
        zui_set_size(260,HS*(512/720)-24);
        callback = fighter_list_ui;
        draw_callback = drawcall_fighter;
        initialize_listbox(global.NAMES,1,global.fighters);
        zui_create(0,0,objUIListBoxScroll);
    } 
}

