///search_ui(searchstring)

with (zui_main()) 
{
    with(zui_create(445,348,obj_uiWindow,-1)) 
    {
        zui_set_size(260,420);
        with (zui_create(0, 0, obj_uiWindowCaption)) 
        {
            caption = "Searching: " + argument0;
            draggable = 1;
        }
        zui_create(0,0,obj_uiExitButton,-1);
        with(zui_create(0,24,obj_uiListbox))
        {
            draw_callback = tag_draw_ui;
            callback = selection_ui;
            zui_set_anchor(0,0);
            zui_set_size(260,356);
            type = 1;
            var c = 0;
            var tmpArray;
            for(i = 0;i < global.FIGHTER_COUNT; i++)
            {
                if(string_count(string_upper(argument0),string_upper(global.cNAME[i])) > 0)
                {
                    tmpArray[c] = i
                    c++;
                }     
            }
            
            if(c == 0)
            {
                zui_destroy();
                exit;
            }
            
            
            initialize_listbox(tmpArray,0,c-1);
            for (i=0;i<length;i++)
            {
                selected[i] = global.select_list.selected[list[i]];
            }
            other.listID = id;
            with(zui_create(0,0,obj_uiListboxScroll)){} 
        }
        
        with (zui_create(5, __height - 35, obj_uiButton)) 
        {
            zui_set_anchor(0,0);
            zui_set_size(150, 30);
            caption = "Toggle Selection";
            callback = selection_ui;
            bID = 0;
            listID = other.listID;
        }
        with (zui_create(160, __height - 35, obj_uiButton)) 
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

