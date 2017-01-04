///getTextM(state,ID1,ID2,...);
var state = argument[0];

ini_open("text.ini");
var total = ini_read_real(state,"total",1);
var randvar = ceil(random(total));
var c = ini_read_string(state,"s"+string(randvar),"ERROR");
ini_close();

var i = 1;
while(i < argument_count && argument[i] != 0){
    if(global.GENDER[argument[i]] == 0)
    {
        c = string_replace_all(c,"$"+string(i),global.NAMES[argument[i]]);
        c = string_replace_all(c,". %"+string(i),". He");
        c = string_replace_all(c,"%"+string(i),"he");
        c = string_replace_all(c,". @"+string(i),". His");
        c = string_replace_all(c,"@"+string(i),"his");
        c = string_replace_all(c,". *"+string(i),". Him");
        c = string_replace_all(c,"*"+string(i),"him");
    }
    else if(global.GENDER[argument[i]] == 1)
    {
        c = string_replace_all(c,"$"+string(i),global.NAMES[argument[i]]);
        c = string_replace_all(c,". %"+string(i),". She");
        c = string_replace_all(c,"%"+string(i),"she");
        c = string_replace_all(c,". @"+string(i),". Her");
        c = string_replace_all(c,"@"+string(i),"her");
        c = string_replace_all(c,". *"+string(i),". Her");
        c = string_replace_all(c,"*"+string(i),"her");
    }
    else if(global.GENDER[argument[i]] == 2)
    {
        c = string_replace_all(c,"$"+string(i),global.NAMES[argument[i]]);
        c = string_replace_all(c,". %"+string(i),". They");
        c = string_replace_all(c,"%"+string(i),"they");
        c = string_replace_all(c,". @"+string(i),". Their");
        c = string_replace_all(c,"@"+string(i),"their");
        c = string_replace_all(c,". *"+string(i),". Them");
        c = string_replace_all(c,"*"+string(i),"them");
    }
    i++;
}
return c;
