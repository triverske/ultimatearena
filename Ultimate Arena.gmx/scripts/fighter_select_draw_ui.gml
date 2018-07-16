ui_draw_sprite_panel(spr_listBoxItem, 0, 16, 0, ypos[i], __width - 15, 16);


var teaminfo = global.menuTeams[i];
if(teaminfo != "")
{
    draw_set_color(get_color(i));
    draw_set_alpha(.24);
    draw_rectangle(0, ypos[i], __width - 15, ypos[i]+16, 0);
    draw_set_alpha(1);
    if(global.cTYPE[i] == 0)
        draw_set_color(c_white);
    else
        draw_set_color(c_aqua);
    draw_text(22,(ypos[i] + 7),list[i] + " - " + teaminfo + " TEAM");
    
    if(global.IDselected == i)
    {
        draw_set_alpha(.7);
        draw_rectangle(0, ypos[global.IDselected], __width - 15, ypos[global.IDselected]+16, 0);
        draw_set_alpha(1);
        draw_set_colour(c_black);
        draw_text(22,(ypos[global.IDselected] + 7),list[global.IDselected] + " - " + teaminfo + " TEAM");
        draw_set_colour(c_white);
    }
}
else
{
    if(global.cTYPE[i] == 0)
        draw_set_color(c_white);
    else
        draw_set_color(c_aqua);
    draw_text(22,(ypos[i] + 7),list[i]);
    draw_set_color(c_white);
    
    if(global.IDselected == i)
    {
        draw_set_alpha(.7);
        draw_rectangle(0, ypos[global.IDselected], __width - 15, ypos[global.IDselected]+16, 0);
        draw_set_alpha(1);
        draw_set_colour(c_black);
        draw_text(22,(ypos[global.IDselected] + 7),list[global.IDselected]);
        draw_set_colour(c_white);
    }
}

draw_rectangle_colour(3,ypos[i]+1,15,ypos[i]+12,c_green,c_green,c_green,c_green,selected[i]);
