with(zui_create(window_get_width()*.6, window_get_height()/2 - 60, objUIWindow))
{
    zui_set_size(500, 298);
    wID = "Editor Window";
    
    with(zui_create(0, 0, objUIWindowCaption))
    {
        caption = "Event Editor";
    }
    with(zui_create(15, 45, objUILabel))
    {
        caption = "Event Name: ";
        halign = fa_left;
    }
    with(zui_create(200, 39, objUIField))
    {
        callback = eventedit_ui;
        fID = 0;
    }
    with(zui_create(15, 90, objUILabel))
    {
        caption = "Description: ";
        halign = fa_left;
    }
    with(zui_create(200, 84, objUIField))
    {
        callback = eventedit_ui;
        fID = 1;
    }
    with(zui_create(15, 135, objUILabel))
    {
        caption = "Death Percentage: ";
        halign = fa_left;
    }
    with(zui_create(200, 129, objUIField))
    {
        callback = eventedit_ui;
        fID = 2;
    }
    with (zui_create(365, 263, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(130, 30);
        caption = "Save Event";
        callback = eventedit_ui;
        bID = 2;
    }
    with (zui_create(202, 263, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(158, 30);
        caption = "New Event";
        callback = eventedit_ui;
        bID = 3;
    }
}/*
with(zui_create(window_get_width()*.6, window_get_height()/2 + 184, objUIWindow))
{
    zui_set_size(390, 144);
    wID = "Phrase Editor";
    callback = charedit_ui;
    text = "NO CATCHPHRASE";
    with(zui_create(0, 0, objUIWindowCaption))
    {
        caption = "Phrase Editor";
    }
    with (zui_create(__width * .5, __height - 36, objUIButton)) 
    {
        zui_set_anchor(.5,0);
        zui_set_size(240, 30);
        caption = "Change Catchphrase";
        callback = charedit_ui;
        bID = 10;
    }
}
