Attribute VB_Name = "modbukasitus"
Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Public Sub Bukasitus(Website As String)
 ShellExecute 0&, vbNullString, Website, vbNullString, vbNullString, SW_SHOWNORMAL
End Sub

