///string_to_color(string)
///
///Converts string in format #FFFFFF to a gamemaker color you can use in draw methods, etc.

var str = string_delete(argument0,1,1)
var charlist = "0123456789ABCDEF"

var r = (string_pos(string_char_at(str,1),charlist) - 1) * 16 + (string_pos(string_char_at(str,2),charlist) - 1)
var g = (string_pos(string_char_at(str,3),charlist) - 1) * 16 + (string_pos(string_char_at(str,4),charlist) - 1)
var b = (string_pos(string_char_at(str,5),charlist) - 1) * 16 + (string_pos(string_char_at(str,6),charlist) - 1)

return make_colour_rgb(real(r),real(g),real(b))
