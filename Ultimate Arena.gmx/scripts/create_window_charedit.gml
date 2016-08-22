with(zui_create(window_get_width()*.5, window_get_height()/2 - 60, objUIWindow))
{
    global.charVersion = 1;
    global.workshopID = -1;
    global.creator = -1;
    zui_set_size(500, 330);
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
    with(zui_create(250, 36, objUIField))
    {
        callback = charedit_ui;
        fID = 0;
        width = 120;
        zui_set_anchor(0,0);
        zui_set_size(width,18);
        maxLength = string_width("Vermin Supreme");
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
        bID = 0
    }
    with(zui_create(325, 75, objUICheckbox))
    {
        type = 1;
        callback = charedit_ui;
        cID = 1;
        bID = 0;
    }
    
    /*
    with (zui_create(200, 105, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(130, 30);
        caption = "Add Death Sound";
        callback = charedit_ui;
        bID = 6;
    } */
    
    for(var i=0;i<7;i++)
    {
        with (zui_create(5 + 28*i, 223, oUIImageButton)) 
        {
            zui_set_anchor(0,0);
            zui_set_size(26, 26);
            image = spr_chareditFighters;
            type = i;
            callback = charedit_ui;
            bID = 9;
        }
    }
    
    with(zui_create(240, __height - 55, objUICheckbox))
    {
        type = 0;
        callback = charedit_ui;
        cID = 0;
        value = 0;
        bID = 1;
    }
    with(zui_create(270, __height - 55, objUILabel))
    {
        caption = "Add to Steam Workshop";
        halign = fa_left;
    }
    
    with (zui_create(5, 261, objUIButton)) 
    {                                           
        zui_set_anchor(0,0);
        zui_set_size(192, 30);
        caption = "Change Image";
        callback = charedit_ui;
        bID = 1;
    }
    with (zui_create(202, __height - 5, objUIButton)) 
    {
        zui_set_anchor(0,1);
        zui_set_size(293, 30);
        caption = "Save Character";
        callback = charedit_ui;
        bID = 2;
    }
    with (zui_create(5, __height - 5, objUIButton)) 
    {
        zui_set_anchor(0,1);
        zui_set_size(192, 30);
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
    with(zui_create(200, 236, objUILabel))
    {
        caption = "Catchphrase: ";
        halign = fa_left;
    }
    with(zui_create(290, 227, objUIField))
    {
        callback = charedit_ui;
        fID = 1;
        width = 204;
        maxLength = 600;
        zui_set_anchor(0,0);
        zui_set_size(width,18);
    }
    
}
with(zui_create(window_get_width()*.8, window_get_height()/2 - 60, objUIWindow))
{
    zui_set_size(200, 298);
    wID = "Character Tags";
    with(zui_create(0,0,objUIWindowCaption))
    {
        caption = "Character Tags";
    }
    with(zui_create(0,24,oUIListBox))
    {
        zui_set_anchor(0,0);
        zui_set_size(200,298-64);
        click_mode = 0;
        callback = charedit_ui;
        draw_callback = tag_select_draw_ui;
        other.listID = id;
        listID = 1;
        initialize_listbox(global.TAGS);
        for(i=length-1;i>=0; i--)
        {
            selected[i] = 1;
        }
        with(zui_create(0,0,oUIListBoxScroll)){}
    }
    with (zui_create(5, __height - 35, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(100, 30);
        caption = "Delete Tag";
        callback = charedit_ui;
        bID = 11;
        type = 2;
        listID = other.listID;
    }
    
    with (zui_create(__width - 89, __height - 35, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(84, 30);
        caption = "Add Tag";
        callback = charedit_ui;
        bID = 12;
        listID = other.listID;
    }
}

/*
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
