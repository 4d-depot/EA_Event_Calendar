//%attributes = {"invisible":true}
Form:C1466.recurrence.dayOfWeek:=New collection:C1472
If (OBJECT Get pointer:C1124(Object named:K67:5;"sun")->=1)
	Form:C1466.recurrence.dayOfWeek.push(0);
End if 
If (OBJECT Get pointer:C1124(Object named:K67:5;"mon")->=1)
	Form:C1466.recurrence.dayOfWeek.push(1);
End if 
If (OBJECT Get pointer:C1124(Object named:K67:5;"tue")->=1)
	Form:C1466.recurrence.dayOfWeek.push(2);
End if 
If (OBJECT Get pointer:C1124(Object named:K67:5;"wed")->=1)
	Form:C1466.recurrence.dayOfWeek.push(3);
End if 
If (OBJECT Get pointer:C1124(Object named:K67:5;"thu")->=1)
	Form:C1466.recurrence.dayOfWeek.push(4);
End if 
If (OBJECT Get pointer:C1124(Object named:K67:5;"fri")->=1)
	Form:C1466.recurrence.dayOfWeek.push(5);
End if 
If (OBJECT Get pointer:C1124(Object named:K67:5;"sat")->=1)
	Form:C1466.recurrence.dayOfWeek.push(6);
End if 