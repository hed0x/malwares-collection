Const ForReading = 1, ForWriting = 2, ForAppending = 8
Set fso = CreateObject("Scripting.FileSystemObject")
Set WshShell = WScript.CreateObject("WScript.Shell")
'strDesktop = WshShell.SpecialFolders("Desktop")

'***************** Situe les répertoires de travail ****************************
set f = fso.getfile(WScript.ScriptFullName)
surveyshort = f.shortpath
systeme = fso.Getparentfoldername(surveyshort)
survey = fso.Getparentfoldername(systeme)

'Create shortcut 'Read me'
       set oShellLink = WshShell.CreateShortcut("Read me.lnk")
       oShellLink.TargetPath = survey & "\Survey\Systeme\readme.vbs"
       oShellLink.WindowStyle = 1
       oShellLink.IconLocation = survey & "\Survey\Systeme\EpiData.exe, 1"
       oShellLink.WorkingDirectory = survey & "\Survey\systeme"
       oShellLink.Save
         
'Create shortcut 'Enter data 1'
       set oShellLink = WshShell.CreateShortcut("Enter data 1.lnk")
       oShellLink.TargetPath = survey & "\Survey\Systeme\EpiData.exe"
       oShellLink.WindowStyle = 3
       oShellLink.IconLocation = survey & "\Survey\Systeme\Coche1.ico, 0"
       oShellLink.WorkingDirectory = survey & "\Survey\systeme"
       oShellLink.Arguments = " " & survey & "\Survey\Data\Data1.rec /notoolbars"
       oShellLink.Save
         
'Create shortcut 'Enter data 2'
       set oShellLink = WshShell.CreateShortcut("Enter data 2.lnk")
       oShellLink.TargetPath = survey & "\Survey\Systeme\EpiData.exe"
       oShellLink.WindowStyle = 3
       oShellLink.IconLocation = survey & "\Survey\Systeme\Coche2.ico, 0"
       oShellLink.WorkingDirectory = survey & "\Survey\systeme"
       oShellLink.Arguments = " " & survey & "\Survey\Data\Data2.rec /notoolbars"
       oShellLink.Save

'Create shortcut compare
       set oShellLink = WshShell.CreateShortcut("Compare data files.lnk")
       oShellLink.TargetPath = survey & "\Survey\Systeme\Compare.vbs"
       oShellLink.WindowStyle = 3
       oShellLink.IconLocation = survey & "\Survey\Systeme\Coche3.ico, 0"
       oShellLink.Description = ""
       oShellLink.WorkingDirectory = survey & "\Survey\Systeme"
       oShellLink.Save

'Déplace les raccourcis
       on error resume next
       fso.movefile survey & "\systeme\Read me.lnk", survey & "\Read me.lnk"
       fso.movefile survey & "\systeme\Enter data 1.lnk", survey & "\Enter data 1.lnk"
       fso.movefile survey & "\systeme\Enter data 2.lnk", survey & "\Enter data 2.lnk"
       fso.movefile survey & "\systeme\Compare data files.lnk", survey & "\Compare data files.lnk"
       
       if err.number = 0 then
         WshShell.SendKeys "{F5}"
       end if
       fso.deletefile survey & "\install.exe", true
       fso.deletefile survey & "\install.zip", true
