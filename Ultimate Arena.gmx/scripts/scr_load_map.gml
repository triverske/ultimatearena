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
var color = 0;

// set tiles
for (var i=255; i>-1; i-=2){
for (var j=255; j>-1; j-=2){
    color = surface_getpixel(surf,i,j);
    if(color_get_hue(color) >= 120 && color_get_hue(color) < 184 && color_get_saturation(color) >= 76 && color_get_value(color) >= 20){     //water
        global.grid[i,j] = 0;
        if(i<255)
            global.grid[i+1,j] = 0;
        if(j<255)
            global.grid[i,j+1] = 0;
        if(i<255 && j<255)
            global.grid[i+1,j+1] = 0;
    }
    else if(color_get_hue(color) >= 53 && color_get_hue(color) < 120 && color_get_saturation(color) >= 76 && color_get_value(color) >= 20){ //grass
        global.grid[i,j] = 2;
        if(i<255)
            global.grid[i+1,j] = 2;
        if(j<255)
            global.grid[i,j+1] = 2;
        if(i<255 && j<255)
            global.grid[i+1,j+1] = 2;
    }
    else if(color == yellow){                                                                                                               //sand
        global.grid[i,j] = 1;
        if(i<255)
            global.grid[i+1,j] = 1;
        if(j<255)
            global.grid[i,j+1] = 1;
        if(i<255 && j<255)
            global.grid[i+1,j+1] = 1;
    }
    else{
        global.grid[i,j] = 3;
        if(i<255)
            global.grid[i+1,j] = 3;
        if(j<255)
            global.grid[i,j+1] = 3;
        if(i<255 && j<255)
            global.grid[i+1,j+1] = 3;
    }
    if(i==1)
        global.grid[i-1,j] = global.grid[i,j];
    if(j==1)
        global.grid[i,j-1] = global.grid[i,j];
    if(i==1 && j==1)
        global.grid[i-1,j-1] = global.grid[i,j];
}
}
//minimap background
draw_background_stretched(global.bck_minimap,0,0,512,512);
background_assign(global.bck_minimap,background_create_from_surface(surf,0,0,512,512,0,0));

//create trees
var check = 0;
for (var i=255; i>-1; i--){
    for (var j=255; j>-1; j--){
        if(global.grid[i,j] == 2){
            check = 1;
            break;
        }
    }
    if(check)
        break
}
if(check){
while(global.trees < totaltrees)
{
    var rand1 = irandom(255);
    var rand2 = irandom(255);
    if (global.grid[rand1,rand2] == 2)
    {
        global.treeloc[global.trees,0] = rand1*2;
        global.treeloc[global.trees,1] = rand2*2;
        draw_sprite(spr_tree,0,rand1*2,rand2*2);
        global.trees++;
    }
}
}
//create wood
while(global.wood < totalwood)
{
    var rand1 = irandom(255);
    var rand2 = irandom(255);
    if (global.grid[rand1,rand2] != 0)
    {
        global.woodloc[global.wood,0] = rand1*2;
        global.woodloc[global.wood,1] = rand2*2;
        global.wood++;
    }
}

//create rope
while(global.rope < totalrope)
{
    var rand1 = irandom(255);
    var rand2 = irandom(255);
    if (global.grid[rand1,rand2] != 0)
    {
        global.ropeloc[global.rope,0] = rand1*2;
        global.ropeloc[global.rope,1] = rand2*2;
        global.rope++;
    }
}

//create stone
while(global.stone < totalstone)
{
    var rand1 = irandom(255);
    var rand2 = irandom(255);
    if (global.grid[rand1,rand2] != 0)
    {
        global.stoneloc[global.stone,0] = rand1*2;
        global.stoneloc[global.stone,1] = rand2*2;
        global.stone++;
    }
}

surface_reset_target();
surface_free(global.mapsurf);
global.mapsurf = surf;
