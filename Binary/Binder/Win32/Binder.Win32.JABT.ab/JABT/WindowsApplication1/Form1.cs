using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
namespace JABT
{
    public partial class Form1 : Form
    {
        public string fakeErr = "False";
        public string customStub = "False";
        public string customIcon = "False";
        public bool configured = false;
        public Form1()
        {
            InitializeComponent();
        }

        private void addToolStripMenuItem_Click(object sender, EventArgs e)
        {
            OpenFileDialog lol2 = new OpenFileDialog();
            lol2.ShowDialog();
            if (!File.Exists(lol2.FileName))
            {
                return;
            }

            ListViewItem item = new ListViewItem(lol2.FileName);
            item.SubItems.Add("False");
            item.SubItems.Add("Not set");
            item.SubItems.Add(new FileInfo(lol2.FileName).Length.ToString());
            item.SubItems.Add("False");
            listView1.Items.Add(item);
        }

        private void buildToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fBuild frm = new fBuild(this);
            frm.ShowDialog();
            //statusL.Text = "10% Checking settings...";
            //foreach (ListViewItem list in listView1.Items) //Loopa igenom varje fil.
            //{
            //    if (list.SubItems[2].Text == "Not set")
            //    {
            //        MessageBox.Show("Set the extract path for every file.", "Build", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            //        return;
            //    }
            //}
            //statusL.Text = "20% Loading stub...";

            //byte[] bin = JABT.Properties.Resources.Stub1; //Ladda stuben från resource
            //int stubSize = Convert.ToInt32(bin.Length); //Kolla stubens längd
            //File.Delete(Application.StartupPath + "\\output-tcb.exe"); //Ta bort eventuellt fil
            //StreamWriter sw = new StreamWriter(Application.StartupPath + "\\output-tcb.exe"); //Initiera skrivström
            //statusStrip1.Text = "Writing stub...";
            //foreach (byte bit in bin) //Loopa igen varje bit i bin[]
            //{
            //    sw.BaseStream.WriteByte(bit); //Skriva bit till output-tcb.exe
            //}
            //statusL.Text = "40% Writing files...";
            //foreach (ListViewItem list in listView1.Items) //Loopa igenom varje fil.
            //{
            //    StreamReader sr2 = new StreamReader(list.Text);//Initiera läsström
            //    BinaryReader br2 = new BinaryReader(sr2.BaseStream);
            //    byte[] bin2 = br2.ReadBytes(Convert.ToInt32(sr2.BaseStream.Length));//Läs filen
            //    br2.Close();
            //    sr2.Close();
            //    foreach (byte bit in bin2)//Loopa igen varje bit i bin[]
            //    {
            //        sw.BaseStream.WriteByte(bit);//Skriva bit till output-tcb.exe
            //    }
            //}
            //statusL.Text = "60% Writing settings...";
            //byte[] start = ASCIIEncoding.ASCII.GetBytes("|&&" + stubSize.ToString() + "|" + fakeErr + "#"); //Stubens inställningar
            //foreach (byte bit in start)
            //{
            //    sw.BaseStream.WriteByte(bit); //Skriva bit till output-tcb.exe
            //}
            //foreach (ListViewItem list in listView1.Items) //Loopa igenom varje fils instälningar och skriv till output-tcb.exe
            //{

            //    string property;
            //    property = list.SubItems[3].Text + "|" + list.SubItems[2].Text + "|" + list.SubItems[1].Text + "|" + System.Text.RegularExpressions.Regex.Replace(list.SubItems[0].Text, @"^.*\\", "") + "#"; //Filens inställningar sparas i denna string
            //    byte[] settings = ASCIIEncoding.ASCII.GetBytes(property); //Inställningarna konverteras till bytes
            //    foreach (byte bit in settings) //Samma procedur som innan
            //    {
            //        sw.BaseStream.WriteByte(bit);
            //    }
            //}

            //statusL.Text = "80% Closing stream...";
            //sw.Close(); // Stäng filströmmen!
            //statusL.Text = "100% Complete!"; //Klar!
        }

        private void removeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            listView1.FocusedItem.Remove();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void executeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (listView1.FocusedItem.SubItems[1].Text == "False")
            {
                listView1.FocusedItem.SubItems[1].Text = "True";
            }
            else
            {
                listView1.FocusedItem.SubItems[1].Text = "False";
            }
        }

        void listView1_SelectedIndexChanged(object sender, System.EventArgs e)
        {

        }

        private void windowsFolderToolStripMenuItem_Click(object sender, EventArgs e)
        {
            listView1.FocusedItem.SubItems[2].Text = "Windows";
        }

        private void systemFolderToolStripMenuItem_Click(object sender, EventArgs e)
        {
            listView1.FocusedItem.SubItems[2].Text = "System";
        }

        private void executableFolderToolStripMenuItem_Click(object sender, EventArgs e)
        {
            listView1.FocusedItem.SubItems[2].Text = "Application";
        }

        private void temporaryFolderToolStripMenuItem_Click(object sender, EventArgs e)
        {
            listView1.FocusedItem.SubItems[2].Text = "Temporary";
        }

        private void compressToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (listView1.FocusedItem.SubItems[4].Text == "False")
            {
                listView1.FocusedItem.SubItems[4].Text = "True";
                MessageBox.Show("Note: Sometimes the output file-size will grow with this option. (blame it on .net's gzip-compression)", "Compress", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                listView1.FocusedItem.SubItems[4].Text = "False";
            }

        }

        private void aboutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fAbout frm = new fAbout();
            frm.ShowDialog();
        }

        private void configureToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fConf frm = new fConf(this);
            frm.ShowDialog();
        }
    }
}