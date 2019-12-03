
if(newsIssue == -1)
{
    newsHeadline = string(global.fighters) + " FIGHTERS ENTER THE ULTIMATE ARENA!";
}
else
{
    var rnd = irandom(4);
    
    if(rnd == 0)
    {
        newsHeadline = "AND THEN THERE WERE " + string(global.fighters_remaining);
    }
    else if(rnd == 1)
    {
        newsHeadline = "COMPUTER ODDLY CERTAIN ABOUT " + string_upper(global.NAMES[obj_sideMenu.xpleader]) + " VICTORY"; 
    }
    else
    {
        newsHeadline = string_upper(global.NAMES[obj_sideMenu.killleader]) + " DOMINATES WITH " + string(obj_sideMenu.killleaderkills) + " KILLS!";
    }
}

news = surface_create(600,600);
surface_set_target(news);
draw_sprite(spr_newspaper,0,0,0);
draw_set_font(fnt_headline);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_set_alpha(.9);
draw_text_ext(300,128,newsHeadline,38,580);
draw_set_font(font0);
var amt = ds_list_size(newsFightersDead);
if(amt > 0)
{
    draw_text(300,443,"OBITUARIES");
    var nd = 1;
    var tx = "";
    var tx2 = "";
    for(var i = 0;i < amt;i++)
    {
        tx2 += global.NAMES[newsFightersDead[| i]] + " - " + global.deathCause[newsFightersDead[| i]];
        show_debug_message("i:" + string(i) + " , AMT:" + string(amt));
        if(i != (amt - 1))
            tx2 += ", ";
        if(string_width(tx2) > 590)
        {
            if(nd < 8)
                draw_text(300,445 + nd*15,tx);
            else if(nd == 8)
                draw_text(300,445 + nd*15,"more OBITUARIES on PAGE " + string(irandom(10) + 2));
            else
                draw_text(300,445 + nd*15,"");
            nd++;
            tx = "";
            tx2 = "";
        }
        else
        {
            tx = tx2;
            if(i == amt - 1)
            {
                if(nd <= 8)
                    draw_text(300,445 + nd*15,tx);
                nd++;
            }
        }
    }
}
draw_set_alpha(1);
draw_set_color(c_white);
draw_sprite(spr_testnewsimage,0,10,190);
surface_reset_target();
ds_list_clear(newsFightersDead);
