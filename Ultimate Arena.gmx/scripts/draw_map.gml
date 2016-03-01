if !surface_exists(map)
{
    map = surface_create(512,512);
    realmap = surface_create(662,662);
}

surface_set_target(map);
draw_background(global.bck_minimap,0,0);

with (oTree)
{
    draw_self();
}
with (oMine)
{
    draw_self();
}
with (oItems)
{
    draw_sprite(sItems,0,floor(x),floor(y))
}
with (oWood)
{
    draw_self();
}
with (oRope)
{
    draw_self();
}
with (oStone)
{
    draw_self();
}
with(oWSpear)
{
    if(dropped)
        draw_self();
}
with(oSSpear)
{
    if(dropped)
        draw_self();
}
with(oWBow)
{
    if(dropped)
        draw_self();
}
with(oSBow)
{
    if(dropped)
        draw_self();
}


draw_set_color(c_red);
with (oFighter)
{
    draw_sprite_ext(sFighterS,INSANE,x,y,1,1,0,c_white,1);
    //if (INV[0] != 0)
        //draw_text(x,y+3,string(INV[0]));
}

with (oExplosion)
{
    draw_self();
}

with(obj_popup)
{
    draw_self();
}
draw_rectangle_colour(1,1,511,511,c_0,c_0,c_0,c_0,true);

draw_set_alpha(dif(global.TIME_HOURS,12)*.02);
draw_rectangle_colour(1,1,511,511,c_navy,c_navy,c_navy,c_navy,false);
draw_set_alpha(1);

surface_reset_target();
surface_set_target(realmap);

draw_rectangle_colour(0,0,662,662,c_black,c_black,c_black,c_black,false);
draw_surface(map,75,75);

surface_reset_target();
surface_set_target(map);

if(instance_exists(oArenaEvent))
{
    draw_set_alpha(.6)
    draw_rectangle_colour(0,512-24,512,512,c_red,c_red,c_maroon,c_maroon,0);
    draw_set_alpha(1);
    draw_set_halign(fa_middle);
    draw_text_colour(256,512-21,"Arena Event! " + oArenaEvent.description,c_white,c_white,c_silver,c_silver,1);
}

surface_reset_target();
global.testmap = realmap;
