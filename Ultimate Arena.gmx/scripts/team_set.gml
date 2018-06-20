var fight = argument0;
var char = argument1;
if(global.TEAM[fight] == "")
    exit;

var gro = 0;
switch(global.TEAM[fight])
{
    case "RED":
        gro = 0;
        break;
    case "ORANGE":
        gro = 1;
        break;
    case "YELLOW":
        gro = 2;
        break;
    case "GREEN":
        gro = 3;
        break;
    case "BLUE":
        gro = 4;
        break;
    case "PURPLE":
        gro = 5;
        break;
}
    

var tid = regGroup[gro];
if(tid == -1)
{
    char.group = char;
    regGroup[gro] = char;
}
else
{
    char.group = regGroup[gro];
}
