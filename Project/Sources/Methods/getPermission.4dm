//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/23/19, 08:22:09
  // ----------------------------------------------------
  // Method: getPermission
  // Description
  //      Get the user permission of the current user or the
  //      user associated with the given user ID.
  //
  // Parameters
  //     $1    -    User Id
  // ----------------------------------------------------

C_TEXT:C284($0;$permission_t)
C_LONGINT:C283($1;$curUserId_l)
C_OBJECT:C1216($shares_o)
$curUserId_l:=getCurrentUserId 
If ($curUserId_l#$1)
	$shares_o:=ds:C1482.Share.query("ownerID = :1";$1)
	If ($shares_o.length>0)
		C_COLLECTION:C1488($shareWithUsers_c)
		C_LONGINT:C283($index_l)
		$shareWithUsers_c:=$shares_o[0].shareWith.users
		$index_l:=$shareWithUsers_c.findIndex(0;"findID";$curUserId_l)
		If ($index_l>=0)
			$permission_t:=$shareWithUsers_c[$index_l].permission
		End if 
	End if 
Else 
	$permission_t:="Read and Write"
End if 

$0:=$permission_t