ini_open(global.saveFile);
global.fighters_remaining = ini_read_real("Map","fighters_remaining",0);
global.arena_events = ini_read_real("Map","arena_events",0);
if(global.arena_events)
    event_timer = ini_read_real("Map","event_timer",20000);
else
    event_timer = 0;
    
for(var i=0; i<global.fighters+2; i++)
    global.deadday[i] = ini_read_string("Map",string(i)+"deadday","");
    
for(var i=0; i<ini_read_real("Map","trees",0); i++)
{
    var c = instance_create(ini_read_real("Trees",string(i)+"x",0),ini_read_real("Trees",string(i)+"y",0),obj_tree);
    c.foodcount = ini_read_real("Trees",string(i)+"food",0);
}

for(var i=0; i<ini_read_real("Map","wood",0); i++)
{
    if(ini_key_exists("Wood",string(i)+"x"))
        instance_create(ini_read_real("Wood",string(i)+"x",0),ini_read_real("Wood",string(i)+"y",0),obj_wood);
}
    
for(var i=0; i<ini_read_real("Map","rope",0); i++)
{
    if(ini_key_exists("Rope",string(i)+"x"))
        instance_create(ini_read_real("Rope",string(i)+"x",0),ini_read_real("Rope",string(i)+"y",0),obj_rope);
}
    
for(var i=0; i<ini_read_real("Map","stone",0); i++)
{
    if(ini_key_exists("Stone",string(i)+"x"))
        instance_create(ini_read_real("Stone",string(i)+"x",0),ini_read_real("Stone",string(i)+"y",0),obj_stone);
}
    
for(var i=1; i<global.fighters+1; i++)
    global.deathCause[i] = ini_read_string("Map",string(i)+"deathCause","Death by ???");
    
for(var i=0; i<global.fighters_remaining; i++)
{ 
    var c = instance_create(ini_read_real("Fighters",string(i)+"x",0),ini_read_real("Fighters",string(i)+"y",0),obj_fighter);
    c.fighterID = ini_read_real("Fighters",string(i)+"fighterID",0);
    global.IDLIST[c.fighterID] = c;
    c.color = global.COLORS[c.fighterID];
    c.NAME = global.NAMES[c.fighterID];
    c.STRENGTH = global.STATS[c.fighterID,0];
    c.AGILITY = global.STATS[c.fighterID,1];
    c.ENDURANCE = global.STATS[c.fighterID,2];
    c.SKILL = global.STATS[c.fighterID,3];
    c.LUCK = global.STATS[c.fighterID,4];
    c.direction = ini_read_real("Fighters",string(i)+"direction",0);
    c.XP = ini_read_real("Fighters",string(i)+"XP",0);
    c.HP = ini_read_real("Fighters",string(i)+"HP",0);
    c.THIRST = ini_read_real("Fighters",string(i)+"THIRST",0);
    c.HUNGER = ini_read_real("Fighters",string(i)+"HUNGER",0);
    c.TIRED = ini_read_real("Fighters",string(i)+"TIRED",0);
    c.SANITY = ini_read_real("Fighters",string(i)+"SANITY",0);
    c.SANMAX = ini_read_real("Fighters",string(i)+"SANMAX",0);
    c.INSANE = ini_read_real("Fighters",string(i)+"INSANE",0);
    c.DELAY = ini_read_real("Fighters",string(i)+"DELAY",0);
    c.QUICK = ini_read_real("Fighters",string(i)+"QUICK",0);
    c.SIGHT = ini_read_real("Fighters",string(i)+"SIGHT",0);
    c.CONTINUE = ini_read_real("Fighters",string(i)+"CONTINUE",0);
    c.kills = ini_read_real("Fighters",string(i)+"kills",0);
    c.foodloc[0] = ini_read_real("Fighters",string(i)+"foodlocx",0);
    c.foodloc[1] = ini_read_real("Fighters",string(i)+"foodlocy",0);
    c.waterloc[0] = ini_read_real("Fighters",string(i)+"waterlocx",0);
    c.waterloc[1] = ini_read_real("Fighters",string(i)+"waterlocy",0);
    if(ini_read_real("Fighters",string(i)+"group",0) != -1)
        c.group = global.IDLIST[ini_read_real("Fighters",string(i)+"group",0)];
    c.STATE = ini_read_string("Fighters",string(i)+"STATE","");
    c.caption = ini_read_string("Fighters",string(i)+"caption","");
    for(var j=1; j<global.fighters+1; j++)
        c.opinion[j] = ini_read_real("Fighters",string(i)+"opinion"+string(j),0);
    for(var j=0; j<20; j++)
        c.INV[j] = ini_read_real("Fighters",string(i)+"INV"+string(j),0);
}
for(var i=0; i<ini_read_real("Items","Total",0); i++)
{
    var c = instance_create(ini_read_real("Items",string(i)+"x",0),ini_read_real("Items",string(i)+"y",0),obj_itemBag);
    c.loadID = ini_read_real("Items",string(i)+"id",-1);
    c.wspearid = ini_read_real("Items",string(i)+"wspearid",0);
    c.sspearid = ini_read_real("Items",string(i)+"sspearid",0);
    c.wbowid = ini_read_real("Items",string(i)+"wbowid",0);
    c.sbowid = ini_read_real("Items",string(i)+"sbowid",0);
    for(var j=0; j<20; j++)
        c.INV[j] = ini_read_real("Items",string(i)+"INV"+string(j),0);
}
for(var i=0; i<ini_read_real("WSpear","Total",0); i++)
{
    var c = instance_create(ini_read_real("WSpear",string(i)+"x",0),ini_read_real("WSpear",string(i)+"y",0),obj_woodSpear);
    c.HP = ini_read_real("WSpear",string(i)+"HP",0);
    c.dropped = ini_read_real("WSpear",string(i)+"dropped",0);
    var own = ini_read_string("WSpear",string(i)+"owner",-2);
    if(string_letters(own) == "F")
        c.owner = global.IDLIST[real(string_digits(own))];
    else if(string_letters(own) == "I")
    {
        with(obj_itemBag)
        {
            if(loadID == real(string_digits(own)))
                c.owner = id;
        }
    }
    c.owner.wspearid = c;
}
for(var i=0; i<ini_read_real("SSpear","Total",0); i++)
{
    var c = instance_create(ini_read_real("SSpear",string(i)+"x",0),ini_read_real("SSpear",string(i)+"y",0),obj_steelSpear);
    c.HP = ini_read_real("SSpear",string(i)+"HP",0);
    c.dropped = ini_read_real("SSpear",string(i)+"dropped",0);
    var own = ini_read_string("SSpear",string(i)+"owner",-2);
    if(string_letters(own) == "F")
        c.owner = global.IDLIST[real(string_digits(own))];
    else if(string_letters(own) == "I")
    {
        with(obj_itemBag)
        {
            if(loadID == real(string_digits(own)))
                c.owner = id;
        }
    }
    c.owner.sspearid = c;
}
for(var i=0; i<ini_read_real("WBow","Total",0); i++)
{
    var c = instance_create(ini_read_real("WBow",string(i)+"x",0),ini_read_real("WBow",string(i)+"y",0),obj_woodBow);
    c.HP = ini_read_real("WBow",string(i)+"HP",0);
    c.dropped = ini_read_real("WBow",string(i)+"dropped",0);
    var own = ini_read_string("WBow",string(i)+"owner",-2);
    if(string_letters(own) == "F")
        c.owner = global.IDLIST[real(string_digits(own))];
    else if(string_letters(own) == "I")
    {
        with(obj_itemBag)
        {
            if(loadID == real(string_digits(own)))
                c.owner = id;
        }
    }
    c.owner.wbowid = c;
}
for(var i=0; i<ini_read_real("SBow","Total",0); i++)
{
    var c = instance_create(ini_read_real("SBow",string(i)+"x",0),ini_read_real("SBow",string(i)+"y",0),obj_steelBow);
    c.HP = ini_read_real("SBow",string(i)+"HP",0);
    c.dropped = ini_read_real("SBow",string(i)+"dropped",0);
    var own = ini_read_string("SBow",string(i)+"owner",-2);
    if(string_letters(own) == "F")
        c.owner = global.IDLIST[real(string_digits(own))];
    else if(string_letters(own) == "I")
    {
        with(obj_itemBag)
        {
            if(loadID == real(string_digits(own)))
                c.owner = id;
        }
    }
    c.owner.sbowid = c;
}
global.NAMES[global.fighters+1] = "";
groups[0,0] = -1;
groups[0,1] = c_white;
totalGroups = 0;
showGroups = 0;
global.landmines = ini_read_real("Map","landmines",0);
if(global.landmines)
{
    for(var i=0; i<ini_read_real("Mines","Total",0); i++)
    {
        var c=instance_create(ini_read_real("Mines",string(i)+"x",0),ini_read_real("Mines",string(i)+"y",0),obj_landmine);
        c.owner = ini_read_real("Mines",string(i)+"owner",-1);
        c.triggered = ini_read_real("Mines",string(i)+"triggered",0)
    }
}

global.ENDLESS = ini_read_real("Map","ENDLESS",0);
global.GAMETYPE = ini_read_real("Map","GAMETYPE",0);
global.custom_sounds = ini_read_real("Map","custom_sounds",0);
global.fighterGroups = ini_read_real("Map","fighterGroups",0);
global.custom_updates = ini_read_real("Map","custon_updates",0);
global.otherUpdates = ini_read_real("Map","otherUpdates",0);
global.update_count = ini_read_real("Map","update_count",0);
for(var i=1; i<global.fighters+1; i++)
    global.DEATH_ARRAY[i] = ini_read_real("Map",string(i)+"DEATH_ARRAY",0);
for(var i=1; i<global.fighters+1; i++)
{
    global.DEADLOC[i,0] = ini_read_real("Map",string(i)+"DEADLOCx",0);
    global.DEADLOC[i,1] = ini_read_real("Map",string(i)+"DEADLOCy",0);
    if!(global.DEADLOC[i,0] == 0 && global.DEADLOC[i,1] == 0)
        instance_create(global.DEADLOC[i,0],global.DEADLOC[i,1],obj_deadLocation);
}
global.DEATH_STRING = ini_read_string("Map","DEATH_STRING","");
global.kill_count = ini_read_real("Map","kill_count",0);
global.KILL_STRING = ini_read_string("Map","KILL_STRING","");
for(var i=1; i<global.fighters+1; i++)
{
    global.killArray[i] = ini_read_real("Map",string(i)+"killArray",0);
    obj_sideMenu.xpArray[i] = ini_read_real("Map",string(i)+"xpArray",0);
    obj_sideMenu.sanityArray[i] = ini_read_real("Map",string(i)+"sanityArray",100);
}
global.event_count = ini_read_real("Map","event_count",0);
global.event_kills = ini_read_real("Map","event_kills",0);
for(var i=1; i<global.fighters+1; i++)
    global.fighter_place[i] = ini_read_real("Map",string(i)+"fighter_place",0);

global.TIME_DAYS = ini_read_real("Map","TIME_DAYS",0);
global.TIME_HOURS = ini_read_real("Map","TIME_HOURS",0);
global.TIME_MINUTES = ini_read_real("Map","TIME_MINUTES",0);
global.TIME_SECONDS = ini_read_real("Map","TIME_SECONDS",0);
global.TIME_STRING = ini_read_string("Map","TIME_STRING","");

//load map
global.seed = ini_read_real("Map","seed",0);
random_set_seed(global.seed);
width         = 256;
height        = 256;
featuresize   = 64;
waterlevel    = -.65;
mountainlevel = 0.3;
beachsize     = 0.15;
seamless      = false;
for(var i=0; i<width; i+=featuresize) 
{
    for(var j=0; j<height; j+=featuresize) 
        scr_set_sample(i, j, random_range(-1, 1));
}

// build map
var samplesize = featuresize;
var scale = 1.0;
while (samplesize > 1) 
{
    scr_diamond_square(samplesize, scale);
    samplesize /= 2;
    scale /= 2.0;
}
    
// set tiles (Here you can add the tiles/terrains you want in the map)
global.grid = grid;
for(var i=0; i<width; i+=1) 
{
    for (var j=0; j<height; j+=1) 
    {
        // tiles
        if (scr_sample(i,j) > mountainlevel)
            global.grid[i,j] = 3; // mountain
        else if (scr_sample(i,j) > waterlevel)
            global.grid[i,j] = 2; // grass
        else if (scr_sample(i,j) > waterlevel - beachsize)
            global.grid[i,j] = 1; // sand
        else
            global.grid[i,j] = 0; // water
    }
}

// create minimap surface
var surf = surface_create(512, 512);
surface_set_target(surf);

var green  = make_color_rgb( 69, 157, 69);
var blue   = make_color_rgb( 48, 102,201);
var yellow = make_color_rgb(222, 196,104);
var brown1 = make_color_rgb(164, 141, 60);
var brown2 = make_color_rgb(130, 112, 48);
var brown3 = make_color_rgb( 94,  80, 34);
var map_tile_size = (512 / width);

// give each terrain a unique color in the minimap
for (var i = 0; i < width; i += 1) {
  for (var j = 0; j < height; j += 1) {
    var point = scr_sample(i,j);
    if (point > mountainlevel + 0.4) {
      draw_set_color(brown1);
    } else if (point > mountainlevel + 0.2) {
      draw_set_color(brown2);
    } else if (point > mountainlevel) {
      draw_set_color(brown3);
    } else if (point > waterlevel) {
      draw_set_color(green);
    } else if (point > (waterlevel - beachsize)) {
      draw_set_color(yellow);
    } else {
      draw_set_color(blue);
    }
    draw_rectangle(i * map_tile_size, j * map_tile_size, (i + 1) * map_tile_size, (j + 1) * map_tile_size, false);
  }
}

// create the minimap background 
background_assign(global.bck_minimap,background_create_from_surface(surf, 0, 0, 512, 512, 0, 0));

surface_reset_target();
if(surface_exists(global.mapsurf))
    surface_free(global.mapsurf);
global.mapsurf = surf;

ini_close();
