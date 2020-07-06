C_LONGINT:C283($m_l)
$m_l:=Month of:C24(Current date:C33)
Case of 
	: ($m_l=1)
		Form:C1466.month:="JAN"
	: ($m_l=2)
		Form:C1466.month:="FEB"
	: ($m_l=3)
		Form:C1466.month:="MAR"
	: ($m_l=4)
		Form:C1466.month:="APR"
	: ($m_l=5)
		Form:C1466.month:="MAY"
	: ($m_l=6)
		Form:C1466.month:="JUN"
	: ($m_l=7)
		Form:C1466.month:="JUL"
	: ($m_l=8)
		Form:C1466.month:="AUG"
	: ($m_l=9)
		Form:C1466.month:="SEP"
	: ($m_l=10)
		Form:C1466.month:="OCT"
	: ($m_l=11)
		Form:C1466.month:="NOV"
	: ($m_l=12)
		Form:C1466.month:="DEC"
End case 

Form:C1466.day:=String:C10(Day of:C23(Current date:C33))
