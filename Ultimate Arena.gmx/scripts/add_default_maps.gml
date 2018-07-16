var defaultM=0
var defaultT=0
var s = sprite_duplicate(spr_defaultMaps);

for(var i=1; i<4; i++){
    ini_open("DefaultMap"+string(i)+".ini");
    for(var j=255; j>-1; j--)
        defaultM[j] = ini_read_string("Map","Colors"+string(j),"ERROR");
    for(j=29; j>-1; j--)
        defaultT[j] = ini_read_string("Trees",string(j),"ERROR");
    ini_close();
    
    directory_create("maps\Default Map "+string(i));
    ini_open(working_directory+"maps\Default Map "+string(i)+"\Default Map "+string(i)+".ini");
    ini_write_string("Map","name","DefaultMap"+string(i));
    for(j=0; j<256; j++)
        ini_write_string("Map","Colors"+string(j),defaultM[j]);
    for(j=0; j<30; j++)
        ini_write_string("Trees",string(j),defaultT[j]);
    ini_close();
    sprite_save(s,i-1,working_directory+"maps\Default Map "+string(i)+"\Default Map "+string(i)+".png");
}
