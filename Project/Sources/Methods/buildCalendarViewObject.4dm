//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/19/19, 16:03:30
  // ----------------------------------------------------
  // Method: buildCalendarViewObject
  // Description
  //     This method generates the event data set and generate
  //     HTML file to render the calendar .
  //
  // ----------------------------------------------------

C_TEXT:C284($url_t;$tmp_t;$html_t)
C_OBJECT:C1216($0)

$url_t:=Get 4D folder:C485(Current resources folder:K5:16)+"fullcalendar"+\
Folder separator:K24:12+"view.html"
$tmp_t:=Get 4D folder:C485(Current resources folder:K5:16)+"fullcalendar"+\
Folder separator:K24:12+"template.html"

  // *** Populate Calendar Data
createCalendarData 
  // ***

$html_t:=Document to text:C1236($tmp_t;"UTF-8")
PROCESS 4D TAGS:C816($html_t;$html_t)
TEXT TO DOCUMENT:C1237($url_t;$html_t;"UTF-8")

$0:=New object:C1471("url";$url_t)