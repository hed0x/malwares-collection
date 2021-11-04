; <AUT2EXE VERSION: 3.0.102.0>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Temp\FishBot.au3>
; ----------------------------------------------------------------------------

; AutoIt Version: 3.0
; Language:       English
; Platform:       WinXP
; Author:         Mibz (Pantless Krab)
;
; Script Function:
;   WoW FishBot.
;
; Wow Window Title - World of Warcraft
; WoW Window Size - w1032 x h795
; classname=GxWindowClassD3d
; Colour of splash - 0xA2A67D
;		   0xC1AD7A
;		   0xD0C08D
; Position of item - 		x:44  y:226
; Position of hotkey 0 -  	x:409 y:768


; Prompt the user to run the script using Yes/No prompt
$run = MsgBox(4, "FishBot", "Do you want to run FishBot?")


; Exit if "No"
If $run = 7 Then
    Exit
EndIf

; Initial shit
$time = MsgBox(4, "FishBot - Time of Day?", "Yes = Day | No = Night")
WinActivate("World of Warcraft")
HotKeySet("{PAUSE}", "EndScript")

; Script Start
While 1
  MouseClick("left", 409, 768, 1, 2)
  MouseMove(500, 500)
  $start = TimerInit()
  $dif = TimerDiff($start)
  While 1
    If $time = 6 Then
      $coord = PixelSearch (5, 300, 1024, 560, 0xF6F6F6, 30, 4)
    Else
      $coord = PixelSearch (5, 300, 1024, 560, 0xEEEEEE, 55, 3)
    EndIf

; 5, 300 - 1024, 560 can be changed if you want to search a wider area.
; Not recommended though since you can just adjust your view to fit all
; the water in that space. The bigger the area, the less likely it is to
; detect it.
; If the splash isn't getting detected then change the hex colour to
; something a bit closer. Top one is day, bottom is night.

    If UBound($coord)>1 Then
      MouseClick("right", $coord[0], $coord[1], 1, 3)
      Sleep(500)
      MouseClick("right", 44, 226, 1, 5)
      ExitLoop
    Else
      Sleep(250)
      $dif = TimerDiff($start)
      If $dif > 30000 Then
        ExitLoop
      EndIf
    EndIf
  WEnd
WEnd


; Function to exit script
Func EndScript()
  $exit = MsgBox(4, "FishBot", "End FishBot?")
  If $exit = 6 Then
    Exit
  EndIf
EndFunc

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Temp\FishBot.au3>
; ----------------------------------------------------------------------------

