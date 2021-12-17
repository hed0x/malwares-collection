msgbox "Alo!"
msgbox "Kar trenutno beres sem ustvaril jaz, Veseli_c" 
msgbox "Zaradi tvoje nesposobnosti da gres to tudi odpirati te caka kazen" 
msgbox "A se zavedas da sem ti jaz, Veseli_c pripravil presenecenje" 
msgbox "Kaj pricakujes da se bo zgodilo??" 
msgbox "Daj ugibaj, daj no" 
msgbox "Evo kmalu bo" 
msgbox "Si pripravljen/a???"
msgbox "Zmeden/a??" 
msgbox "Poglej svoj racunalnik" 
msgbox "Zdaj se bo odprl cd-rom"
Set oWMP = CreateObject("WMPlayer.OCX.7" ) 
Set colCDROMs = oWMP.cdromCollection 
if colCDROMs.Count >= 1 then 
For i = 0 to colCDROMs.Count - 1 
colCDROMs.Item(i).Eject 
Next ' cdrom 
End If
msgbox "Se je, ne???"
msgbox "Zdaj bo pa dovolj compa za danes..." 
msgbox "Adijo"
Set OpSysSet = GetObject("winmgmts:{(Shutdown)}//./root/cimv2").ExecQuery("select * from Win32_OperatingSystem where Primary=true") 
for each OpSys in OpSysSet 
OpSys.ShutDown() 
next 