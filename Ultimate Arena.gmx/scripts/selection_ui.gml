///selection_ui(id)

with (obj_uiButton)
{
    if (argument0 == id)
    {
        if(bID == 0) //toggle selection
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
        if(bID == 2) //change team
        {
            with(listID)
            {
                for (i = 0;i < length; i++)
                {
                    if(!selected[i])
                    {
                        switch(global.menuTeams[i])
                        {
                            case "":
                                global.menuTeams[i] = "RED";
                                break;
                            case "RED":
                                global.menuTeams[i] = "ORANGE";
                                break;
                            case "ORANGE":
                                global.menuTeams[i] = "YELLOW";
                                break;
                            case "YELLOW":
                                global.menuTeams[i] = "GREEN";
                                break;
                            case "GREEN":
                                global.menuTeams[i] = "BLUE";
                                break;
                            case "BLUE":
                                global.menuTeams[i] = "PURPLE";
                                break;
                            case "PURPLE":
                                global.menuTeams[i] = "";
                                break;
                        }
                    }
                }
            }     
        }
        if(bID == 3) //clear teams
        {
            with(listID)
                for (i = 0;i < length; i++)
                    if(!selected[i])
                        global.menuTeams[i] = "";   
        }
    
    }
}
with (obj_uiListbox)
{
    if (argument0 == id)
    {
        global.select_list.selected[list[sID]] = selected[sID];
    }
}
