if !surface_exists(updates)
{
    updates = surface_create(390,74*25);
}

draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_white); draw_set_font(font0);
surface_set_target(updates);
with (oUpdateBox)
{
    draw_sprite(spr_updateBox,boxColor,0,y);
    
    if(fighters == 1)
    {
        draw_sprite_stretched(image1,1,x+5,y+5,64,64);
        if (dead > 0)
            draw_sprite_stretched(sDeadX,1,x+5,y+5,64,64);
        
        
    }
    else if (fighters == 4)
    {
        draw_sprite_stretched(image1,1,x+5,y+5,32,32);
        if (image2 != global.IMAGES[0])
            draw_sprite_stretched(image2,1,x+37,y+37,32,32);
        if (image3 != global.IMAGES[0])
            draw_sprite_stretched(image3,1,x+37,y+5,32,32);
        if (image4 != global.IMAGES[0])
            draw_sprite_stretched(image4,1,x+5,y+37,32,32);
        if (dead > 0)
            draw_sprite_stretched(sDeadX,1,x+37,y+37,32,32);
    }
    draw_text_ext(x+75,y+5,text,14,305);
    draw_text(x+338,y+59,time);
}
surface_reset_target();
global.surf_updates = updates;
