var WS = global.WSCALE;
var HS = global.HSCALE;

var i0 = argument0;
var i1 = argument1;
var i2 = argument2;
var i3 = argument3;

with(zui_main())
{
    with(zui_create(WS/3-WS*.2,HS/2,obj_uiWindow))
    {
        wID = "Bless";
        zui_set_size(500,700);
        zui_set_position(floor(WS / 2 + WS / 12),HS / 2);
        callback = workshop_ui;
        
        with(zui_create(0, 0, obj_uiWindowCaption)) 
        {
            caption = "Selected Item";
            draggable = 0; 
            //type = 99;
        }
        
        with(zui_create(0,0,obj_uiLabel))
        {
            zui_set_position(10,400);
            callback = workshop_ui;
            caption = "TEST";
            lID = 1;
            halign = fa_left;
        }
        
        with(zui_create(10,40,obj_uiLabel))
        {
            caption = i0;
            halign = fa_left;
            valign = fa_top;
        }
        with(zui_create(10,60,obj_uiLabel))
        {
            caption = i1;
            halign = fa_left;
            valign = fa_top;
        }
        with(zui_create(10,80,obj_uiLabel))
        {
            if(i2 == ugc_visibility_friends_only)
                caption = "Visible to Friends Only";
            else if(i2 == ugc_visibility_private)
                caption = "Not Visible to Public";
            else if(i2 == ugc_visibility_public)
                caption = "Visible to Public";
            halign = fa_left;
            valign = fa_top;
        }
        
        with(zui_create(10,600,obj_uiButton))
        {
            callback = workshop_ui;
            bID = 1;
            workshopID = i3;
            zui_set_size(235,40);
            zui_set_anchor(0,0);
            caption = "Open Workshop Page";
        }
        with(zui_create(255,600,obj_uiButton))
        {
            callback = workshop_ui;
            bID = 2;
            workshopID = i3;
            zui_set_size(235,40);
            zui_set_anchor(0,0);
            caption = "Update Item";
        }
        with(zui_create(10,650,obj_uiButton))
        {
            callback = workshop_ui;
            bID = 3;
            zui_set_size(480,40);
            zui_set_anchor(0,0);
            caption = "Submit Update";
        }
        
        /*
        
        with(zui_create(250,420,obj_uiLabel))
            caption = "Workshop Visibility";
        
        with(zui_create(125, 475, obj_uiCheckbox))
        {
            type = 1;
            callback = charedit_ui;
            cID = 0;
            bID = 1;
            if(i2 == ugc_visibility_public)
                value = 1;
        }
        with(zui_create(125,500,obj_uiLabel))
            caption = "Public";
        
        with(zui_create(250, 475, obj_uiCheckbox))
        {
            type = 1;
            callback = charedit_ui;
            cID = 1;
            bID = 1;
            if(i2 == ugc_visibility_friends_only)
                value = 1;
        }
        with(zui_create(250,500,obj_uiLabel))
            caption = "Friends Only";
            
        with(zui_create(375, 475, obj_uiCheckbox))
        {
            type = 1;
            callback = charedit_ui;
            cID = 2;
            bID = 1;
            if(i2 == ugc_visibility_private)
                value = 1;
        }
        with(zui_create(375,500,obj_uiLabel))
            caption = "Private";
            
        */
    }
}
