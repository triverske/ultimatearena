with(instance_create(x,y,obj_itemBag))
{
    var check = 0;
    for(i=0;i<20;i++)
    {
        INV[i] = other.INV[i];
        if(INV[i] > 0)
            check = 1;
    }
    
    if(!check)
        instance_destroy();
        
    if(INV[4]>0)
    {
        wspearid = other.wspearid;
        wspearid.owner = id;
    }
    if(INV[5]>0)
    {
        sspearid = other.sspearid;
        sspearid.owner = id;
    }
    if(INV[6]>0)
    {
        wbowid = other.wbowid;
        wbowid.owner = id;
    }
    if(INV[7]>0)
    {
        sbowid = other.sbowid;
        sbowid.owner = id;
    }
    
}
