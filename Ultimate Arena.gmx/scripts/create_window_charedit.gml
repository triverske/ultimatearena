with(zui_create(window_get_width()*.6, window_get_height()/2, objUIWindow))
{

    zui_set_size(500, 258);
    wID = "Editor Window";
    
    with(zui_create(0, 0, objUIWindowCaption))
    {
        caption = "Character Editor";
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
        value = 1;
    }
    with(zui_create(325, 75, objUICheckbox))
    {
        type = 1;
        callback = charedit_ui;
        cID = 1;
    }
    /*
    with (zui_create(200, 105, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(130, 30);
        caption = "Add Death Sound";
        callback = charedit_ui;
        bID = 6;
    }
    */
    with (zui_create(5, 223, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(192, 30);
        caption = "Change Image";
        callback = charedit_ui;
        bID = 1;
    }
    with (zui_create(365, 223, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(130, 30);
        caption = "Save Character";
        callback = charedit_ui;
        bID = 2;
    }
    with (zui_create(202, 223, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(158, 30);
        caption = "New Character";
        callback = charedit_ui;
        bID = 4;
    }
    
    
    
    with(zui_create(300, 125, objUILabel))
    {
        caption = "Strength";
        halign = fa_middle;
    }
    with(zui_create(400, 125, objUILabel))
    {
        caption = "Agility";
        halign = fa_middle;
    }
    with(zui_create(250, 175, objUILabel))
    {
        caption = "Endurance";
        halign = fa_middle;
    }
    with(zui_create(350, 175, objUILabel))
    {
        caption = "Skill";
        halign = fa_middle;
    }
    with(zui_create(450, 175, objUILabel))
    {
        caption = "Luck";
        halign = fa_middle;
    }
    
    with(zui_create(300, 150, objUILabel))
    {
        caption = "5";
        halign = fa_middle;
        lID = 1;
    }
    with(zui_create(400, 150, objUILabel))
    {
        caption = "5";
        halign = fa_middle;
        lID = 2;
    }
    with(zui_create(250, 200, objUILabel))
    {
        caption = "5";
        halign = fa_middle;
        lID = 3;
    }
    with(zui_create(350, 200, objUILabel))
    {
        caption = "5";
        halign = fa_middle;
        lID = 4;
    }
    with(zui_create(450, 200, objUILabel))
    {
        caption = "5";
        halign = fa_middle;
        lID = 5;
    }
    
    with (zui_create(320, 150, objUIButton)) 
    {
        zui_set_anchor(.5,.5);
        zui_set_size(20, 20);
        caption = ">";
        callback = charedit_ui;
        bID = 7;
        stat = 0;
    }
    with (zui_create(420, 150, objUIButton)) 
    {
        zui_set_anchor(.5,.5);
        zui_set_size(20, 20);
        caption = ">";
        callback = charedit_ui;
        bID = 7;
        stat = 1;
    }
    with (zui_create(270, 200, objUIButton)) 
    {
        zui_set_anchor(.5,.5);
        zui_set_size(20, 20);
        caption = ">";
        callback = charedit_ui;
        bID = 7;
        stat = 2;
    }
    with (zui_create(370, 200, objUIButton)) 
    {
        zui_set_anchor(.5,.5);
        zui_set_size(20, 20);
        caption = ">";
        callback = charedit_ui;
        bID = 7;
        stat = 3;
    }
    with (zui_create(470, 200, objUIButton)) 
    {
        zui_set_anchor(.5,.5);
        zui_set_size(20, 20);
        caption = ">";
        callback = charedit_ui;
        bID = 7;
        stat = 4;
    }
    
    with (zui_create(280, 150, objUIButton)) 
    {
        zui_set_anchor(.5,.5);
        zui_set_size(20, 20);
        caption = "<";
        callback = charedit_ui;
        bID = 8;
        stat = 0;
    }
    with (zui_create(380, 150, objUIButton)) 
    {
        zui_set_anchor(.5,.5);
        zui_set_size(20, 20);
        caption = "<";
        callback = charedit_ui;
        bID = 8;
        stat = 1;
    }
    with (zui_create(230, 200, objUIButton)) 
    {
        zui_set_anchor(.5,.5);
        zui_set_size(20, 20);
        caption = "<";
        callback = charedit_ui;
        bID = 8;
        stat = 2;
    }
    with (zui_create(330, 200, objUIButton)) 
    {
        zui_set_anchor(.5,.5);
        zui_set_size(20, 20);
        caption = "<";
        callback = charedit_ui;
        bID = 8;
        stat = 3;
    }
    with (zui_create(430, 200, objUIButton)) 
    {
        zui_set_anchor(.5,.5);
        zui_set_size(20, 20);
        caption = "<";
        callback = charedit_ui;
        bID = 8;
        stat = 4;
    }
    
}
