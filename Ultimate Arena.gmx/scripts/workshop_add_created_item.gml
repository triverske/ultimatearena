///workshop_add_created_item(workshop_id)

var workshopID = argument0;

if(workshopID == -1)
    exit;
    
if(global.createdWorkshopItemsCount > 0)
{
    for(var q = 0;q < global.createdWorkshopItemsCount;q++)
    {
        if(workshopID == global.createdWorkshopItems[q])
            exit;
    }
    global.createdWorkshopItems[global.createdWorkshopItemsCount] = workshopID;
    global.createdWorkshopItemsCount++;
}
else
{
    global.createdWorkshopItems[0] = workshopID;
    global.createdWorkshopItemsCount = 1;
}
