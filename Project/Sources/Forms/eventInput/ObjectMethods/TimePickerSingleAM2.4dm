  //TimePickerSingle AM

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		  // declare the variable here or anywhere else in your own code
		
		C_TIME:C306(endTime)
		endTime:=Time:C179(Form:C1466.endTime)
		
	: (Form event code:C388=On Data Change:K2:15)
		Form:C1466.endTime:=(endTime*1)
		
End case 
