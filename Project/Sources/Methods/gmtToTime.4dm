//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/19/19, 15:47:37
  // ----------------------------------------------------
  // Method: gmtToTime
  // Description
  //     This method convert the time string (GMT) into a regular
  //     time value that 4D recognize.
  //
  // Parameters
  //    $1    -    time string in GMT
  // ----------------------------------------------------

C_TIME:C306($0;$time_h)
C_TEXT:C284($1;$dateTime_t)
C_LONGINT:C283($pos_l)

If (Count parameters:C259>=1)
	$dateTime_t:=$1
	$pos_l:=Position:C15("T";$dateTime_t)
	If ($pos_l>0)
		$dateTime_t:=Delete string:C232($dateTime_t;1;$pos_l)
	End if 
	$time_h:=Time:C179($dateTime_t)
End if 

$time_h:=Time:C179($time_h-(60*60*7))  // Offset

$0:=$time_h