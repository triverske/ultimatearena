///vect_cross(vect1,vect2)
//returns the cross product between vect1 and vect2
var i;
var v1 = argument0;
var v2 = argument1;

var num = min(v1[0],v2[0]);
if(num ==2)
{
    var v3 = vect_cross(vect3(v1[1],v1[2],1),vect3(v2[1],v2[2],1));
    v3[0] = 2;
    return v3;
}
else if (num ==3)
{
    return vect3(v1[2] * v2[3] - v1[3] * v2[2], v1[3] * v2[1] - v1[1] * v2[3],v1[1] * v2[2] - v1[2] * v2[1]);
}
else
{
    show_debug_message("vect_cross todo vect4")
    return vect4(0,0,0,0);
}
return 0;
