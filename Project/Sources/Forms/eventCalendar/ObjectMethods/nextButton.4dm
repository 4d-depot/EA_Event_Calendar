Case of 
	: (Form:C1466.view="month")
		Form:C1466.date:=Add to date:C393(Form:C1466.date;0;1;0)
	: (Form:C1466.view="week")
		Form:C1466.date:=Add to date:C393(getFirstDateInWeekOf (Form:C1466.date);0;0;7)
	: (Form:C1466.view="day")
		Form:C1466.date:=Add to date:C393(Form:C1466.date;0;0;1)
	: (Form:C1466.view="list")
		Form:C1466.date:=Add to date:C393(Form:C1466.date;0;0;7)
End case 
updateCalendar 