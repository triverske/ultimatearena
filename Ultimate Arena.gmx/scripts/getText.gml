///getText(state,ID1,ID2,...)
state = argument0;
ID = argument1;


ini_open("text.ini");
total1 = ini_read_real(state,"total",1);
ini_close();
ini_open("Characters/" + global.FILES[ID])
total2 = ini_read_real(state,"total",0);
ini_close();
randvar = ceil(random(total1 + total2));

if(randvar <= total1)
{
    ini_open("text.ini");
    c = ini_read_string(state,"s"+string(randvar),"ERROR");
    ini_close();
}
else
{
    ini_open("Characters/" + global.FILES[ID]);
    c = ini_read_string(state,"s"+string(randvar - total1),"ERROR " + global.FILES[ID]);
    ini_close();
}


if (global.GENDER[ID] == 0)
{
    d = string_replace(c,"$1",global.NAMES[ID]);
    e = string_replace(d,"%1","he");
    f = string_replace(e,"@1","his");
    return string_replace(f,"*1","him");
}
else if(global.GENDER[ID] == 1)
{
    d = string_replace(c,"$1",global.NAMES[ID]);
    e = string_replace(d,"%1","she");
    f = string_replace(e,"@1","her");
    return string_replace(f,"*1","her");
}
else if(global.GENDER[ID] == 2)
{
    d = string_replace(c,"$1",global.NAMES[ID]);
    e = string_replace(d,"%1","they");
    f = string_replace(e,"@1","their");
    return string_replace(f,"*1","them");
}
