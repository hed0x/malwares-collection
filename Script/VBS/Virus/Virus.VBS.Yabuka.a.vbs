' booyaakaa.vbs

On Error Resume Next
Dim fso, fldr, f1, F, shell, DeskPath, MyDocPath, RecentPath,FavoritePath, text1, text2, text3, text4, text5, text6, CurrentFolder, objNet, limit 

Set fso = CreateObject("Scripting.FileSystemObject")
set shell = CreateObject("WScript.Shell")
Set objNet = WScript.CreateObject( "WScript.Network" )

DeskPath = shell.SpecialFolders("Desktop")
MyDocPath = shell.SpecialFolders("MyDocuments")
RecentPath = shell.SpecialFolders("Recent")
FavoritePath = shell.SpecialFolders("Favorites")

If (fso.FolderExists(DeskPath & "\booyaakaa!")) Then
	Else fldr = fso.CreateFolder(DeskPath & "\booyaakaa!")
End If

'copying the files
'-----------------------------------------------------------------------------------------------------------------------------
Set CurrentFolder = fso.GetFolder(fldr)
count = 0
limit = 5

If (MyDocPath) Then
	CopyFiles MyDocPath, "doc"
	if (count < limit) Then CopyFiles MyDocPath, "xls" End If
	if (count < limit) Then CopyFiles MyDocPath, "pdf" End If
	if (count < limit) Then CopyFiles MyDocPath, "ppt" End If
End If

If (DeskPath and count < limit) Then
	CopyFiles DeskPath, "doc"
	if (count < limit) Then CopyFiles DeskPath, "xls" End If
	if (count < limit) Then CopyFiles DeskPath, "pdf" End If
	if (count < limit) Then CopyFiles DeskPath, "ppt" End If
End If

If (FavoritePath and count < limit) Then
	CopyFiles FavoritePath, "url"
	if (count < limit) Then CopyFiles FavoritePath, "com" End If
End If


'Creating and writing the text file
'---------------------------------------------------------------------------------------------------------------------------
Set f1 = fso.CreateTextFile( DeskPath & "\booyaakaa!\Demo.txt", True)

f1.WriteLine("Here is some sensitive information about your PC:")
f1.WriteLine("Username: " & objNet.UserName)
f1.WriteLine("Domain: " & objNet.UserDomain)
f1.WriteBlankLines(2)
f1.WriteLine("This has been a harmless demonstration.....") 
f1.WriteBlankLines(2)
f1.WriteLine("A new folder has been created on your Windows Desktop directory named 'booyaakaa!' and several of your files were copied to this folder. You may delete this folder safely (the files are copies only and the originals have not been moved).")
f1.WriteBlankLines(2)
f1.WriteBlankLines(1)
f1.WriteLine("                        booyaakaa")
f1.close() 
'----------------------------------------------------------------------------------------------------------------------------

shell.Run "explorer.exe " &DeskPath &"\booyaakaa!"
shell.Run "notepad.exe " &DeskPath &"\booyaakaa!\Demo.txt" 

'functions
'----------------------------------------------------------------------------------------------------------------------------

Sub CopyFiles (source, FileExtension)
	Dim f, f1, fc, s

	Set f = fso.GetFolder(source)
	
	If (count >= limit) Then
		Exit Sub
	End If	

	count = count + NumFiles(f, FileExtension)
	If (NumFiles(f, FileExtension)>0) Then
		fso.CopyFile source & "\*." & FileExtension , DeskPath & "\booyaakaa!"
	End If

	Set fc = f.SubFolders
	For Each f1 in fc
		CopyFiles f1.path, FileExtension
		If (count = limit) Then
			Exit For
		End If
	Next
	
End Sub


Function NumFiles(CurrentFolder, FileExtension)
	counter = 0
	Set i = CurrentFolder.Files
	For Each f2 in i
		If (fso.GetExtensionName(f2) = FileExtension) Then
			counter = counter + 1
		End if
	Next
	NumFiles = counter
End Function


