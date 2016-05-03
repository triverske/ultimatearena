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
    with(zui_create(14, 55, objUIField))
    {
        callback = eventedit_ui;
        fID = 0;
        maxLength = string_width("WWWWWWWWWWWWWWW");
        width = maxLength+6;
        zui_set_anchor(0,0);
        zui_set_size(width,18);
    }
    with(zui_create(15, 90, objUILabel))
    {
        caption = "Description: ";
        halign = fa_left;
    }
    with(zui_create(14, 100, objUIField))
    {
        callback = eventedit_ui;
        fID = 1;
        maxLength = string_width("WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
        width = maxLength+6;
        zui_set_anchor(0,0);
        zui_set_size(width,18);
    }
    with(zui_create(15, 135, objUILabel))
    {
        caption = "Death Percentage: ";
        halign = fa_left;
    }
    with(zui_create(14, 145, objUIField))
    {
        callback = eventedit_ui;
        fID = 2;
        maxLength = string_width("100");
        width = maxLength+6;
        zui_set_anchor(0,0);
        zui_set_size(width,18);
    }
    with(zui_create(15, 180, objUILabel))
    {
        caption = "Updates: ";
        halign = fa_left;
    }
    with(zui_create(14, 190, objUIMultiField))
    {
        callback = eventedit_ui;
        mID = 0;
        maxLength = 600;
        width = 440;
        zui_set_anchor(0,0);
        zui_set_size(width,18);
    }
    with(zui_create(465, 200, objUILabel))
    {
        caption = "1/1";
        halign = fa_left;
        lID = 1;
    }
    with (zui_create(15, 225, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(130, 30);
        caption = "Add Update";
        callback = eventedit_ui;
        bID = 4;
    }
    with (zui_create(155, 225, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(130, 30);
        caption = "Delete Update";
        callback = eventedit_ui;
        bID = 5;
    }
    with (zui_create(440, 225, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(20, 20);
        caption = "<";
        callback = eventedit_ui;
        bID = 6;
    }
    with (zui_create(470, 225, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(20, 20);
        caption = ">";
        callback = eventedit_ui;
        bID = 7;
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
}
