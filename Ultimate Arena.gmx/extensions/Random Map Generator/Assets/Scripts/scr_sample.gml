/* Script to get a value out of our grid
 *
 * Arguments:
 * 0: x position in the grid
 * 1: y position in the grid
 *
 * Returns value at position x, y in the grid
 *
 */

if (seamless) {
  return grid[(argument0 & (width - 1)) + (argument1 & (height - 1)) * width];
} else {
  if (argument0 >= 0 && argument0 < width && argument1 >= 0 && argument1 < height) {
    return grid[argument0, argument1];
  } else {
    return 0;
  }
}
