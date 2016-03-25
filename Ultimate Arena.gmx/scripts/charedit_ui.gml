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
            
            ini_open(working_directory + "characters\" + global.fNAME[sID])
            global.editStats[0] = min(10,ini_read_real("character","strength",5));
            global.editStats[1] = min(10,ini_read_real("character","agility",5));
            global.editStats[2] = min(10,ini_read_real("character","endurance",5));
            global.editStats[3] = min(10,ini_read_real("character","skill",5));
            global.editStats[4] = min(10,ini_read_real("character","luck",5));
            var gen = ini_read_real("character","gender",0)
            var s1 = ini_read_string("think","s1","");
            ini_close();
            
            with(objUIWindow)
            {
                if(wID == "Phrase Editor")
                    text = s1
            }
            
            with(objUICheckbox)
            {
                if(gen == cID)
                {
                    value = 1;
                }
                else
                {
                    value = 0;
                }
            }
            
            
            with(objUILabel)
                if(lID > 0)
                    caption = string(global.editStats[lID - 1]);
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
            var charname = keyboard_string;
            file = get_open_filename("Image File|*.png;*.jpg;*.jpeg", "");
            if(file != "")
            {
                var newsp = sprite_add(file,0,0,0,0,0);
                var surf = surface_create(128,128);
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
            keyboard_string = charname;
        }
        if(bID == 2) //Save Character
        {
            ini_open(working_directory + "characters\" + keyboard_string + ".ini");
            ini_write_string("character","name",keyboard_string);
            ini_write_string("character","image",keyboard_string+".png");
            
            ini_write_real("character","colorr",global.editColors[global.editColor,0]);
            ini_write_real("character","colorg",global.editColors[global.editColor,1]);
            ini_write_real("character","colorb",global.editColors[global.editColor,2]);
            newGender = 0;
            with(objUICheckbox)
            {
                if(value == 1)
                    other.newGender = cID;
            }
            ini_write_real("character","gender",newGender)
            
            ini_write_real("character","strength",global.editStats[0]);
            ini_write_real("character","agility",global.editStats[1]);
            ini_write_real("character","endurance",global.editStats[2]);
            ini_write_real("character","skill",global.editStats[3]);
            ini_write_real("character","luck",global.editStats[4]);
            
            with(objUIWindow)
            {
                if(wID == "Phrase Editor")
                {
                    if(text != "")
                    {
                        ini_write_string("think","s1",text);
                        ini_write_real("think","total",1);
                    }
                }
            }
            
            ini_close();
            
            for(i=0;i<5;i++)
                global.editStats[i] = 5;
                
            with(objUILabel)
                if(lID > 0)
                    caption = "5";
                
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
        if(bID == 7) //Increase Stat
        {
            global.editStats[stat]++;
            
            if(global.editStats[stat] > 10)
                global.editStats[stat] = 10;
                
            with(objUILabel)
                if(lID == other.stat + 1)
                    caption = string(global.editStats[other.stat]);
        }
        if(bID == 8) //Decrease Stat
        {
            global.editStats[stat]--;
            
            if(global.editStats[stat] < 1)
                global.editStats[stat] = 1;
                
            with(objUILabel)
                if(lID == other.stat + 1)
                    caption = string(global.editStats[other.stat]);
        }
        if(bID == 9) //Fighter Color
        {
            global.editColor = type;
            with(oUIImageButton)
            {
                if(global.editColor != type)
                    color = c_gray;
                else
                    color = c_white;
            }
        }
        if(bID == 10) //Change catchphrase
        {
            get_string_async("Enter a catchphrase","");
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
with(objUIWindow)
{
    if(argument0 == id)
    {
        if(wID == "Phrase Editor")
        {
            draw_set_valign(fa_top);
            draw_set_halign(fa_left);
            draw_sprite(spr_updateBox,0,0,29);
            draw_sprite_stretched(global.newImage,1,5,29+5,64,64);
            
            if(text != "")
                draw_text_ext(75,29+5,text,14,305);
            else
                draw_text_ext(75,29+5,"NO CATCHPHRASE",14,305);
                
            draw_text(338,29+59,"00:00:00");
        }
    }
}
