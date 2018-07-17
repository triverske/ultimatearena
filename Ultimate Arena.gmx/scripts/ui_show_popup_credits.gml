///ui_show_popup(caption)

with (obj_uiMain) {
 var _black = zui_create(0, 0, obj_uiBlack, -1000);

 with (zui_create(__width * 0.5, __height * 0.5, obj_uiWindow, -1001)) {
  zui_set_size(500, 300);
  
  black = _black;
  
  with (zui_create(0, 0, obj_uiWindowCaption)) {
   caption = "Ultimate Arena Credits";
  }
  
  with (zui_create(zui_get_width() * 0.5, zui_get_height() * 0.5 - 8, obj_uiLabel)) 
  {
   caption = 
   "Ultimate Arena v" + global.VERSION + "##
   Developed by House Bonneau & Triverske#
   Programmers: Troy Bonneau, Matt Mozingo##
   Github Contributors#SquirrelJay, zeaga, Proncs,#YellowAfterLife
   Copyright 2016-2018";
  }
  
  with (zui_create(zui_get_width() * 0.5, zui_get_height() - 24, obj_uiButton)) {
   zui_set_size(100, 28);
   caption = "OK";
   callback = ui_popup_close;
  }
 }
}
