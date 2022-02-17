using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.IO.Compression;
using System.Runtime.InteropServices;
using System.Resources;

namespace JABT
{
    public partial class fBuild : Form
    {
        //[DllImport("kernel32.dll", SetLastError = true)]
        //private static extern long WriteProcessMemory(long hProcess, object lpBaseAddress,
        //object lpBuffer, long nSize, long lpNumberOfBytesWritten);

        System.Threading.Thread buildThread;
        Form1 parent;
        public fBuild(Form1 own)
        {
            parent = own;
            InitializeComponent();
        }

        public static byte[] Compress(byte[] bytData)
        {
            
           try
            {

                MemoryStream ms = new MemoryStream();
                Stream s = new GZipStream(ms, CompressionMode.Compress);

                s.Write(bytData, 0, bytData.Length);
                s.Close();

                byte[] compressedData = (byte[])ms.ToArray();
                return compressedData;

            }
            catch
            {
                return null;
            }

        }


        private void fBuild_Load(object sender, EventArgs e)
        {
            buildThread = new System.Threading.Thread(new System.Threading.ThreadStart(build));

        }

        private void build(){
            listBox1.Items.Add("10% Checking settings...");
            progressBar1.Value = 10;
            if (!parent.configured)
            {
                DialogResult sureContinue = MessageBox.Show("You have not configured this build, are you sure you want to continue?", "Build", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (sureContinue == DialogResult.No)
                {
                    return;
                }
            }
            if (parent.listView1.Items.Count == 0)
            {
                MessageBox.Show("Add files before building!", "Build", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;

            }
            foreach (ListViewItem list in parent.listView1.Items) //Loopa igenom varje fil.
            {
                if (list.SubItems[2].Text == "Not set")
                {
                    MessageBox.Show("Set the extract path for every file.", "Build", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    return;
                }
                if (list.SubItems[4].Text == "True" && Convert.ToInt32(list.SubItems[3].Text) > 100000000)
                {
                    DialogResult sureCompress = MessageBox.Show("A file has the option \"Compress\" set to true and exceeds 100MB. This can make the application crash, are you sure?", "Build", MessageBoxButtons.YesNo);
                    if (sureCompress == DialogResult.No)
                    {
                        return;
                    }
                }
            }
            
            progressBar1.Value = 20;
            byte[] bin;
            if (parent.customStub == "False")
            {
                listBox1.Items.Add("20% Loading stub...");
                bin = JABT.Properties.Resources.Stub1; //Ladda stuben från resource
            }
            else
            {
                listBox1.Items.Add("20% Loading custom stub...");
                StreamReader sr = new StreamReader(parent.customStub);
                BinaryReader br = new BinaryReader(sr.BaseStream);
                bin = br.ReadBytes(Convert.ToInt32(sr.BaseStream.Length)); //Ladda stuben från hårddisk
            }
            int stubSize = Convert.ToInt32(bin.Length); //Kolla stubens längd
            File.Delete(Application.StartupPath + "\\output-tcb.exe"); //Ta bort eventuellt fil
            StreamWriter sw = new StreamWriter(Application.StartupPath + "\\output-tcb.exe"); //Initiera skrivström
            listBox1.Items.Add("30% Writing stub...");
            progressBar1.Value = 30;
            foreach (byte bit in bin) //Loopa igen varje bit i bin[]
            {
                sw.BaseStream.WriteByte(bit); //Skriva bit till output-tcb.exe
            }
            listBox1.Items.Add("40% Writing files...");
            progressBar1.Value = 40;
            foreach (ListViewItem list in parent.listView1.Items) //Loopa igenom varje fil.
            {

                StreamReader sr2 = new StreamReader(list.Text);//Initiera läsström
                BinaryReader br2 = new BinaryReader(sr2.BaseStream);
                byte[] bin2 = br2.ReadBytes(Convert.ToInt32(sr2.BaseStream.Length));//Läs filen
                br2.Close();
                sr2.Close();
                if (list.SubItems[4].Text != "True") //Ska den komprimeras?
                {
                    list.SubItems[4].Tag = "0";
                    foreach (byte bit in bin2)//Loopa igen varje bit i bin[]
                    {
                        sw.BaseStream.WriteByte(bit);//Skriva bit till output-tcb.exe
                    }
                }
                else
                {
                    listBox1.Items.Add("    Compressing...");
                    byte[] compressed = Compress(bin2);
                    list.SubItems[4].Tag = compressed.Length.ToString();
                    foreach (byte cbit in compressed)//Loopa igen varje bit i bin[]
                    {
                        sw.BaseStream.WriteByte(cbit);//Skriva bit till output-tcb.exe
                    }

                }

                listBox1.Items.Add("    Wrote file!");
            }
            listBox1.Items.Add("60% Writing settings...");
            progressBar1.Value = 60;
            byte[] start = ASCIIEncoding.ASCII.GetBytes("|&&" + stubSize.ToString() + "|" + parent.fakeErr + "#"); //Stubens inställningar
            foreach (byte bit in start)
            {
                sw.BaseStream.WriteByte(bit); //Skriva bit till output-tcb.exe
            }
            foreach (ListViewItem list in parent.listView1.Items) //Loopa igenom varje fils instälningar och skriv till output-tcb.exe
            {

                string property;
                property = list.SubItems[3].Text + "|" + list.SubItems[2].Text + "|" + list.SubItems[1].Text + "|" + System.Text.RegularExpressions.Regex.Replace(list.SubItems[0].Text, @"^.*\\", "") + "|" + list.SubItems[4].Text + "|" + list.SubItems[4].Tag.ToString() + "#"; //Filens inställningar sparas i denna string
                byte[] settings = ASCIIEncoding.ASCII.GetBytes(property); //Inställningarna konverteras till bytes
                foreach (byte bit in settings) //Samma procedur som innan
                {
                    sw.BaseStream.WriteByte(bit);
                }
            }

            listBox1.Items.Add("80% Closing stream...");
            progressBar1.Value = 90;
            sw.Close(); // Stäng filströmmen!
            listBox1.Items.Add("100% Complete!"); //Klar!
            progressBar1.Value = 100;
            this.Text = "100% Complete!";
            DialogResult openDir = MessageBox.Show("The build is complete!\r\nDo you want to open the folder which contains the output?", "Build", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (openDir == DialogResult.Yes)
            {
                System.Diagnostics.Process proc = new System.Diagnostics.Process();
                proc.EnableRaisingEvents = false;
                proc.StartInfo.FileName = "explorer";
                proc.StartInfo.Arguments = Application.StartupPath;
                proc.Start();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
            
        }



        private void button2_Click(object sender, EventArgs e)
        {
                fBuild.CheckForIllegalCrossThreadCalls = false;
                buildThread.Start();
                button2.Enabled = false;
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }
    }
}