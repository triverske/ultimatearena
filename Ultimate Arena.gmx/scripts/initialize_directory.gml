///initialize_directories(directory)
//Will set directory[i] to list all of the directories

var i = 0;
var _find = file_find_first(working_directory + argument0 + "\*", fa_directory); 

if(directory_exists(working_directory + argument0 + "\" + _find))
{
    directory[0] = _find;
    i++;
}
    
while (_find != "")
{ 
    _find = file_find_next(); 
    if(directory_exists(working_directory + argument0 + "\" + _find))
    {
        directory[i] = _find;
        i++
    }
    show_debug_message(argument0 + "\" + _find);
} 
file_find_close();
