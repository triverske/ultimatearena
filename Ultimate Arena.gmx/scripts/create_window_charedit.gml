with(zui_create(window_get_width()*.6, window_get_height()/2, objUIWindow))
{
    //zui_set_anchor(-.5, -.05);
    zui_set_size(500, 300);
    wID = "Editor Window";
    
    with(zui_create(0, 0, objUIWindowCaption))
    {
        caption = "Character Editor";
        draggable = 1;
    }
        
    with(zui_create(5, 29, oUIImage))
    {
        image = global.newImage;
        callback = charedit_ui;
        scale = 1.5;
        bID = 0;
    }
    with(zui_create(200, 45, objUILabel))
    {
        caption = "Name: ";
        halign = fa_left;
    }
    with(zui_create(252, 39, objUIField))
    {
        callback = charedit_ui;
        fID = 0
    }
    with(zui_create(200, 75, objUILabel))
    {
        caption = "Gender:  M"
        halign = fa_left;
    }
    with(zui_create(305, 75, objUILabel))
    {
        caption = "F"
    }
    with(zui_create(280, 75, objUICheckbox))
    {
        type = 1;
        callback = charedit_ui;
        cID = 0;
    }
    with(zui_create(325, 75, objUICheckbox))
    {
        type = 1;
        callback = charedit_ui;
        cID = 1;
    }
    with (zui_create(200, 130, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(100, 30);
        caption = "Change Image";
        callback = charedit_ui;
        bID = 1;
    }
    with (zui_create(200, 180, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(100, 30);
        caption = "Save Character";
        callback = charedit_ui;
        bID = 2;
    }
}
