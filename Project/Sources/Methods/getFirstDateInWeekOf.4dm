//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/15/19, 16:27:36
  // ----------------------------------------------------
  // Method: getFirstDateInWeekOf
  // Description
  //     Get the first date of the week that the given date belongs to
  //
  // Parameters
  //    $1    -    Date
  // ----------------------------------------------------

C_DATE:C307($0;$1)
$0:=Add to date:C393($1;0;0;(Day number:C114($1)-1)*-1)
