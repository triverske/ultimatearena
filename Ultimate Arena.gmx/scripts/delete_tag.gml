///delete_tag(tag id);

var tID = argument0;
for(var i=0; i<array_length_2d(global.TAG_LIST,tID); i++){
    ini_open(global.fNAME[global.TAG_LIST[tID,i]]);
    var prevtag = ini_read_string("character","tags","");
    var newtag = string_replace(prevtag,global.TAGS[tID]+",","");
    newtag = string_replace(newtag,global.TAGS[tID],"");
    ini_write_string("character","tags",newtag);
    ini_close();
}
initialize_characters();
