///ui_exit

with (objZUIMain) {
 var _black = zui_create(0, 0, objUIBlack, -1000);

 with (zui_create(__width * 0.5, __height * 0.5, objUIWindow, -1001)) {
  zui_set_size(256, 112);
  
  black = _black;
  
  with (zui_create(0, 0, objUIWindowCaption)) {
   caption = "NOTICE";
  }
  
  with (zui_create(zui_get_width() * 0.5, zui_get_height() * 0.5 - 8, objUILabel)) {
   caption = "Would you like to return#to the main menu?";
  }
  
  with (zui_create(zui_get_width() * 0.5 - 2, zui_get_height() - 24, objUIButton)) {
   zui_set_size(96, 28);
   zui_set_anchor(1,.5);
   caption = "Yes";
   callback = ui_exit;
  }
  with (zui_create(zui_get_width() * 0.5 + 2, zui_get_height() - 24, objUIButton)) {
   zui_set_size(96, 28);
   zui_set_anchor(0,.5);
   caption = "No";
   callback = ui_popup_close;
  }
 }
}
