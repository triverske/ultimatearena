/* Script that refreshes the tiles. Only show the tiles inside the view for performance
 *
 * Returns nothing
 *
 */

// delete all the tiles
tile_layer_delete(1000000);

// find tile positions in view
var view_w = view_wview / tile_size;
var view_h = view_hview / tile_size;
var xl = max(floor(x / tile_size) - floor(view_w), 0);
var xw = min(floor(x / tile_size) + floor(view_w), width - 1);
var yl = max(floor(y / tile_size) - floor(view_h), 0);
var yh = min(floor(y / tile_size) + floor(view_h), height - 1);

// add the new tiles
for (var i = xl; i < xw; i++) {
  for (var j = yl; j < yh; j++) {
    switch (global.grid[i, j]) {
      // define your tiles here
      // water
      case 0: tile_add(bg_tiles, 32, 0, tile_size, tile_size, i * tile_size, j * tile_size, 1000000); break;
      // beach
      case 1: tile_add(bg_tiles, 0, 32, tile_size, tile_size, i * tile_size, j * tile_size, 1000000); break;
      // grass
      case 2: tile_add(bg_tiles, 0, 0, tile_size, tile_size, i * tile_size, j * tile_size, 1000000); break;
      // mountain
      case 3: tile_add(bg_tiles, 32, 32, tile_size, tile_size, i * tile_size, j * tile_size, 1000000); break;
    }
  }
}