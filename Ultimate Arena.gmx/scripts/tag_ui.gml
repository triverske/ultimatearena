///tag_ui(id)

with (oUIListBox)
{
    if (argument0 == id )
    {
        with (zui_main()) 
        {
            with(zui_create(445,348,objUIWindow,-1)) 
            {
                
                zui_set_size(260,420);
                callback = tag_ui;
                tagname = global.TAGS[argument0.sID];
                with (zui_create(0, 0, objUIWindowCaption)) 
                {
                    caption = "Tag: " + other.tagname;
                    draggable = 1;
                }
                with(zui_create(0,24,oUIListBox))
                    {
                        draw_callback = tag_draw_ui;
                        callback = selection_ui;
                        zui_set_anchor(0,0);
                        zui_set_size(260,356);
                        tmpArrayLength = array_length_2d(global.TAG_LIST,argument0.sID);
                        //show_debug_message(string(tmpArrayLength));
                        for(i = 0;i < tmpArrayLength; i++)
                            tmpArray[i] = global.TAG_LIST[argument0.sID,i];
                        
                        initialize_listbox(tmpArray,0,tmpArrayLength);
                        tmpArray = 0;
                        for (i = 0;i < length; i++)
                        {
                            selected[i] = global.select_list.selected[i];
                        }
                        other.listID = id;
                
    
                        with(zui_create(0,0,oUIListBoxScroll))
                        {
        
                        } 
                    }
                zui_create(0, 0, oUIExitButton);
                with (zui_create(5, __height - 35, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(150, 30);
        caption = "Toggle Selection";
        callback = selection_ui;
        bID = 0;
        listID = other.listID;
    }
    with (zui_create(160, __height - 35, objUIButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(95, 30);
        caption = "Clear";
        callback = selection_ui;
        bID = 1;
        listID = other.listID;
    }
                
        
            }
        }
    }
    
}
