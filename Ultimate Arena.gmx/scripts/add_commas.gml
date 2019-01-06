///add_commas(integer, separation); 
/// @description Insert commas in a number, from right to left, every separation spaces 
/// @param {real} The input value 
/// @param {real} Number of digits grouped between commas 
var str = string(argument0); 
var sep = 3;
for (var i = string_length(str) - (sep - 1); i > 1; i -= sep) 
{ 
    str = string_insert(",", str, i); 
} 
return str;
