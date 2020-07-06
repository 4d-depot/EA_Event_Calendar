//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/15/19, 16:20:05
  // ----------------------------------------------------
  // Method: getDateRange
  // Description
  //     Based on the given date and view, build a date
  //     range and return it in a form of object.
  //
  // Parameters
  //     $1    -    Date
  //     $2    -    View
  // ----------------------------------------------------

C_DATE:C307($1;$date_d;$first_d;$last_d)
C_TEXT:C284($2;$view_t)
C_OBJECT:C1216($0;$dateRange_o)

$date_d:=$1
$view_t:=$2

Case of 
	: ($view_t="month")
		$first_d:=Add to date:C393(!00-00-00!;Year of:C25($date_d);Month of:C24($date_d);1)
		$last_d:=Add to date:C393(Add to date:C393($first_d;0;1;0);0;0;-1)
		$first_d:=getFirstDateInWeekOf ($first_d)
		$last_d:=getLastDateInWeekOf ($last_d)
		If (($last_d-$first_d+1)<42)
			$last_d:=Add to date:C393($last_d;0;0;7)
		End if 
		$0:=New object:C1471("startDate";$first_d;"endDate";$last_d)
		
	: ($view_t="week") | ($view_t="list")
		$first_d:=getFirstDateInWeekOf ($date_d)
		$last_d:=getLastDateInWeekOf ($date_d)
		$0:=New object:C1471("startDate";$first_d;"endDate";$last_d)
		
	: ($view_t="day")
		$0:=New object:C1471("startDate";$date_d;"endDate";$date_d)
		
End case 

SET TEXT TO PASTEBOARD:C523(String:C10($last_d-$first_d+1))