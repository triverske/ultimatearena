var section;
section[0] = "eat";
section[1] = "drink";
section[2] = "bathe";
section[3] = "make_wspear";
section[4] = "make_wbow";
section[5] = "make_medkit";
section[6] = "make_trap";
section[7] = "use_medkit";
section[8] = "set_trap";
section[9] = "place_mine";
section[10] = "disarm_mine";
section[11] = "group_up";
section[12] = "end_group";
section[13] = "think";
section[14] = "think_rare";
section[15] = "kill_unarmed";
section[16] = "kill_unarmed_insane";
section[17] = "kill_wspear";
section[18] = "kill_wspear_insane";
section[19] = "kill_wspear_fail";
section[20] = "kill_sspear";
section[21] = "kill_sspear_insane";
section[22] = "kill_sspear_fail";
section[23] = "kill_wbow";
section[24] = "kill_wbow_insane";
section[25] = "kill_wbow_fail";
section[26] = "kill_sbow";
section[27] = "kill_sbow_insane";
section[28] = "kill_sbow_fail";
section[29] = "kill_drown";
section[30] = "kill_drown_insane";
section[31] = "die_hunger";
section[32] = "die_thirst";
section[33] = "die_mine";
section[34] = "die_mine_m";
section[35] = "die_mine_p";
section[36] = "die_trap";
section[37] = "arena_escape_fail";
section[38] = "suicide";
section[39] = "wander";
section[40] = "sleep";
section[41] = "run";
section[42] = "chase";
section[43] = "hunt";
section[44] = "search_water";
section[45] = "search_food";
section[46] = "get_food";
section[47] = "get_wood";
section[48] = "get_rope";
section[49] = "get_stone";
section[50] = "attack_unarmed";
section[51] = "attack_wspear";
section[52] = "attack_sspear";
section[53] = "attack_wbow";
section[54] = "attack_sbow";
section[55] = "dya_kill";
section[56] = "dya_attack";
section[57] = "dya_live";

SC = 58 //Section count (0 counts)

var ttotal = 0
ini_open("DefaultText.ini");
for(var i=0; i<SC; i++)
    ttotal += ini_read_real(section[i],"total",0);
ini_close();


directory = 0;
directory[0] = "";
var l = initialize_directory("texts");

if(file_exists("text.ini"))
    file_delete("text.ini");
    
ini_open("settings.ini");
if(ini_read_real("defaulttext","togglefile",1))
{
    var t = ini_read_string("defaulttext","toggle","ERROR");
    
    if(t != "ERROR")
    {
        ini_close();
        var a = 0;
        ini_open("DefaultText.ini");
        for(var i=0; i<SC; i++)
        {//stores text in a array
            a[i,0] = ini_read_real(section[i],"total",0);
            show_debug_message(string(a[i,0]) + " in section " + section[i]);
            //a[i,1] = ini_read_string(section[i],"toggle","ERROR");
            for(var j=1;j<a[i,0]+1;j++)
                a[i,j] = ini_read_string(section[i],"s"+string(j),"ERROR");
        }
        ini_close();
        ini_open("text.ini");
        for(i=0; i<SC; i++) //adds a array to text.ini
        {
            var tot = 0;
            for(j=1; j<a[i,0]+1; j++)
            {
                if(string_char_at(t,1) == "1")
                {
                    tot++;
                    ini_write_string(section[i],"s"+string(tot),a[i,j]);
                }
                t = string_delete(t,1,1);
            }
            ini_write_real(section[i],"total",tot);
        }
        ini_close();
    }
    else
    {
        t="";
        repeat(ttotal)
            t+="1";
        ini_write_string("defaulttext","toggle",t);
        ini_close();
        file_copy("DefaultText.ini","text.ini");
    }
}
else
{
    ini_close();
}

if(l > 0)
{
    for(var i=0;i<l;i++)
    {//loops through all files
        if(global.TEXTTOGGLE[i+1])
        {
            var t = 0;
            ini_open("texts\" + directory[i] + "\" + directory[i] + ".ini");
            for(var j=0; j<SC; j++)
            {//stores text in t array
                t[j,0] = 0;
                if(ini_section_exists(section[j]))
                {
                    t[j,0] = ini_read_real(section[j],"total",0);
                    t[j,1] = ini_read_string(section[j],"toggle","ERROR");
                    if(t[j,0] > 0 && t[j,1] == "ERROR"){
                        t[j,1] = "";
                        repeat(t[j,0])
                            t[j,1]+="1";
                    }
                    for(var k=2;k<t[j,0]+2;k++){
                        t[j,k] = ini_read_string(section[j],"s"+string(k-1),"ERROR");
                    }
                }
            }
            ini_close();
            ini_open("text.ini");
            for(j=0; j<SC; j++)
            {//adds t array to text.ini
                var tot = ini_read_real(section[j],"total",0);
                for(var k=2;k<t[j,0]+2;k++)
                {
                    if(t[j,k] == "ERROR" || string_char_at(t[j,1],k-1) == "0")
                        tot--;
                    else
                        ini_write_string(section[j],"s"+string(k+tot-1),t[j,k]);
                }
                if(tot+t[j,0] > 0)
                    ini_write_real(section[j],"total",tot+t[j,0]);
            }
            ini_close();
        }
    }
}
