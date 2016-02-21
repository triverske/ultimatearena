///zui_destroy()
for (var i = __childs - 1; i >= 0; --i) {
 with (__child[i]) {
  zui_destroy();
 }
}

with (__parent) {
 zui_remove_child(other.id);
}

instance_destroy();
