///getTextEvent(state,ID1,ID2,...)
event = argument0;
ID = argument1;


ini_open(working_directory+"events\" + global.EVENT[event]);
total = ini_read_real("text","total",1);

randvar = ceil(random(total));


var c = ini_read_string("text","s"+string(randvar),"ERROR");
ini_close();




if (global.GENDER[ID] == 0)
{
    var d = string_replace(c,"$1",global.NAMES[ID]);
    var e = string_replace(d,"%1","he");
    var f = string_replace(e,"@1","his");
    return string_replace(f,"*1","him");
}
else if(global.GENDER[ID] == 1)
{
    d = string_replace(c,"$1",global.NAMES[ID]);
    e = string_replace(d,"%1","she");
    f = string_replace(e,"@1","her");
    return string_replace(f,"*1","her");
}
