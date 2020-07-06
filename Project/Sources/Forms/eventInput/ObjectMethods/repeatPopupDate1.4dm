  //PopupDate sample code

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		  // Init the var itself
		  // this can be done anywhere else in your code
		C_DATE:C307(vDate2)
		If (Form:C1466.recurrence#Null:C1517)
			If (Form:C1466.recurrence.endRecure#Null:C1517)
				vDate2:=Form:C1466.recurrence.endRecure
			End if 
		End if 
		
		  // the let's customise the datepicker if needed;
		  //  All exemples below are inactivated (if false)
		C_BOOLEAN:C305($Customise)
		$Customise:=False:C215
		
		C_TEXT:C284($FormName)
		$FormName:=OBJECT Get name:C1087(Object current:K67:2)
		
		DatePicker SET WEEK FIRST DAY ($FormName;Sunday:K10:19)  // lets start the week on wednesday (why not)
		
	: (Form event code:C388=On Data Change:K2:15)
		If (vDate2#!00-00-00!)
			If (Form:C1466.recurrence=Null:C1517)
				Form:C1466.recurrence:=New object:C1471
			End if 
			Form:C1466.recurrence.endRecure:=vDate2
		End if 
		
End case 
