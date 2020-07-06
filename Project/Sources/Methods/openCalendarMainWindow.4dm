//%attributes = {}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/15/19, 16:12:38
  // ----------------------------------------------------
  // Method: openCalendarMainWindow
  // Description
  //      Open a calendar in a new window
  // ----------------------------------------------------

C_LONGINT:C283($1;$proc_l)

If (Count parameters:C259=0)
	$proc_l:=New process:C317(Current method name:C684;0;"fc Calendar Main Multiple";1;*)
	
Else 
	
	C_LONGINT:C283($win_l)
	C_TEXT:C284($form_t)
	C_OBJECT:C1216($data_o)
	$data_o:=New object:C1471("calContainer";buildCalendarViewObject )
	$form_t:="main"
	$win_l:=Open form window:C675($form_t)
	DIALOG:C40($form_t;$data_o)
	CLOSE WINDOW:C154($win_l)
	
End if 
