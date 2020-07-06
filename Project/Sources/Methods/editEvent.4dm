//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/15/19, 16:26:19
  // ----------------------------------------------------
  // Method: editEvent
  // Description
  //    Open the Event Editor for the given Event entity.
  //
  // Parameters
  //    $1    -    Event entity
  // ----------------------------------------------------

C_LONGINT:C283($win_l)
C_TEXT:C284($form_t)
C_OBJECT:C1216($1;$event_o;$status_o)
C_BOOLEAN:C305(deleteEntity_b)

If (Count parameters:C259>=1)
	
	deleteEntity_b:=False:C215
	
	$event_o:=$1
	
	$form_t:="eventInput"
	$win_l:=Open form window:C675($form_t)
	DIALOG:C40($form_t;$event_o)
	CLOSE WINDOW:C154($win_l)
	
	If (OK=1)
		If (deleteEntity_b)
			$status_o:=$event_o.drop()
		Else 
			$status_o:=$event_o.save()
		End if 
		Case of 
			: ($status_o.success=False:C215)
				ALERT:C41($status_o.statusText)
		End case 
	End if 
End if 
