using ns12;
using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Text;

namespace ns4
{
	internal sealed class Class73
	{
		private static readonly string string_0;

		private static readonly string string_1;

		private static readonly byte[] byte_0;

		private static readonly Dictionary<int, string> dictionary_0;

		private static readonly bool bool_0;

		private static readonly int int_0;

		public static string smethod_0(int int_1)
		{
			int_1 -= Class73.int_0;
			if (Class73.bool_0)
			{
				string text;
				Class73.dictionary_0.TryGetValue(int_1, out text);
				if (text != null)
				{
					return text;
				}
			}
			int index = int_1;
			int num = (int)Class73.byte_0[index++];
			int num2;
			if ((num & 128) == 0)
			{
				num2 = num;
				if (num2 == 0)
				{
					return string.Empty;
				}
			}
			else if ((num & 64) == 0)
			{
				num2 = ((num & 63) << 8) + (int)Class73.byte_0[index++];
			}
			else
			{
				num2 = ((num & 31) << 24) + ((int)Class73.byte_0[index++] << 16) + ((int)Class73.byte_0[index++] << 8) + (int)Class73.byte_0[index++];
			}
			string result;
			try
			{
				byte[] array = Convert.FromBase64String(Encoding.UTF8.GetString(Class73.byte_0, index, num2));
				string text2 = string.Intern(Encoding.UTF8.GetString(array, 0, array.Length));
				if (Class73.bool_0)
				{
					try
					{
						Class73.dictionary_0.Add(int_1, text2);
					}
					catch
					{
					}
				}
				result = text2;
			}
			catch
			{
				result = null;
			}
			return result;
		}

		static Class73()
		{
			Class73.string_0 = "1";
			Class73.string_1 = "79";
			Class73.byte_0 = null;
			Class73.bool_0 = false;
			Class73.int_0 = 0;
			if (Class73.string_0 == "1")
			{
				Class73.bool_0 = true;
				Class73.dictionary_0 = new Dictionary<int, string>();
			}
			Class73.int_0 = Convert.ToInt32(Class73.string_1);
			Assembly executingAssembly = Assembly.GetExecutingAssembly();
			using (Stream manifestResourceStream = executingAssembly.GetManifestResourceStream("{94f40ab7-234c-497f-bdbf-cddb2222c656}"))
			{
				int num = Convert.ToInt32(manifestResourceStream.Length);
				byte[] buffer = new byte[num];
				manifestResourceStream.Read(buffer, 0, num);
				Class73.byte_0 = Class16.smethod_679(buffer);
				manifestResourceStream.Close();
			}
		}
	}
}
