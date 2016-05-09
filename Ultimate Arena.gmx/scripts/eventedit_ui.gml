///eventedit_ui(id)
with(oUIListBox)
{
    if(argument0 == id)
    {
        if(global.IDselected == argument0.sID)
        {
            global.IDselected = -1;
        }
        else
        {
            global.IDselected = argument0.sID;
            ini_open(working_directory + "events\" + global.EVENT[sID])
            var ename = ini_read_string("event","name","");
            var edesc = ini_read_string("event","description","");
            var eperc = ini_read_real("event","death_percentage",0);
            var etotl = ini_read_real("text","total",0);
            var etxt;
            for(var i=etotl; i>0; i--){
                etxt[i] = ini_read_string("text","s"+string(i),"");
            }
            ini_close();
            with(objUIField){
                if(fID == 0)
                    content = ename;
                if(fID == 1)
                    content = edesc;
                if(fID == 2)
                    content = string(eperc);
            }
            with(objUIMultiField){
                if(mID == 0){
                    activeField = 0;
                    fields = etotl;
                    for(i=0; i<etotl; i++){
                        content[i] = etxt[i+1];
                    }
                }
            }
            with(objUILabel){
                if(lID == 1){
                    caption = string(objUIMultiField.activeField+1)+"/"+string(objUIMultiField.fields);
                }
            }
        }
    }
}
with(objUIButton)
{
    if(argument0 == id)
    {
        if(bID == 0)//Go Back
        {
            c = instance_create(0,0,oRoomTransition);
            c.gotoroom = rm_title;
        }
        if(bID == 1)//Delete Event
        {
            if(global.IDselected != -1)
            {
                file_delete(working_directory + "events\" + global.EVENT[global.IDselected]);
                initialize_events();
                keyboard_string = "";
                room_restart();
            }
        }
        if(bID == 2) //Save Event
        {
            with(objUIField){
                if(fID == 0)
                    var ename = content;
                if(fID == 1)
                    var edesc = content;
                if(fID == 2)
                    var eperc = content;
            }
            ini_open(working_directory + "events\" + ename + ".ini");
            ini_write_string("event","name",ename);
            ini_write_string("event","description",edesc);
            ini_write_real("event","death_percentage",real(eperc));
            
            ini_write_real("text","total",objUIMultiField.fields);
            if(ini_section_exists("text"))
                ini_section_delete("text");
            for(var i=1; i<=objUIMultiField.fields; i++){
                ini_write_string("text","s"+string(i),objUIMultiField.content[i-1]);
            }
            ini_write_real("text","total",objUIMultiField.fields);
            ini_close();
            
            initialize_events();
            keyboard_string = "";
            room_restart();
        }
        if(bID == 3) //New Event
        {
            keyboard_string = "";
            room_restart();
        }
        if(bID == 4) //Add Update
        {
            with(objUIMultiField){
                if(mID == 0){
                    fields++;
                    activeField = fields-1;
                    content[activeField]="";
                }
            }
            with(objUILabel){
                if(lID == 1){
                    caption = string(objUIMultiField.activeField+1)+"/"+string(objUIMultiField.fields);
                }
            }
        }
        if(bID == 5) //Delete Update
        {
            with(objUIMultiField){
                if(mID == 0){
                    if(fields <= 1){
                        content[0] = "";
                        fields = 0;
                    }
                    else{
                        for(var i=activeField; i<fields-1; i++){
                            content[i] = content[i+1];
                        }
                        content[fields-1] = "";
                        fields--;
                        activeField = max(0,--activeField);
                    }
                }
            }
            with(objUILabel){
                if(lID == 1){
                    caption = string(objUIMultiField.activeField+1)+"/"+string(objUIMultiField.fields);
                }
            }
        }
        if(bID == 6) //Last Update
        {
            with(objUIMultiField){
                if(mID == 0){
                    activeField--;
                    if(activeField<0)
                        activeField = fields-1;
                }
            }
            with(objUILabel){
                if(lID == 1){
                    caption = string(objUIMultiField.activeField+1)+"/"+string(objUIMultiField.fields);
                }
            }
        }
        if(bID == 7) //Next Update
        {
            with(objUIMultiField){
                if(mID == 0){
                    activeField++;
                    if(activeField>fields-1)
                        activeField = 0;
                }
            }
            with(objUILabel){
                if(lID == 1){
                    caption = string(objUIMultiField.activeField+1)+"/"+string(objUIMultiField.fields);
                }
            }
        }
    }
}
with(objUIField)
{
    if(argument0 == id)
    {
        if(fID == 0)
        {
        }
        //code here for saving text to .ini
    }
}
