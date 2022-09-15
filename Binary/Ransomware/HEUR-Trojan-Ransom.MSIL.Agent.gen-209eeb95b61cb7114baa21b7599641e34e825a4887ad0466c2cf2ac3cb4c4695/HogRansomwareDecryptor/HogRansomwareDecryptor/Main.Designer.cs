namespace HogRansomwareDecryptor
{
	// Token: 0x02000002 RID: 2
	public partial class Main : global::System.Windows.Forms.Form
	{
		// Token: 0x0600000B RID: 11 RVA: 0x000024F0 File Offset: 0x000006F0
		protected override void Dispose(bool disposing)
		{
			if (disposing && this.components != null)
			{
				this.components.Dispose();
			}
			base.Dispose(disposing);
		}

		// Token: 0x0600000C RID: 12 RVA: 0x00002510 File Offset: 0x00000710
		private void InitializeComponent()
		{
			global::System.ComponentModel.ComponentResourceManager componentResourceManager = new global::System.ComponentModel.ComponentResourceManager(typeof(global::HogRansomwareDecryptor.Main));
			this.Msg = new global::System.Windows.Forms.Label();
			this.VisitInvite = new global::System.Windows.Forms.LinkLabel();
			this.DecryptBtn = new global::System.Windows.Forms.Button();
			this.Token = new global::System.Windows.Forms.TextBox();
			this.HideToken = new global::System.Windows.Forms.CheckBox();
			this.OpenTutorial = new global::System.Windows.Forms.LinkLabel();
			this.label2 = new global::System.Windows.Forms.Label();
			base.SuspendLayout();
			this.Msg.AutoSize = true;
			this.Msg.Font = new global::System.Drawing.Font("Arial", 18f, global::System.Drawing.FontStyle.Bold, global::System.Drawing.GraphicsUnit.Point, 0);
			this.Msg.ForeColor = global::System.Drawing.Color.Silver;
			this.Msg.Location = new global::System.Drawing.Point(12, 9);
			this.Msg.Name = "Msg";
			this.Msg.Size = new global::System.Drawing.Size(897, 319);
			this.Msg.TabIndex = 0;
			this.Msg.Text = componentResourceManager.GetString("Msg.Text");
			this.VisitInvite.AutoSize = true;
			this.VisitInvite.Font = new global::System.Drawing.Font("Arial", 24f, global::System.Drawing.FontStyle.Bold, global::System.Drawing.GraphicsUnit.Point, 0);
			this.VisitInvite.LinkColor = global::System.Drawing.Color.Aqua;
			this.VisitInvite.Location = new global::System.Drawing.Point(12, 404);
			this.VisitInvite.Name = "VisitInvite";
			this.VisitInvite.Size = new global::System.Drawing.Size(246, 37);
			this.VisitInvite.TabIndex = 1;
			this.VisitInvite.TabStop = true;
			this.VisitInvite.Text = "Discord Server";
			this.VisitInvite.LinkClicked += new global::System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.VisitInvite_LinkClicked);
			this.DecryptBtn.FlatStyle = global::System.Windows.Forms.FlatStyle.Flat;
			this.DecryptBtn.Font = new global::System.Drawing.Font("Arial", 18f, global::System.Drawing.FontStyle.Bold, global::System.Drawing.GraphicsUnit.Point, 0);
			this.DecryptBtn.ForeColor = global::System.Drawing.Color.Silver;
			this.DecryptBtn.Location = new global::System.Drawing.Point(639, 396);
			this.DecryptBtn.Name = "DecryptBtn";
			this.DecryptBtn.Size = new global::System.Drawing.Size(256, 42);
			this.DecryptBtn.TabIndex = 2;
			this.DecryptBtn.Text = "Decrypt My Files!";
			this.DecryptBtn.UseVisualStyleBackColor = true;
			this.DecryptBtn.Click += new global::System.EventHandler(this.DecryptBtn_Click);
			this.Token.Font = new global::System.Drawing.Font("Arial", 15.75f, global::System.Drawing.FontStyle.Bold, global::System.Drawing.GraphicsUnit.Point, 0);
			this.Token.Location = new global::System.Drawing.Point(161, 349);
			this.Token.MaxLength = 88;
			this.Token.Name = "Token";
			this.Token.Size = new global::System.Drawing.Size(734, 32);
			this.Token.TabIndex = 3;
			this.Token.UseSystemPasswordChar = true;
			this.HideToken.AutoSize = true;
			this.HideToken.Checked = true;
			this.HideToken.CheckState = global::System.Windows.Forms.CheckState.Checked;
			this.HideToken.Font = new global::System.Drawing.Font("Arial", 15.75f, global::System.Drawing.FontStyle.Bold, global::System.Drawing.GraphicsUnit.Point, 0);
			this.HideToken.ForeColor = global::System.Drawing.Color.Silver;
			this.HideToken.Location = new global::System.Drawing.Point(755, 319);
			this.HideToken.Name = "HideToken";
			this.HideToken.Size = new global::System.Drawing.Size(140, 28);
			this.HideToken.TabIndex = 7;
			this.HideToken.Text = "Hide Token";
			this.HideToken.UseVisualStyleBackColor = true;
			this.HideToken.CheckedChanged += new global::System.EventHandler(this.HideToken_CheckedChanged);
			this.OpenTutorial.AutoSize = true;
			this.OpenTutorial.Font = new global::System.Drawing.Font("Arial", 15.75f, global::System.Drawing.FontStyle.Bold, global::System.Drawing.GraphicsUnit.Point, 0);
			this.OpenTutorial.LinkColor = global::System.Drawing.Color.Aqua;
			this.OpenTutorial.Location = new global::System.Drawing.Point(264, 417);
			this.OpenTutorial.Name = "OpenTutorial";
			this.OpenTutorial.Size = new global::System.Drawing.Size(245, 24);
			this.OpenTutorial.TabIndex = 8;
			this.OpenTutorial.TabStop = true;
			this.OpenTutorial.Text = "How do I get my token?";
			this.OpenTutorial.LinkClicked += new global::System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.OpenTutorial_LinkClicked);
			this.label2.AutoSize = true;
			this.label2.Font = new global::System.Drawing.Font("Arial", 18f, global::System.Drawing.FontStyle.Bold, global::System.Drawing.GraphicsUnit.Point, 0);
			this.label2.ForeColor = global::System.Drawing.Color.Silver;
			this.label2.Location = new global::System.Drawing.Point(12, 350);
			this.label2.Name = "label2";
			this.label2.Size = new global::System.Drawing.Size(143, 29);
			this.label2.TabIndex = 9;
			this.label2.Text = "Your token:";
			base.AutoScaleDimensions = new global::System.Drawing.SizeF(6f, 13f);
			base.AutoScaleMode = global::System.Windows.Forms.AutoScaleMode.Font;
			this.BackColor = global::System.Drawing.Color.FromArgb(44, 44, 44);
			base.ClientSize = new global::System.Drawing.Size(907, 450);
			base.Controls.Add(this.label2);
			base.Controls.Add(this.OpenTutorial);
			base.Controls.Add(this.HideToken);
			base.Controls.Add(this.Token);
			base.Controls.Add(this.DecryptBtn);
			base.Controls.Add(this.VisitInvite);
			base.Controls.Add(this.Msg);
			base.FormBorderStyle = global::System.Windows.Forms.FormBorderStyle.FixedDialog;
			base.MaximizeBox = false;
			base.MinimizeBox = false;
			base.Name = "Main";
			base.ShowIcon = false;
			base.StartPosition = global::System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "Hog Ransomware Decryptor";
			base.TopMost = true;
			base.FormClosing += new global::System.Windows.Forms.FormClosingEventHandler(this.Main_FormClosing);
			base.Load += new global::System.EventHandler(this.Main_Load);
			base.ResumeLayout(false);
			base.PerformLayout();
		}

		// Token: 0x04000002 RID: 2
		private global::System.ComponentModel.IContainer components;

		// Token: 0x04000003 RID: 3
		private global::System.Windows.Forms.Label Msg;

		// Token: 0x04000004 RID: 4
		private global::System.Windows.Forms.LinkLabel VisitInvite;

		// Token: 0x04000005 RID: 5
		private global::System.Windows.Forms.Button DecryptBtn;

		// Token: 0x04000006 RID: 6
		private global::System.Windows.Forms.TextBox Token;

		// Token: 0x04000007 RID: 7
		private global::System.Windows.Forms.CheckBox HideToken;

		// Token: 0x04000008 RID: 8
		private global::System.Windows.Forms.LinkLabel OpenTutorial;

		// Token: 0x04000009 RID: 9
		private global::System.Windows.Forms.Label label2;
	}
}
