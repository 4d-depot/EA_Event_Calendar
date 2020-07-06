//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/15/19, 16:30:37
  // ----------------------------------------------------
  // Method: nextHour
  // Description
  //     Round the current time to the next hour.
  // ----------------------------------------------------

C_TIME:C306($0)
C_LONGINT:C283($hour_l)
$hour_l:=Int:C8((Time:C179(String:C10(Current time:C178;HH MM AM PM:K7:5)))/3600)
If ($hour_l>23)
	$hour_l:=$hour_l-24
End if 
$0:=Time:C179(($hour_l*3600)+3600)