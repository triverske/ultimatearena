///commandAI(command);
com = argument0;

if (com != STATE)
{
STATE = com;
switch(com)
{   
    case "WANDER":
    wanderAngle += random(1) * wanderChange - wanderChange * .5;//change the angle randomly to make it wander
    DIR = wanderAngle;
    QUICK = .5 + AGILITY/10;
    CONTINUE = 100;
    break;
    
    case "SLEEP":
    QUICK = 0;
    if(TIRED<80)
        CONTINUE = 500;
    else
        CONTINUE = 20;
    break;
    
    case "WATER SEARCH":
    QUICK = .5 + AGILITY/10;
    CONTINUE = 170;
    DELAY = 30;
    point_direction(x,y,waterloc[0],waterloc[1]);
    break;
    
    case "FOOD SEARCH":
    QUICK = .5 + AGILITY/10;
    CONTINUE = 85;
    DELAY = 30;
    point_direction(x,y,foodloc[0],foodloc[1]);
    break;
    
    case "GET FOOD":
    QUICK = 0;
    CONTINUE = 0;
    if(treeid.foodcount > 0)
    {
        INV[2]++;
        treeid.foodcount--;
        XP+=2;
    }
    break;
    
    case "GET WOOD":
    QUICK = 0;
    CONTINUE = 0;
    XP+=3;
    INV[9]++;
    with(woodid)
        instance_destroy()
    break;
    
    case "GET ROPE":
    QUICK = 0;
    CONTINUE = 0;
    XP+=5;
    INV[10]++;
    with(ropeid)
        instance_destroy()
    break;
    
    case "GET STONE":
    QUICK = 0;
    CONTINUE = 0;
    XP+=4;
    INV[11]++;
    with(stoneid)
        instance_destroy()
    break;
/*    
    case "GET WSPEAR":
    QUICK = 0;
    CONTINUE = 0;
    XP+=3;
    INV[4]++;
    with(wspearid)
    {
        dropped = 0;
        x = -100;
        y = -100;
    }
    break;

    case "GET SSPEAR":
    QUICK = 0;
    CONTINUE = 0;
    XP+=4;
    INV[5]++;
    with(wspearid)
    {
        dropped = 0;
        x = -100;
        y = -100;
    }
    break;
    
    case "GET WBOW":
    QUICK = 0;
    CONTINUE = 0;
    XP+=4;
    INV[6]++;
    with(wbowid)
    {
        dropped = 0;
        x = -100;
        y = -100;
    }
    break;
    
    case "GET SBOW":
    QUICK = 0;
    CONTINUE = 0;
    XP+=5;
    INV[7]++;
    with(sbowid)
    {
        dropped = 0;
        x = -100;
        y = -100;
    }
    break;
*/    
    case "BATHE":
    QUICK = 0;
    CONTINUE = 0;
    if(SANITY<SANMAX)
        SANITY++;
    createUpdate(getText("bathe",fighterID),fighterID,0);
    bathetime = time;
    DELAY = 60;
    break;
    
    case "MAKE MEDKIT":
    QUICK = 0;
    CONTINUE = 0;
    INV[2]--;
    INV[10]--;
    INV[8]++;
    XP+=3;
    createUpdate(global.NAMES[fighterID] + " put together a medkit.",fighterID,0);
    DELAY = 180;
    break;
    
    case "MAKE TRAP":
    QUICK = 0;
    DELAY = 6;
    CONTINUE = 0;
    INV[10]--;
    INV[11]--;
    INV[1]++;
    XP+=3;
    createUpdate(global.NAMES[fighterID] + " built a small trap.",fighterID,0);
    DELAY = 180;
    break;
    
    case "EAT":
    QUICK = 0;
    DELAY = 3;
    INV[2]--;
    HUNGER = 100;
    CONTINUE = 0;
    createUpdate(getText("eat",fighterID),fighterID,0);
    break;
    
    case "DRINK":
    QUICK = 0;
    DELAY = 3;
    INV[3]--;
    THIRST = 100;
    CONTINUE = 0;
    createUpdate(getText("drink",fighterID),fighterID,0);
    break;
    
    case "USE MEDKIT":
    QUICK = 0;
    CONTINUE = 0;
    INV[8]--;
    HP += 50;
    DELAY = 90;
    break;
    
    case "THINK":
    QUICK = 0;
    DELAY = 10;
    CONTINUE = 3;
    createUpdate(getText("think",fighterID),fighterID,0);
    break;
    
    case "THINK RARE":
    QUICK = 0;
    DELAY = 10;
    CONTINUE = 3;
    createUpdate(getText("think_rare",fighterID),fighterID,0);
    break;
    
    case "MAKE SPEAR":
    QUICK = 0;
    INV[9]--;
    INV[11]--;
    wspearid = instance_create(-100,-100,oWSpear);
    INV[4]++;
    XP+=6;
    DELAY = 360;
    CONTINUE = 0;
    createUpdate(global.NAMES[fighterID] + " crafted a wooden spear.",fighterID,0);
    break;
    
    case "MAKE BOW":
    QUICK = 0;
    INV[9]--;
    INV[10]--;
    wbowid = instance_create(-100,-100,oWBow);
    INV[6]++;
    XP+=8;
    DELAY = 720;
    CONTINUE = 0;
    createUpdate(global.NAMES[fighterID] + " crafted a wooden bow.",fighterID,0);
    break;
    
    case "HUNT":
    QUICK = .5 + AGILITY/10;
    CONTINUE = 100;
    point_direction(x,y,enemyloc[0],enemyloc[1]);
    break;
    
    case "CHASE":
    QUICK = .7 + AGILITY/10;
    CONTINUE = 30;
    instance_deactivate_object(self);
    c = instance_nearest(x,y-5,oFighter);
    instance_activate_object(self);
    DIR = c.DIR;
    //createUpdate(global.NAMES[fighterID] + " began chasing " + global.NAMES[c.fighterID],fighterID,1);
    break;
    
    case "RUN":
    QUICK = .7 + AGILITY/10;
    CONTINUE = 70;
    instance_deactivate_object(self);
    c = instance_nearest(x,y-5,oFighter);
    instance_activate_object(self);
    DIR = c.DIR-180;
    //createUpdate(global.NAMES[fighterID] + " began chasing another fighter.");
    break;
    
    case "SUICIDE":
    createUpdate(getText("suicide",fighterID),fighterID,1);
    drop_items();    
    instance_destroy();
    break;
    
    case "ATTACK UNARMED":
    QUICK = 0;
    CONTINUE = 15 * (HP/25);
    hit = 1+floor(random(STRENGTH));
    otherFighter.HP -= hit;
    c = random(floor(7))
    if(c = 6)
        XP++;
    if (otherFighter.HP <= 0)
    {
        createUpdateM(getTextM("kill_unarmed",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
        kills++;
        XP+=5;
        c = (floor(random(20)));
        SANITY -= c;
        SANMAX -= c;
        with (otherFighter)
        {
            drop_items();
            instance_destroy();
        }
    }
    break;
    
    case "ATTACK WSPEAR":
    QUICK = 0;
    CONTINUE = 15 * (HP/25);
    hit = 5+floor(random(STRENGTH*2));
    with(wspearid)
    {
        HP-= 1+floor(random(9));
        if(HP <= 0)
        {
            other.INV[4] = 0;
            other.wspearid = 0;
            instance_destroy();
        }
    }
    otherFighter.HP -= hit;
    c = random(floor(6));
    if(c = 5)
        XP++;
    if (otherFighter.HP <= 0)
    {
        createUpdateM(getTextM("kill_wspear",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
        kills++;
        XP+=7;
        c = (floor(random(15)));
        SANITY -= c;
        SANMAX -= c;
        with (otherFighter)
        {
            drop_items();
            instance_destroy();
        }
    }
    break;
    
    case "ATTACK SSPEAR":
    QUICK = 0;
    CONTINUE = 15 * (HP/25);
    hit = 10+floor(random(STRENGTH*2));
    with(sspearid)
    {
        HP-= 1+floor(random(9));
        if(HP <= 0)
        {
            other.INV[5] = 0;
            other.sspearid = 0;
            instance_destroy();
        }
    }
    otherFighter.HP -= hit;
    c = random(floor(6));
    if(c = 5)
        XP+=2;
    if(otherFighter.HP <= 0)
    {
        createUpdateM(getTextM("kill_sspear",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
        kills++;
        XP+=8;
        c = (floor(random(15)));
        SANITY -= c;
        SANMAX -= c;
        with (otherFighter)
        {
            drop_items();
            instance_destroy();
        }
    }
    break;
        
    case "ATTACK WBOW":
    QUICK = 0;
    CONTINUE = 15 * (HP/25);
    hit = 5+floor(random(SKILL*2));
    with(wbowid)
    {
        HP-= 1+floor(random(9));
        if(HP <= 0)
        {
            other.INV[6] = 0;
            other.wbowid = 0;
            instance_destroy();
        }
    }
    otherFighter.HP -= hit;
    c = random(floor(5));
    if(c = 4)
        XP++;
    if (otherFighter.HP <= 0)
    {
        createUpdateM(getTextM("kill_wbow",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
        kills++;
        XP+=9;
        c = (floor(random(10)));
        SANITY -= c;
        SANMAX -= c;
        with (otherFighter)
        {
            drop_items();
            instance_destroy();
        }
    }
    break;
    
    case "ATTACK SBOW":
    QUICK = 0;
    CONTINUE = 15 * (HP/25);
    hit = 10+floor(random(SKILL*2));
    with(sbowid)
    {
        HP-= 1+floor(random(9));
        if(HP <= 0)
        {
            other.INV[7] = 0;
            other.sbowid = 0;
            instance_destroy();
        }
    }
    otherFighter.HP -= hit;
    c = random(floor(5));
    if(c = 4)
        XP+=2;
    if (otherFighter.HP <= 0)
    {
        createUpdateM(getTextM("kill_sbow",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
        kills++;
        XP+=10;
        c = (floor(random(10)));
        SANITY -= c;
        SANMAX -= c;
        with (otherFighter)
        {
            drop_items();
            instance_destroy();
        }
    }
    break;
    
    case "ATTACK DROWN":
    QUICK = 0;
    CONTINUE = 0;
    createUpdateM(getTextM("kill_drown",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
    kills++;
    XP+=12;
    SANITY -= (floor(random(10)));
    with (otherFighter)
    {
        drop_items();
        instance_destroy();
    }
    break;
    
    case "PLACE MINE":
    QUICK = 0;
    CONTINUE = 0;
    c = random(10)
    if(c+SKILL>=5)
    {
        var w = instance_create(x,y,oMine);
        w.owner = self;
        INV[0]--;
    }
    else
    {
        HP = 0;
        instance_create(x,y,oExplosion);
        createUpdate(getText("die_landmine_p",fighterID),fighterID,1);
        instance_destroy();
    }
    break;

    case "SET TRAP":
    QUICK = 0;
    CONTINUE = 0;
    var w = instance_create(x,y,oTrap);
    w.owner = fighterID;
    INV[1]--;
    break;
    
    default:
    break;

}
}
