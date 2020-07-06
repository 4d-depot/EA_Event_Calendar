//%attributes = {"invisible":true}

  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/23/19, 08:33:29
  // ----------------------------------------------------
  // Method: userNameFromId
  // Description
  //     Based on the given user id, return the corresponding
  //     user name.
  //
  // Parameters
  //    $1    -    User id
  // ----------------------------------------------------

C_TEXT:C284($0)
C_LONGINT:C283($1;$index_l)

$index_l:=Storage:C1525.user.list.findIndex(0;"findID";$1)
If ($index_l>=0)
	$0:=Storage:C1525.user.list[$index_l].name
End if 