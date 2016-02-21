///draw_text_wrap(x,y,str,pos,show)
/*

    CALL:
        draw_text_wrap(x,y,str,pos,show)

    INFO:
        Draw a text that is wrapped horizontally.

    ARGUMENTS:
        x =             The x position to draw the text.
        y =             The y position to draw the text.
        str =           The string to draw.
        pos =           The position of the first character to show. This
                        can be any number, positive or negative.
        show =          The number of characters to show.

    RETURNS:
        Nothing.

    WRITTEN BY:
        Davve
        No credit needed if used.

*/
draw_text(argument0, argument1, string_copy((ceil(argument4 / string_length(argument2)) + 1) * argument2, string_length(argument2) * (argument3 < 0) + argument3 mod string_length(argument2) + 1, argument4));
