//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/15/19, 16:38:08
  // ----------------------------------------------------
  // Method: waCallBackEventEdit
  // Description
  //      This method is called through JavaScript. It is a call back
  //      when the user clicks on an event on the fullCalendar.
  //      The $1 object is an extendedProps property that contains
  //      the primary key of an event record.
  //
  // Parameters
  //     $1    -    extendedProps object
  // ----------------------------------------------------

C_OBJECT:C1216($0;$1;$events_o;$event_o)
If ($1.ID#Null:C1517)
	$events_o:=ds:C1482.Events.query("ID = :1";$1.ID)
	If ($events_o.length>0)
		$event_o:=$events_o[0]
		editEvent ($event_o)
		
		C_TEXT:C284($title_t;$start_t;$end_t)
		$title_t:=String:C10(Time:C179($event_o.startTime);HH MM AM PM:K7:5)+" "+$event_o.subject
		$start_t:=formatDate ($event_o.startDate;"yyyy-mm-dd")+"T"+String:C10(Time:C179($event_o.startTime))
		$end_t:=formatDate ($event_o.endDate;"yyyy-mm-dd")+"T"+String:C10(Time:C179($event_o.endTime))
		$0:=New object:C1471("title";$title_t;"start";$start_t;"end";$end_t;"extendedProps";\
			New object:C1471("ID";String:C10($event_o.ID)))
	End if 
End if 