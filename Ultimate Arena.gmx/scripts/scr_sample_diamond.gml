/* Script to change the value of a given position 
 * relative to the neighbours
 *
 * Arguments:
 * 0: x position in the grid
 * 1: y position in the grid
 * 2: size of the grid
 * 3: value at current position
 *
 * Returns nothing
 *
 */

var hs = argument2 / 2;
 
var a = scr_sample(argument0 - hs, argument1);
var b = scr_sample(argument0 + hs, argument1);
var c = scr_sample(argument0, argument1 - hs);
var d = scr_sample(argument0, argument1 + hs);
 
scr_set_sample(argument0, argument1, ((a + b + c + d) / 4.0) + argument3);
