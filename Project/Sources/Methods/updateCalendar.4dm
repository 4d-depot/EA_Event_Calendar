//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/15/19, 16:33:48
  // ----------------------------------------------------
  // Method: updateCalendar
  // Description
  //     This method is used to update/refresh fullCalendar
  //     with the latest data.
  // ----------------------------------------------------

C_COLLECTION:C1488($1)
changeDate (formatDate (Form:C1466.date;"yyyy-mm-dd"))
If (Count parameters:C259>=1)
	Form:C1466.filter:=$1
End if 
createCalendarData (Form:C1466.date)

WA EXECUTE JAVASCRIPT FUNCTION:C1043(*;"webArea";"updateEventData";*;\
viewAttribute (Form:C1466.view);formatDate (Form:C1466.date;"yyyy-mm-dd");events_c)

updateTitle 