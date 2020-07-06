  //TimePickerSingle AM

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		  // declare the variable here or anywhere else in your own code
		
		C_TIME:C306(startTime)
		startTime:=Time:C179(Form:C1466.startTime)
		
	: (Form event code:C388=On Data Change:K2:15)
		Form:C1466.startTime:=(startTime*1)
		If (Form:C1466.startTime>Form:C1466.endTime)
			endTime:=Time:C179(startTime+(60*30))
			Form:C1466.endTime:=endTime
		End if 
End case 
