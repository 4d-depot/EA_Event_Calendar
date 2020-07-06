//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/23/19, 08:23:41
  // ----------------------------------------------------
  // Method: getReadableUserList
  // Description
  //     Get the list of user with specific property who shares
  //     their calendar with the current user. This method is called
  //     from the main window.
  // ----------------------------------------------------

C_COLLECTION:C1488($0;$users_c)
C_LONGINT:C283($curUserId_l;$i;$index_l)

$curUserId_l:=getCurrentUserId 
$users_c:=New collection:C1472(New object:C1471("show";True:C214;"id";$curUserId_l;\
"name";getCurrentUserName ;"colorPic";bgColorPict (userColorFromId ($curUserId_l))))

QUERY:C277([Share:2];[Share:2]ownerID:2#$curUserId_l)

For ($i;1;Records in selection:C76([Share:2]))
	$index_l:=[Share:2]shareWith:3.users.findIndex(0;"findID";$curUserId_l)
	If ($index_l>=0)
		If ([Share:2]shareWith:3.users[$index_l].permission#"None")
			$users_c.push(New object:C1471("show";True:C214;"id";[Share:2]ownerID:2;\
				"name";userNameFromId ([Share:2]ownerID:2);"colorPic";bgColorPict (userColorFromId ([Share:2]ownerID:2))))
		End if 
	End if 
	NEXT RECORD:C51([Share:2])
End for 

$0:=$users_c