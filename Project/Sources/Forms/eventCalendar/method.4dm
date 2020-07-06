Case of 
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.view:="month"
		Form:C1466.date:=Current date:C33
		OBJECT Get pointer:C1124(Object named:K67:5;"radioMonth")->:=1
		WA SET PREFERENCE:C1041(*;"webArea";WA enable JavaScript:K62:4;True:C214)
		WA OPEN URL:C1020(*;"webArea";Form:C1466.url)
		SET WINDOW TITLE:C213("Calendar for "+getCurrentUserName )
		
		C_LONGINT:C283($l;$t;$r;$b)
		OBJECT GET COORDINATES:C663(*;"radioMonth";$l;$t;$r;$b)
		OBJECT SET COORDINATES:C1248(*;"viewRect";$l;$t;$r;$b)
		
	: (Form event code:C388=On Activate:K2:9)
		updateCalendar 
		
End case 