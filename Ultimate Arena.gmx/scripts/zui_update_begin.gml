///zui_update_begin() *

// ** TODO : do not use zui_update_begin
__hover = 0;

for (var i = __childs - 1; i >= 0; --i) {
 with (__child[i]) {
  zui_update_begin();
 }
}
