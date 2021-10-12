namespace Main
{
    partial class FormGame
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
            this.labelWelcome = new System.Windows.Forms.Label();
            this.timerTypingEffect = new System.Windows.Forms.Timer(this.components);
            this.labelTask = new System.Windows.Forms.Label();
            this.textBoxAddress = new System.Windows.Forms.TextBox();
            this.buttonCheckPayment = new System.Windows.Forms.Button();
            this.buttonViewEncryptedFiles = new System.Windows.Forms.Button();
            this.timerCountDown = new System.Windows.Forms.Timer(this.components);
            this.labelCountDown = new System.Windows.Forms.Label();
            this.labelFilesToDelete = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // labelWelcome
            // 
            this.labelWelcome.AutoSize = true;
            this.labelWelcome.BackColor = System.Drawing.Color.Black;
            this.labelWelcome.Font = new System.Drawing.Font("Lucida Console", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelWelcome.ForeColor = System.Drawing.Color.Lime;
            this.labelWelcome.Location = new System.Drawing.Point(25, 29);
            this.labelWelcome.Name = "labelWelcome";
            this.labelWelcome.Size = new System.Drawing.Size(218, 16);
            this.labelWelcome.TabIndex = 0;
            this.labelWelcome.Text = "I want to play a game";
            // 
            // timerTypingEffect
            // 
            this.timerTypingEffect.Tick += new System.EventHandler(this.timerTypingEffect_Tick);
            // 
            // labelTask
            // 
            this.labelTask.AutoSize = true;
            this.labelTask.BackColor = System.Drawing.Color.Black;
            this.labelTask.Font = new System.Drawing.Font("Lucida Console", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelTask.ForeColor = System.Drawing.Color.Lime;
            this.labelTask.Location = new System.Drawing.Point(25, 505);
            this.labelTask.Name = "labelTask";
            this.labelTask.Size = new System.Drawing.Size(239, 16);
            this.labelTask.TabIndex = 1;
            this.labelTask.Text = "All you have to do...";
            // 
            // textBoxAddress
            // 
            this.textBoxAddress.Location = new System.Drawing.Point(28, 524);
            this.textBoxAddress.Name = "textBoxAddress";
            this.textBoxAddress.Size = new System.Drawing.Size(348, 20);
            this.textBoxAddress.TabIndex = 2;
            this.textBoxAddress.Text = "12Xspzstah37626slkwKhsKSHA";
            // 
            // buttonCheckPayment
            // 
            this.buttonCheckPayment.BackColor = System.Drawing.Color.Gold;
            this.buttonCheckPayment.Location = new System.Drawing.Point(28, 551);
            this.buttonCheckPayment.Name = "buttonCheckPayment";
            this.buttonCheckPayment.Size = new System.Drawing.Size(348, 33);
            this.buttonCheckPayment.TabIndex = 3;
            this.buttonCheckPayment.Text = "I made a payment, now give me back my files!";
            this.buttonCheckPayment.UseVisualStyleBackColor = false;
            this.buttonCheckPayment.Click += new System.EventHandler(this.buttonCheckPayment_Click);
            // 
            // buttonViewEncryptedFiles
            // 
            this.buttonViewEncryptedFiles.BackColor = System.Drawing.Color.Gray;
            this.buttonViewEncryptedFiles.Location = new System.Drawing.Point(28, 479);
            this.buttonViewEncryptedFiles.Name = "buttonViewEncryptedFiles";
            this.buttonViewEncryptedFiles.Size = new System.Drawing.Size(348, 23);
            this.buttonViewEncryptedFiles.TabIndex = 4;
            this.buttonViewEncryptedFiles.Text = "View encrypted files";
            this.buttonViewEncryptedFiles.UseVisualStyleBackColor = false;
            this.buttonViewEncryptedFiles.Click += new System.EventHandler(this.buttonViewEncryptedFiles_Click);
            // 
            // timerCountDown
            // 
            this.timerCountDown.Interval = 1000;
            this.timerCountDown.Tick += new System.EventHandler(this.timerCountDown_Tick);
            // 
            // labelCountDown
            // 
            this.labelCountDown.AutoSize = true;
            this.labelCountDown.BackColor = System.Drawing.Color.Black;
            this.labelCountDown.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.labelCountDown.Font = new System.Drawing.Font("Lucida Sans Unicode", 48F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelCountDown.ForeColor = System.Drawing.Color.DarkRed;
            this.labelCountDown.Location = new System.Drawing.Point(28, 320);
            this.labelCountDown.Name = "labelCountDown";
            this.labelCountDown.Size = new System.Drawing.Size(220, 80);
            this.labelCountDown.TabIndex = 5;
            this.labelCountDown.Text = "59:59";
            // 
            // labelFilesToDelete
            // 
            this.labelFilesToDelete.AutoSize = true;
            this.labelFilesToDelete.BackColor = System.Drawing.Color.Black;
            this.labelFilesToDelete.Font = new System.Drawing.Font("Lucida Console", 12F, System.Drawing.FontStyle.Bold);
            this.labelFilesToDelete.ForeColor = System.Drawing.Color.Lime;
            this.labelFilesToDelete.Location = new System.Drawing.Point(24, 455);
            this.labelFilesToDelete.Name = "labelFilesToDelete";
            this.labelFilesToDelete.Size = new System.Drawing.Size(261, 16);
            this.labelFilesToDelete.TabIndex = 6;
            this.labelFilesToDelete.Text = "1 file will be deleted.";
            // 
            // FormGame
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::Main.Properties.Resources.Jigsaw;
            this.ClientSize = new System.Drawing.Size(840, 596);
            this.Controls.Add(this.labelFilesToDelete);
            this.Controls.Add(this.labelCountDown);
            this.Controls.Add(this.buttonViewEncryptedFiles);
            this.Controls.Add(this.buttonCheckPayment);
            this.Controls.Add(this.textBoxAddress);
            this.Controls.Add(this.labelTask);
            this.Controls.Add(this.labelWelcome);
            this.Name = "FormGame";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormGame_FormClosing);
            this.Load += new System.EventHandler(this.FormGame_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label labelWelcome;
        private System.Windows.Forms.Timer timerTypingEffect;
        private System.Windows.Forms.Label labelTask;
        private System.Windows.Forms.TextBox textBoxAddress;
        private System.Windows.Forms.Button buttonCheckPayment;
        private System.Windows.Forms.Button buttonViewEncryptedFiles;
        private System.Windows.Forms.Timer timerCountDown;
        private System.Windows.Forms.Label labelCountDown;
        private System.Windows.Forms.Label labelFilesToDelete;
    }
}