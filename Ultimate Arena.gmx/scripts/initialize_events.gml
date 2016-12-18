global.EVENT = 0;
global.eNAME = 0;

directory = 0;
directory[0] = "";
var l = initialize_directory("events");

for(var i=0;i<l;i++)
{
    global.EVENT[i] = directory[i] + "\" + directory[i] + ".ini";
    global.eNAME[i] = directory[i];
}

global.EVENT_COUNT = i;
