///update_get_event_text(state,ID1);
event = argument0;
ID = argument1;


ini_open(global.EVENT[event]);
total = ini_read_real("text","total",1);

randvar = ceil(random(total));

var c = ini_read_string("text","s"+string(randvar),"ERROR");
ini_close();

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
