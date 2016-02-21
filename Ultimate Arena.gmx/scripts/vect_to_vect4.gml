///vect_to_vect4(vect)
//converts vect to a vect4

var i;
var v1 = argument0;
var v;

var num = min(v1[0],4);
v[0] = num;
v[1] = 0;
v[2] = 0;
v[3] = 0;
v[4] = 0;
for(i=1; i<= num; i++)
{
    v[i] = v1[i];
}
return v;
