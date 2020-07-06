  //PopupDate sample code

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		  // Init the var itself
		  // this can be done anywhere else in your code
		C_DATE:C307(vDate)
		vDate:=Form:C1466.startDate
		
		  // the let's customise the datepicker if needed;
		  //  All exemples below are inactivated (if false)
		C_BOOLEAN:C305($Customise)
		$Customise:=False:C215
		
		C_TEXT:C284($FormName)
		$FormName:=OBJECT Get name:C1087(Object current:K67:2)
		
		DatePicker SET WEEK FIRST DAY ($FormName;Sunday:K10:19)  // lets start the week on wednesday (why not)
		
	: (Form event code:C388=On Data Change:K2:15)
		If (vDate#!00-00-00!)
			Form:C1466.startDate:=vDate
			
			If (Form:C1466.allDay)
				If (Form:C1466.endDate<Form:C1466.startDate)
					vDate1:=Form:C1466.startDate
				End if 
			Else 
				vDate1:=Form:C1466.startDate
			End if 
		End if 
		
		If (vDate>vDate1)
			vDate1:=vDate
		End if 
		
End case 
