selected[i] = global.select_list.selected[list[i]];


ui_draw_sprite_panel(sListBoxItem, 0, 16, 0, ypos[i], __width - 15, 16);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_text(22,(ypos[i] + 7),global.cNAME[list[i]]);
draw_rectangle_colour(3,ypos[i]+1,15,ypos[i]+12,c_green,c_green,c_green,c_green,selected[i]);

draw_set_color(c_white);


/*
ui_draw_sprite_panel(sListBoxItem, 0, 16, 0, ypos[i], __width - 15, 16);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_text(4,(ypos[i] + 7),global.cNAME[list[i]]);

draw_set_color(c_white);*/
