///load_game(fname);
//Open save file

ini_open(argument0);
    
//Check if valid file
if(!ini_section_exists("Map") || !ini_section_exists("Fighters"))
{
    ini_close();
    ui_show_popup("INVALID SAVE FILE");
    exit;
}

//Load
var errorcheck = 0;
global.fighters = ini_read_real("Map","fighters",0);
var f = global.fighters;
for(var i=1; i<f+1; i++)
{
    if(ini_key_exists("Map",string(i)+"NAMES"))
        global.NAMES[i] = ini_read_string("Map",string(i)+"NAMES","NAMING ERROR");
    else errorcheck = 1;
    if(ini_key_exists("Map",string(i)+"GENDER"))
        global.GENDER[i] = ini_read_real("Map",string(i)+"GENDER",0);
    else errorcheck = 1;
    if(ini_key_exists("Map",string(i)+"SOUNDS"))
        global.SOUNDS[i] = ini_read_string("Map",string(i)+"SOUNDS","");
    else errorcheck = 1;
    if(ini_key_exists("Map",string(i)+"FILES"))
        global.FILES[i] = ini_read_string("Map",string(i)+"FILES","");
    else errorcheck = 1;
    if(ini_key_exists("Map",string(i)+"COLORS"))    
        global.COLORS[i] = ini_read_real("Map",string(i)+"COLORS",0);
    else errorcheck = 1;
    
    if(ini_key_exists("Map",string(i)+"STATS0"))
    { 
        global.STATS[i,0] = ini_read_real("Map",string(i)+"STATS0",5);
        global.STATS[i,1] = ini_read_real("Map",string(i)+"STATS1",5);
        global.STATS[i,2] = ini_read_real("Map",string(i)+"STATS2",5);
        global.STATS[i,3] = ini_read_real("Map",string(i)+"STATS3",5);
        global.STATS[i,4] = ini_read_real("Map",string(i)+"STATS4",5);
    }
    else errorcheck = 1;
    
    if(ini_key_exists("Map",string(i)+"IMAGES"))
        global.IMAGES[i] = ini_read_real("Map",string(i)+"IMAGES",spr_defaultFighterImage);
    else errorcheck = 1;
}
global.IMAGES[0] = spr_defaultFighterImage;
global.fighters = f;
ini_close();

if(errorcheck)
{
    ui_show_popup("INVALID SAVE FILE");
    exit;
}
    
global.saveFile = argument0;
var c = instance_create(0,0,oRoomTransition);
c.gotoroom = rm_game;
global.loadingGame = 1;

