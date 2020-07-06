//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/15/19, 16:35:28
  // ----------------------------------------------------
  // Method: updateTitle
  // Description
  //      This gets the Calendar title from fullCalendar and
  //      update it to the Form.title.
  // ----------------------------------------------------

C_TEXT:C284($title_t)
WA EXECUTE JAVASCRIPT FUNCTION:C1043(*;"webArea";"getTitle";$title_t)
Form:C1466.title:=$title_t