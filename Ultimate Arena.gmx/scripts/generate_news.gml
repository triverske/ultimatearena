var img = noone;
var newsImage = 0;
var oldHeadline = newsHeadline;
if(newsIssue == 0)
{
    newsHeadline = string(global.fighters) + " FIGHTERS ENTER THE ULTIMATE ARENA!";
    newsImage = 4;
    newsIssue++;
}
else
{
    while(newsHeadline == oldHeadline)
    {
        var rnd = irandom(4);
        
        if(rnd == 0)
        {
            newsHeadline = "AND THEN THERE WERE " + string(global.fighters_remaining);
            newsImage = choose(2,4,6,7);
        }
        else if(rnd == 1)
        {
            newsHeadline = "COMPUTER ODDLY CERTAIN ABOUT " + string_upper(global.NAMES[obj_sideMenu.xpleader]) + " VICTORY"; 
            img = global.IMAGES[obj_sideMenu.xpleader];
            newsImage = choose(0,1,3,5);
        }
        else
        {
            newsHeadline = string_upper(global.NAMES[obj_sideMenu.killleader]) + " DOMINATES WITH " + string(obj_sideMenu.killleaderkills) + " KILLS!";
            img = global.IMAGES[obj_sideMenu.killleader];
            newsImage = choose(0,1,3,5);
        }
    }
}

var newsOpen = false;
with(obj_uiWindow)
    if(wID == "Ultimate News")
        newsOpen = true;

if(!newsOpen)
    global.newsLook = true;
else
    global.newsLook = false;

news = surface_create(600,576);
surface_set_target(news);
draw_clear_alpha(c_white,1);
draw_set_colour_write_enable(1,1,1,0);
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
        //show_debug_message("i:" + string(i) + " , AMT:" + string(amt));
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
                //show_debug_message("GET");
                if(nd <= 8)
                    draw_text(300,445 + nd*15,tx);
                nd++;
            }
        }
    }
}
draw_set_alpha(1);


draw_set_color(c_white);
draw_sprite(spr_testnewsimage,newsImage,10,190);

draw_set_color(c_lime);
if(newsImage == 0)
    draw_line(47,227,266,232);
else if(newsImage == 1)
    draw_line(47,227,295,236);
else if(newsImage == 3)
    draw_line(47,227,255,269);
else if(newsImage == 5)
    draw_line(47,227,251,241);
draw_set_color(c_white);

texture_set_interpolation(1);
if(img != noone)
    draw_sprite_stretched(img,0,15,195,64,64);
texture_set_interpolation(0);
draw_set_colour_write_enable(1,1,1,1);
surface_reset_target();
ds_list_clear(newsFightersDead);
