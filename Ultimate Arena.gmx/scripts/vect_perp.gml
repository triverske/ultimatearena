///vect_perp(vect)
//perpendicular vector for the vector

var i;
var v1 = argument0;
var v;

var num = v1[0];
v[0] = num;
if(num ==2)
{
    v[1] = -v1[2];
    v[2] = v1[1];
}
else if(num ==3)
{
    v = vect3(0,0,0);
    show_debug_message("vect_perp, todo vect3")
}
else
{
    v = vect4(0,0,0,0);
    show_debug_message("vect_perp, todo vect4")
}

return v;
