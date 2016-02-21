///getCommand()

//returns the randomized command.
var totalprob = 0; var randvar = 0; totalc = 0;
for(i=0;i<commands;i++)
{
    totalprob+=commandArray[i,1];
}
randvar = floor(random(totalprob));

for(i=0;i<commands-1;i++)
{
    if (randvar < (commandArray[i,1] + totalc))
        return commandArray[i,0];
    totalc += commandArray[i,1];
}
return commandArray[commands-1,0];
