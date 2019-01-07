///evselect_ui()
with(obj_uiListbox)
{
    if(argument0 == id)
    {
        if(!instance_exists(obj_arenaEvent))
        {
            if(global.arena_events)
            {
                with(instance_create(0,0,obj_placeItem))
                {
                    event = 1;
                    evOverride = other.sID;
                }
            }
        }
    }
}
