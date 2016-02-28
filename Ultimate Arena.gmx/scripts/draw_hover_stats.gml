///draw_hover_stats(fighter)

var c = argument0;
var mxPos = mouse_x * (global.WSCALE/1280);
var myPos = mouse_y * (global.HSCALE/720);
if(instance_exists(c))
{
    draw_sprite(spr_hoverStats,0,mxPos,myPos);
    draw_sprite_stretched(global.IMAGES[c.fighterID],0,mxPos-79,myPos-23,22,22);
    draw_set_halign(fa_center);
    draw_text(mxPos + 12,myPos - 12,c.NAME);
    //draw_text(mxPos + 12,myPos - 12,string(mxPos));
}
