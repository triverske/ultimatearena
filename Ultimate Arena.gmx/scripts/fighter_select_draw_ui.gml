ui_draw_sprite_panel(sListBoxItem, 0, 16, 0, ypos[i], __width - 15, 16);
draw_text(22,(ypos[i] + 7),list[i]);
if(global.IDselected == i)
{
    draw_set_alpha(.7);
    draw_rectangle(0, ypos[global.IDselected], __width - 15, ypos[global.IDselected]+16, 0);
    draw_set_alpha(1);
    draw_set_colour(c_black);
    draw_text(22,(ypos[global.IDselected] + 7),list[global.IDselected]);
    draw_set_colour(c_white);
}
draw_rectangle_colour(3,ypos[i]+1,15,ypos[i]+12,c_green,c_green,c_green,c_green,selected[i]);
