///zui_shared_qsort(left, right, compare, swap)
var i, j, p, tmp;

if (argument0 < argument1) {
 i = argument0;
 j = argument1;
 p = argument0;

 while (i < j) {
  while (script_execute(argument2, j, p) > 0)
   j--;

  while (i < j && script_execute(argument2, i, p) <= 0)
   i++;
  
  script_execute(argument3, i, j);
 }

 script_execute(argument3, argument0, i);

 zui_shared_qsort(argument0, i - 1, argument2, argument3);
 zui_shared_qsort(i + 1, argument1, argument2, argument3);
}
