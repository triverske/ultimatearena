/* Main Script of the Diamond-Square-Algorithm
 *
 * Arguments:
 * 0: stepsize
 * 1: scale
 *
 * Returns nothing
 *
 */

var stepsize = argument0;
var scale    = argument1;
var halfstep = stepsize / 2;

for (y = halfstep; y < (height + halfstep); y += stepsize) {
  for (x = halfstep; x < (width + halfstep); x += stepsize) {
    scr_sample_square(x, y, stepsize, random_range(-1, 1) * scale);
  }
}
 
for (y = 0; y < height; y += stepsize) {
  for (x = 0; x < width; x += stepsize) {
    scr_sample_diamond(x + halfstep, y, stepsize, random_range(-1, 1) * scale);
    scr_sample_diamond(x, y + halfstep, stepsize, random_range(-1, 1) * scale);
  }
}
