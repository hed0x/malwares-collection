using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Reflection;
using System.Text;

namespace ns7
{
	internal sealed class Class69
	{
		internal struct Struct16
		{
			public string string_0;

			public Version version_0;

			public string string_1;

			public string string_2;

			public string method_0(bool bool_0)
			{
				StringBuilder stringBuilder = new StringBuilder();
				stringBuilder.Append(this.string_0);
				if (bool_0 && this.version_0 != null)
				{
					stringBuilder.Append(", Version=");
					stringBuilder.Append(this.version_0);
				}
				stringBuilder.Append(", Culture=");
				stringBuilder.Append((this.string_1.Length == 0) ? "neutral" : this.string_1);
				stringBuilder.Append(", PublicKeyToken=");
				stringBuilder.Append((this.string_2.Length == 0) ? "null" : this.string_2);
				return stringBuilder.ToString();
			}

			public Struct16(string assemblyFullName)
			{
				this.version_0 = null;
				this.string_1 = string.Empty;
				this.string_2 = string.Empty;
				this.string_0 = string.Empty;
				string[] array = assemblyFullName.Split(new char[]
				{
					','
				});
				for (int i = 0; i < array.Length; i++)
				{
					string text = array[i];
					string text2 = text.Trim();
					if (text2.StartsWith("Version="))
					{
						this.version_0 = new Version(text2.Substring(8));
					}
					else if (text2.StartsWith("Culture="))
					{
						this.string_1 = text2.Substring(8);
						if (this.string_1 == "neutral")
						{
							this.string_1 = string.Empty;
						}
					}
					else if (text2.StartsWith("PublicKeyToken="))
					{
						this.string_2 = text2.Substring(15);
						if (this.string_2 == "null")
						{
							this.string_2 = string.Empty;
						}
					}
					else
					{
						this.string_0 = text2;
					}
				}
			}
		}

		internal const string string_0 = "{71461f04-2faa-4bb9-a0dd-28a79101b599}";

		private const int int_0 = 4;

		internal static Dictionary<string, Assembly> dictionary_0 = new Dictionary<string, Assembly>();

		internal static bool IsWebApplication
		{
			get
			{
				try
				{
					string a = Process.GetCurrentProcess().MainModule.ModuleName.ToLower();
					if (a == "w3wp.exe")
					{
						bool result = true;
						return result;
					}
					if (a == "aspnet_wp.exe")
					{
						bool result = true;
						return result;
					}
				}
				catch
				{
				}
				return false;
			}
		}
	}
}
