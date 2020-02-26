///map_ui(id)

with (obj_uiListbox)
{
if (argument0 == id )
{
    var totaltrees = 30;
    global.trees = 0;
    var totalwood = 10;
    global.wood = 0;
    var totalrope = 5;
    global.rope = 0;
    var totalstone = 5;
    global.stone = 0;
    global.mapSelected = sID;
    ini_open(global.MAPS[sID]);
    if(global.mapTYPE[sID] == 0)
    {
        //Fill global.grid
        
        for(var i=0; i<256; i++){
            var str = ini_read_string("Map","Colors"+string(i),"");
            for(var j=0; j<256; j++){
                 var k = real(string_char_at(str,j+1));
                 if(k > 3){
                    global.grid[i,j] = 3;
                 }
                 else
                    global.grid[i,j] = k;
            }
        }
    }
    
    // create minimap surface
    var surf = surface_create(512, 512);
    surface_set_target(surf);
    
    
    if(global.mapTYPE[sID] == 0)
    {
        var spr = sprite_add(global.mapPICS[sID],1,0,0,0,0);
        draw_sprite_ext(spr,0,0,0,2,2,0,c_white,1);
    }
    else
    {
        var spr = sprite_add(global.mapOVERLAY[sID],1,0,0,0,0);
        draw_sprite_ext(spr,0,0,0,1,1,0,c_white,1);
    }
    var blue = make_color_rgb(48,102,201);
    //create wood
    while(global.wood < totalwood)
    {
        var rand1 = irandom(512);
        var rand2 = irandom(512);
        if (surface_getpixel(surf,rand1,rand2) != blue)
        {
            global.woodloc[global.wood,0] = rand1;
            global.woodloc[global.wood,1] = rand2;
            global.wood++;
        }
    }
    
    //create rope
    while(global.rope < totalrope)
    {
        var rand1 = irandom(512);
        var rand2 = irandom(512);
        if (surface_getpixel(surf,rand1,rand2) != blue)
        {
            global.ropeloc[global.rope,0] = rand1;
            global.ropeloc[global.rope,1] = rand2;
            global.rope++;
        }
    }
    
    //create stone
    while(global.stone < totalstone)
    {
        var rand1 = irandom(512);
        var rand2 = irandom(512);
        if (surface_getpixel(surf,rand1,rand2) != blue)
        {
            global.stoneloc[global.stone,0] = rand1;
            global.stoneloc[global.stone,1] = rand2;
            global.stone++;
        }
    }
    
    var spr2 = 0;
    if(global.mapOVERLAY[sID] != noone)
    {
        if(file_exists(global.mapOVERLAY[sID]))
        {
            spr2 = sprite_add(global.mapOVERLAY[sID],1,0,0,0,0);
            if(global.mapTYPE[sID] == 0)
                draw_sprite_ext(spr2,0,0,0,2,2,0,c_white,1);
            else
                draw_sprite_ext(spr2,0,0,0,1,1,0,c_white,1);
        }
    }
    
    // create the minimap background 
    background_delete(global.bck_minimap);
    background_assign(global.bck_minimap,background_create_from_surface(surf, 0, 0, 512, 512, 0, 0));
    
    // create trees
    for(var i=0; i<30; i++){
        if(ini_read_string("Trees",string(i),"ERROR") == "ERROR")
            break;
        global.treeloc[global.trees,0] = real(string_copy(ini_read_string("Trees",string(i),"000000"),1,3));
        global.treeloc[global.trees,1] = real(string_copy(ini_read_string("Trees",string(i),"000000"),4,3));
        if(global.mapTYPE[sID] == 0)
            draw_sprite(spr_tree,0,global.treeloc[global.trees,0],global.treeloc[global.trees,1]);
        global.trees++;
    }
    
    ini_close();
    surface_reset_target();
    sprite_delete(spr);
    if(spr2 != 0)
        sprite_delete(spr2);
    if(surface_exists(global.mapsurf))
        surface_free(global.mapsurf);
    global.mapsurf = surf;
}
}
