///charedit_ui(id)
with(oUIListBox)
{
    if(argument0 == id)
    {
        if(global.IDselected == argument0.sID)
        {
            global.IDselected = -1;
        }
        else
        {
            global.IDselected = argument0.sID;
            keyboard_string = global.cNAME[sID];
            global.newImage = global.cIMAGES[sID];
        }
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
            file = get_open_filename("Image File|*.png;*.jpg;*.jpeg", "");
            if(file != "")
            {
                newsp = sprite_add(file,0,0,0,0,0);
                surf = surface_create(128,128);
                surface_set_target(surf);
                draw_sprite_stretched(newsp,0,0,0,128,128);
                surface_reset_target();
                
                global.newImage = sprite_create_from_surface(surf,0,0,128,128,0,0,0,0);
                
                sprite_delete(newsp);
                surface_free(surf);
            }
            else
            {
                global.newImage = sFighterImage;
            }
            
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
                
            if(global.newImage != sFighterImage)
            {
                sprite_save(global.newImage,0,working_directory + "characters\" + keyboard_string +".png");
            }
            else
            {
                //Gamemaker doesn't let you save images from the resource tree.
                tempSprite = sprite_duplicate(sFighterImage);
                sprite_save(tempSprite,0,working_directory + "characters\" + keyboard_string +".png");
                sprite_delete(tempSprite);
            }
            
            initialize_characters();
            room_restart();
            keyboard_string = "";
        }
        if(bID == 4)
        {
            global.newImage = sFighterImage;
            keyboard_string = "";
            room_restart();
        }
        if(bID == 5)
        {
            if(global.IDselected != -1)
            {
                file_delete(working_directory + "characters\" + global.fNAME[global.IDselected]);
                initialize_characters();
                keyboard_string = "";
                room_restart();
            }
        }
        if(bID == 6) //Add sound
        {
            file = get_open_filename("Sound File|*.ogg", "");
            if(file != "")
            {
                //with the current setup I don't think it's possible to get a file then save it in the character directory
            }
        }
    }
}
with(oUIImage)
{
    if(argument0 == id)
    {
        if(global.IDselected >= 0)
            image = global.cIMAGES[global.IDselected];
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
