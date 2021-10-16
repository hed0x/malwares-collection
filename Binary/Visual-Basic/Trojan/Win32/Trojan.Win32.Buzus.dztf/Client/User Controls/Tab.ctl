VERSION 5.00
Begin VB.UserControl Tab 
   Alignable       =   -1  'True
   BackColor       =   &H00E3E3E3&
   ClientHeight    =   1665
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3870
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ScaleHeight     =   1665
   ScaleWidth      =   3870
   ToolboxBitmap   =   "Tab.ctx":0000
   Begin VB.Shape Box 
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00808080&
      Height          =   375
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Image io3 
      Height          =   300
      Left            =   3720
      Picture         =   "Tab.ctx":0312
      Top             =   960
      Visible         =   0   'False
      Width           =   30
   End
   Begin VB.Image io2 
      Height          =   300
      Left            =   2640
      Picture         =   "Tab.ctx":03F4
      Stretch         =   -1  'True
      Top             =   960
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Image io1 
      Height          =   300
      Left            =   2520
      Picture         =   "Tab.ctx":0486
      Top             =   960
      Visible         =   0   'False
      Width           =   30
   End
   Begin VB.Label l1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Tab0"
      Height          =   195
      Index           =   0
      Left            =   1680
      TabIndex        =   0
      Top             =   1200
      Visible         =   0   'False
      Width           =   360
   End
   Begin VB.Image i3 
      Height          =   315
      Index           =   0
      Left            =   1440
      Picture         =   "Tab.ctx":0568
      Top             =   1200
      Visible         =   0   'False
      Width           =   30
   End
   Begin VB.Image i1 
      Height          =   315
      Index           =   0
      Left            =   120
      Picture         =   "Tab.ctx":0652
      Top             =   1200
      Visible         =   0   'False
      Width           =   30
   End
   Begin VB.Image i2 
      Height          =   315
      Index           =   0
      Left            =   240
      Picture         =   "Tab.ctx":073C
      Stretch         =   -1  'True
      Top             =   1200
      Visible         =   0   'False
      Width           =   1095
   End
End
Attribute VB_Name = "Tab"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Const TabSpacing = -15
Const Padding = 120

Dim TheLastTabYouWereOver As Integer, TheActiveTab As Integer

Public Event Click(tIndex As Integer)
Public Event DblClick(tIndex As Integer)

Private Sub i1_DblClick(Index As Integer)
    RaiseEvent DblClick(Index)
End Sub
Private Sub i2_DblClick(Index As Integer): i1_DblClick Index: End Sub
Private Sub i3_DblClick(Index As Integer): i1_DblClick Index: End Sub
Private Sub l1_DblClick(Index As Integer): i1_DblClick Index: End Sub

Private Sub i1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If TheLastTabYouWereOver = 0 Then TheLastTabYouWereOver = 1
    ShowDefaultImg TheLastTabYouWereOver
    ShowHoverImg Index
    TheLastTabYouWereOver = Index
End Sub
Private Sub i2_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single): i1_MouseMove Index, Button, Shift, X, Y: End Sub
Private Sub i3_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single): i1_MouseMove Index, Button, Shift, X, Y: End Sub
Private Sub l1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single): i1_MouseMove Index, Button, Shift, X, Y: End Sub

Private Sub i1_Click(Index As Integer)
    On Error Resume Next
    Box.Visible = True
    Box.ZOrder 0 'bring this one to top
    i1(Index).ZOrder 0
    i2(Index).ZOrder 0
    i3(Index).ZOrder 0
    l1(Index).ZOrder 0
    ShowDefaultImg Index
    ShowDefaultImg TheLastTabYouWereOver
    TheActiveTab = Index
    Redraw
    RaiseEvent Click(Index)
End Sub
Private Sub i2_Click(Index As Integer): i1_Click Index: End Sub
Private Sub i3_Click(Index As Integer): i1_Click Index: End Sub
Private Sub l1_Click(Index As Integer): i1_Click Index: End Sub

Private Function ShowHoverImg(Index As Integer)
    On Error Resume Next
    If Index = 0 Then Exit Function 'preventing original from getting overwritten
    If Index = TheActiveTab Then Exit Function
    i1(Index).Picture = io1.Picture
    i2(Index).Picture = io2.Picture
    i3(Index).Picture = io3.Picture
End Function

Private Function ShowDefaultImg(Index As Integer)
    On Error Resume Next
    i1(Index).Picture = i1(0).Picture
    i2(Index).Picture = i2(0).Picture
    i3(Index).Picture = i3(0).Picture
End Function

Private Function Redraw()
    On Error Resume Next
    Dim Ix As Integer
    Dim DT As Long, DY As Long
    
    For Ix = 1 To i1.UBound Step 1
        
        If Ix = TheActiveTab Then DY = 0 Else DY = 30
        
        i1(Ix).Move DT, DY, 30, 315
        DT = DT + i1(Ix).Width
        
        With l1(Ix)
            .FontBold = (Ix = TheActiveTab)
            .Move DT + Padding \ 2, (315 + DY - .Height) \ 2, .Width
            .ZOrder 0
            i2(Ix).Move .Left - TabSpacing - Padding \ 2 + TabSpacing, DY, .Width + Padding, 315
            DT = DT + .Width + Padding + TabSpacing
        End With
        
        i3(Ix).Move DT - TabSpacing, DY, 30, 315
        DT = DT + i3(Ix).Width
    Next
    
    Box.Move 0, 300, UserControl.Width, UserControl.Height - 300
End Function

Public Property Let ActiveTab(Index As Integer)
    On Error Resume Next
    TheActiveTab = Index
    i1_Click Index
    Redraw
End Property

Public Property Get ActiveTab() As Integer
    On Error Resume Next
    ActiveTab = TheActiveTab
End Property

Public Property Let TabCaption(Index As Integer, Text As String)
    On Error Resume Next
    l1(Index).Caption = Text
    Redraw
End Property

Public Property Get TabCaption(Index As Integer) As String
    On Error Resume Next
    TabCaption = l1(Index).Caption
End Property

Public Property Let TabTag(Index As Integer, Text As String)
    On Error Resume Next
    l1(Index).Tag = Text
    Redraw
End Property

Public Property Get TabTag(Index As Integer) As String
    On Error Resume Next
    TabTag = l1(Index).Tag
End Property

Public Property Let TabTooltip(Index As Integer, Text As String)
    On Error Resume Next
    l1(Index).ToolTipText = Text
    Redraw
End Property

Public Property Get TabTooltip(Index As Integer) As String
    On Error Resume Next
    TabTooltip = l1(Index).ToolTipText
End Property

Public Sub AddTab(Optional Caption As String)
    'On Error Resume Next
    Dim Idx As Integer
    'left of tab
    Load i1(i1.UBound + 1)
    i1(i1.UBound).Visible = True
    Load i2(i2.UBound + 1)
    i2(i2.UBound).Visible = True
    Load i3(i3.UBound + 1)
    i3(i3.UBound).Visible = True
    Load l1(l1.UBound + 1)
    l1(l1.UBound).Visible = True
    
    ShowDefaultImg l1.UBound
    
    l1(l1.UBound).Caption = IIf(Caption = "", "Tab " & l1.UBound, Caption)
    Redraw
End Sub

Public Sub AddTabs(ParamArray Caption() As Variant)
    'On Error Resume Next
    Dim I As Integer
    For I = LBound(Caption()) To UBound(Caption()) Step 1
        Debug.Print I
        AddTab CStr(Caption(I))
    Next
End Sub

Public Sub RemoveTab(Index As Integer)
    On Error Resume Next
    i1(Index).Visible = False
    Set i1(Index) = Nothing
    Unload i1(Index)
    i2(Index).Visible = False
    Set i2(Index) = Nothing
    Unload i2(Index)
    i3(Index).Visible = False
    Set i3(Index) = Nothing
    Unload i3(Index)
    
    Unload l1(Index)    'Labels get unloaded easily
    Redraw
End Sub

Private Function IsLoaded(Index As Integer) As Boolean
    On Error Resume Next
    IsLoaded = (i1(Index).Name = i1(Index).Name)
End Function

Private Sub UserControl_Initialize()
    Box.Visible = True
End Sub

Private Sub UserControl_Resize()
    On Error Resume Next
    Box.Move 0, 300, UserControl.Width, UserControl.Height - 300
End Sub
