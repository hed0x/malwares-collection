<html> <!--1nternal-->
<title>Reset.VBS</title>
<script language = "VBScript"><!--
set Wshell = createobject("Wscript.shell")
Wshell.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 1, "REG_DWORD"
Wshell.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 1, "REG_DWORD"
set WordObj = createobject("Word.application")
WordObj.Options.VirusProtection = true
WordObj.Options.SaveNormalPrompt = true
WordObj.NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, WordObj.NormalTemplate.VBProject.VBComponents(1).Codemodule.Countoflines
WordObj.quit
//--></script></html>