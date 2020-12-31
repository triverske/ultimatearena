///ai_command(command);
com = argument0;

if (com != STATE)
{
    STATE = com;
    switch(com)
    {   
        case "WANDER":
        caption = "Wandering";
        var ic = true;
            with(obj_arenaShrink)
                if(!point_in_circle(other.x,other.y,x,y,radius+10))
                    ic = false;
        
        if(group != -1 && instance_exists(group) && distance_to_object(group) > 5)
        {
            if(ic == true)
                DIR += point_direction(x,y-5,group.x,group.y-5)+random_range(-15,15);
            else
                DIR = point_direction(x,y-5,256+irandom_range(-120,120),256+irandom_range(-120,120))+random_range(-20,20);
        }
        else
        {
            if(ic == false)
                DIR = point_direction(x,y-5,256+irandom_range(-120,120),256+irandom_range(-120,120))+random_range(-30,30);

            DIR += random_range(-5,5)//change the angle randomly to make it wander
        }
        QUICK = .1 + AGILITY/20;
        CONTINUE = 15;
        
        update_create(update_get_text("wander",fighterID),fighterID,0);
        break;
        
        case "HEAD TO CENTER":
        caption = "Headed to Center";

        DIR = point_direction(x,y-5,256+irandom_range(-120,120),256+irandom_range(-120,120))+random_range(-25,25);
        QUICK = .1 + AGILITY/20;
        CONTINUE = 1;
        update_create(update_get_text("headtocenter",fighterID),fighterID,0);
        
        break;
        
        case "SLEEP":
        caption = "Sleeping";
        QUICK = 0;
        if(TIRED<80)
            CONTINUE = 500;
        else
            CONTINUE = 20;
        update_create(update_get_text("sleep",fighterID),fighterID,0);
        break;
        
        case "WAITING":
        caption = "Waiting";
        QUICK = 0;
        CONTINUE = 1;
        update_create(update_get_text("waiting",fighterID),fighterID,0);
        break;
        
        
        case "WATER SEARCH":
        caption = "Searching for Water";
        QUICK = .5 + AGILITY/10;
        CONTINUE = 170;
        DELAY = 30;
        DIR = point_direction(x,y,waterloc[0],waterloc[1]);
        update_create(update_get_text("search_water",fighterID),fighterID,0);
        break;
        
        case "FOOD SEARCH":
        caption = "Searching for Food";
        QUICK = .5 + AGILITY/10;
        CONTINUE = 85;
        DELAY = 30;
        DIR = point_direction(x,y,foodloc[0],foodloc[1]);
        update_create(update_get_text("search_food",fighterID),fighterID,0);
        break;
        
        case "GET FOOD":
        caption = "Getting Food";
        QUICK = 0;
        CONTINUE = 0;
        if(treeid.foodcount > 0)
        {
            INV[2]++;
            treeid.foodcount--;
            XP+=2;
        }
        update_create(update_get_text("get_food",fighterID),fighterID,0);
        break;
        
        case "GET WOOD":
        caption = "Getting Wood";
        QUICK = 0;
        CONTINUE = 0;
        XP+=3;
        INV[9]++;
        with(woodid)
            instance_destroy()
        update_create(update_get_text("get_water",fighterID),fighterID,0);
        break;
        
        case "GET ROPE":
        caption = "Getting Rope";
        QUICK = 0;
        CONTINUE = 0;
        XP+=5;
        INV[10]++;
        with(ropeid)
            instance_destroy()
        update_create(update_get_text("get_rope",fighterID),fighterID,0);
        break;
        
        case "GET STONE":
        caption = "Getting Stone";
        QUICK = 0;
        CONTINUE = 0;
        XP+=4;
        INV[11]++;
        with(stoneid)
            instance_destroy()
        update_create(update_get_text("get_stone",fighterID),fighterID,0);
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
        caption = "Taking a Bath";
        QUICK = 0;
        CONTINUE = 0;
        SANITY = clamp(SANITY + 2,-99,SANMAX);
        bathetime = time;
        DELAY = 60;
        update_create(update_get_text("bathe",fighterID),fighterID,0);
        break;
        
        case "MAKE SPEAR":
        caption = "Making a Spear";
        QUICK = 0;
        INV[9]--;
        INV[11]--;
        wspearid = instance_create(-100,-100,obj_woodSpear);
        wspearid.owner = id;
        INV[4]++;
        XP+=6;
        DELAY = 360;
        CONTINUE = 0;
        update_create(update_get_text("make_wspear",fighterID),fighterID,0);
        break;
        
        case "MAKE BOW":
        caption = "Making a Bow";
        QUICK = 0;
        INV[9]--;
        INV[10]--;
        wbowid = instance_create(-100,-100,obj_woodBow);
        wbowid.owner = id;
        INV[6]++;
        XP+=8;
        DELAY = 720;
        CONTINUE = 0;
        update_create(update_get_text("make_wbow",fighterID),fighterID,0);
        break;
        
        case "MAKE MEDKIT":
        caption = "Making a Medkit";
        QUICK = 0;
        CONTINUE = 0;
        INV[2]--;
        INV[10]--;
        INV[8]++;
        XP+=3;
        update_create(update_get_text("make_medkit",fighterID),fighterID,0);
        DELAY = 180;
        break;
        
        case "MAKE TRAP":
        caption = "Making a Trap";
        QUICK = 0;
        DELAY = 6;
        CONTINUE = 0;
        INV[10]--;
        INV[11]--;
        INV[1]++;
        XP+=3;
        update_create(update_get_text("make_trap",fighterID),fighterID,0);
        DELAY = 180;
        break;
        
        case "EAT":
        caption = "Eating";
        QUICK = 0;
        DELAY = 3;
        INV[2]--;
        HUNGER = 100;
        CONTINUE = 0;
        update_create(update_get_text("eat",fighterID),fighterID,0);
        break;
        
        case "DRINK":
        caption = "Drinking Water";
        QUICK = 0;
        DELAY = 3;
        THIRST = 100;
        CONTINUE = 0;
        update_create(update_get_text("drink",fighterID),fighterID,0);
        break;
        
        case "DRINK SUPPLY":
        caption = "Drinking Water";
        QUICK = 0;
        DELAY = 3;
        THIRST = 100;
        CONTINUE = 0;
        INV[3]--;
        update_create(update_get_text("drink",fighterID),fighterID,0);
        break;
        
        case "USE MEDKIT":
        caption = "Using a Medkit";
        QUICK = 0;
        CONTINUE = 0;
        INV[8]--;
        HP += 50;
        DELAY = 90;
        update_create(update_get_text("use_medkit",fighterID),fighterID,0);
        break;
        
        case "THINK":
        caption = "Thinking";
        QUICK = 0;
        DELAY = 10;
        CONTINUE = 3;
        update_create(update_get_text("think",fighterID),fighterID,0);
        break;
        
        case "THINK RARE":
        caption = "Thinking";
        QUICK = 0;
        DELAY = 10;
        CONTINUE = 3;
        update_create(update_get_text("think_rare",fighterID),fighterID,0);
        break;
        
        case "HUNT":
        caption = "Hunting";
        QUICK = .5 + AGILITY/10;
        CONTINUE = 150;
        DIR = point_direction(x,y-5,otherFighter.x,otherFighter.y-5);
        caption = "Hunting " + otherFighter.NAME;
        update_m_create(update_get_multichar_text("hunt",fighterID,otherFighter.fighterID),fighterID,otherFighter.fighterID,0,0,0);
        break;
        
        case "CHASE":
        QUICK = .7 + AGILITY/10;
        CONTINUE = 70;
        DIR = point_direction(x,y-5,otherFighter.x,otherFighter.y-5)
        caption = "Chasing " + otherFighter.NAME;
        update_m_create(update_get_multichar_text("chase",fighterID,otherFighter.fighterID),fighterID,otherFighter.fighterID,0,0,0);
        break;
        
        case "OBSERVE":
        QUICK = .1 + AGILITY/10;
        CONTINUE = 70;
        DIR = point_direction(x,y-5,otherFighter.x,otherFighter.y-5)
        caption = "Observing " + otherFighter.NAME;
        update_m_create(update_get_multichar_text("chase",fighterID,otherFighter.fighterID),fighterID,otherFighter.fighterID,0,0,0);
        break;
        
        case "RUN":
        caption = "Running";
        QUICK = .7 + AGILITY/10;
        CONTINUE = 80;
        DIR = point_direction(otherFighter.x,otherFighter.y-5,x,y-5);
        update_create(update_get_text("run",fighterID),fighterID,0);
        break;
        
        case "GROUP UP":
        if(group == -1)
            group = id;
        otherFighter.group = group;
        update_m_create(update_get_multichar_text("group_up",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,0);
        break;
        
        case "END GROUP":
        with(obj_fighter)
        {
            group = -1;
            for(var i=0; i<global.fighters+1; i++)
                opinion[i] = -5;
        }
        update_create(update_get_text("end_group",fighterID),fighterID,0);
        break;
        
        case "ATTACK UNARMED":
        with(obj_fighter)
        {
            if(id != other.id && group == other.otherFighter.group)
                opinion[other.fighterID]--;
        }
        caption = "Attacking " + otherFighter.NAME;
        QUICK = 0;
        CONTINUE = 15 * (HP/25);
        hit = irandom(STRENGTH);
        otherFighter.HP -= hit;
        var c = irandom(6);
        if(c == 6)
            XP++;
        if (otherFighter.HP <= 0)
        {
            global.deathCause[otherFighter.fighterID] = "Killed by " + global.NAMES[fighterID];
            if(SANITY < 0)
                update_m_create(update_get_multichar_text("kill_unarmed_insane",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
            else
                update_m_create(update_get_multichar_text("kill_unarmed",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
            kills++;
            XP+=5;
            c = irandom(5);
            SANITY -= c;
            SANMAX -= c;
            with (otherFighter)
            {
                drop_items();
                instance_destroy();
            }
        }
        else
            update_m_create(update_get_multichar_text("attack_unarmed",fighterID,otherFighter.fighterID),fighterID,otherFighter.fighterID,0,0,0);
        break;
        
        case "ATTACK WSPEAR":
        with(obj_fighter)
        {
            if(id != other.id && group == other.otherFighter.group)
                opinion[other.fighterID]--;
        }
        caption = "Attacking " + otherFighter.NAME + " with Spear";
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
        var c = irandom(5);
        if(c = 5)
            XP++;
        if (otherFighter.HP <= 0)
        {
            global.deathCause[otherFighter.fighterID] = "Killed by " + global.NAMES[fighterID];
            if(SANITY < 0)
                update_m_create(update_get_multichar_text("kill_wspear_insane",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
            else
                update_m_create(update_get_multichar_text("kill_wspear",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
            kills++;
            XP+=7;
            c = (floor(random(8)));
            SANITY -= c;
            SANMAX -= c;
            with (otherFighter)
            {
                drop_items();
                instance_destroy();
            }
        }
        else if(irandom(1000) < 11-LUCK){
            global.deathCause[fighterID] = "Killed by accident";
            update_m_create(update_get_multichar_text("kill_wspear_fail",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
            drop_items();
            instance_destroy();
        }
        else
            update_m_create(update_get_multichar_text("attack_wspear",fighterID,otherFighter.fighterID),fighterID,otherFighter.fighterID,0,0,0);
        break;
        
        case "ATTACK SSPEAR":
        with(obj_fighter)
        {
            if(id != other.id && group == other.otherFighter.group)
                opinion[other.fighterID]--;
        }
        caption = "Attacking " + otherFighter.NAME + " with Spear";
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
        var c = irandom(5);
        if(c = 5)
            XP+=2;
        if(otherFighter.HP <= 0)
        {
            global.deathCause[otherFighter.fighterID] = "Killed by " + global.NAMES[fighterID];
            if(SANITY < 0)
                update_m_create(update_get_multichar_text("kill_sspear_insane",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
            else
                update_m_create(update_get_multichar_text("kill_sspear",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
            kills++;
            XP+=8;
            c = (floor(random(8)));
            SANITY -= c;
            SANMAX -= c;
            with (otherFighter)
            {
                drop_items();
                instance_destroy();
            }
        }
        else if(irandom(1000) < 11-LUCK){
            global.deathCause[fighterID] = "Killed by accident";
            update_m_create(update_get_multichar_text("kill_sspear_fail",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
            drop_items();
            instance_destroy();
        }
        else
            update_m_create(update_get_multichar_text("attack_sspear",fighterID,otherFighter.fighterID),fighterID,otherFighter.fighterID,0,0,0);
        break;
            
        case "ATTACK WBOW":
        with(obj_fighter)
        {
            if(id != other.id && group == other.otherFighter.group)
                opinion[other.fighterID]--;
        }
        caption = "Attacking " + otherFighter.NAME + " with Bow";
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
        var c = irandom(4);
        if(c = 4)
            XP++;
        if (otherFighter.HP <= 0)
        {
            global.deathCause[otherFighter.fighterID] = "Killed by " + global.NAMES[fighterID];
            if(SANITY < 0)
                update_m_create(update_get_multichar_text("kill_wbow_insane",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
            else
                update_m_create(update_get_multichar_text("kill_wbow",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
            kills++;
            XP+=9;
            c = (floor(random(5)));
            SANITY -= c;
            SANMAX -= c;
            with (otherFighter)
            {
                drop_items();
                instance_destroy();
            }
        }
        else if(irandom(1000) < 11-LUCK){
            global.deathCause[fighterID] = "Killed by accident";
            update_m_create(update_get_multichar_text("kill_wbow_fail",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
            drop_items();
            instance_destroy();
        }
        else
            update_m_create(update_get_multichar_text("attack_wbow",fighterID,otherFighter.fighterID),fighterID,otherFighter.fighterID,0,0,0);
        break;
        
        case "ATTACK SBOW":
        with(obj_fighter)
        {
            if(id != other.id && group == other.otherFighter.group)
                opinion[other.fighterID]--;
        }
        caption = "Attacking " + otherFighter.NAME + " with Bow";
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
        var c = irandom(4);
        if(c = 4)
            XP+=2;
        if (otherFighter.HP <= 0)
        {
            global.deathCause[otherFighter.fighterID] = "Killed by " + global.NAMES[fighterID];
            if(SANITY < 0)
                update_m_create(update_get_multichar_text("kill_sbow_insane",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
            else
                update_m_create(update_get_multichar_text("kill_sbow",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
            kills++;
            XP+=10;
            c = (floor(random(5)));
            SANITY -= c;
            SANMAX -= c;
            with (otherFighter)
            {
                drop_items();
                instance_destroy();
            }
        }
        else if(irandom(1000) < 11-LUCK){
            global.deathCause[fighterID] = "Killed by accident";
            update_m_create(update_get_multichar_text("kill_sbow_fail",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
            drop_items();
            instance_destroy();
        }
        else
            update_m_create(update_get_multichar_text("attack_sbow",fighterID,otherFighter.fighterID),fighterID,otherFighter.fighterID,0,0,0);
        break;
        
        case "ATTACK DROWN":
        with(obj_fighter)
        {
            if(id != other.id && group == other.otherFighter.group)
                opinion[other.fighterID]-=2;
        }
        QUICK = 0;
        CONTINUE = 0;
        if(SANITY < 0)
            update_m_create(update_get_multichar_text("kill_drown_insane",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
        else
            update_m_create(update_get_multichar_text("kill_drown",fighterID,otherFighter.fighterID,0,0),fighterID,otherFighter.fighterID,0,0,1);
        kills++;
        XP+=12;
        SANITY -= (floor(random(5)));
        with (otherFighter)
        {
            global.deathCause[fighterID] = "Drowned by " + other.NAME;
            drop_items();
            instance_destroy();
        }
        break;
        
        case "PLACE MINE":
        caption = "Placing Landmine";
        QUICK = 0;
        CONTINUE = 0;
        var c = irandom(10)
        if(c+SKILL>=5)
        {
            var w = instance_create(x,y,obj_landmine);
            w.owner = fighterID;
            INV[0]--;
            update_create(update_get_text("place_mine",fighterID),fighterID,0);
        }
        else
        {
            global.deathCause[fighterID] = "Killed by own land mine";
            HP = 0;
            instance_create(x,y,obj_explosion);
            update_create(update_get_text("die_mine_p",fighterID),fighterID,1);
            instance_destroy();
        }
        break;
    
        case "SET TRAP":
        caption = "Placing Trap";
        QUICK = 0;
        CONTINUE = 0;
        var w = instance_create(x,y,obj_trap);
        w.owner = fighterID;
        INV[1]--;
        update_create(update_get_text("set_trap",fighterID),fighterID,0);
        break;
        
        default:
        break;
        
        case "SUICIDE":
        global.deathCause[fighterID] = "Death by suicide";
        update_create(update_get_text("suicide",fighterID),fighterID,1);
        drop_items();    
        instance_destroy();
        break;
    }
}

