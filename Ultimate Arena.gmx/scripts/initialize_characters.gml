global.cNAME = 0;
global.TAGS = 0;
global.TAG_LIST = 0;
global.TAG_COUNT = 0;
global.fNAME = 0;

if(is_array(global.cIMAGES)){
    for(var i=0; i<array_length_1d(global.cIMAGES); i++){
        if(global.cIMAGES[i] != sFighterImage)
            sprite_delete(global.cIMAGES[i]);
    }
}
global.cIMAGES = 0;

directory = 0;
directory[0] = "";
var l = initialize_directory("characters");

for(var i=0;i<l;i++){
    global.fNAME[i] = directory[i] + "\" + directory[i] + ".ini";
    ini_open(working_directory + "characters\" + global.fNAME[i]);
    global.cNAME[i] = ini_read_string("character","name","NAMING ERROR");
    global.cSOUNDS[i] = ini_read_string("character","deathsound","");
    
    var cImage = ini_read_string("character","image","sFighterImage");
    
    if(cImage != "sFighterImage")
        global.cIMAGES[i] = sprite_add(working_directory + "characters\" + directory[i] + "\" + directory[i] + ".png",1,0,0,0,0);
    else
        global.cIMAGES[i] = sFighterImage; 
        
    if(global.cIMAGES[i] == -1){
        var tempSprite = sprite_duplicate(sFighterImage);
        sprite_save(tempSprite,0,working_directory + "characters\" + directory[i] + "\" + directory[i] + ".png");
        sprite_delete(tempSprite);
        global.cIMAGES[i] = sprite_add(working_directory + "characters\" + directory[i] + "\" + directory[i] + ".png",1,0,0,0,0);
    }
    
    var tags = ini_read_string("character","tags","");
    if (tags != ""){
        var tagcount = string_parse_number(tags,",",true);
        for(r = 0; r < tagcount; r++){
            var curtag = string_extract(tags,",",r);
            var notInArray = 1;
            for(c = 0;c < global.TAG_COUNT; c++){
                if(global.TAGS[c] == curtag){
                    notInArray = 0
                    global.TAG_LIST[c,array_length_2d(global.TAG_LIST, c)] = i;
                }
            }
            if(notInArray){
                global.TAGS[global.TAG_COUNT] = curtag;
                global.TAG_LIST[global.TAG_COUNT,0] = i;
                global.TAG_COUNT++;
            }    
        }
    }
    ini_close();
}

global.lNAME = i;
global.fighters = i;
global.FIGHTER_COUNT = i;

