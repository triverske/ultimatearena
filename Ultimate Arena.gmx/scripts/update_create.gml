///update_create(text,ID1,Dead)
if(argument0 == "ERROR" || argument0 == "ERROR"+global.FILES[argument1] || argument0 == "")
    exit;
global.update_count++;
if(argument2 > 0 && global.deadUpdates)
{
    with (oUpdateBox)
        currentPos++;
        
    i = instance_create(0,0,oUpdateBox);
    i.boxColor = global.boxColor
    i.text = argument0;
    i.image1 = global.IMAGES[argument1];
    i.fighters = 1;
    i.dead = argument2;
        
    if (global.boxColor == 0)
        global.boxColor = 1;
    else
        global.boxColor = 0; 
}
else if(argument2 < 1 && global.otherUpdates)
{
    with (oUpdateBox)
        currentPos++;
    
    i = instance_create(0,0,oUpdateBox);
    i.boxColor = global.boxColor
    i.text = argument0;
    i.image1 = global.IMAGES[argument1];
    i.fighters = 1;
    i.dead = argument2;
        
    if (global.boxColor == 0)
        global.boxColor = 1;
    else
        global.boxColor = 0; 
}
