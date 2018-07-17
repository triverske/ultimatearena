if (instance_exists(obj_uiMain))
 return obj_uiMain.id;
else
 return instance_create(0, 0, obj_uiMain);
