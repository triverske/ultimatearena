///generate_map_from_sprite(id)
//only for use in obj_mapEditor
//sets mapGrid
//returns map sprite

var sprite = argument0;

var totalTrees = 30;
var currentTrees = 0;

var surf = surface_create(256,256);
surface_set_target(surf);
draw_sprite(sprite,0,0,0);
surface_reset_target();

var green  = make_color_rgb( 69, 157, 69);
var blue   = make_color_rgb( 48, 102,201);
var yellow = make_color_rgb(222, 196,104);
var brown1 = make_color_rgb(164, 141, 60);
var brown2 = make_color_rgb(130, 112, 48);
var brown3 = make_color_rgb( 94,  80, 34);
var color = 0;

// set tiles
surface_set_target(mapeditSurf);
for (var i=255; i>-1; i-=2){
for (var j=255; j>-1; j-=2){
    color = surface_getpixel(surf,i,j);
    if(color == blue){
        if(i == 255 || j == 255){
            ds_grid_set(mapGrid,i,j,0);
            draw_rectangle_colour(i,j,i,j,blue,blue,blue,blue,0);
            if(i!=255){
                ds_grid_set(mapGrid,i+1,j,0);
                draw_rectangle_colour(i+1,j,i+1,j,blue,blue,blue,blue,0);
            }
            else if(j!=255){
                ds_grid_set(mapGrid,i,j+1,0);
                draw_rectangle_colour(i,j+1,i,j+1,blue,blue,blue,blue,0);
            }
        }
        else{
            ds_grid_set_region(mapGrid,i,j,i+1,j+1,0);
            draw_rectangle_colour(i,j,i+1,j+1,blue,blue,blue,blue,0);
        }
    }
    else if(color == yellow){
        if(i == 255 || j == 255){
            ds_grid_set(mapGrid,i,j,1);
            draw_rectangle_colour(i,j,i,j,yellow,yellow,yellow,yellow,0);
            if(i!=255){
                ds_grid_set(mapGrid,i+1,j,1);
                draw_rectangle_colour(i+1,j,i+1,j,yellow,yellow,yellow,yellow,0);
            }
            else if(j!=255){
                ds_grid_set(mapGrid,i,j+1,1);
                draw_rectangle_colour(i,j+1,i,j+1,yellow,yellow,yellow,yellow,0);
            }
        }
        else{
            ds_grid_set_region(mapGrid,i,j,i+1,j+1,1);
            draw_rectangle_colour(i,j,i+1,j+1,yellow,yellow,yellow,yellow,0);
        }
    }
    else if(color == green){
        if(i == 255 || j == 255){
            ds_grid_set(mapGrid,i,j,2);
            draw_rectangle_colour(i,j,i,j,green,green,green,green,0);
            if(i!=255){
                ds_grid_set(mapGrid,i+1,j,2);
                draw_rectangle_colour(i+1,j,i+1,j,green,green,green,green,0);
            }
            else if(j!=255){
                ds_grid_set(mapGrid,i,j+1,2);
                draw_rectangle_colour(i,j+1,i,j+1,green,green,green,green,0);
            }
        }
        else{
            ds_grid_set_region(mapGrid,i,j,i+1,j+1,2);
            draw_rectangle_colour(i,j,i+1,j+1,green,green,green,green,0);
        }
    }
    else if(color == brown1){
        if(i == 255 || j == 255){
            ds_grid_set(mapGrid,i,j,3);
            draw_rectangle_colour(i,j,i,j,brown1,brown1,brown1,brown1,0);
            if(i!=255){
                ds_grid_set(mapGrid,i+1,j,3);
                draw_rectangle_colour(i+1,j,i+1,j,brown1,brown1,brown1,brown1,0);
            }
            else if(j!=255){
                ds_grid_set(mapGrid,i,j+1,3);
                draw_rectangle_colour(i,j+1,i,j+1,brown1,brown1,brown1,brown1,0);
            }
        }
        else{
            ds_grid_set_region(mapGrid,i,j,i+1,j+1,3);
            draw_rectangle_colour(i,j,i+1,j+1,brown1,brown1,brown1,brown1,0);
        }
    }
    else if(color == brown2){
        if(i == 255 || j == 255){
            ds_grid_set(mapGrid,i,j,4);
            draw_rectangle_colour(i,j,i,j,brown2,brown2,brown2,brown2,0);
            if(i!=255){
                ds_grid_set(mapGrid,i+1,j,4);
                draw_rectangle_colour(i+1,j,i+1,j,brown2,brown2,brown2,brown2,0);
            }
            else if(j!=255){
                ds_grid_set(mapGrid,i,j+1,4);
                draw_rectangle_colour(i,j+1,i,j+1,brown2,brown2,brown2,brown2,0);
            }
        }
        else{
            ds_grid_set_region(mapGrid,i,j,i+1,j+1,4);
            draw_rectangle_colour(i,j,i+1,j+1,brown2,brown2,brown2,brown2,0);
        }
    }
    else if(color_get_hue(color) >= 120 && color_get_hue(color) < 184 && color_get_saturation(color) >= 76 && color_get_value(color) >= 20){     //water
        if(i == 255 || j == 255){
            ds_grid_set(mapGrid,i,j,0);
            draw_rectangle_colour(i,j,i,j,blue,blue,blue,blue,0);
            if(i!=255){
                ds_grid_set(mapGrid,i+1,j,0);
                draw_rectangle_colour(i+1,j,i+1,j,blue,blue,blue,blue,0);
            }
            else if(j!=255){
                ds_grid_set(mapGrid,i,j+1,0);
                draw_rectangle_colour(i,j+1,i,j+1,blue,blue,blue,blue,0);
            }
        }
        else{
            ds_grid_set_region(mapGrid,i,j,i+1,j+1,0);
            draw_rectangle_colour(i,j,i+1,j+1,blue,blue,blue,blue,0);
        }
        color = blue;
    }
    else if(color_get_hue(color) >= 53 && color_get_hue(color) < 120 && color_get_saturation(color) >= 76 && color_get_value(color) >= 20){ //grass
        if(i == 255 || j == 255){
            ds_grid_set(mapGrid,i,j,2);
            draw_rectangle_colour(i,j,i,j,green,green,green,green,0);
            if(i!=255){
                ds_grid_set(mapGrid,i+1,j,2);
                draw_rectangle_colour(i+1,j,i+1,j,green,green,green,green,0);
            }
            else if(j!=255){
                ds_grid_set(mapGrid,i,j+1,2);
                draw_rectangle_colour(i,j+1,i,j+1,green,green,green,green,0);
            }
        }
        else{
            ds_grid_set_region(mapGrid,i,j,i+1,j+1,2);
            draw_rectangle_colour(i,j,i+1,j+1,green,green,green,green,0);
        }
        color = green;
    }
    else{                                                                                                                                   //mountain3
        if(i == 255 || j == 255){
            ds_grid_set(mapGrid,i,j,5);
            draw_rectangle_colour(i,j,i,j,brown3,brown3,brown3,brown3,0);
            if(i!=255){
                ds_grid_set(mapGrid,i+1,j,5);
                draw_rectangle_colour(i+1,j,i+1,j,brown3,brown3,brown3,brown3,0);
            }
            else if(j!=255){
                ds_grid_set(mapGrid,i,j+1,5);
                draw_rectangle_colour(i,j+1,i,j+1,brown3,brown3,brown3,brown3,0);
            }
        }
        else{
            ds_grid_set_region(mapGrid,i,j,i+1,j+1,5);
            draw_rectangle_colour(i,j,i+1,j+1,brown3,brown3,brown3,brown3,0);
        }
        color = brown3;
    }
    if(i==1){
        ds_grid_set(mapGrid,i-1,j,ds_grid_get(mapGrid,i,j));
        ds_grid_set(mapGrid,i-1,j-1,ds_grid_get(mapGrid,i,j));
        draw_rectangle_colour(i-1,j,i-1,j,color,color,color,color,0);
        draw_rectangle_colour(i-1,j-1,i-1,j-1,color,color,color,color,0);
    }
    if(j==1){
        ds_grid_set(mapGrid,i,j-1,ds_grid_get(mapGrid,i,j));
        ds_grid_set(mapGrid,i-1,j-1,ds_grid_get(mapGrid,i,j));
        draw_rectangle_colour(i,j-1,i,j-1,color,color,color,color,0);
        draw_rectangle_colour(i-1,j-1,i-1,j-1,color,color,color,color,0);
    }
}
}
surface_reset_target();
surface_free(surf);

//create trees
var check = ds_grid_value_exists(mapGrid,0,0,255,255,2);
if(check){
    while(currentTrees < totalTrees)
    {
        var rand1 = irandom(255);
        var rand2 = irandom(255);
        if(ds_grid_get(mapGrid,rand1,rand2) == 2)
        {
            treeArray[currentTrees,0] = rand1*2;
            treeArray[currentTrees,1] = rand2*2;
            currentTrees++;
        }
    }
}
