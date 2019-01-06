///draw_statbars(p1,p2,p3,p4,status)
p1 = argument0;
p2 = argument1;
p3 = argument2;
p4 = argument3;
status = argument4;
var yPos = 36;

var c = 61/100
if(p4<0)
    p4 = 0;

draw_sprite(spr_fighterStats,0,153,yPos - 10);

texture_set_interpolation(1);
draw_sprite_stretched(global.IMAGES[fighter],time,155,yPos - 8,58,58);
texture_set_interpolation(0);
time += global.IMAGESP[fighter];

if(status == 0)
{
    draw_text(260,yPos,"Status: Alive");
}
else
{
    draw_text(260,yPos,"Status: Dead");
}

draw_set_alpha(.6); draw_set_color(c_black);
draw_rectangle(304,yPos + 11,304 - (61-(p1*c)),yPos + 16,0);
draw_rectangle(304,yPos + 21,304 - (61-(p2*c)),yPos + 26,0);
draw_rectangle(304,yPos + 31,304 - (61-(p3*c)),yPos + 36,0);
draw_rectangle(304,yPos + 41,304 - (61-(p4*c)),yPos + 46,0);
draw_set_alpha(1);
