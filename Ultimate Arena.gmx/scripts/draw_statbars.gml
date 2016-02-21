///draw_statbars(p1,p2,p3,p4,status)
p1 = argument0;
p2 = argument1;
p3 = argument2;
p4 = argument3;
status = argument4;
c = 61/100
if(p4<0)
    p4 = 0;

draw_sprite(sStatusCheck,0,153,72);
if(status == 0)
{
    draw_text(260,82,"Status: Alive");
}
else
{
    draw_text(260,82,"Status: Dead");
}
draw_set_alpha(.6); draw_set_color(c_black);
draw_rectangle(304,93,304 - (61-(p1*c)),98,0);
draw_rectangle(304,103,304 - (61-(p2*c)),108,0);
draw_rectangle(304,113,304 - (61-(p3*c)),118,0);
draw_rectangle(304,123,304 - (61-(p4*c)),128,0);
draw_set_alpha(1);
