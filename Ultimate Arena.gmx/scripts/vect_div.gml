///vect_div(vect1, vect2)
//divide each component of vect1 by each component of vect2
var i;
var v1 = argument0;
var v2 = argument1;
var v;

var num = min(v1[0],v2[0]);
v[0] = num;
for(i=1; i<= num; i++)
{
    v[i] = v1[i]/v2[i];
}
return v;
