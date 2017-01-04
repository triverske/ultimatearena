with(zui_create((window_get_width()-260)*.5+260, window_get_height()/2, objUIWindow))
{
    zui_set_size(800, 620);
    wID = "Editor Window";
    
    with(zui_create(0, 0, objUIWindowCaption))
    {
        caption = "Default Updates";
    }
    with(zui_create(10,75,objUIListBox))
    {
        zui_set_anchor(0,0);
        zui_set_size(780,435);
        callback = textedit_ui;
        draw_callback = tag_select_draw_ui;
        other.listID = id;
        listID = 1;
        type = 1;
        initialize_listbox(oTextedit.currentList);
        for(var i=array_length_1d(oTextedit.currentList)-1; i>-1; i--)
            selected[i] = !oTextedit.toggleList[i];
            
        with(zui_create(0,0,objUIListBoxScroll)){}
    }
    with (zui_create(10, 35, objUIButton)) 
    {                                           
        zui_set_anchor(0,0);
        zui_set_size(30, 30);
        caption = "<";
        callback = textedit_ui;
        bID = 2;
    }
    with(zui_create(400, 35, objUILabel))
    {
        caption = oTextedit.sectionName[0];
        halign = fa_center;
        valign = fa_top;
        lID = 1;
    }
    with(zui_create(400, 50, objUILabel))
    {
        caption = "(One fighter)";
        halign = fa_center;
        valign = fa_top;
        lID = 2;
    }
    with (zui_create(760, 35, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(30, 30);
        caption = ">";
        callback = textedit_ui;
        bID = 3;
    }
    with(zui_create(10, 526, objUIField))
    {
        zui_set_anchor(0,0);
        width = 610;
        zui_set_size(width,18);
        callback = textedit_ui;
        maxLength = string_width("Vermin Supreme attempts to climb one of the arena barriers, but loses his footing and falls to a painful end.");
        fID = 0;
    }
    with(zui_create(630,520, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(30,30);
        caption = "+";
        callback = textedit_ui;
        bID = 4;
    }
    with(zui_create(690,520, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(100,30);
        caption = "Delete Update";
        callback = textedit_ui;
        type = 2;
        bID = 5;
    }
    with(zui_create(540,560, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(120,30);
        caption = "New Update File";
        callback = textedit_ui;
        bID = 6;
    }
    with(zui_create(670,560, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(120,30);
        caption = "Save Update File";
        callback = textedit_ui;
        bID = 7;
    }
    with(zui_create(10, 590, objUILabel))
    {
        caption = "$1 is used for a fighter's name, %1 for he/she, @1 for his/her, *1 for him/her.#Use $2, %2, @2, and *2 when a second fighter is involved in an update."
        halign = fa_left;
        valign = fa_bottom;
    }
    with(zui_create(550, __height - 14, objUICheckbox))
    {
        type = 0;
        callback = textedit_ui;
        cID = 0;
        value = 0;
        bID = 1;
        __visible = 0;
    }
    with(zui_create(585, __height - 14, objUILabel))
    {
        caption = "Add to Steam Workshop";
        halign = fa_left;
        __visible = 0;
    }
}





