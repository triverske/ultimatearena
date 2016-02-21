///vect_norm(vect)
//normalises a scalar to vector 
var i;
var v1 = argument0;
var v;

var num = v1[0];
var tot = 0;
v[0] = num;
for(i=1; i<= num; i++)
{
    v[i] = 0;
    tot+=v1[i]*v1[i];
}
if(tot != 0)
{
    tot = sqrt(tot);
    for(i=1; i<= num; i++)
    {
        v[i] = v1[i]/tot;
    }
}
return v;
