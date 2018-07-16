with(zui_create(445,348,objUIWindow,-1))
{
    if (global.GAMETYPE == 0)
    {
        wID = "Sandbox";
        callback = arena_ui;
        zui_set_size(140,524);
        with(zui_create(0,0,objUIWindowCaption))
        {
            caption = "Sandbox";
            draggable = 1;
        }
        with(zui_create(70,151,oUIImageButton,-1))
        {
            zui_set_size(90,90);
            image = spr_sandboxButtons;
            callback = arena_ui;
            bID = 81;
        }
        with(zui_create(70,289,oUIImageButton,-1))
        {
            zui_set_size(90,90);
            image = spr_sandboxButtons;
            callback = arena_ui;
            bID = 82;
        }
        with(zui_create(70,429,oUIImageButton,-1))
        {
            zui_set_size(90,90);
            image = spr_sandboxButtons;
            callback = arena_ui;
            bID = 83;
        }
    }
    else if (global.GAMETYPE == 1)
    {
        wID = "Sponsor Menu";
        callback = arena_ui;
        zui_set_size(140,524);
        with(zui_create(0,0,objUIWindowCaption))
        {
            caption = "Sponsor";
            draggable = 1;
        }
    }
    zui_create(0,0,oUIExitButton,-1);
}
