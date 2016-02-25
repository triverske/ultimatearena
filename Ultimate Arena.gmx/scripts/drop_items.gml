with(instance_create(x,y,oItems))
{
    var check = 0;
    for(i=0;i<20;i++)
    {
        INV[i] = other.INV[i];
        if(INV[i] != 0)
            check = 1;
    }
    
    wspearid = other.wspearid;
    sspearid = other.sspearid;
    wbowid = other.wbowid;
    sbowid = other.sbowid;
    
    if(check == 0)
        instance_destroy();
}
