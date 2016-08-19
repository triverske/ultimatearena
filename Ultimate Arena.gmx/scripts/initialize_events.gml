directory[0] = "";
initialize_directories("events");
var l = array_length_1d(directory);

if(l != 0)
{
    for(i=0;i<l;i++)
    {
        global.EVENT[i] = directory[i] + "\" + directory[i] + ".ini";
    }
}

global.EVENT_COUNT = i;
