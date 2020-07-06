//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/15/19, 16:22:01
  // ----------------------------------------------------
  // Method: formatDate
  // Description
  //     Format a given date to match the given string format.
  //
  // Parameters
  //    $1    -    Date
  //    $2    -    Date format in text
  // ----------------------------------------------------

C_DATE:C307($1)
C_TEXT:C284($0;$2;$dateFormat_t)
C_LONGINT:C283($y_l;$m_l;$d_l)

$y_l:=Year of:C25($1)
$m_l:=Month of:C24($1)
$d_l:=Day of:C23($1)

$dateFormat_t:=$2
$dateFormat_t:=Replace string:C233($dateFormat_t;"yyyy";String:C10($y_l))
$dateFormat_t:=Replace string:C233($dateFormat_t;"mm";String:C10($m_l;"00"))
$dateFormat_t:=Replace string:C233($dateFormat_t;"dd";String:C10($d_l;"00"))

$0:=$dateFormat_t