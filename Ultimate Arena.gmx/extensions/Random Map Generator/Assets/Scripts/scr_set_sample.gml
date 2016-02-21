/* Script to set a value in our grid
 *
 * Arguments:
 * 0: x position in the grid
 * 1: y position in the grid
 * 2: value to put in the grid
 *
 * Returns nothing
 *
 */

if (seamless) {
  grid[(argument0 & (width - 1)) + (argument1 & (height - 1)) * width] = argument2;
} else {
  if (argument0 >= 0 && argument0 < width && argument1 >= 0 && argument1 < height) {
    grid[argument0, argument1] = argument2;
  }
}
