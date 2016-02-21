///vect_truncate(vector,max length)
//if the vector exceeds the max length, it will be returned truncated to max length.
var _vec=argument[0];
var _len=argument[1];

if(vect_len(_vec)>_len)
    _vec=vect_scaler(_vec,_len);

return(_vec);
