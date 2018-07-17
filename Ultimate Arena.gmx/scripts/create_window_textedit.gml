with(zui_create((window_get_width()-260)*.5+260, window_get_height()/2, obj_uiWindow))
{
    zui_set_size(800, 620);
    wID = "Editor Window";
    
    with(zui_create(0, 0, obj_uiWindowCaption))
    {
        caption = "Default Updates";
    }
    with(zui_create(10,75,obj_uiListbox))
    {
        zui_set_anchor(0,0);
        zui_set_size(780,435);
        callback = textedit_ui;
        draw_callback = tag_select_draw_ui;
        other.listID = id;
        listID = 1;
        type = 1;
        initialize_listbox(obj_textEditor.currentList);
        for(var i=array_length_1d(obj_textEditor.currentList)-1; i>-1; i--)
            selected[i] = !obj_textEditor.toggleList[i];
            
        with(zui_create(0,0,obj_uiListboxScroll)){}
    }
    with (zui_create(10, 35, obj_uiButton)) 
    {                                           
        zui_set_anchor(0,0);
        zui_set_size(30, 30);
        caption = "<";
        callback = textedit_ui;
        bID = 2;
    }
    with(zui_create(400, 35, obj_uiLabel))
    {
        caption = obj_textEditor.sectionName[0];
        halign = fa_center;
        valign = fa_top;
        lID = 1;
    }
    with(zui_create(400, 50, obj_uiLabel))
    {
        caption = "(One fighter)";
        halign = fa_center;
        valign = fa_top;
        lID = 2;
    }
    with (zui_create(760, 35, obj_uiButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(30, 30);
        caption = ">";
        callback = textedit_ui;
        bID = 3;
    }
    with(zui_create(10, 526, obj_uiField))
    {
        zui_set_anchor(0,0);
        width = 610;
        zui_set_size(width,18);
        callback = textedit_ui;
        maxLength = string_width("Vermin Supreme attempts to climb one of the arena barriers, but loses his footing and falls to a painful end.");
        fID = 0;
    }
    with(zui_create(630,520, obj_uiButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(30,30);
        caption = "+";
        callback = textedit_ui;
        bID = 4;
    }
    with(zui_create(690,520, obj_uiButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(100,30);
        caption = "Delete Update";
        callback = textedit_ui;
        type = 2;
        bID = 5;
    }
    with(zui_create(540,560, obj_uiButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(120,30);
        caption = "New Update File";
        callback = textedit_ui;
        bID = 6;
    }
    with(zui_create(670,560, obj_uiButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(120,30);
        caption = "Save Update File";
        callback = textedit_ui;
        bID = 7;
    }
    with(zui_create(10, 590, obj_uiLabel))
    {
        caption = "$1 is used for a fighter's name, %1 for he/she, @1 for his/her, *1 for him/her.#Use $2, %2, @2, and *2 when a second fighter is involved in an update."
        halign = fa_left;
        valign = fa_bottom;
    }
    with(zui_create(550, __height - 14, obj_uiCheckbox))
    {
        type = 0;
        callback = textedit_ui;
        cID = 0;
        value = 0;
        bID = 1;
        __visible = 0;
    }
    with(zui_create(585, __height - 14, obj_uiLabel))
    {
        caption = "Add to Steam Workshop";
        halign = fa_left;
        __visible = 0;
    }
}





