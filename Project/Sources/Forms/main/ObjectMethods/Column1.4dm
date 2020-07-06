Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		If (Shift down:C543)
			C_OBJECT:C1216($readableUser_o)
			C_BOOLEAN:C305($show_b)
			$show_b:=Form:C1466.readableUser[Form:C1466.readableUserPos-1].show
			For each ($readableUser_o;Form:C1466.readableUser)
				$readableUser_o.show:=$show_b
			End for each 
			Form:C1466.readableUser:=Form:C1466.readableUser
		End if 
		
		C_COLLECTION:C1488($showUsers_c)
		C_OBJECT:C1216($user_o)
		$showUsers_c:=New collection:C1472
		For each ($user_o;Form:C1466.readableUser)
			If ($user_o.show)
				$showUsers_c.push($user_o.id)
			End if 
		End for each 
		EXECUTE METHOD IN SUBFORM:C1085("calContainer";"updateCalendar";*;$showUsers_c)
		
End case 
