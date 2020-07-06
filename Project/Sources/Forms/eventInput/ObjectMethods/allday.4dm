If (Form:C1466.allDay)
	OBJECT SET VISIBLE:C603(*;"TimePickerSingleAM@";False:C215)
	OBJECT SET VISIBLE:C603(*;"timeBGRect@";False:C215)
Else 
	OBJECT SET VISIBLE:C603(*;"TimePickerSingleAM@";True:C214)
	OBJECT SET VISIBLE:C603(*;"timeBGRect@";True:C214)
	vDate1:=vDate
End if 