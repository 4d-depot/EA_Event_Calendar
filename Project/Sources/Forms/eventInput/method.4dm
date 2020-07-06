Case of 
	: (Form event code:C388=On Load:K2:1)
		ARRAY TEXT:C222(uname_at;0)
		ARRAY LONGINT:C221(uid_al;0)
		getUserList (->uid_al;->uname_at)
		
		C_LONGINT:C283($i;$curUserId_l)
		$curUserId_l:=getCurrentUserId 
		For ($i;Size of array:C274(uid_al);1;-1)
			If ($curUserId_l=Form:C1466.ownerID)
				If (getPermission (uid_al{$i})#"Read and Write")
					DELETE FROM ARRAY:C228(uname_at;$i;1)
					DELETE FROM ARRAY:C228(uid_al;$i;1)
				End if 
			Else 
				If (getPermission (uid_al{$i})#"Read@")
					DELETE FROM ARRAY:C228(uname_at;$i;1)
					DELETE FROM ARRAY:C228(uid_al;$i;1)
				End if 
			End if 
		End for 
		
		If (Form:C1466.isNew())
			FORM GOTO PAGE:C247(1)
			OBJECT SET ENABLED:C1123(*;"bDelete";False:C215)
			OBJECT SET VISIBLE:C603(*;"repeat@";False:C215)
			SET WINDOW TITLE:C213("New Event - Untitled")
			uname_at:=Find in array:C230(uname_at;getCurrentUserName )
			recur_at:=1
			
		Else 
			
			If (Form:C1466.recurrence#Null:C1517)
				If (Form:C1466.recurrence.repeat#Null:C1517)
					
					Case of 
						: (Form:C1466.recurrence.repeat="Every week")
							FORM GOTO PAGE:C247(2)
							DatePicker SET WEEK FIRST DAY ("repeatPopupDate1";Sunday:K10:19)
							For ($i;1;Form:C1466.recurrence.dayOfWeek.length)
								Case of 
									: (Form:C1466.recurrence.dayOfWeek[$i-1]=1)
										OBJECT Get pointer:C1124(Object named:K67:5;"sun")->:=1
									: (Form:C1466.recurrence.dayOfWeek[$i-1]=2)
										OBJECT Get pointer:C1124(Object named:K67:5;"mon")->:=1
									: (Form:C1466.recurrence.dayOfWeek[$i-1]=3)
										OBJECT Get pointer:C1124(Object named:K67:5;"tue")->:=1
									: (Form:C1466.recurrence.dayOfWeek[$i-1]=4)
										OBJECT Get pointer:C1124(Object named:K67:5;"wed")->:=1
									: (Form:C1466.recurrence.dayOfWeek[$i-1]=5)
										OBJECT Get pointer:C1124(Object named:K67:5;"thu")->:=1
									: (Form:C1466.recurrence.dayOfWeek[$i-1]=6)
										OBJECT Get pointer:C1124(Object named:K67:5;"fri")->:=1
									: (Form:C1466.recurrence.dayOfWeek[$i-1]=7)
										OBJECT Get pointer:C1124(Object named:K67:5;"sat")->:=1
								End case 
							End for 
						: (Form:C1466.recurrence.repeat="Every day")
							FORM GOTO PAGE:C247(1)
							OBJECT SET VISIBLE:C603(*;"repeat@";True:C214)
						Else 
							FORM GOTO PAGE:C247(1)
							OBJECT SET VISIBLE:C603(*;"repeat@";False:C215)
					End case 
					
				Else 
					
					FORM GOTO PAGE:C247(1)
					OBJECT SET VISIBLE:C603(*;"repeat@";False:C215)
					
				End if 
			End if 
			If (getPermission (Form:C1466.ownerID)="Read only")
				OBJECT SET ENABLED:C1123(*;"ownerList";False:C215)
				OBJECT SET ENABLED:C1123(*;"subject";False:C215)
				OBJECT SET ENABLED:C1123(*;"location";False:C215)
				OBJECT SET VISIBLE:C603(*;"PopupDate";False:C215)
				OBJECT SET VISIBLE:C603(*;"PopupDate1";False:C215)
				OBJECT SET VISIBLE:C603(*;"TimePickerSingleAM1";False:C215)
				OBJECT SET VISIBLE:C603(*;"TimePickerSingleAM2";False:C215)
				OBJECT SET ENABLED:C1123(*;"allday";False:C215)
				OBJECT SET ENABLED:C1123(*;"bValidate";False:C215)
				OBJECT SET ENABLED:C1123(*;"bDelete";False:C215)
				OBJECT SET ENABLED:C1123(*;"details";False:C215)
				OBJECT SET ENABLED:C1123(*;"choice2repeat";False:C215)
				OBJECT SET VISIBLE:C603(*;"startTime";True:C214)
				OBJECT SET VISIBLE:C603(*;"endTime";True:C214)
			Else 
				OBJECT SET ENABLED:C1123(*;"ownerList";True:C214)
				OBJECT SET ENABLED:C1123(*;"subject";True:C214)
				OBJECT SET ENABLED:C1123(*;"location";True:C214)
				OBJECT SET VISIBLE:C603(*;"PopupDate";True:C214)
				OBJECT SET VISIBLE:C603(*;"PopupDate1";True:C214)
				OBJECT SET VISIBLE:C603(*;"TimePickerSingleAM1";True:C214)
				OBJECT SET VISIBLE:C603(*;"TimePickerSingleAM2";True:C214)
				OBJECT SET ENABLED:C1123(*;"allday";True:C214)
				OBJECT SET ENABLED:C1123(*;"bValidate";True:C214)
				OBJECT SET ENABLED:C1123(*;"bDelete";True:C214)
				OBJECT SET ENABLED:C1123(*;"details";True:C214)
				OBJECT SET ENABLED:C1123(*;"choice2repeat";True:C214)
				OBJECT SET VISIBLE:C603(*;"startTime";False:C215)
				OBJECT SET VISIBLE:C603(*;"endTime";False:C215)
			End if 
			
			SET WINDOW TITLE:C213(Form:C1466.subject)
			uname_at:=Find in array:C230(uid_al;Form:C1466.ownerID)
		End if 
		
	: (Form event code:C388=On Timer:K2:25)
		SET TIMER:C645(0)
		DatePicker SET WEEK FIRST DAY ("repeatPopupDate1";Sunday:K10:19)
End case 
