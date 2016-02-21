///charedit_ui(id)
with(oUIListBox)
{
    if(argument0 == id)
    {
        if(global.IDselected == argument0.sID)
            global.IDselected = -1;
        else
            global.IDselected = argument0.sID;
    }
}
with(objUIButton)
{
    if(argument0 == id)
    {
        if(bID == 0)
        {
            c = instance_create(0,0,oRoomTransition);
            c.gotoroom = rm_title;
        }
        if(bID == 1)
        {
            file = get_open_filename("image|*.png", "");
            newsp = sprite_add(file,0,0,0,0,0);
            surf = surface_create(128,128);
            surface_set_target(surf);
            draw_sprite_stretched(newsp,0,0,0,128,128);
            surface_reset_target();
            
            global.newImage = sprite_create_from_surface(surf,0,0,128,128,0,0,0,0);
            
            sprite_delete(newsp);
            surface_free(surf);
            
            with(oUIImage)
            {
                if(bID == 0)
                {
                
                    image = global.newImage;
                }
            }
        }
        if(bID == 2)
        {
            ini_open(working_directory + "characters\" + keyboard_string + ".ini");
            ini_write_string("character","name",keyboard_string);
            ini_write_string("character","image",keyboard_string+".png");
            
            newGender = 0;
            with(objUICheckbox)
            {
                if(value == 1)
                    other.newGender = cID;
            }
            ini_write_real("character","gender",newGender)
            ini_close();
                
            sprite_save(global.newImage,0,working_directory + "characters\" + keyboard_string +".png");
            
            
        }
    }
}
with(oUIImage)
{
    if(argument0 == id)
    {
        if(global.IDselected >= 0)
            image = global.IMAGES[global.IDselected];
    }
}
with(objUIField)
{
    if(argument0 == id)
    {
        if(fID == 0)
        {
        }
        //code here for saving text to .ini
    }
}
with(objUICheckbox)
{
    if(argument0 == id)
    {
    }
}
