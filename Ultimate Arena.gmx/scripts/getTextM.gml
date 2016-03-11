///getTextM(state,ID1,ID2,...)
state = argument0;
ID1 = argument1;
ID2 = argument2;
ID3 = argument3;
ID4 = argument4;


ini_open("text.ini");
total = ini_read_real(state,"total",1);
randvar = ceil(random(total));

c = ini_read_string(state,"s"+string(randvar),"ERROR");

ini_close();
if (global.GENDER[ID1] == 0)
{
    d = string_replace(c,"$1",global.NAMES[ID1]);
    e = string_replace(d,"%1","he");
    f = string_replace(e,"@1","his");
    c = string_replace(f,"*1","him");
}
else if(global.GENDER[ID1] == 1)
{
    d = string_replace(c,"$1",global.NAMES[ID1]);
    e = string_replace(d,"%1","she");
    f = string_replace(e,"@1","her");
    c = string_replace(f,"*1","her");
}
else if(global.GENDER[ID1] == 2)
{
    d = string_replace(c,"$1",global.NAMES[ID]);
    e = string_replace(d,"%1","they");
    f = string_replace(e,"@1","their");
    return string_replace(f,"*1","them");
}

if (ID2 != 0)
{
    if (global.GENDER[ID2] == 0)
    {
        d = string_replace(c,"$2",global.NAMES[ID2]);
        e = string_replace(d,"%2","he");
        f = string_replace(e,"@2","his");
        c = string_replace(f,"*2","him");
    }
    else if(global.GENDER[ID2] == 1)
    {
        d = string_replace(c,"$2",global.NAMES[ID2]);
        e = string_replace(d,"%2","she");
        f = string_replace(e,"@2","her");
        c = string_replace(f,"*2","her");
    }
    else if(global.GENDER[ID2] == 2)
    {
        d = string_replace(c,"$2",global.NAMES[ID]);
        e = string_replace(d,"%2","they");
        f = string_replace(e,"@2","their");
        return string_replace(f,"*2","them");
    }
    
    if (ID3 != 0)
    {
        if (global.GENDER[ID3] == 0)
        {
            d = string_replace(c,"$3",global.NAMES[ID3]);
            e = string_replace(d,"%3","he");
            f = string_replace(e,"@3","his");
            c = string_replace(f,"*3","him");
        }
        else if(global.GENDER[ID3] == 1)
        {
            d = string_replace(c,"$3",global.NAMES[ID3]);
            e = string_replace(d,"%3","she");
            f = string_replace(e,"@3","her");
            c = string_replace(f,"*3","her");
        }
        else if(global.GENDER[ID3] == 2)
        {
            d = string_replace(c,"$3",global.NAMES[ID]);
            e = string_replace(d,"%3","they");
            f = string_replace(e,"@3","their");
            return string_replace(f,"*3","them");
        }
        if (ID4 != 0)
        {
            if (global.GENDER[ID4] == 0)
            {
                d = string_replace(c,"$4",global.NAMES[ID4]);
                e = string_replace(d,"%4","he");
                f = string_replace(e,"@4","his");
                c = string_replace(f,"*4","him");
            }
            else if(global.GENDER[ID4] == 1)
            {
                d = string_replace(c,"$4",global.NAMES[ID4]);
                e = string_replace(d,"%4","she");
                f = string_replace(e,"@4","her");
                c = string_replace(f,"*4","her");
            }
            else if(global.GENDER[ID4] == 2)
            {
                d = string_replace(c,"$4",global.NAMES[ID]);
                e = string_replace(d,"%4","they");
                f = string_replace(e,"@4","their");
                return string_replace(f,"*4","them");
            }
        }
    }
}
return c;
