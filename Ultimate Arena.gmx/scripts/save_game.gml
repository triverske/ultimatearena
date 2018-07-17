if(!directory_exists("saves"))
    directory_create("saves");
var file = get_save_filename_ext("ini file|*.ini",string(current_month)+"-"+string(current_day)+"-"+string(current_year)+"-"+string(current_hour)+"-"+string(current_minute)+"-"+string(current_second)+".ini",working_directory+"saves","Save Game");
if(file != "")
    ini_open(file);
else
    exit;
//GENERAL
ini_write_real("Map","seed",global.seed);
ini_write_real("Map","ENDLESS",global.ENDLESS);
ini_write_real("Map","GAMETYPE",global.GAMETYPE);
ini_write_real("Map","TWITCHENABLED",global.TWITCHENABLED);
ini_write_real("Map","arena_events",global.arena_events);
ini_write_real("Map","landmines",global.landmines);
ini_write_real("Map","custom_sounds",global.custom_sounds);
ini_write_real("Map","custon_updates",global.custom_updates);
ini_write_real("Map","fighterGroups",global.fighterGroups);
ini_write_real("Map","otherUpdates",global.otherUpdates);
ini_write_real("Map","update_count",global.update_count);
for(var i=1; i<global.fighters+1; i++)
    ini_write_real("Map",string(i)+"DEATH_ARRAY",global.DEATH_ARRAY[i]);
for(var i=1; i<global.fighters+1; i++)
    ini_write_string("Map",string(i)+"deadday",global.deadday[i]);
for(var i=1; i<global.fighters+1; i++)
    ini_write_string("Map",string(i)+"deathCause",global.deathCause[i]);
for(var i=1; i<global.fighters+1; i++)
{
    if(array_length_2d(global.DEADLOC,i)==2)
    {
        ini_write_real("Map",string(i)+"DEADLOCx",global.DEADLOC[i,0]);
        ini_write_real("Map",string(i)+"DEADLOCy",global.DEADLOC[i,1]);
    }
}
ini_write_string("Map","DEATH_STRING",global.DEATH_STRING);
ini_write_real("Map","kill_count",global.kill_count);
ini_write_string("Map","KILL_STRING",global.KILL_STRING);
for(var i=1; i<global.fighters+1; i++)
    ini_write_real("Map",string(i)+"killArray",global.killArray[i]);
ini_write_real("Map","event_count",global.event_count);
ini_write_real("Map","event_kills",global.event_kills);
ini_write_real("Map","event_timer",event_timer);
for(var i=1; i<global.fighters+1; i++)
    ini_write_real("Map",string(i)+"fighter_place",global.fighter_place[i]);
ini_write_real("Map","fighters",global.fighters);
ini_write_real("Map","fighters_remaining",global.fighters_remaining);
for(var i=1; i<global.fighters+1; i++)
{
    ini_write_real("Map",string(i)+"sanityArray",obj_sideMenu.sanityArray[i]);
    ini_write_real("Map",string(i)+"xpArray",obj_sideMenu.xpArray[i]);
}
for(var i=1; i<global.fighters+1; i++)
    ini_write_real("Map",string(i)+"GENDER",global.GENDER[i]);
for(var i=1; i<global.fighters+1; i++)
    ini_write_string("Map",string(i)+"NAMES",global.NAMES[i]);
for(var i=1; i<global.fighters+1; i++)
    ini_write_string("Map",string(i)+"SOUNDS",global.SOUNDS[i]);
for(var i=1; i<global.fighters+1; i++)
    ini_write_string("Map",string(i)+"FILES",global.FILES[i]);
for(var i=1; i<global.fighters+1; i++)
    ini_write_real("Map",string(i)+"COLORS",global.COLORS[i]);
for(var i=1; i<global.fighters+1; i++)
    ini_write_real("Map",string(i)+"IMAGES",global.IMAGES[i]);
for(var i=1; i<global.fighters+1; i++)
{
    ini_write_real("Map",string(i)+"STATS0",global.STATS[i,0]);
    ini_write_real("Map",string(i)+"STATS1",global.STATS[i,1]);
    ini_write_real("Map",string(i)+"STATS2",global.STATS[i,2]);
    ini_write_real("Map",string(i)+"STATS3",global.STATS[i,3]);
    ini_write_real("Map",string(i)+"STATS4",global.STATS[i,4]);
}
ini_write_real("Map","TIME_DAYS",global.TIME_DAYS);
ini_write_real("Map","TIME_HOURS",global.TIME_HOURS);
ini_write_real("Map","TIME_MINUTES",global.TIME_MINUTES);
ini_write_real("Map","TIME_SECONDS",global.TIME_SECONDS);
ini_write_string("Map","TIME_STRING",global.TIME_STRING);
ini_write_real("Map","rope",global.rope);
ini_write_real("Map","stone",global.stone);
ini_write_real("Map","trees",global.trees);
ini_write_real("Map","wood",global.wood);

//TREES
i = 0;
with(obj_tree)
{
    ini_write_real("Trees",string(i)+"x",x);
    ini_write_real("Trees",string(i)+"y",y);
    ini_write_real("Trees",string(i)+"food",foodcount);
    i++;
}

//WOOD
i=0;
with(obj_wood)
{
    ini_write_real("Wood",string(i)+"x",x);
    ini_write_real("Wood",string(i)+"y",y);
    i++;
}

//ROPE
i=0;
with(obj_rope)
{
    ini_write_real("Rope",string(i)+"x",x);
    ini_write_real("Rope",string(i)+"y",y);
    i++;
}

//STONE
i=0;
with(obj_stone)
{
    ini_write_real("Stone",string(i)+"x",x);
    ini_write_real("Stone",string(i)+"y",y);
    i++;
}

//MINES
i=0;
with(obj_landmine)
{
    ini_write_real("Mines",string(i)+"x",x);
    ini_write_real("Mines",string(i)+"y",y);
    ini_write_real("Mines",string(i)+"owner",owner);
    ini_write_real("Mines",string(i)+"triggered",triggered);
    i++;
}
ini_write_real("Mines","Total",i);
//Items
i=0;
with(obj_itemBag)
{
    ini_write_real("Items",string(i)+"x",x);
    ini_write_real("Items",string(i)+"y",y);
    ini_write_real("Items",string(i)+"id",id);
    ini_write_real("Items",string(i)+"wspearid",wspearid);
    ini_write_real("Items",string(i)+"sspearid",sspearid);
    ini_write_real("Items",string(i)+"wbowid",wbowid);
    ini_write_real("Items",string(i)+"sbowid",sbowid);
    for(var j=0; j<20; j++)
        ini_write_real("Items",string(i)+"INV"+string(j),INV[j]);
    i++;
}
ini_write_real("Items","Total",i);
//WSpears
i=0;
with(obj_woodSpear)
{
    ini_write_real("WSpear",string(i)+"x",x);
    ini_write_real("WSpear",string(i)+"y",y);
    ini_write_real("WSpear",string(i)+"HP",HP);
    ini_write_real("WSpear",string(i)+"dropped",dropped);
    if(owner.object_index == obj_fighter)
        ini_write_string("WSpear",string(i)+"owner","F"+string(owner.fighterID));
    if(owner.object_index == obj_itemBag)
        ini_write_string("WSpear",string(i)+"owner","I"+string(owner));
    i++;
}
ini_write_real("WSpear","Total",i);
//SSpears
i=0;
with(obj_steelSpear)
{
    ini_write_real("SSpear",string(i)+"x",x);
    ini_write_real("SSpear",string(i)+"y",y);
    ini_write_real("SSpear",string(i)+"HP",HP);
    ini_write_real("SSpear",string(i)+"dropped",dropped);
    if(owner.object_index == obj_fighter)
        ini_write_string("SSpear",string(i)+"owner","F"+string(owner.fighterID));
    if(owner.object_index == obj_itemBag)
        ini_write_string("SSpear",string(i)+"owner","I"+string(owner));
    i++;
}
ini_write_real("SSpear","Total",i);
//WBows
i=0;
with(obj_woodBow)
{
    ini_write_real("WBow",string(i)+"x",x);
    ini_write_real("WBow",string(i)+"y",y);
    ini_write_real("WBow",string(i)+"HP",HP);
    ini_write_real("WBow",string(i)+"dropped",dropped);
    if(owner.object_index == obj_fighter)
        ini_write_string("WBow",string(i)+"owner","F"+string(owner.fighterID));
    if(owner.object_index == obj_itemBag)
        ini_write_string("WBow",string(i)+"owner","I"+string(owner));
    i++;
}
ini_write_real("WBow","Total",i);
//SBows
i=0;
with(obj_steelBow)
{
    ini_write_real("SBow",string(i)+"x",x);
    ini_write_real("SBow",string(i)+"y",y);
    ini_write_real("SBow",string(i)+"HP",HP);
    ini_write_real("SBow",string(i)+"dropped",dropped);
    if(owner.object_index == obj_fighter)
        ini_write_string("SBow",string(i)+"owner","F"+string(owner.fighterID));
    if(owner.object_index == obj_itemBag)
        ini_write_string("SBow",string(i)+"owner","I"+string(owner));
    i++;
}
ini_write_real("SBow","Total",i);
//FIGHTERS
i=0;
with(obj_fighter)
{
    ini_write_real("Fighters",string(i)+"fighterID",fighterID);
    ini_write_real("Fighters",string(i)+"x",x);
    ini_write_real("Fighters",string(i)+"y",y);
    ini_write_real("Fighters",string(i)+"direction",direction);
    ini_write_real("Fighters",string(i)+"XP",XP);
    ini_write_real("Fighters",string(i)+"HP",HP);
    ini_write_real("Fighters",string(i)+"THIRST",THIRST);
    ini_write_real("Fighters",string(i)+"HUNGER",HUNGER);
    ini_write_real("Fighters",string(i)+"TIRED",TIRED);
    ini_write_real("Fighters",string(i)+"SANITY",SANITY);
    ini_write_real("Fighters",string(i)+"SANMAX",SANMAX);
    ini_write_real("Fighters",string(i)+"INSANE",INSANE);
    ini_write_real("Fighters",string(i)+"DELAY",DELAY);
    ini_write_real("Fighters",string(i)+"QUICK",QUICK);
    ini_write_real("Fighters",string(i)+"SIGHT",SIGHT);
    ini_write_real("Fighters",string(i)+"CONTINUE",CONTINUE);
    ini_write_real("Fighters",string(i)+"kills",kills);
    ini_write_real("Fighters",string(i)+"foodlocx",foodloc[0]);
    ini_write_real("Fighters",string(i)+"foodlocy",foodloc[1]);
    ini_write_real("Fighters",string(i)+"waterlocx",waterloc[0]);
    ini_write_real("Fighters",string(i)+"waterlocy",waterloc[1]);
    if(group != -1)
        ini_write_real("Fighters",string(i)+"group",group.fighterID);
    else
        ini_write_real("Fighters",string(i)+"group",-1);
    
    ini_write_string("Fighters",string(i)+"STATE",STATE);
    ini_write_string("Fighters",string(i)+"caption",caption);
    
    for(var j=1; j<global.fighters+1; j++)
        ini_write_real("Fighters",string(i)+"opinion"+string(j),opinion[j]);
    for(var j=0; j<20; j++)
        ini_write_real("Fighters",string(i)+"INV"+string(j),INV[j]);
    i++;
}
ini_close();
