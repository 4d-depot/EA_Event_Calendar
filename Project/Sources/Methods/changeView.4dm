//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/15/19, 16:25:23
  // ----------------------------------------------------
  // Method: changeView
  // Description
  //     Change the display view of the fullCalendar.
  //
  // Parameters
  //    $1    -    View
  // ----------------------------------------------------

C_TEXT:C284($1)
If (Count parameters:C259=1)
	Case of 
		: ($1="month")
			WA EXECUTE JAVASCRIPT FUNCTION:C1043(*;"webArea";"change";*;"view";"dayGridMonth")
		: ($1="week")
			WA EXECUTE JAVASCRIPT FUNCTION:C1043(*;"webArea";"change";*;"view";"timeGridWeek")
		: ($1="day")
			WA EXECUTE JAVASCRIPT FUNCTION:C1043(*;"webArea";"change";*;"view";"timeGridDay")
		: ($1="list")
			WA EXECUTE JAVASCRIPT FUNCTION:C1043(*;"webArea";"change";*;"view";"listWeek")
	End case 
End if 
