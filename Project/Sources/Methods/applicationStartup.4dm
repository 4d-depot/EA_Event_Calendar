//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/19/19, 16:02:15
  // ----------------------------------------------------
  // Method: applicationStartup
  // Description
  //     This method must be executed during the startup of
  //     the application.
  // ----------------------------------------------------


C_TEXT:C284($currentUserName_t)
ARRAY TEXT:C222($uname_at;0)
ARRAY LONGINT:C221($uid_al;0)

  // *** Developer Hook ***
  // *** If the application is using a custom login system, replace
  // *** the following code with their own to populate the data.
GET USER LIST:C609($uname_at;$uid_al)  // Populate usernames and ids arrays
$currentUserName_t:=Current user:C182  // Specify current username
  // ***

setupUserListForCalendar ($currentUserName_t;->$uname_at;->$uid_al)
SET DATABASE PARAMETER:C642(Dates inside objects:K37:73;Date type:K37:88)
