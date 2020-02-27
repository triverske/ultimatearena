///draw_circle_center(x,y,radius,color);
//qiuck shit script only works <= 3
var xx     = argument0;
var yy     = argument1;
var radius = argument2;
var color  = argument3;

surface_set_target(mapeditSurf);
draw_set_color(color);
draw_circle(xx,yy,radius,0);
draw_set_color(c_white);
surface_reset_target();

surface_set_target(colorSurf);
var point = color_get_red(color);
if (point > 220)
    draw_set_color(c_white);
else if (point > 200)
  draw_set_color(brown1);
else if (point > 150)
  draw_set_color(brown2);
else if (point > 110) 
  draw_set_color(brown3);
else if (point > 20)
  draw_set_color(green);
else if (point > 10) 
  draw_set_color(yellow);
else 
  draw_set_color(blue);

draw_circle(xx,yy,radius,0);
draw_set_color(c_white);
surface_reset_target();

