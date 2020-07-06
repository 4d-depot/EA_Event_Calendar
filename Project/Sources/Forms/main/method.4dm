
Case of 
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.readableUser:=getReadableUserList 
		Form:C1466.loaded:=True:C214
	: (Form event code:C388=On Activate:K2:9)
		If (Form:C1466.loaded#Null:C1517)
			If (Form:C1466.loaded)
				EXECUTE METHOD IN SUBFORM:C1085("calContainer";"updateCalendar")
			End if 
		End if 
End case 