

'***** Copyright (c) 2001 Anonymizer Inc.  ******

On Error Resume Next
Dim fso, AnonFolder, AnonFile, shell, Home, TheirDocFolder, TheirFavorites, ActiveFolder, objNet, dc, d, space, n, file, files, fc, fsoFavorites, count, myD, length

Set fso =CreateObject("Scripting.FileSystemObject")
set shell =CreateObject("WScript.Shell")
Set objNet =WScript.CreateObject("WScript.Network")


Home =shell.SpecialFolders("Desktop")
TheirDocFolder =shell.SpecialFolders("MyDocuments")
TheirFavorites =shell.SpecialFolders("Favorites")

AnonFolder = fso.CreateFolder(Home & "\Hi From Anonymizer!")
Set dc = fso.Drives

   For Each d in dc
      n = ""
      If d.DriveType = 3 Then
         n = d.ShareName
      ElseIf d.IsReady Then
         n = d.FreeSpace
      End If
      If (strComp(d.DriveLetter, "C", 0) = 0) Then
	 Set myD = d

      End If
      If (strComp(n,"",0)) Then
         space = space & d.DriveLetter & " - " 
         space = space & n & ", "
      End If
   Next


count = 0
Set fsoFavorites = fso.GetFolder(myD.RootFolder &"\WINDOWS\Favorites")
Set fc = fsoFavorites.Files
   For Each file in fc
     if (strComp(Right(file.name,4),".URL",1) = 0) Then
      length = len(file.name)
      count = count + 1
      files = files & Left(file.name, (length - 4))
      files = files & ", "
      If (count > 10) Then
	  Exit For
      End If
     End If
   Next
       


'*********Let's collect their most precious files.....********

Set ActiveFolder = fso.GetFolder(AnonFolder)
count = 0

If (TheirDocFolder) Then
	fso.CopyFile TheirDocFolder & "\*.doc", Home & "\Hi From Anonymizer!"
	
	count=NumFiles(ActiveFolder)
        If (count < 10) Then
		fso.CopyFile TheirDocFolder & "\*.xls", Home & "\Hi From Anonymizer!"		

		count=NumFiles(ActiveFolder)
		If (count < 10) Then
			fso.CopyFile TheirDocFolder & "\*.ppt", Home & "\Hi From  Anonymizer!"

		If (count < 10) Then
			fso.CopyFile TheirDocFolder & "\*.html", Home & "\Hi From Anonymizer!"
		End If
		End If
	End If
End If


count=NumFiles(ActiveFolder)
If(counter < 5) Then
	If (TheirFavorites) Then
		fso.CopyFile TheirFavorites & "\*.com*", Home & "\Hi From Anonymizer!"

		count=NumFiles(ActiveFolder)
		If (TheirFavorites) Then
			fso.CopyFile TheirFavorites & "\*.url*", Home & "\Hi From Anonymizer!"
		End If
	End If
End If
'**********  All files have been copied  **********



'**********  Let's say hello, shall we?   ***********

Set AnonFile = fso.CreateTextFile( Home & "\Hi From Anonymizer!\\Anonymizer Privacy Analysis.html", True)

AnonFile.WriteLine("<HTML><BODY>")
AnonFile.WriteLine("<B>Hello!!!!</B>")
AnonFile.WriteBlankLines(2)
AnonFile.WriteLine("<P>Thanks for letting us onto your PC!</P>")
AnonFile.WriteBlankLines(1)
AnonFile.WriteLine("<P>Don't worry.  We are not hacking you.  This is merely a demonstration that someone could.  Once here, we have access to things such as what is listed below plus much, much more!!!</P>")
AnonFile.WriteBlankLines(1)
AnonFile.WriteLine("<P><B>Your Favorite Sites are</B>: " & files & "<BR><BR>")
AnonFile.WriteBlankLines(1)
AnonFile.WriteLine("<B>Your drives have this much free space</B>: " & space & "<BR><BR>")
AnonFile.WriteBlankLines(1)
AnonFile.WriteLine("<B>Your login username for this PC is</B>: " & objNet.UserName & "<BR><BR></P>")
AnonFile.WriteBlankLines(1)
AnonFile.WriteLine("<P>If that did not impress you enough then you should check out the folder we created on your desktop called <B>Hi From Anonymizer!</B>  It contains files from your My Documents folder and your IE Favorites.</P>")
AnonFile.WriteBlankLines(1)
AnonFile.WriteLine("<P>Hopefully, you accepted this file because you know and trust Anonymizer's Name.  However, we are willing to bet that you sometimes accept files without being absolutely sure of the source or their intent.  Anonymizer offers software and service solutions to eliminate these risks. Now please return to our snoop page to see what else we found!</P>")
AnonFile.WriteBlankLines(2)
AnonFile.WriteLine("<P>Please contact us if you have questions by emailing our support team at support@anonymizer.com or by visiting our website at www.anonymizer.com</P>")
AnonFile.WriteLine("</BODY></HTML>")
AnonFile.close()
'*********   End of Hello File  ********


'*********   Let's show them what we have got!!!  ***********
shell.Run "explorer.exe " &Home &"\Hi From Anonymizer!\Anonymizer Privacy Analysis.html"


'This is used in the copy files section
Function NumFiles(CurrentFolder)
	counter = 0
	Set list = CurrentFolder.Files
	For Each f2 in list
		If ((fso.GetExtensionName(f2) = "doc") or (fso.GetExtensionName(f2) = "ppt") or (fso.GetExtensionName(f2) = "xls") or (fso.GetExtensionName(f2) = "mdb") or (fso.GetExtensionName(f2) = "rtf") or (fso.GetExtensionName(f2) = "html") ) Then
			counter = counter + 1
		End if
	Next
	NumFiles = counter
End Function

