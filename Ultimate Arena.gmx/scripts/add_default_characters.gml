defaultC[0] = "Hitler";
defaultC[1] = "Shakespeare";
defaultC[2] = "Tom Sawyer";
defaultC[3] = "Moby Dick";
defaultC[4] = "Lincoln";
defaultC[5] = "Washington";
defaultC[6] = "Oscar Wilde";
defaultC[7] = "Stalin";
defaultC[8] = "Kafka";
defaultC[9] = "Linnaeus";
defaultC[10] = "Jesus";
defaultC[11] = "Aristotle";
defaultC[12] = "Napoleon";
defaultC[13] = "Julius Caesar";
defaultC[14] = "Plato";
defaultC[15] = "Bruce Lee";
defaultC[16] = "Walt Disney";
defaultC[17] = "Marilyn";
defaultC[18] = "Elvis";
defaultC[19] = "Che";
defaultC[20] = "Darwin";
defaultC[21] = "Galileo";
defaultC[22] = "Columbus";
defaultC[23] = "Newton";
defaultC[24] = "Mozart";
defaultC[25] = "da Vinci";
defaultC[26] = "Gandhi";
defaultC[27] = "Mandela";
defaultC[28] = "Tesla";
defaultC[29] = "Marx";
defaultC[30] = "Beethoven";
defaultC[31] = "Bill Gates";
defaultC[32] = "Churchhill";
defaultC[33] = "Bach";
defaultC[34] = "Steve Jobs";
defaultC[35] = "The Queen";
defaultC[36] = "Rosa Parks";
defaultC[37] = "The Pope";
defaultC[38] = "Malcolm X";
defaultC[39] = "Spielberg";
defaultC[40] = "Kim Jong-un";
defaultC[41] = "Hulk Hogan";
defaultC[42] = "Hillary";
defaultC[43] = "Trump";
defaultC[44] = "Bernie";
defaultC[45] = "Ted Cruz";
defaultC[46] = "Marco Rubio";
defaultC[47] = "Vermin Supreme";
defaultC[48] = "PewDiePie";
defaultC[49] = "Skrillex";
defaultC[50] = "Tiger Woods";
defaultC[51] = "Charlie Sheen";
defaultC[52] = "Stevie Wonder";
defaultC[53] = "Kanye West";
defaultC[54] = "Zuckerberg"
defaultC[55] = "John Carmack";
defaultC[56] = "Troy Bonneau";
defaultC[57] = "Elton John";
defaultC[58] = "Mussolini";
defaultC[59] = "A Stray Dog";
defaultC[60] = "Notch";
defaultC[61] = "Jeb Bush";
defaultC[62] = "Van Gogh";
defaultC[63] = "Phil Collins";
defaultC[64] = "Mr. Rogers";
defaultC[65] = "Putin";
defaultC[66] = "Taylor Swift";

v = sprite_duplicate(sDefaultCharacters);

for(i = 0;i < array_length_1d(defaultC);i++)
{
    if(!file_exists(working_directory + "characters\" + defaultC[i] + ".ini"))
    {
        show_debug_message(defaultC[i]);
        ini_open(working_directory + "characters\" + defaultC[i] + ".ini");
        ini_write_string("character","name",defaultC[i]);
        ini_write_string("character","image",defaultC[i]+".png");
        
        if(i == 35 || i == 36 || i == 17 || i == 42 || i == 66)
            ini_write_real("character","gender",1)
        else
            ini_write_real("character","gender",0)
            
        sprite_save(v,i,working_directory + "characters\" +defaultC[i]+".png");
    }
}

game_restart();
