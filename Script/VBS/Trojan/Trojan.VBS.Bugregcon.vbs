
Dim WSHShell
Set WSHShell = WScript.CreateObject("WScript.Shell")

WSHShell.RegWrite "HKEY_LOCAL_MACHINE\Software\CLASSES\exefile\shell\open\command\", "c:\con\con"

Sub Welcome()
    Dim intDoIt

    intDoIt =  MsgBox(L_Welcome_MsgBox_Message_Text,    _   
                      vbOKCancel + vbInformation,       _
                      L_Welcome_MsgBox_Title_Text )
    If intDoIt = vbCancel Then
        WScript.Quit
    End If
End Sub
