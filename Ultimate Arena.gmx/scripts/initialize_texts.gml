global.TEXT = 0;
global.TEXTTOGGLE = 0;
global.TEXT_COUNT = 0;

directory = 0;
directory[0] = "";
var l = initialize_directory("texts");

global.TEXT[0] = "Default Updates";
ini_open("settings.ini");
global.TEXTTOGGLE[0] = ini_read_real("defaulttext","togglefile",1);
ini_close();

for(var i=1; i<=l; i++){
    global.TEXT[i] = directory[i-1];
    ini_open(working_directory+"texts\"+global.TEXT[i]+"\"+global.TEXT[i]+".ini");
    global.TEXTTOGGLE[i] = ini_read_real("toggle","toggle",1);
    ini_close();
}
global.TEXT_COUNT = i;
//194 total default texts
