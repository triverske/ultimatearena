ui_draw_sprite_panel(sListBoxItem, 0, 16, 0, ypos[i], __width - 15, 16);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_text(22,(ypos[i] + 7),list[i]);
if(sID == i)
{
    draw_set_alpha(.7);
    draw_rectangle(0, ypos[sID], __width - 15, ypos[sID]+16, 0);
    draw_set_alpha(1);
    draw_set_colour(c_black);
    draw_text(22,(ypos[sID] + 7),list[sID]);
    draw_set_colour(c_white);
}
draw_rectangle_colour(3,ypos[i]+1,15,ypos[i]+12,c_green,c_green,c_green,c_green,selected[i]);

draw_set_color(c_white);
