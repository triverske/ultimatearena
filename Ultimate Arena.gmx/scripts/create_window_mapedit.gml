with(zui_create(round(window_get_width()*.5), round(window_get_height()/2), objUIWindow)){
    zui_set_size(522, 572);
    wID = "Editor Window";
    
    with(zui_create(0, 0, objUIWindowCaption))
        caption = "Map Editor";
    with(zui_create(15, 39, objUILabel)){
        caption = "Name: ";
        halign = fa_left;
    }
    with(zui_create(65, 30, objUIField)){
        callback = mapedit_ui;
        fID = 0;
        maxLength = string_width("WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
        width = maxLength+6;
        zui_set_anchor(0,0);
        zui_set_size(width,18);
    }
    with(zui_create(5, 54, oUIImage)){
        image = oMapedit.mapeditSurf;
        type = 2;
        scale = 2;
        iID = 0;
    }
}
with(zui_create(round(window_get_width()*.5)+411, round(window_get_height()/2)-118 , objUIWindow)){
    zui_set_size(200,336);
    wID = "Materials Window";
    with(zui_create(0, 0, objUIWindowCaption))
        caption = "Materials";      
        
    with(zui_create(5, 44, objUILabel)){
        caption = "Brush: ";
        halign = fa_left;
    }
    with(zui_create(60, 29, objUIButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(30, 30);
        caption = "1";
        callback = mapedit_ui;
        bID = 14;
    }
    with(zui_create(95, 29, objUIButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(30, 30);
        caption = "2";
        callback = mapedit_ui;
        bID = 15;
    }
    with(zui_create(130, 29, objUIButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(30, 30);
        caption = "3";
        callback = mapedit_ui;
        bID = 16;
    }
    with(zui_create(165, 29, objUIButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(30, 30);
        caption = "4";
        callback = mapedit_ui;
        bID = 17;
    }
    with(zui_create(5, 64, objUIButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "";
        callback = mapedit_ui;
        bID = 2;
        with(zui_create(5,5,oUIImage)){
            zui_set_anchor(0,0);
            height = 19;
            width = 20;
            type = 3;
            color = make_color_rgb( 48, 102,201);
        }
        with(zui_create(35, 15, objUILabel)){
            caption = "Water";
            halign = fa_left;
        }
    }
    with (zui_create(5, 99, objUIButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "";
        callback = mapedit_ui;
        bID = 3;
        with(zui_create(5,5,oUIImage)){
            zui_set_anchor(0,0);
            height = 19;
            width = 20;
            type = 3;
            color = make_color_rgb(222, 196,104);
        }
        with(zui_create(35, 15, objUILabel)){
            caption = "Sand";
            halign = fa_left;
        }
    }
    with (zui_create(5, 134, objUIButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "";
        callback = mapedit_ui;
        bID = 4;
        with(zui_create(5,5,oUIImage)){
            zui_set_anchor(0,0);
            height = 19;
            width = 20;
            type = 3;
            color = make_color_rgb( 69, 157, 69);
        }
        with(zui_create(35, 15, objUILabel)){
            caption = "Grass";
            halign = fa_left;
        }
    }
    with(zui_create(5, 169, objUIButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "";
        callback = mapedit_ui;
        bID = 5;
        with(zui_create(5,5,oUIImage)){
            zui_set_anchor(0,0);
            height = 19;
            width = 20;
            type = 3;
            color = make_color_rgb(164, 141, 60);
        }
        with(zui_create(35, 15, objUILabel)){
            caption = "Mountain 1";
            halign = fa_left;
        }
    }
    with (zui_create(5, 204, objUIButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "";
        callback = mapedit_ui;
        bID = 6;
        with(zui_create(5,5,oUIImage)){
            zui_set_anchor(0,0);
            height = 19;
            width = 20;
            type = 3;
            color = make_color_rgb(130, 112, 48);
        }
        with(zui_create(35, 15, objUILabel)){
            caption = "Mountain 2";
            halign = fa_left;
        }
    }
    with (zui_create(5, 239, objUIButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "";
        callback = mapedit_ui;
        bID = 7;
        with(zui_create(5,5,oUIImage)){
            zui_set_anchor(0,0);
            height = 19;
            width = 20;
            type = 3;
            color = make_color_rgb( 94,  80, 34);
        }
        with(zui_create(35, 15, objUILabel)){
            caption = "Mountain 3";
            halign = fa_left;
        }
    }
    with (zui_create(5, 274, objUIButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "";
        callback = mapedit_ui;
        bID = 8;
        with(zui_create(5+8,5+19,oUIImage)){
            zui_set_anchor(0,0);
            zui_set_size(20,20);
            image = sTree;
            scale = 2;
        }
        with(zui_create(35, 15, objUILabel)){
            caption = "Trees";
            halign = fa_left;
        }
    }
    with(zui_create(50,320,objUILabel)){
        caption = "0/30 Trees";
        lID = 1;
    }
    with (zui_create(150, 320, objUIButton)) {               
        zui_set_size(90, 26);
        caption = "Clear";
        callback = mapedit_ui;
        bID = 13;
    }
}
with(zui_create(round(window_get_width()*.5)+411, round(window_get_height()/2)+195, objUIWindow)){
    zui_set_size(200,180);
    wID = "File Window";
    
    with(zui_create(5, 5, objUIButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "Create New Map";
        callback = mapedit_ui;
        bID = 9;
    }
    with(zui_create(5, 40, objUIButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "Save Map";
        callback = mapedit_ui;
        bID = 10;
    }
    with(zui_create(5, 75, objUIButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "Import Image Overlay";
        callback = mapedit_ui;
        bID = 11;
    }
    with(zui_create(5, 110, objUIButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "Generate Map From Overlay";
        callback = mapedit_ui;
        bID = 18;
    }
    with(zui_create(5, 145, objUIButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "Overlay: Off";
        callback = mapedit_ui;
        bID = 12;
    }
}
