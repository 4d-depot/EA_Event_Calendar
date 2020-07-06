//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/23/19, 08:29:04
  // ----------------------------------------------------
  // Method: setupUserListForCalendar
  // Description
  //     This method must be called after the user had logged
  //     into the application.
  //
  // Parameters
  //    $1    -    Current user name
  //    $2    -    Pointer to a text array (List of user names in the application)
  //    $3    -    Pointer to a Longint array (List of corresponding user ids to the names)
  // ----------------------------------------------------

C_TEXT:C284($1;$curUserName_t)
C_POINTER:C301($2;$3;$uname_atp;$uid_alp)

C_LONGINT:C283($curUserId_l;$foundat_l)
$curUserName_t:=$1
$uname_atp:=$2
$uid_alp:=$3

$foundat_l:=Find in array:C230($uname_atp->;$curUserName_t)
If ($foundat_l#-1)
	$curUserId_l:=$uid_alp->{$foundat_l}
End if 

C_COLLECTION:C1488($color_c;$userList_c;$list_c)
$color_c:=getColors 

Use (Storage:C1525)
	Storage:C1525.user:=New shared object:C1526
	Use (Storage:C1525.user)
		Storage:C1525.user.currentName:=$curUserName_t
		Storage:C1525.user.currentId:=$curUserId_l
		Storage:C1525.user.list:=New shared collection:C1527
		Use (Storage:C1525.user.list)
			$index_l:=1
			For ($i;1;Size of array:C274($uname_atp->))
				Storage:C1525.user.list.push(New shared object:C1526("id";$uid_alp->{$i};"name";$uname_atp->{$i};"color";$color_c[$index_l-1]))
				If ($index_l=$color_c.length)
					$index_l:=1
				Else 
					$index_l:=$index_l+1
				End if 
			End for 
		End use 
	End use 
End use 

C_LONGINT:C283($i;$index_l)
Use (Storage:C1525)
	Storage:C1525.color:=New shared object:C1526
	$index_l:=1
	Use (Storage:C1525.color)
		For ($i;1;Size of array:C274($uid_alp->))
			Storage:C1525.color[String:C10($uid_alp->{$i})]:=$color_c[$index_l-1]
			If ($index_l=$color_c.length)
				$index_l:=1
			Else 
				$index_l:=$index_l+1
			End if 
		End for 
	End use 
End use 