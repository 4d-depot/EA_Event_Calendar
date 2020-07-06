//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/23/19, 08:17:02
  // ----------------------------------------------------
  // Method: waCallBackEventUpdate
  // Description
  //      This method is executed when an event is altered
  //      directly on the calendar.
  //
  // Parameters
  //    $1    -    Event object
  //    $2    -    New start date
  //    $3    -    New end date
  // ----------------------------------------------------

C_OBJECT:C1216($0;$1;$events_o;$event_o;$status_o)
C_TEXT:C284($2;$3)

If ($1.ID#Null:C1517)
	$events_o:=ds:C1482.Events.query("ID = :1";$1.ID)
	If ($events_o.length>0)
		$event_o:=$events_o[0]
		$event_o.startDate:=Date:C102($2)
		$event_o.startTime:=gmtToTime ($2)
		$event_o.endDate:=Date:C102($3)
		$event_o.endTime:=gmtToTime ($3)
		$status_o:=$event_o.save()
		If ($status_o.success=False:C215)
			ALERT:C41($status_o.statusText)
		End if 
	End if 
End if 
