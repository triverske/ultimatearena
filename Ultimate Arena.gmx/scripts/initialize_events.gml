directory = 0;
directory[0] = "";
initialize_directory("events");
var l = array_length_1d(directory);

if(l != 0)
{
    for(i=0;i<l-1;i++)
    {
        global.EVENT[i] = directory[i] + "\" + directory[i] + ".ini";
        global.eNAME[i] = directory[i];
    }
}
global.EVENT_COUNT = i;
