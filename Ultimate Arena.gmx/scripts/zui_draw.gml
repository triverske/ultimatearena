///zui_draw() *
__dx = __x * argument2 + argument0;
__dy = __y * argument3 + argument1;
__sx = __scalex * argument2;
__sy = __scaley * argument3;
__ax = __width * __anchorx;
__ay = __height * __anchory;

if (!__visible)
 return 0;

d3d_transform_set_translation(-__ax, -__ay, 0);
d3d_transform_add_scaling(__sx, __sy, 1);
d3d_transform_add_translation(__dx, __dy, 0);
event_perform(ev_draw, 0);

if (__auto) {
 for (var i = 0; i < __childs; ++i) {
  with (__child[i]) {
   zui_draw(other.__dx - other.__sx * other.__ax, other.__dy - other.__sy * other.__ay, other.__sx, other.__sy);
  }
 }
}
