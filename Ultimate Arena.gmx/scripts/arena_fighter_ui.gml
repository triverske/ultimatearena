///arena_fighter_ui(id)

with (objUIButton)
{
    if (argument0 == id)
    {
        if(bID == 1)
        {
            with(fID)
            {
                drop_items();
                instance_destroy();
            }
        
        }
        if(bID == 0)
        {
            with(fID)
            {
                HUNGER = 100;
                THIRST = 100;
            }
        
        }
    
    }
}
