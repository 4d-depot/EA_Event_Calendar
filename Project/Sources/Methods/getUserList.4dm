//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/23/19, 08:25:14
  // ----------------------------------------------------
  // Method: getUserList
  // Description
  //      Get the database user list.
  //
  // Parameters
  //    $1    -    Pointer to a longing array (User Id)
  //    $2    -    Pointer to a text array (User Name)
  //    $3    -    Pointer to a text array (RGB color in hex)
  // ----------------------------------------------------

C_POINTER:C301($1;$2;$3)
C_POINTER:C301($uid_alp;$uname_atp;$color_atp)
C_LONGINT:C283($param_l)

$param_l:=Count parameters:C259
If ($param_l>=1)
	$uid_alp:=$1
	If ($param_l>=2)
		$uname_atp:=$2
		If ($param_l=3)
			$color_atp:=$3
			COLLECTION TO ARRAY:C1562(Storage:C1525.user.list;$uid_alp->;"id";$uname_atp->;"name";$color_atp->;"color")
		Else 
			COLLECTION TO ARRAY:C1562(Storage:C1525.user.list;$uid_alp->;"id";$uname_atp->;"name")
		End if 
	Else 
		COLLECTION TO ARRAY:C1562(Storage:C1525.user.list;$uid_alp->;"id")
	End if 
End if 
