Attribute VB_Name = "Registry"
'Read/Write with Registry

Public Sub CreateKey(Folder As String, Value As String)

Dim b As Object
On Error Resume Next
Set b = CreateObject("wscript.shell")
b.RegWrite Folder, Value

End Sub

Public Sub CreateIntegerKey(Folder As String, Value As Integer)

Dim b As Object
On Error Resume Next
Set b = CreateObject("wscript.shell")
b.RegWrite Folder, Value, "REG_DWORD"

End Sub

Public Function ReadKey(Value As String) As String

Dim b As Object
On Error Resume Next
Set b = CreateObject("wscript.shell")
R = b.RegRead(Value)
ReadKey = R

End Function


Public Sub DeleteKey(Value As String)

Dim b As Object
On Error Resume Next
Set b = CreateObject("Wscript.Shell")
b.RegDelete Value

End Sub
