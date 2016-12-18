global.MAPS[0] = file_find_first(working_directory+"maps\*", fa_directory);
//show_debug_message(global.MAPS[0]);

if(global.MAPS[0] != ""){
    var i = 0;
    if(!file_exists(working_directory+"maps\"+global.MAPS[0]+'\'+global.MAPS[0]+'.ini'))
        i = -1;
    do{
        i++;
        global.MAPS[i] = file_find_next();
        while(global.MAPS[i] != "" && !file_exists(working_directory+"maps\"+global.MAPS[i]+'\'+global.MAPS[i]+'.ini')){
            global.MAPS[i] = file_find_next();
        }
        //show_debug_message(global.MAPS[i]);
    }
    until(global.MAPS[i] == "");
    file_find_close();
    global.MAP_COUNT = i;
}
