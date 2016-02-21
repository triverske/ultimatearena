/*
argument0= line width
argument1= cursor width

    disable field
argument2= col_line 
argument3= col_field
argument4= col_text

    active field
argument5= col_line
argument6= col_field
argument7= col_text

    passive field
argument8= col_line
argument9= col_field
argument10= col_text

argument11= increase the height (+px only even values!)
argument12= active field
argument13= number of fields

*/


field_sett=ds_list_create()
field_content=ds_list_create()

ds_list_add(field_sett,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11,argument12,argument13)

repeat argument13
ds_list_add(field_content,"")
