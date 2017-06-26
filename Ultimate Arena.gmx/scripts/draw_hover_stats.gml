///draw_hover_stats(fighter)

var c = argument0;
var mxPos = device_mouse_raw_x(0);
var myPos = device_mouse_raw_y(0);

if(instance_exists(c))
{
    draw_sprite(spr_hoverStats,0,mxPos,myPos);
    texture_set_interpolation(1);
    draw_sprite_stretched(global.IMAGES[c.fighterID],0,mxPos-79,myPos-23,22,22);
    texture_set_interpolation(0);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(mxPos + 12,myPos - 12,c.NAME);
}
