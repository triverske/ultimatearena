///arena_fighter_ui(id)

with (objUIButton)
{
    if (argument0 == id && fID > 0)
    {
        if(bID == 0) //Food + Drink
        {
            with(fID)
            {
                HUNGER = 100;
                THIRST = 100;
            }
        }
        if(bID == 1) //Kill
        {
            with(fID)
            {
                drop_items();
                instance_destroy();
            }
        
        }
        if(bID == 2)
        {
            if(!instance_exists(obj_moveFighter))
            {
                if(instance_exists(fID))
                {
                    m = instance_create(0,0,obj_moveFighter)
                    m.fighter = fID; 
                }
            }
        }
        if(bID == 3)
        {
            with(fID)
            {
                if(group != -1)
                    group = -1;
            }
        }
    
    }
}
with (id)
{
    if(object_index == objUILabel)
    {
        if(instance_exists(fighter) && fighter > 0)
        {
            caption = fighter.caption;
        }
        else
        {
            caption = global.deathCause[fighterID];
        }
    }
}
