/*
argument0= id (controls the switching on "Tab")
argument1=hide content?

argument2= x
argument3= y
argument4= width

argument5= disable!
argument6= default value
argument7= input string
argument8= max length (0 to limit the width of the field)
*/
field_height=string_height('gl')
field_hidden=""
notActive = argument5;
/*
//TAB features
if field_sett[| 12]=argument0 and argument5
then field_sett[| 12]+=1

if field_sett[| 12]>field_sett[| 13]-1
then field_sett[| 12]=0
*/

// activate on click
if mouse_check_button_released(mb_left)
{
    if (mouse_x > x && mouse_x < (x + argument4))
    {
        if(mouse_y > y && mouse_y < (y + 16))
        {
            active = false;
        }
    }
    else
        active = true;
}

/*
if point_in_rectangle(mouse_x,mouse_y,round(argument2),round(argument3-field_sett[| 11]/2),round(argument2+argument4),round(argument3+field_height+field_sett[| 11]/2))
if !argument5
if !argument1 then keyboard_string=field_content[| argument0] else keyboard_string="" field_sett[| 12]=argument0} */

//drawing the stroke
if notActive
   then draw_set_colour(field_sett[| 2]) //disable
   else if argument0=field_sett[| 12] 
           then draw_set_colour(field_sett[| 5]) //active
           else draw_set_colour(field_sett[| 8]) //passive

for (i=0; i<field_sett[| 0]; i+=1) draw_rectangle(round(argument2-i),round(argument3-i-field_sett[| 11]/2),round(i+argument2+argument4),round(i+argument3+field_height+field_sett[| 11]/2),1)

//drawing the fill
if notActive
   then draw_set_colour(field_sett[| 3]) //disable
   else if argument0=field_sett[| 12] 
           then draw_set_colour(field_sett[| 6]) //active
           else draw_set_colour(field_sett[| 9]) //passive 
draw_rectangle(round(argument2+1),round(argument3+1-field_sett[| 11]/2),round(argument2+argument4-1),round(argument3+field_height+field_sett[| 11]/2-1),0)

//drawing the text
if notActive
   then draw_set_colour(field_sett[| 4]) //disable
   else if argument0=field_sett[| 12] 
           then draw_set_colour(field_sett[| 7]) //active
           else draw_set_colour(field_sett[| 10]) //passive


if !argument1 
then{if field_content[| argument0]!=""       //visible text
     then draw_text(round(argument2+3),round(argument3+1),field_content[| argument0])
     else {draw_set_alpha(0.3) draw_text(round(argument2+3),round(argument3+1),argument6) draw_set_alpha(1)} }
                                             //hidden text
else{for (i=0; i<string_length(field_content[| argument0]); i+=1) field_hidden+="*"    
     if field_content[| argument0]!=""    
     then draw_text(round(argument2+3),round(argument3+1),field_hidden)
     else {draw_set_alpha(0.3) draw_text(round(argument2+3),round(argument3+1),argument6) draw_set_alpha(1)}}


if argument0=field_sett[| 12]    //limit the length
if argument8 
then field_content[| argument0]=string_copy(argument7,0,argument8)
else if string_width(argument7)<argument4-10 then field_content[| argument0]=argument7

// drawing the cursor
if argument0=field_sett[| 12]
{
draw_set_colour(field_sett[| 5]) //active           
if date_get_second(date_current_datetime()) mod 2 >0
   for (i=0; i<field_sett[| 1]; i+=1) 
   if !argument1
   then draw_line(round(argument2+3+i+string_width(field_content[| argument0])),round(argument3+1),round(argument2+3+i+string_width(field_content[| argument0])),round(argument3+field_height-2))
   else draw_line(round(argument2+3+i+string_width(field_hidden)),round(argument3+1),round(argument2+3+i+string_width(field_hidden)),round(argument3+field_height-2))
}
