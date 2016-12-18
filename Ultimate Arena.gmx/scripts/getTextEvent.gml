///getTextEvent(state,ID1,ID2,...);
event = argument0;
ID = argument1;


ini_open(working_directory+"events\" + global.EVENT[event]);
total = ini_read_real("text","total",1);

randvar = ceil(random(total));


var c = ini_read_string("text","s"+string(randvar),"ERROR");
ini_close();




if (global.GENDER[ID] == 0)
{
    c = string_replace(c,"$1",global.NAMES[ID]);
    c = string_replace(c,"%1","he");
    c = string_replace(c,"@1","his");
    return string_replace(c,"*1","him");
}
else if(global.GENDER[ID] == 1)
{
    c = string_replace(c,"$1",global.NAMES[ID]);
    c = string_replace(c,"%1","she");
    c = string_replace(c,"@1","her");
    return string_replace(c,"*1","her");
}
