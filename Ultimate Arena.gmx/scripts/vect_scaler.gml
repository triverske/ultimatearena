///vect_scaler(vect,real)
//scales the vector to the distance specified

var i;
var v1 = vect_norm(argument0);
var scale = argument1;
var v;

var num = v1[0];
var tot = 0;
v[0] = num;
for(i=1; i<= num; i++)
{
    v[i] = v1[i]*scale;
}

return v;
