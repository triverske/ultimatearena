with(oGraphicsController)
{
    if(global.custom_sounds)
    {
        if(global.SOUNDS[argument0] != "")
        {
            test1 = audio_create_stream("Characters/" + global.SOUNDS[argument0]);
            audio_play_sound(test1,0,0);
            
        }
    }
}
