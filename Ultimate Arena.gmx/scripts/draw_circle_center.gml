///draw_circle_center(x,y,radius,color);
//qiuck shit script only works <= 3
var xx     = argument0;
var yy     = argument1;
var radius = argument2;
var color  = argument3;

for(var i=-radius; i<radius+1; i++){
for(var j=-radius; j<radius+1; j++){
    if(abs(i)+abs(j) <= radius){
        draw_rectangle_colour(xx+i,yy+j,xx+i,yy+j,color,color,color,color,0);
    }
    if(radius == 3){
        if(abs(i) == radius-1 && abs(j) == radius-1)
            draw_rectangle_colour(xx+i,yy+j,xx+i,yy+j,color,color,color,color,0);
    }
}
}
