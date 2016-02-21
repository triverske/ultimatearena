///vect_rev(vect)
//reverse direction for the vector

var i;
var v1 = argument0;
var v;

var num = v1[0];
var tot = 0;
v[0] = num;
for(i=1; i<= num; i++)
{
    v[i] = -v1[i];
}

return v;
