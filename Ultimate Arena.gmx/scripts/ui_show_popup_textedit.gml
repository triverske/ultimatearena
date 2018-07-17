///ui_show_popup_textedit(caption)

with(obj_uiMain){
    var _black = zui_create(0, 0, obj_uiBlack, -1000);

    with(zui_create(__width * 0.5, __height * 0.5, obj_uiWindow, -1001)) {
        zui_set_size(256, 150);
        black = _black;

        with(zui_create(0, 0, obj_uiWindowCaption))
            caption = "NOTICE";
  
        with(zui_create(zui_get_width() * 0.5, 48, obj_uiLabel))
            caption = argument0;
            
        with(zui_create(10, zui_get_height() - 66, obj_uiField)){
            zui_set_anchor(0,0);
            width = 236;
            zui_set_size(width,18);
            callback = textedit_ui;
            maxLength = string_width("How long should I allow this to be?");
            fID = 1;
        }
            
        with(zui_create(10, zui_get_height() - 38, obj_uiButton)){
            zui_set_anchor(0,0);
            zui_set_size(96, 28);
            caption = "OK";
            bID = 8;
            callback = textedit_ui;
        }
        with(zui_create(116, zui_get_height() - 38, obj_uiButton)){
            zui_set_anchor(0,0);
            zui_set_size(130, 28);
            caption = "CANCEL";
            bID = 0;
            callback = ui_popup_close;
        }
    }
}
