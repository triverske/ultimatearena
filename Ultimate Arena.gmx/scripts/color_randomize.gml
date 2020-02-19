///color_randomize(color,intensity)
var col = argument0;
var in = argument1;

var h = color_get_red(col);
var s = color_get_green(col);
var v = color_get_blue(col);

return make_color_hsv(h,s+random_range(-in,in),v+random_range(-in,in));
