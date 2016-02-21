if (instance_exists(objZUIMain))
 return objZUIMain.id;
else
 return instance_create(0, 0, objZUIMain);
