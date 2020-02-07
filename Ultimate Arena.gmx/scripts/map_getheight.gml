var xx = round(argument0);
var yy = round(argument1);
pixel = buffer_peek(heiBuff, 4 * (xx + yy * 1024), buffer_u32)    // extracts info in ABGR Format
a = (pixel >> 24) & $ff;    // Alpha [0-255]    
r = pixel & $ff;         // Red [0-255]  
g = (pixel >> 8) & $ff;     // Green [0-255]    
b = (pixel >> 16) & $ff;   // Blue [0-255] 
return(r)
