If (Form event code:C388=On Load:K2:1)
	ARRAY TEXT:C222(repeat_at;3)
	repeat_at{1}:="None"
	repeat_at{2}:="Every day"
	repeat_at{3}:="Every week"
	
	C_LONGINT:C283($foundat_l)
	If (Form:C1466.recurrence#Null:C1517)
		$foundat_l:=Find in array:C230(repeat_at;Form:C1466.recurrence.repeat)
		If ($foundat_l=-1)
			$foundat_l:=1
		End if 
		repeat_at:=$foundat_l
		If ($foundat_l>1)
			OBJECT SET VISIBLE:C603(*;"repeat@";True:C214)
		End if 
	Else 
		OBJECT SET VISIBLE:C603(*;"repeat@";False:C215)
	End if 
Else 
	If (repeat_at{repeat_at}="None")
		FORM GOTO PAGE:C247(1)
		Form:C1466.recurrence:=New object:C1471
		OBJECT SET VISIBLE:C603(*;"repeat@";False:C215)
	Else 
		If (repeat_at{repeat_at}="Every day")
			FORM GOTO PAGE:C247(1)
			Form:C1466.recurrence.startRecure:=Form:C1466.startDate
			Form:C1466.recurrence.endRecure:=Form:C1466.endDate
		Else 
			FORM GOTO PAGE:C247(2)
			Form:C1466.recurrence.startRecure:=Form:C1466.startDate
			Form:C1466.recurrence.endRecure:=Form:C1466.endDate
			vDate2:=Form:C1466.recurrence.endRecure
			SET TIMER:C645(1)
		End if 
		
		If (Form:C1466.recurrence=Null:C1517)
			Form:C1466.recurrence:=New object:C1471
		End if 
		Form:C1466.recurrence.repeat:=repeat_at{repeat_at}
		Form:C1466.recurrence.endRecure:=Form:C1466.endDate
		OBJECT SET VISIBLE:C603(*;"repeat@";True:C214)
	End if 
End if 