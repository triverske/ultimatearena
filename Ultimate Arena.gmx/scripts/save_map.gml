var file;
file = get_save_filename_ext("Map File|*.uam", "", working_directory, "Save Map");

if(file != "")
{
    ini_open(file)

    for (j = 0; j < 256; j++)
    {
        var t = "";
        for(i=0;i<256;i++)
            t+=string(global.grid[i,j]);    
        
        ini_write_string("map",string(j), t);
    }

    ini_close();
}
else
    ui_show_popup("Unable to save map");
