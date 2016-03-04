///sendVote(type,fighterID,twitchID)
//
// Vote type 1 - Fighter Selection
// Vote type 2 - Winner Selection
// Vote type 3 - Sponsor Selection
//

fID = real(argument1);
tID = argument2;


if(argument0 == 1)
{
    if(fID > global.lNAME || fID < 0) exit;
    
    fighterVotes[fID,0]++;
    with (oTwitchCharbox)
    {
        if (other.fID == ID)
            mix = 1;
    }
}
else if(argument0 == 2)
{
    if(fID > 59 || fID < 0) exit;
    
    ini_open("twitch.ini")
    if (!ini_section_exists(tID))
    {
        ini_write_real(tID,"points",0);
        ini_write_real(tID,"votenum",0);
    }
    var votenum = ini_read_real(tID,"votenum",0);
    
    if(votenum < global.currentgame)
    {
        winnerVotes[fID,0]++;
        winnerVotes[fID,winnerVotes[fID,0]] = tID;
        ini_write_real(tID,"votenum",global.currentgame);
        createTwitchName(tID + " voted for " + global.cNAME[fighterVotes[fID,1]]);
        with (oTwitchCharbox2)
        {
            if (other.fID == fID)
                mix = 1;
        }
    }
    ini_close();
}
else if(argument0 == 3)
{
    if(fID > 4 || fID < 1) exit;
    
    sponsorVotes[fID]++;
}
