//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/15/19, 16:15:12
  // ----------------------------------------------------
  // Method: createCalendarData
  // Description
  //      Based on the given date, generate the data in the
  //     format supported by fullCalendar.
  //
  // Parameters
  //    $1    -    Date
  // ----------------------------------------------------

C_DATE:C307($1;$targetDate_d)
C_COLLECTION:C1488($userFilter_c)
If (Count parameters:C259>=1)
	$targetDate_d:=$1
Else 
	$targetDate_d:=Current date:C33
End if 

If (Form:C1466.filter#Null:C1517)
	$userFilter_c:=Form:C1466.filter
End if 

C_TEXT:C284(eventDefaultDate_t)  // yyyy-mm-dd
C_COLLECTION:C1488(events_c)
events_c:=New collection:C1472

C_OBJECT:C1216($dateRange_o;$events_o;$event_o)
$dateRange_o:=getDateRange ($targetDate_d;"month")
If ($userFilter_c=Null:C1517)
	$events_o:=ds:C1482.Events.query("startDate >= :1 and endDate <= :2";$dateRange_o.startDate;$dateRange_o.endDate)
Else 
	$events_o:=ds:C1482.Events.query("startDate >= :1 and endDate <= :2 and ownerID in :3";$dateRange_o.startDate;$dateRange_o.endDate;$userFilter_c)
End if 
eventDefaultDate_t:=formatDate (Current date:C33;"yyyy-mm-dd")

events_c.push(New object:C1471("start";eventDefaultDate_t;\
"end";eventDefaultDate_t;"overlap";False:C215;\
"rendering";"background";"color";"#ff9f89"))

ARRAY LONGINT:C221($ownerId_al;0)
C_COLLECTION:C1488($color_c)
$color_c:=getColors 

C_TEXT:C284($title_t;$start_t;$end_t;$color_t)
C_LONGINT:C283($curUserId_l)
C_OBJECT:C1216($share_o;$shares_o;$shareWith_o)
C_COLLECTION:C1488($shareWithUsers_c)

$curUserId_l:=getCurrentUserId 
$shareWithUsers_c:=userIdThatSharedCalendar 
ARRAY LONGINT:C221($shareOwnerID_al;0)
COLLECTION TO ARRAY:C1562($shareWithUsers_c;$shareOwnerID_al)

C_BOOLEAN:C305($editable_b)
C_LONGINT:C283($mode_l)
For each ($event_o;$events_o)
	
	Case of 
		: ($event_o.ownerID=$curUserId_l)
			$editable_b:=True:C214
			$mode_l:=2
		: (Find in array:C230($shareOwnerID_al;$event_o.ownerID)#-1)
			If (getPermission ($event_o.ownerID)="Read and Write")
				$editable_b:=True:C214
				$mode_l:=2
			Else 
				$editable_b:=False:C215
				$mode_l:=1
			End if 
			
		Else 
			$editable_b:=True:C214
			$mode_l:=0
	End case 
	
	If ($mode_l>0)
		$color_t:=Storage:C1525.color[String:C10($event_o.ownerID)]
		
		If ($event_o.allDay)
			$title_t:="All day "+$event_o.subject
			$start_t:=formatDate ($event_o.startDate;"yyyy-mm-dd")
			$end_t:=formatDate ($event_o.endDate;"yyyy-mm-dd")
		Else 
			$title_t:=$event_o.subject
			$start_t:=formatDate ($event_o.startDate;"yyyy-mm-dd")+"T"+String:C10(Time:C179($event_o.startTime))
			$end_t:=formatDate ($event_o.endDate;"yyyy-mm-dd")+"T"+String:C10(Time:C179($event_o.endTime))
		End if 
		
		C_COLLECTION:C1488($dayOfWeek_c)
		C_TEXT:C284($startRecur_t;$endRecur_t)
		If ($event_o.recurrence#Null:C1517)
			If ($event_o.recurrence.repeat#Null:C1517)
				Case of 
					: ($event_o.recurrence.repeat="Every day")
						$startRecur_t:=$start_t  //formatDate ($event_o.recurrence.startRecure;"yyyy-mm-dd")
						$endRecur_t:=formatDate ($event_o.recurrence.endRecure;"yyyy-mm-dd")
						events_c.push(New object:C1471("title";$title_t;"start";$start_t;"end";$end_t;"color";$color_t;\
							"editable";$editable_b;"extendedProps";New object:C1471("ID";String:C10($event_o.ID));\
							"startRecur";$startRecur_t;"endRecur";$endRecur_t))
					: ($event_o.recurrence.repeat="Every week")
						$dayOfWeek_c:=$event_o.recurrence.dayOfWeek
						$startRecur_t:=$start_t  //formatDate ($event_o.recurrence.startRecure;"yyyy-mm-dd")
						$endRecur_t:=formatDate ($event_o.recurrence.endRecure;"yyyy-mm-dd")
						events_c.push(New object:C1471("title";$title_t;"start";$start_t;"end";$end_t;"color";$color_t;\
							"editable";$editable_b;"extendedProps";New object:C1471("ID";String:C10($event_o.ID));\
							"daysOfWeek";$dayOfWeek_c;"startRecur";$startRecur_t;"endRecur";$endRecur_t))
					Else 
						events_c.push(New object:C1471("title";$title_t;"start";$start_t;"end";$end_t;"color";$color_t;\
							"editable";$editable_b;"extendedProps";New object:C1471("ID";String:C10($event_o.ID))))
				End case 
			Else 
				events_c.push(New object:C1471("title";$title_t;"start";$start_t;"end";$end_t;"color";$color_t;\
					"editable";$editable_b;"extendedProps";New object:C1471("ID";String:C10($event_o.ID))))
			End if 
		Else 
			events_c.push(New object:C1471("title";$title_t;"start";$start_t;"end";$end_t;"color";$color_t;\
				"editable";$editable_b;"extendedProps";New object:C1471("ID";String:C10($event_o.ID))))
		End if 
		
	End if 
	
End for each 

ARRAY OBJECT:C1221($event_ao;0)
COLLECTION TO ARRAY:C1562(events_c;$event_ao)

  // Debug only
  //SET TEXT TO PASTEBOARD(JSON Stringify array(events_c;*))