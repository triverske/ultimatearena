///createTwitchName(text)

with (oTwitchName)
{
    currentPos++;
}
i = instance_create(room_width-276,60,oTwitchName);

if (global.boxColor == 0)
    i.color = c_0;
else
    i.color = c_1;

i.text = argument0;
i.name = string_extract(argument0," ",0);

if (global.boxColor == 0)
    global.boxColor = 1;
else
    global.boxColor = 0; 
