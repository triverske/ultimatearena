///draw_hover_stats(fighter)

var c = argument0;
if(instance_exists(c))
{
    draw_sprite(spr_hoverStats,0,mouse_x,mouse_y);
    draw_sprite_stretched(global.IMAGES[c.fighterID],0,mouse_x-79,mouse_y-23,22,22);
    draw_set_halign(fa_center);
    draw_text(mouse_x + 12,mouse_y - 12,c.NAME);
}
