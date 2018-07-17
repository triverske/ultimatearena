if !surface_exists(map)
{
    map = surface_create(512,512);
    realmap = surface_create(662,662);
}

surface_set_target(map);
draw_background(global.bck_minimap,0,0);



with(obj_deadLocation)
    draw_self();

with(obj_tree)
    draw_self();

with(obj_landmine)
    draw_self();
    
with(obj_itemBag)
    draw_sprite(spr_itemBag,0,floor(x),floor(y))

with(obj_wood)
    draw_self();

with(obj_rope)
    draw_self();

with(obj_stone)
    draw_self();

with(obj_woodSpear)
    if(dropped)
        draw_self();

with(obj_steelSpear)
    if(dropped)
        draw_self();

with(obj_woodBow)
    if(dropped)
        draw_self();

with(obj_steelBow)
    if(dropped)
        draw_self();

with(obj_arenaEvent)
{
    draw_set_color(c_red);
    draw_set_alpha(1);
    draw_circle(x,y,radius0,1);
    draw_set_alpha(.1);
    draw_circle(x,y,radius0,0);
    draw_set_alpha(.5);
    draw_circle(x,y,radius1,1);
    draw_set_alpha(1);
}


draw_set_color(c_red);
with (obj_fighter)
{
    if(STATE == "SLEEP")
    {
        draw_sprite(spr_sleep,0,x,y-12);
    }


    if(other.showGroups)
    {
        if(group!=-1)
        {
            var c=-1;
            for(var i=0; i<other.totalGroups; i++)
            {
                if(other.groups[i,0] == group)
                {
                    c=i;
                    
                    
                }
            }   
            if(c==-1)
            {
                other.groups[other.totalGroups,0] = group;
                other.groups[other.totalGroups,1] = make_color_hsv((other.totalGroups*14)%255,255,(other.totalGroups%2+1)*127);
                
                c=other.totalGroups;
                other.totalGroups++;
            }
            if(group == id)
            {
                for(var e = 0;e < 6;e++)
                {
                    if(other.regGroup[e] == id)
                    {
                        switch(e)
                        {
                            case 0:
                                other.groups[c,1] = c_red;
                                break;
                            case 1:
                                other.groups[c,1] = c_orange;
                                break;
                            case 2:
                                other.groups[c,1] = c_yellow;
                                break;
                            case 3:
                                other.groups[c,1] = c_green;
                                break;
                            case 4:
                                other.groups[c,1] = c_blue;
                                break;
                            case 5:
                                other.groups[c,1] = c_purple;
                                break;
                        }
                    }
                }
            
            
                draw_rectangle_colour(x-6,y-13,x+6,y+2,c_white,c_white,c_white,c_white,0);
            }
            draw_rectangle_colour(x-5,y-12,x+5,y+1,other.groups[c,1],other.groups[c,1],other.groups[c,1],other.groups[c,1],0);
        }
    }
    
    if(fighterID == other.sanityleader)
    {
        draw_sprite_ext(spr_fighterLowAlpha,0,x+irandom_range(-2,2),y+irandom_range(-4,2),1,1,0,c_fuchsia,1);
        draw_sprite_ext(spr_fighterLowAlpha,0,x+irandom_range(-2,2),y+irandom_range(-4,2),1,1,0,c_fuchsia,1);
        draw_sprite_ext(spr_fighterLowAlpha,0,x+irandom_range(-2,2),y+irandom_range(-4,2),1,1,0,c_fuchsia,1);
    }
    if(fighterID == other.killleader)
    {
        other.skullx = smooth_approach(other.skullx,x,.1);
        other.skully = smooth_approach(other.skully,y-12,.1);
    }
    
    draw_sprite_ext(spr_fighter,INSANE,x,y,1,1,0,color,1);
}

with (obj_explosion)
    draw_self();

draw_sprite(spr_skull,0,skullx,skully);

with(obj_popup)
    draw_self();

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

if(instance_exists(obj_arenaEvent))
{
    draw_set_alpha(.6)
    draw_rectangle_colour(0,512-24,512,512,c_red,c_red,c_maroon,c_maroon,0);
    draw_set_alpha(1);
    draw_set_halign(fa_middle);
    draw_text_colour(256,512-21,"Arena Event! " + obj_arenaEvent.description,c_white,c_white,c_silver,c_silver,1);
}

surface_reset_target();
global.testmap = realmap;
