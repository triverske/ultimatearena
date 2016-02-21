///vect_to_vect3(vect)
//converts vect to a vect3

var i;
var v1 = argument0;
var v;

var num = min(v1[0],3);
v[0] = num;
v[1] = 0;
v[2] = 0;
v[3] = 0;
for(i=1; i<= num; i++)
{
    v[i] = v1[i];
}
return v;
