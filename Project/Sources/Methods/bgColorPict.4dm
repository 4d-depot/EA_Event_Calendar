//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 09/23/19, 08:19:30
  // ----------------------------------------------------
  // Method: bgColorPict
  // Description
  //     Create a circle based on the given RGB color value.
  //
  // Parameters
  //    $1    -    RGB color in hex (e.g. #994C00)
  // ----------------------------------------------------

C_PICTURE:C286($0)
C_TEXT:C284($1;$svgRef_t;$objectRef_t)
$svgRef_t:=SVG_New 
$objectRef_t:=SVG_New_circle ($svgRef_t;10;10;5;$1;$1)
SVG EXPORT TO PICTURE:C1017($svgRef_t;$0)
SVG_CLEAR ($svgRef_t)
