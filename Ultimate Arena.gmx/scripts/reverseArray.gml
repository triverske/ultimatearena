///reverseArray(array)
var count = 0;

tmpArray[0] = 0;

length = array_length_1d(argument0);

for(i = 0; i <= length; i++)
{
    tmpArray[i] = argument0[i];

}
for(i = length; i > 0; i--)
{
    argument0[count] = tmpArray[i];
    count++;

}
tmpArray = 0;

return argument0;
