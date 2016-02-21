///vect_dot(vect1,vect2)
//returns the dot product between vect1 and vect2
var i;
var v1 = argument0;
var v2 = argument1;

var num = min(v1[0],v2[0]);
var tot = 0;
for(i=1; i<= num; i++)
{
    tot+=v1[i] * v2[i];
}

return tot;
