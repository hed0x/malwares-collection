namespace RANSOMWARE3._0
{
    partial class Window
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Window));
            this.lbl_title = new System.Windows.Forms.Label();
            this.logo = new System.Windows.Forms.PictureBox();
            this.text1 = new System.Windows.Forms.RichTextBox();
            this.bit_logo = new System.Windows.Forms.PictureBox();
            this.lbl_title2 = new System.Windows.Forms.Label();
            this.text2 = new System.Windows.Forms.RichTextBox();
            this.box_email = new System.Windows.Forms.TextBox();
            this.box_key = new System.Windows.Forms.TextBox();
            this.btn_copy = new System.Windows.Forms.Button();
            this.btn_decrypt = new System.Windows.Forms.Button();
            this.title_time = new System.Windows.Forms.Label();
            this.lbl_count = new System.Windows.Forms.Label();
            this.link_bit = new System.Windows.Forms.LinkLabel();
            this.link_click = new System.Windows.Forms.LinkLabel();
            this.link_ransom = new System.Windows.Forms.LinkLabel();
            this.lbl_date = new System.Windows.Forms.Label();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.logo)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bit_logo)).BeginInit();
            this.SuspendLayout();
            // 
            // lbl_title
            // 
            this.lbl_title.AutoSize = true;
            this.lbl_title.BackColor = System.Drawing.Color.Transparent;
            this.lbl_title.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.lbl_title.Font = new System.Drawing.Font("Arial Black", 20.25F, System.Drawing.FontStyle.Bold);
            this.lbl_title.ForeColor = System.Drawing.Color.White;
            this.lbl_title.Location = new System.Drawing.Point(12, 4);
            this.lbl_title.Name = "lbl_title";
            this.lbl_title.Size = new System.Drawing.Size(674, 40);
            this.lbl_title.TabIndex = 0;
            this.lbl_title.Text = "THE FILES WERE ENCRYPTED, WHAT NOW?";
            // 
            // logo
            // 
            this.logo.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.logo.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.logo.Cursor = System.Windows.Forms.Cursors.No;
            this.logo.Image = ((System.Drawing.Image)(resources.GetObject("logo.Image")));
            this.logo.Location = new System.Drawing.Point(12, 47);
            this.logo.Name = "logo";
            this.logo.Size = new System.Drawing.Size(203, 195);
            this.logo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.logo.TabIndex = 1;
            this.logo.TabStop = false;
            // 
            // text1
            // 
            this.text1.BackColor = System.Drawing.Color.White;
            this.text1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F);
            this.text1.Location = new System.Drawing.Point(221, 47);
            this.text1.Name = "text1";
            this.text1.ReadOnly = true;
            this.text1.Size = new System.Drawing.Size(465, 195);
            this.text1.TabIndex = 2;
            this.text1.Text = resources.GetString("text1.Text");
            // 
            // bit_logo
            // 
            this.bit_logo.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.bit_logo.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.bit_logo.Cursor = System.Windows.Forms.Cursors.No;
            this.bit_logo.Image = ((System.Drawing.Image)(resources.GetObject("bit_logo.Image")));
            this.bit_logo.Location = new System.Drawing.Point(12, 248);
            this.bit_logo.Name = "bit_logo";
            this.bit_logo.Size = new System.Drawing.Size(397, 108);
            this.bit_logo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.bit_logo.TabIndex = 3;
            this.bit_logo.TabStop = false;
            // 
            // lbl_title2
            // 
            this.lbl_title2.AutoSize = true;
            this.lbl_title2.BackColor = System.Drawing.Color.Transparent;
            this.lbl_title2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.lbl_title2.Font = new System.Drawing.Font("Arial Black", 20.25F, System.Drawing.FontStyle.Bold);
            this.lbl_title2.ForeColor = System.Drawing.Color.White;
            this.lbl_title2.Location = new System.Drawing.Point(415, 245);
            this.lbl_title2.Name = "lbl_title2";
            this.lbl_title2.Size = new System.Drawing.Size(271, 40);
            this.lbl_title2.TabIndex = 4;
            this.lbl_title2.Text = "HOW CAN I PAY?";
            // 
            // text2
            // 
            this.text2.BackColor = System.Drawing.Color.White;
            this.text2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F);
            this.text2.Location = new System.Drawing.Point(415, 291);
            this.text2.Name = "text2";
            this.text2.ReadOnly = true;
            this.text2.Size = new System.Drawing.Size(271, 128);
            this.text2.TabIndex = 5;
            this.text2.Text = resources.GetString("text2.Text");
            // 
            // box_email
            // 
            this.box_email.BackColor = System.Drawing.Color.DarkBlue;
            this.box_email.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.box_email.ForeColor = System.Drawing.Color.White;
            this.box_email.Location = new System.Drawing.Point(12, 362);
            this.box_email.Name = "box_email";
            this.box_email.ReadOnly = true;
            this.box_email.Size = new System.Drawing.Size(295, 26);
            this.box_email.TabIndex = 6;
            this.box_email.Text = "notvalidemailadress.ransom@gmail.com";
            // 
            // box_key
            // 
            this.box_key.BackColor = System.Drawing.Color.DarkBlue;
            this.box_key.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.box_key.ForeColor = System.Drawing.Color.White;
            this.box_key.Location = new System.Drawing.Point(12, 394);
            this.box_key.Name = "box_key";
            this.box_key.Size = new System.Drawing.Size(295, 26);
            this.box_key.TabIndex = 7;
            // 
            // btn_copy
            // 
            this.btn_copy.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.btn_copy.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold);
            this.btn_copy.Location = new System.Drawing.Point(313, 362);
            this.btn_copy.Name = "btn_copy";
            this.btn_copy.Size = new System.Drawing.Size(96, 26);
            this.btn_copy.TabIndex = 8;
            this.btn_copy.Text = "COPY";
            this.btn_copy.UseVisualStyleBackColor = true;
            this.btn_copy.Click += new System.EventHandler(this.btn_copy_Click);
            // 
            // btn_decrypt
            // 
            this.btn_decrypt.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.btn_decrypt.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold);
            this.btn_decrypt.Location = new System.Drawing.Point(313, 394);
            this.btn_decrypt.Name = "btn_decrypt";
            this.btn_decrypt.Size = new System.Drawing.Size(96, 26);
            this.btn_decrypt.TabIndex = 9;
            this.btn_decrypt.Text = "DECRYPT";
            this.btn_decrypt.UseVisualStyleBackColor = true;
            this.btn_decrypt.Click += new System.EventHandler(this.btn_decrypt_Click);
            // 
            // title_time
            // 
            this.title_time.AutoSize = true;
            this.title_time.BackColor = System.Drawing.Color.Transparent;
            this.title_time.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.title_time.Font = new System.Drawing.Font("Arial Black", 30F, System.Drawing.FontStyle.Bold);
            this.title_time.ForeColor = System.Drawing.Color.White;
            this.title_time.Location = new System.Drawing.Point(38, 467);
            this.title_time.Name = "title_time";
            this.title_time.Size = new System.Drawing.Size(246, 58);
            this.title_time.TabIndex = 10;
            this.title_time.Text = "TIME OUT";
            // 
            // lbl_count
            // 
            this.lbl_count.AutoSize = true;
            this.lbl_count.BackColor = System.Drawing.Color.Transparent;
            this.lbl_count.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.lbl_count.Font = new System.Drawing.Font("Arial Black", 30F, System.Drawing.FontStyle.Bold);
            this.lbl_count.ForeColor = System.Drawing.Color.White;
            this.lbl_count.Location = new System.Drawing.Point(54, 533);
            this.lbl_count.Name = "lbl_count";
            this.lbl_count.Size = new System.Drawing.Size(214, 58);
            this.lbl_count.TabIndex = 11;
            this.lbl_count.Text = "00:00:00";
            this.lbl_count.Click += new System.EventHandler(this.lbl_count_Click);
            // 
            // link_bit
            // 
            this.link_bit.AutoSize = true;
            this.link_bit.BackColor = System.Drawing.Color.Transparent;
            this.link_bit.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.link_bit.Location = new System.Drawing.Point(377, 474);
            this.link_bit.Name = "link_bit";
            this.link_bit.Size = new System.Drawing.Size(134, 20);
            this.link_bit.TabIndex = 12;
            this.link_bit.TabStop = true;
            this.link_bit.Text = "What is a bitcoin?";
            this.link_bit.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.link_bit_LinkClicked);
            // 
            // link_click
            // 
            this.link_click.AutoSize = true;
            this.link_click.BackColor = System.Drawing.Color.Transparent;
            this.link_click.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.link_click.Location = new System.Drawing.Point(377, 512);
            this.link_click.Name = "link_click";
            this.link_click.Size = new System.Drawing.Size(291, 20);
            this.link_click.TabIndex = 13;
            this.link_click.TabStop = true;
            this.link_click.Text = "Don\'t have a bitcoin address? Click here";
            this.link_click.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.link_click_LinkClicked);
            // 
            // link_ransom
            // 
            this.link_ransom.AutoSize = true;
            this.link_ransom.BackColor = System.Drawing.Color.Transparent;
            this.link_ransom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.link_ransom.Location = new System.Drawing.Point(377, 550);
            this.link_ransom.Name = "link_ransom";
            this.link_ransom.Size = new System.Drawing.Size(208, 20);
            this.link_ransom.TabIndex = 14;
            this.link_ransom.TabStop = true;
            this.link_ransom.Text = "WHAT IS RANSOMWARE?";
            this.link_ransom.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.link_ransom_LinkClicked);
            // 
            // lbl_date
            // 
            this.lbl_date.AutoSize = true;
            this.lbl_date.BackColor = System.Drawing.Color.Transparent;
            this.lbl_date.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.lbl_date.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.lbl_date.ForeColor = System.Drawing.Color.White;
            this.lbl_date.Location = new System.Drawing.Point(35, 433);
            this.lbl_date.Name = "lbl_date";
            this.lbl_date.Size = new System.Drawing.Size(251, 22);
            this.lbl_date.TabIndex = 15;
            this.lbl_date.Text = "dddd, mmm dd yyyy, hh mm ss";
            // 
            // timer1
            // 
            this.timer1.Enabled = true;
            this.timer1.Interval = 1000;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // Window
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(697, 620);
            this.Controls.Add(this.lbl_date);
            this.Controls.Add(this.link_ransom);
            this.Controls.Add(this.link_click);
            this.Controls.Add(this.link_bit);
            this.Controls.Add(this.lbl_count);
            this.Controls.Add(this.title_time);
            this.Controls.Add(this.btn_decrypt);
            this.Controls.Add(this.btn_copy);
            this.Controls.Add(this.box_key);
            this.Controls.Add(this.box_email);
            this.Controls.Add(this.text2);
            this.Controls.Add(this.lbl_title2);
            this.Controls.Add(this.bit_logo);
            this.Controls.Add(this.text1);
            this.Controls.Add(this.logo);
            this.Controls.Add(this.lbl_title);
            this.DoubleBuffered = true;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(713, 658);
            this.MinimizeBox = false;
            this.MinimumSize = new System.Drawing.Size(713, 658);
            this.Name = "Window";
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "RANSOMWARE3.0";
            this.TopMost = true;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Window_FormClosing);
            this.Load += new System.EventHandler(this.Window_Load);
            ((System.ComponentModel.ISupportInitialize)(this.logo)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bit_logo)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbl_title;
        private System.Windows.Forms.PictureBox logo;
        private System.Windows.Forms.RichTextBox text1;
        private System.Windows.Forms.PictureBox bit_logo;
        private System.Windows.Forms.Label lbl_title2;
        private System.Windows.Forms.RichTextBox text2;
        private System.Windows.Forms.TextBox box_email;
        private System.Windows.Forms.TextBox box_key;
        private System.Windows.Forms.Button btn_copy;
        private System.Windows.Forms.Button btn_decrypt;
        private System.Windows.Forms.Label title_time;
        private System.Windows.Forms.Label lbl_count;
        private System.Windows.Forms.LinkLabel link_bit;
        private System.Windows.Forms.LinkLabel link_click;
        private System.Windows.Forms.LinkLabel link_ransom;
        private System.Windows.Forms.Label lbl_date;
        private System.Windows.Forms.Timer timer1;
    }
}