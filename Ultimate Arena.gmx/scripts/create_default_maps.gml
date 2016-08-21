///create_default_maps(width,height,featuresize,waterlevel,mountainlevel,beachsize,seamless)
/* Main script to generate a map
 *
 * Arguments:
 * 0: size of the map
 * 1: featuresize
 * 2: the waterlevel
 * 3: the size of the beaches
 *
 * Returns nothing
 *
 */
width         = argument0;
height        = argument0;
featuresize   = argument1;
waterlevel    = argument2;
mountainlevel = argument3;
beachsize     = argument4;
seamless      = argument5;

var totaltrees = 30;
var currenttrees = 0;
ini_open("Test.ini");
// create heightmap
for (var i = 0; i < width; i += featuresize) 
{
    for (var j = 0; j < height; j += featuresize) 
    {
        scr_set_sample(i, j, random_range(-1, 1));
    }
}

// build map
var samplesize = featuresize;
var scale = 1.0;
while (samplesize > 1) 
{
    scr_diamond_square(samplesize, scale);
    samplesize /= 2;
    scale /= 2.0;
}
    
// set tiles (Here you can add the tiles/terrains you want in the map)
/*global.grid = grid;
for (var i = 0; i < width; i += 1) 
{
    for (var j = 0; j < height; j += 1) 
    {
        // tiles
        if (scr_sample(i,j) > mountainlevel)
            global.grid[i,j] = 3; // mountain
        else if (scr_sample(i,j) > waterlevel)
            global.grid[i,j] = 2; // grass
        else if (scr_sample(i,j) > waterlevel - beachsize)
            global.grid[i,j] = 1; // sand
        else
            global.grid[i,j] = 0; // water
    }
}*/

// create minimap surface
var surf = surface_create(256, 256);
surface_set_target(surf);

var green  = make_color_rgb( 69, 157, 69);
var blue   = make_color_rgb( 48, 102,201);
var yellow = make_color_rgb(222, 196,104);
var brown1 = make_color_rgb(164, 141, 60);
var brown2 = make_color_rgb(130, 112, 48);
var brown3 = make_color_rgb( 94,  80, 34);
var map_tile_size = (256 / width);

// give each terrain a unique color in the minimap
var str = "";
var p = 0;
for (var i = 0; i < width; i += 1) {
  for (var j = 0; j < height; j += 1) {
    var point = scr_sample(i,j);
    if (point > mountainlevel + 0.4) {
      draw_set_color(brown1);
    } else if (point > mountainlevel + 0.2) {
      draw_set_color(brown2);
    } else if (point > mountainlevel) {
      draw_set_color(brown3);
    } else if (point > waterlevel) {
      draw_set_color(green);
    } else if (point > (waterlevel - beachsize)) {
      draw_set_color(yellow);
    } else {
      draw_set_color(blue);
    }
    draw_rectangle(i * map_tile_size, j * map_tile_size, (i + 1) * map_tile_size, (j + 1) * map_tile_size, false);
  }
}
var str = "";
var c = 0;
for(var i=0; i<256; i++){
    for(var j=0; j<256; j++){
        c = surface_getpixel(surf,i,j);
        if(c == blue)
            c=0;
        else if(c == yellow)
            c=1;
        else if(c == green)
            c=2;
        else if(c == brown3)
            c=3;
        else if(c == brown2)
            c=4;
        else if(c == brown1)
            c=5;
        str+=string(c);
    }
    ini_write_string("Map","Colors"+string(i),str);
    str = "";
}

// create trees
while(currenttrees < totaltrees)
{
    var rand1 = irandom(512);
    var rand2 = irandom(512);
    if (surface_getpixel(surf,round(rand1/2),round(rand2/2)) == green)
    {
        ini_write_string("Trees",string(currenttrees),string_format(rand1,3,0)+string_format(rand2,3,0));
        currenttrees++;
    }
}

surface_reset_target();
surface_save(surf,"Test.png");
ini_close();
surface_free(surf);
