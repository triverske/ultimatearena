///initialize_sprites(ind,path)

var in = argument0;
var path = argument1;

global.SPRITE_COUNT = 4;

if(file_exists(path + "default_f.png"))
    global.cSPRITES[in,0] = sprite_add(path + "default_f.png",0,1,0,16,32);
else
    global.cSPRITES[in,0] = spr_fighter;
    
if(file_exists(path + "default_b.png"))
    global.cSPRITES[in,1] = sprite_add(path + "default_b.png",0,1,0,16,32);
else
    global.cSPRITES[in,1] = spr_fighter;
    
if(file_exists(path + "default_l.png"))
    global.cSPRITES[in,2] = sprite_add(path + "default_l.png",0,1,0,16,32);
else
    global.cSPRITES[in,2] = spr_fighter;
    
if(file_exists(path + "default_r.png"))
    global.cSPRITES[in,3] = sprite_add(path + "default_r.png",0,1,0,16,32);
else
    global.cSPRITES[in,3] = global.cSPRITES[in,2];
