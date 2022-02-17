Imports System.Net
Imports System.Net.Sockets
Imports System
Imports System.Reflection
Imports System.Runtime.InteropServices
<Assembly: AssemblyTitle("TinyRAT--Client")> 
<Assembly: AssemblyDescription("A Visual Basic Script Executer")> 
<Assembly: AssemblyCompany("Dr. Apocalypse")> 
<Assembly: AssemblyProduct("TinyRAT--Client")> 
<Assembly: CLSCompliant(True)> 
<Assembly: Guid("BCA2A727-3A41-4035-87BD-EA17928E4FAD")> 
<Assembly: AssemblyVersion("1.0.*")> 
Public Class frmHome
    Inherits System.Windows.Forms.Form
#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents txtFile As System.Windows.Forms.TextBox
    Friend WithEvents btnSend As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.txtFile = New System.Windows.Forms.TextBox
        Me.btnSend = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'txtFile
        '
        Me.txtFile.Location = New System.Drawing.Point(0, 0)
        Me.txtFile.Multiline = True
        Me.txtFile.Name = "txtFile"
        Me.txtFile.Size = New System.Drawing.Size(272, 208)
        Me.txtFile.TabIndex = 0
        Me.txtFile.Text = ""
        '
        'btnSend
        '
        Me.btnSend.Location = New System.Drawing.Point(56, 216)
        Me.btnSend.Name = "btnSend"
        Me.btnSend.Size = New System.Drawing.Size(128, 24)
        Me.btnSend.TabIndex = 1
        Me.btnSend.Text = "Send"
        '
        'frmHome
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(274, 245)
        Me.Controls.Add(Me.btnSend)
        Me.Controls.Add(Me.txtFile)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow
        Me.Name = "frmHome"
        Me.Text = "VBS Runner - Client"
        Me.ResumeLayout(False)

    End Sub

#End Region
    Private _ClientSocket As Socket
    Private _IpEndPoint As New IPEndPoint(Dns.GetHostByName(Dns.GetHostName).AddressList(0), 5124)
    Private Sub btnSend_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSend.Click
        _ClientSocket = New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)
        _ClientSocket.Connect(_IpEndPoint)
        Dim Buffer() As Byte = System.Text.ASCIIEncoding.ASCII.GetBytes(txtFile.Text)
        _ClientSocket.Send(Buffer, 0, Buffer.Length, SocketFlags.None)
        _ClientSocket.Shutdown(SocketShutdown.Both)
        _ClientSocket.Close()
    End Sub
End Class