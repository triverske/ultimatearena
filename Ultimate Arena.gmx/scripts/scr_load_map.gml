///scr_load_map(file name)
// Load a custom map

var totaltrees = 30;
global.trees = 0;
var totalwood = 10;
global.wood = 0;
var totalrope = 5;
global.rope = 0;
var totalstone = 5;
global.stone = 0;

background_assign(global.bck_minimap,background_add(argument0,0,0));

var surf = surface_create(512,512);
surface_set_target(surf);
draw_background(global.bck_minimap,0,0);

var green  = make_color_rgb( 69, 157, 69);
var blue   = make_color_rgb( 48, 102,201);
var yellow = make_color_rgb(222, 196,104);
var brown1 = make_color_rgb(164, 141, 60);
var brown2 = make_color_rgb(130, 112, 48);
var brown3 = make_color_rgb( 94,  80, 34);

// set tiles
for (var i=0; i<256; i++){
for (var j=0; j<256; j++){
    switch(surface_getpixel(surf,i,j)){
    case(blue):
        global.grid[i,j] = 0;
        break;
    case(yellow):
        global.grid[i,j] = 1;
        break;
    case(green):
        global.grid[i,j] = 2;
        break;
    case(brown1):
    case(brown2):
    case(brown3):
        global.grid[i,j] = 3;
        break;
    }
}
}
//minimap background
draw_background_stretched(global.bck_minimap,0,0,512,512);
background_assign(global.bck_minimap,background_create_from_surface(surf,0,0,512,512,0,0));

//create trees
while(global.trees < totaltrees)
{
    var rand1 = irandom(512);
    var rand2 = irandom(512);
    if (surface_getpixel(surf,rand1,rand2) == green)
    {
        global.treeloc[global.trees,0] = rand1;
        global.treeloc[global.trees,1] = rand2;
        draw_sprite(sTree,0,rand1,rand2);
        global.trees++;
    }
}

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

surface_reset_target();
surface_free(global.mapsurf);
global.mapsurf = surf;
