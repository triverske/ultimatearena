///array_from_section();

currentList = 0;
toggleList = 0;

if(textList[command,0] == ""){
    currentList[0] = "";
    toggleList[0] = 0;
}
else{
    for(var i=array_length_2d(textList,command)-1; i>0; i--){
        currentList[i-1] = textList[command,i];
        toggleList[i-1] = real(string_char_at(textList[command,0],i));
    }
}
