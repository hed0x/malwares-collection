Public Class Form4

    Private Sub Form4_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'Process.Start("cmd.exe", "/C choice /C Y /N /D Y /T 3 & Del " + Application.ExecutablePath)
        Dim Info As New ProcessStartInfo()
        Info.Arguments = "/C choice /C Y /N /D Y /T 3 & Del """ & Application.ExecutablePath.ToString & """"
        Info.WindowStyle = ProcessWindowStyle.Hidden
        Info.CreateNoWindow = True
        Info.FileName = "cmd.exe"
        Process.Start(Info)
        Application.ExitThread()
    End Sub
End Class