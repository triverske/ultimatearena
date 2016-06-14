
ui_draw_sprite_panel(sListBoxItem, 0, 16, 0, ypos[i], __width - 15, 16);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_text(4,ypos[i]+7,list[i]);
draw_set_halign(fa_right);
draw_set_color(c_red);
draw_text(__width - 17,ypos[i]+7,global.deadday[i+1]);
draw_set_color(c_white);
