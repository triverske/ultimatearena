///zui_remove_child(id) *
for (var i = 0; i < __childs; ++i) {
 if (__child[i] = argument0) {
  for (var j = i; j < __childs - 1; ++j) {
   __child[j] = __child[j + 1];
  }
  __childs--; 
  return 0;
 }
}