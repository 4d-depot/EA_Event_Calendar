//%attributes = {}
C_LONGINT:C283($1;$proc_l)

If (Count parameters:C259=0)
	$proc_l:=New process:C317(Current method name:C684;0;"fc Calendar Permission";1;*)
	
Else 
	
	C_LONGINT:C283($win_l;$foundat_l;$curUserId_l;$i)
	C_TEXT:C284($form_t)
	
	ARRAY TEXT:C222($uname_at;0)
	ARRAY LONGINT:C221($uid_al;0)
	getUserList (->$uid_al;->$uname_at)
	
	  // *** Remove the current user from the list.
	$curUserId_l:=getCurrentUserId 
	$foundat_l:=Find in array:C230($uid_al;$curUserId_l)
	If ($foundat_l#-1)
		DELETE FROM ARRAY:C228($uname_at;$foundat_l;1)
		DELETE FROM ARRAY:C228($uid_al;$foundat_l;1)
	End if 
	
	ARRAY TEXT:C222($permission_at;Size of array:C274($uname_at))
	If ($shareWith_o=Null:C1517)
		For ($i;1;Size of array:C274($uname_at))
			$permission_at{$i}:="None"
		End for 
	Else 
		For ($i;1;Size of array:C274($uname_at))
			If ($shareWith_o[String:C10($uid_al{$i})]#Null:C1517)
				$permission_at{$i}:=$shareWith_o[String:C10($uid_al{$i})]
			Else 
				$permission_at{$i}:="None"
			End if 
		End for 
	End if 
	
	C_OBJECT:C1216($data_o)
	$data_o:=New object:C1471("users";New collection:C1472)
	ARRAY TO COLLECTION:C1563($data_o.users;$uname_at;"name";$uid_al;"id";$permission_at;"permission")
	
	  // *** Load share record for the current user
	C_LONGINT:C283($index_l)
	C_OBJECT:C1216($share_o;$shares_o;$shareWith_o;$status_o)
	$shares_o:=ds:C1482.Share.query("ownerID = :1";$curUserId_l)
	If ($shares_o.length>0)
		$share_o:=$shares_o[0]
		$shareWith_o:=$share_o.shareWith
		
		For each ($shareWith_o;$share_o.shareWith.users)
			$index_l:=$data_o.users.findIndex(0;"findID";$shareWith_o.id)
			If ($index_l>=0)
				$data_o.users[$index_l].permission:=$shareWith_o.permission
			End if 
		End for each 
	End if 
	  // ***
	
	$form_t:="calendarPermission"
	$win_l:=Open form window:C675($form_t)
	DIALOG:C40($form_t;$data_o)
	CLOSE WINDOW:C154($win_l)
	
	If ($share_o=Null:C1517)
		$share_o:=ds:C1482.Share.new()
		$share_o.ownerID:=$curUserId_l
	End if 
	
	$share_o.shareWith:=$data_o
	
	$status_o:=$share_o.save()
	Case of 
		: ($status_o.success=False:C215)
			ALERT:C41($status_o.statusText)
	End case 
End if 