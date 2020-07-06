//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/15/19, 16:24:29
  // ----------------------------------------------------
  // Method: changeDate
  // Description
  //     Chjange the pivot date in the fullCalendar.
  //
  // Parameters
  //    $1    -    Date in text (YYYY-MM-DD)
  // ----------------------------------------------------

C_TEXT:C284($1)
If (Count parameters:C259=1)
	WA EXECUTE JAVASCRIPT FUNCTION:C1043(*;"webArea";"change";*;"date";$1)
End if 