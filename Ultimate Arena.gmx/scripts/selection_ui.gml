///selection_ui(id)

with (objUIButton)
{
    if (argument0 == id)
    {
        if(bID == 0)
        {
            with(listID)
            {
                for (i = 0;i < length; i++)
                {
                    if (selected[i] == 0)
                        selected[i] = 1;
                    else
                        selected[i] = 0;
                    
                    if(id != global.select_list)   
                        global.select_list.selected[list[i]] = selected[i];
                }
            }
        
        }
        if(bID == 1)
        {
            with(listID)
            {
                for (i = 0;i < length; i++)
                {
                    if(id == global.select_list)
                        global.select_list.selected[i] = 1;
                    else
                        global.select_list.selected[list[i]] = 1;
                }
            }
        
        }
    
    }
}
with (oUIListBox)
{
    if (argument0 == id)
    {
        if (selected[sID] == 0)
            selected[sID] = 1;
        else
            selected[sID] = 0;
            
        global.select_list.selected[list[sID]] = selected[sID];
    }
}
