with(zui_create(round(window_get_width()*.5), round(window_get_height()/2), obj_uiWindow)){
    zui_set_size(522, 572);
    wID = "Editor Window";
    global.workshopID = -1;
    global.creator = -1;
    global.charVersion = 0;
    with(zui_create(0, 0, obj_uiWindowCaption))
        caption = "Heightmap Editor";
    with(zui_create(15, 39, obj_uiLabel)){
        caption = "Name: ";
        halign = fa_left;
    }
    with(zui_create(65, 30, obj_uiField)){
        callback = mapedit_ui;
        fID = 0;
        maxLength = string_width("WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
        width = maxLength+6;
        zui_set_anchor(0,0);
        zui_set_size(width,18);
    }
    with(zui_create(5, 54, obj_uiImage)){
        image = obj_mapEditor.mapeditSurf;
        type = 2;
        scale = 1;
        iID = 0;
    }
}
with(zui_create(round(window_get_width()*.5)+411, round(window_get_height()/2)-118 , obj_uiWindow)){
    zui_set_size(200,336);
    wID = "Materials Window";
    with(zui_create(0, 0, obj_uiWindowCaption))
        caption = "Materials";      
        
    with(zui_create(5, 44, obj_uiLabel)){
        caption = "Brush: ";
        halign = fa_left;
    }
    with(zui_create(60, 29, obj_uiButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(30, 30);
        caption = "1";
        callback = mapedit_ui;
        bID = 14;
    }
    with(zui_create(95, 29, obj_uiButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(30, 30);
        caption = "2";
        callback = mapedit_ui;
        bID = 15;
    }
    with(zui_create(130, 29, obj_uiButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(30, 30);
        caption = "3";
        callback = mapedit_ui;
        bID = 16;
    }
    with(zui_create(165, 29, obj_uiButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(30, 30);
        caption = "4";
        callback = mapedit_ui;
        bID = 17;
    }
    /*
    with(zui_create(5, 64, obj_uiButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "";
        callback = mapedit_ui;
        bID = 2;
        with(zui_create(5,5,obj_uiImage)){
            zui_set_anchor(0,0);
            height = 19;
            width = 20;
            type = 3;
            color = make_color_rgb( 48, 102,201);
        }
        with(zui_create(35, 15, obj_uiLabel)){
            caption = "Water";
            halign = fa_left;
        }
    }*/
    
    with(zui_create(100, 110, obj_uiLabel))
    {
        caption = "Height"
        halign = fa_center;
    }
    with(zui_create(10,120,obj_uiSlider))
    {
        zui_set_size(180, 26);
        zui_set_anchor(0,0);
        callback = mapedit_ui;
        slID = 1;
        value = 1;
        pos = 0;
    }


    with (zui_create(5, 274, obj_uiButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "";
        callback = mapedit_ui;
        bID = 8;
        with(zui_create(5+8,5+19,obj_uiImage)){
            zui_set_anchor(0,0);
            zui_set_size(20,20);
            image = spr_tree;
            scale = 2;
        }
        with(zui_create(35, 15, obj_uiLabel)){
            caption = "Trees";
            halign = fa_left;
        }
    }
    with(zui_create(50,320,obj_uiLabel)){
        caption = "0/30 Trees";
        lID = 1;
    }
    with (zui_create(150, 320, obj_uiButton)) {               
        zui_set_size(90, 26);
        caption = "Clear";
        callback = mapedit_ui;
        bID = 13;
    }
}
with(zui_create(round(window_get_width()*.5)+411, round(window_get_height()/2)+185, obj_uiWindow)){
    zui_set_size(200,200);
    wID = "File Window";
    
    with(zui_create(5, 5, obj_uiButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "Create New Map";
        callback = mapedit_ui;
        bID = 9;
    }
    with(zui_create(5, 40, obj_uiButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "Save Map";
        callback = mapedit_ui;
        bID = 10;
    }
    with(zui_create(5, 75, obj_uiButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "Import Color Map";
        callback = mapedit_ui;
        bID = 11;
    }
    with(zui_create(5, 110, obj_uiButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "Import Height Map";
        callback = mapedit_ui;
        bID = 18;
    }
    with(zui_create(5, 145, obj_uiButton)) {                                           
        zui_set_anchor(0,0);
        zui_set_size(190, 30);
        caption = "Overlay: Off";
        callback = mapedit_ui;
        bID = 12;
    }
    
    with(zui_create(15, __height - 14, obj_uiCheckbox))
    {
        type = 0;
        callback = mapedit_ui;
        cID = 0;
        value = 0;
        bID = 1;
    }
    with(zui_create(40, __height - 14, obj_uiLabel))
    {
        caption = "Add to Steam Workshop";
        halign = fa_left;
    }
}
