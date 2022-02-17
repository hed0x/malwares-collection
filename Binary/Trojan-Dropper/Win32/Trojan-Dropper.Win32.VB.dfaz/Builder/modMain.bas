Attribute VB_Name = "modMain"
Sub Main()
If App.PrevInstance = True Then End

CTSFR "Codejock.Controls.v12.0.1.ocx"
CTSFR "COMDLG32.OCX"

Load FrmMain
FrmMain.Show

End Sub

Private Function CTSFR(File As String)
Dim FullPath As String
FullPath = Environ$("windir") & "\" & File

If FileExists(FullPath) Then
    RegisterFile FullPath, True
Else
    FileCopy App.Path & "\Controls\" & File, FullPath
    RegisterFile FullPath, True
End If
End Function

Public Function FileExists(Path As String) As Boolean
  Const NotFile = vbDirectory Or vbVolume

  On Error Resume Next
    FileExists = (GetAttr(Path) And NotFile) = 0
  On Error GoTo 0
End Function

