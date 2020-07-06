//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/15/19, 16:29:20
  // ----------------------------------------------------
  // Method: newEvent
  // Description
  //      Open the Event Editor for new event creation.
  // ----------------------------------------------------

C_LONGINT:C283($win_l)
C_TEXT:C284($form_t)
C_OBJECT:C1216($event_o;$status_o)

$event_o:=ds:C1482.Events.new()
$event_o.ownerID:=getCurrentUserId 
$event_o.startDate:=Current date:C33
$event_o.endDate:=$event_o.startDate
$event_o.startTime:=nextHour 
$event_o.endTime:=$event_o.startTime
$event_o.recurrence:=New object:C1471("repeat";"None")

$form_t:="eventInput"
$win_l:=Open form window:C675($form_t)
DIALOG:C40($form_t;$event_o)
CLOSE WINDOW:C154($win_l)

If (OK=1)
	$status_o:=$event_o.save()
	Case of 
		: ($status_o.success=False:C215)
			ALERT:C41($status_o.statusText)
	End case 
End if 
