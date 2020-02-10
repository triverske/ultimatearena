var buffer = argument0;
var xp = argument1;
var yp = argument2;

var height = buffer_peek(buffer, 4, buffer_f32);
var offset = (4 * ((xp * height) + yp)) + 8;
return(buffer_peek(buffer,offset,buffer_u8));
