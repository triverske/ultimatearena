var WS = global.WSCALE;
var HS = global.HSCALE;

with(zui_create(WS/2-WS*.1,HS/2,objUIWindow,-1))
{
    wID = "Fighter List";
    zui_set_size(260,HS*.8);
    with(zui_create(0,24,oUIListBox))
    {
        zui_set_anchor(0,0);
        zui_set_size(260,HS*.8);
        caption = "TEST";
        callback = test22;
        draw_callback = drawcall_fighter;
        initialize_listbox(global.NAMES,0,global.fighters+1);

        with(zui_create(0,50,oUIListBoxScroll))
        {
        
        }
    }                
    with(zui_create(0,0,objUIWindowCaption))
    {
        caption = "Fighter List";
        draggable = 1;
    }
    zui_create(0,0,oUIExitButton);

}

