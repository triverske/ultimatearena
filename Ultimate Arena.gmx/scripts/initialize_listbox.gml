///initialize_listbox(list,min,max)

//This script sets some initial variables needed for a listbox
//that I had no other way of calculating

list = argument[0];


if(argument_count > 1)
{
    length = argument[2] - argument[1] + 1;
    for(i=0;i<=argument[2];i++)
    {
        ypos[i] = i*16;
    }
    
    minimum = argument[1];
    
    for(i=0;i<length;i++)
    {
        list[i] = list[i + minimum];
    }


}
else
{
    length = array_length_1d(list);
    for(i=0;i<=length;i++)
    {
        ypos[i] = i*16;
    }
    minimum = 0;

}
