///array_to_section();

var copy = textList;
textList = 0;
var sc = global.SECTIONS
for(var i=sc; i>-1; i--){
    if(i != command){
        for(var j=array_length_2d(copy,i)-1; j>-1; j--)
            textList[i,j] = copy[i,j];
    }
    else{
        for(var j=array_length_1d(currentList); j>0; j--){
            if(currentList[j-1] != "")
                textList[i,j] = currentList[j-1];
        }
    }
}

if(currentList[0] != ""){
    var s = "";
    for(var i=0; i<array_length_1d(toggleList); i++)
        s+=string(toggleList[i]);
        
    textList[command,0] = s;
}
else{
    textList[command,0] = "";
}
