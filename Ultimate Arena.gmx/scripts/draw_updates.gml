if(!surface_exists(updates))
{
    updates = surface_create(390,74*25);
}

draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_white); 
draw_set_font(font0);
surface_set_target(updates);
draw_clear_alpha(0,0);
with(obj_updateBox)
{
    yp = y - other.updateScroll;
    if(yp > 1850)
        continue;
    
    draw_sprite(spr_updateBox,boxColor,0,yp);
    draw_sprite(spr_cameraButton,0,314,60+yp);
    
    texture_set_interpolation(1);
    if(fighters == 1)
    {
        draw_sprite_stretched(image1,imgFrame,x+5,yp+5,64,64);
        if(dead > 0)
            draw_sprite_stretched(spr_deadX,1,x+5,yp+5,64,64);
    }
    else if(fighters == 4)
    {
        draw_sprite_stretched(image1,iFrm[0],x+5,yp+5,32,32);
        if (image2 != global.IMAGES[0])
            draw_sprite_stretched(image2,iFrm[1],x+37,yp+37,32,32);
        if (image3 != global.IMAGES[0])
            draw_sprite_stretched(image3,iFrm[2],x+37,yp+5,32,32);
        if (image4 != global.IMAGES[0])
            draw_sprite_stretched(image4,iFrm[3],x+5,yp+37,32,32);
        if (dead > 0)
            draw_sprite_stretched(spr_deadX,1,x+37,yp+37,32,32);
    }
    texture_set_interpolation(0);
    
    draw_text_ext(x+75,yp+5,text,14,305);
    draw_text(x+338,yp+59,time);
}
surface_reset_target();
global.surf_updates = updates;
