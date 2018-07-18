///date_timestamp(timestamp)
// Convert UNIX time to GMS time

var t = date_inc_second(25569+1, argument0);
return date_inc_day(t, -1);
