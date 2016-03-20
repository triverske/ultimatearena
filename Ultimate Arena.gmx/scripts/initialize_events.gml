var i = 1;
global.EVENT[0] = file_find_first(working_directory+"events\*.ini", 0);
    global.EVENT[i] = file_find_next();
    
    while(global.EVENT[i] != "")
    {
        i++;
        global.EVENT[i] = file_find_next();
    }
    file_find_close();
    global.EVENT_COUNT = i;
