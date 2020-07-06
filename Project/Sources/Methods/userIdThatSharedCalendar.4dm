//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/23/19, 09:08:06
  // ----------------------------------------------------
  // Method: userIdThatSharedCalendar
  // Description
  //     Return the collection of user id of those who shared
  //     their calendar with the current user.
  // ----------------------------------------------------

C_COLLECTION:C1488($0;$shareOwnerId_c;$shareWithUsers_c)
C_OBJECT:C1216($shares_o;$share_o)
C_LONGINT:C283($curUserId_l;$index_l)
$shareOwnerId_c:=New collection:C1472
$curUserId_l:=getCurrentUserId 
$shares_o:=ds:C1482.Share.query("ownerID # :1";$curUserId_l)
If ($shares_o.length>0)
	For each ($share_o;$shares_o)
		$shareWithUsers_c:=$share_o.shareWith.users
		$index_l:=$shareWithUsers_c.findIndex(0;"findID";$curUserId_l)
		If ($index_l>=0)
			If ($shareWithUsers_c[$index_l].permission#"none")
				$shareOwnerId_c.push($share_o.ownerID)
			End if 
		End if 
	End for each 
End if 
$0:=$shareOwnerId_c