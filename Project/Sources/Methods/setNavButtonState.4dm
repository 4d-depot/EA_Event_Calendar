//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/15/19, 16:31:53
  // ----------------------------------------------------
  // Method: setNavButtonState
  // Description
  //     Generic method that controls the state of the
  //     navigation buttons.
  //
  // Parameters
  //    $1    -    Only true when creating a new entitiy (event).
  // ----------------------------------------------------

C_BOOLEAN:C305($1)  // True to disable all
If ($1)
	OBJECT SET ENABLED:C1123(*;"bFirst";False:C215)
	OBJECT SET ENABLED:C1123(*;"bPrevious";False:C215)
	OBJECT SET ENABLED:C1123(*;"bNext";False:C215)
	OBJECT SET ENABLED:C1123(*;"bLast";False:C215)
Else 
	If (Form:C1466.currentEntityIndex<=1)
		OBJECT SET ENABLED:C1123(*;"bFirst";False:C215)
		OBJECT SET ENABLED:C1123(*;"bPrevious";False:C215)
	Else 
		OBJECT SET ENABLED:C1123(*;"bFirst";True:C214)
		OBJECT SET ENABLED:C1123(*;"bPrevious";True:C214)
	End if 
	
	If (Form:C1466.currentEntityIndex<Form:C1466.currentEntititySel.length)
		OBJECT SET ENABLED:C1123(*;"bNext";True:C214)
		OBJECT SET ENABLED:C1123(*;"bLast";True:C214)
	Else 
		OBJECT SET ENABLED:C1123(*;"bNext";False:C215)
		OBJECT SET ENABLED:C1123(*;"bLast";False:C215)
	End if 
End if 