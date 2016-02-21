///zui_update() *
var rx = __dx - __ax * __sx;
var ry = __dy - __ay * __sy;

if (__visible && __enabled && global.__zui_mx >= rx && global.__zui_my >= ry && global.__zui_mx < rx + __width * __sx && global.__zui_my < ry + __height * __sy) { 
 for (var i = __childs - 1; i >= 0; --i) {
  with (__child[i]) {
   if (zui_update()) {
    other.__hover = 0;
    return 1;
   }
  }
 }
 
 __hover = 1;
 return 1;
} else {
 __hover = 0;
 return 0;
}