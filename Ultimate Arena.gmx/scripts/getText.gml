///getText(state,ID1);
state = argument0;
ID = argument1;


ini_open("text.ini");
var total1 = ini_read_real(state,"total",1);
ini_close();
ini_open("Characters/" + global.FILES[ID])
var total2 = ini_read_real(state,"total",0);
ini_close();

var randvar = 0;
if(total2 > 0)
    randvar = irandom(1);

if(randvar)
{
    randvar = irandom(total2-1)+1;
    ini_open("Characters/" + global.FILES[ID]);
    var c = ini_read_string(state,"s"+string(randvar),"ERROR " + global.FILES[ID]);
    ini_close();
}
else
{
    randvar = irandom(total1-1)+1;
    ini_open("text.ini");
    var c = ini_read_string(state,"s"+string(randvar),"ERROR");
    ini_close();
}


if(global.GENDER[ID] == 0)
{
    c = string_replace_all(c,"$1",global.NAMES[ID]);
    c = string_replace_all(c,". %1",". He");
    c = string_replace_all(c,"%1","he");
    c = string_replace_all(c,". @1",". His");
    c = string_replace_all(c,"@1","his");
    c = string_replace_all(c,". *1",". Him");
    return string_replace_all(c,"*1","him");
}
else if(global.GENDER[ID] == 1)
{
    c = string_replace_all(c,"$1",global.NAMES[ID]);
    c = string_replace_all(c,". %1",". She");
    c = string_replace_all(c,"%1","she");
    c = string_replace_all(c,". @1",". Her");
    c = string_replace_all(c,"@1","her");
    c = string_replace_all(c,". *1",". Her");
    return string_replace_all(c,"*1","her");
}
else if(global.GENDER[ID] == 2)
{
    c = string_replace_all(c,"$1",global.NAMES[ID]);
    c = string_replace_all(c,". %1",". They");
    c = string_replace_all(c,"%1","they");
    c = string_replace_all(c,". @1",". Their");
    c = string_replace_all(c,"@1","their");
    c = string_replace_all(c,". *1",". Them");
    return string_replace_all(c,"*1","them");
}
