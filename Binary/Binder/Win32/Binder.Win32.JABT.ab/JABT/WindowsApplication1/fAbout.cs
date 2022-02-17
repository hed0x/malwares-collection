using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace JABT
{
    public partial class fAbout : Form
    {
        public fAbout()
        {
            InitializeComponent();
            this.Click += new EventHandler(fAbout_Click);
        }

        void fAbout_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void fAbout_Load(object sender, EventArgs e)
        {

            
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void label1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void label2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}