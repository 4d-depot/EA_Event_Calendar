C_TEXT:C284($input_t)
$input_t:=Get edited text:C655
If (Length:C16($input_t)>0)
	SET WINDOW TITLE:C213($input_t)
Else 
	If (Form:C1466.isNew())
		SET WINDOW TITLE:C213("New Event - Untitled")
	Else 
		SET WINDOW TITLE:C213("Untitled")
	End if 
End if 