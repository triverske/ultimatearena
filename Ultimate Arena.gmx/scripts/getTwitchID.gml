///getTwitchID(str)
var s = "", i = 2;

while(string_char_at(argument0,i) != "!")
{
s += string_char_at(argument0,i);
i++;
}
return s;
