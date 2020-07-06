//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/15/19, 16:36:40
  // ----------------------------------------------------
  // Method: viewAttribute
  // Description
  //      Convert the view token with the view attribute
  //      that fullCalendar supports.
  //
  // Parameters
  //     $1    -    View token
  // ----------------------------------------------------

C_TEXT:C284($0;$1)
If (Count parameters:C259=1)
	Case of 
		: ($1="month")
			$0:="dayGridMonth"
		: ($1="week")
			$0:="timeGridWeek"
		: ($1="day")
			$0:="timeGridDay"
		: ($1="list")
			$0:="listWeek"
	End case 
End if 
