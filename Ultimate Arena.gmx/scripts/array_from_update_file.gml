///array_from_update_file(file);
//1d - section
//2d - 0:toggle string, 1+:update text

textList = 0;

if(argument0 == "DefaultText.ini"){
    ini_open("settings.ini");
    var s = ini_read_string("defaulttext","toggle","");
    if(s == ""){
        repeat(194)
            s+="1";
        ini_write_string("defaulttext","toggle",s);
    }
    ini_close();
    
    ini_open(argument0);
    for(var i=0; i<55; i++){
        textList[i,0] = "";
        var t = ini_read_real(section[i],"total",0);
        for(var j=t; j>0; j--)
            textList[i,j] = ini_read_string(section[i],"s"+string(j),"ERROR");
            
        if(t > 0){
            textList[i,0] = string_copy(s,1,t);
            s = string_delete(s,1,t);
        }
    }
    global.charVersion = 0;
    global.workshopID = -1;
    global.creator = ini_read_real("text","creator",-1);
    with(objUICheckbox)
            if(bID == 1)
                __visible = 0;
                
    with(objUILabel)
        if(caption == "Add to Steam Workshop")
            __visible = 0;
    ini_close();
}
else if(argument0 == ""){
    for(var i=54; i>-1; i--){
        textList[i,0] = "";
    }
    global.charVersion = 1;
    global.workshopID = -1;
    global.creator = -1;
    with(objUICheckbox)
        if(bID == 1)
            __visible = 1;
            
    with(objUILabel)
        if(caption == "Add to Steam Workshop")
            __visible = 1;
}
else{
    ini_open(argument0);
    for(var i=54; i>-1; i--){
        textList[i,0] = "";
        if(ini_section_exists(section[i])){
            var t = ini_read_real(section[i],"total",0);
            textList[i,0] = ini_read_string(section[i],"toggle","");
            if(t == 0 && textList[i,0] != ""){
                textList[i,0] = "";
                ini_write_string(section[i],"toggle","");
            }
            else if(t > 0 && textList[i,0] == ""){
                repeat(t)
                    textList[i,0]+="1";
                ini_write_string(section[i],"toggle",textList[i,0]);
            }
            for(var j=t; j>0; j--){
                textList[i,j] = ini_read_string(section[i],"s"+string(j),"ERROR");
            }
        }
    }
    global.charVersion = ini_read_real("text","version",1);
    global.workshopID = ini_read_real("text","workshopID",-1);
    global.creator = ini_read_real("text","creator",-1);
    if(global.creator != -1 && global.creator != steam_get_user_account_id())
    {
        with(objUICheckbox)
            if(bID == 1)
                __visible = 0;
                
        with(objUILabel)
            if(caption == "Add to Steam Workshop")
                __visible = 0;
    }
    else
    {
        with(objUICheckbox)
            if(bID == 1)
                __visible = 1;
                
        with(objUILabel)
            if(caption == "Add to Steam Workshop")
                __visible = 1;
    }
    ini_close();
}
