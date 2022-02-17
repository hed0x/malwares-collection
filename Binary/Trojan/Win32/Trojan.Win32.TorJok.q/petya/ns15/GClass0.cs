using Ionic.Zip;
using ns1;
using ns10;
using ns12;
using ns13;
using ns14;
using ns2;
using ns3;
using ns4;
using ns6;
using ns7;
using ns8;
using ns9;
using System;
using System.IO;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;

namespace ns15
{
	[ClassInterface(ClassInterfaceType.AutoDispatch), ComVisible(true), Guid("ebc25cf6-9120-4283-b972-0e5520d00004")]
	public sealed class GClass0
	{
		internal sealed class Class23
		{
			internal static Regex regex_0 = new Regex(" \\(copy (\\d+)\\)$");

			internal static int int_0 = 0;
		}

		internal delegate T Delegate4<T>();

		[CompilerGenerated]
		internal sealed class Class24
		{
			public int int_0;

			public byte[] byte_0;

			public int int_1;

			public long long_0;

			public long method_0()
			{
				if (this.int_0 < 8)
				{
					throw new BadReadException(string.Format("  Missing data for ZIP64 extra field, position 0x{0:X16}", this.long_0));
				}
				long result = BitConverter.ToInt64(this.byte_0, this.int_1);
				this.int_1 += 8;
				this.int_0 -= 8;
				return result;
			}
		}

		[CompilerGenerated]
		internal sealed class Class25
		{
			public int int_0;

			public GClass0 gclass0_0;

			public byte[] byte_0;

			public int int_1;

			public DateTime method_0()
			{
				int num = BitConverter.ToInt32(this.byte_0, this.int_1);
				this.int_1 += 4;
				this.int_0 -= 4;
				return GClass0.dateTime_4.AddSeconds((double)num);
			}
		}

		internal short short_0;

		internal short short_1;

		internal int int_0;

		internal short short_2;

		internal short short_3;

		internal short short_4;

		internal Class22 class22_0;

		internal Class22 class22_1;

		internal Class20 class20_0;

		internal Class20 class20_1;

		internal short short_5;

		internal DateTime dateTime_0;

		internal DateTime dateTime_1;

		internal DateTime dateTime_2;

		internal DateTime dateTime_3;

		internal bool bool_0;

		internal bool bool_1 = true;

		internal bool bool_2;

		internal bool bool_3 = true;

		internal string string_0;

		internal string string_1;

		internal short short_6;

		internal short short_7;

		internal short short_8;

		internal short short_9;

		internal Enum20 enum20_0;

		internal string string_2;

		internal bool bool_4;

		internal byte[] byte_0;

		internal long long_0;

		internal long long_1;

		internal long long_2;

		internal int int_1;

		internal bool bool_5;

		internal int int_2;

		internal byte[] byte_1;

		internal bool bool_6;

		internal bool bool_7;

		internal bool bool_8;

		internal bool bool_9;

		internal uint uint_0;

		internal static Encoding encoding_0 = Encoding.GetEncoding("IBM437");

		internal Encoding encoding_1;

		internal Class8 class8_0;

		internal long long_3 = -1L;

		internal byte[] byte_2;

		internal long long_4;

		internal long long_5;

		internal long long_6;

		internal int int_3;

		internal int int_4;

		internal bool bool_10;

		internal uint uint_1;

		internal string string_3;

		internal Enum0 enum0_0;

		internal Enum2 enum2_0;

		internal Enum2 enum2_1;

		internal byte[] byte_3;

		internal Stream stream_0;

		internal Stream stream_1;

		internal long? nullable_0;

		private bool bool_11;

		internal bool bool_12;

		internal bool bool_13;

		internal bool? nullable_1;

		internal bool? nullable_2;

		internal bool bool_14;

		internal Enum7 enum7_0;

		internal static DateTime dateTime_4 = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);

		internal static DateTime dateTime_5 = DateTime.FromFileTimeUtc(0L);

		internal static DateTime dateTime_6 = new DateTime(1, 1, 1, 0, 0, 0, DateTimeKind.Utc);

		internal Delegate0 delegate0_0;

		internal Delegate1 delegate1_0;

		internal Delegate2 delegate2_0;

		internal Stream stream_2;

		internal int int_5;

		private object object_0 = new object();

		[CompilerGenerated]
		private Enum3 enum3_0;

		[CompilerGenerated]
		private Enum1 enum1_0;

		[CompilerGenerated]
		private Delegate3 delegate3_0;

		[CompilerGenerated]
		private Encoding encoding_2;

		[CompilerGenerated]
		private Encoding encoding_3;

		[CompilerGenerated]
		private Enum9 enum9_0;

		internal bool AttributesIndicateDirectory
		{
			get
			{
				return this.short_1 == 0 && (this.int_0 & 16) == 16;
			}
		}

		public string Info
		{
			get
			{
				StringBuilder stringBuilder = new StringBuilder();
				stringBuilder.Append(string.Format("          ZipEntry: {0}\n", this.string_1)).Append(string.Format("   Version Made By: {0}\n", this.short_0)).Append(string.Format(" Needed to extract: {0}\n", this.short_6));
				if (this.bool_4)
				{
					stringBuilder.Append("        Entry type: directory\n");
				}
				else
				{
					stringBuilder.Append(string.Format("         File type: {0}\n", this.bool_14 ? "text" : "binary")).Append(string.Format("       Compression: {0}\n", (CompressionMethod)this.short_8)).Append(string.Format("        Compressed: 0x{0:X}\n", this.long_0)).Append(string.Format("      Uncompressed: 0x{0:X}\n", this.long_2)).Append(string.Format("             CRC32: 0x{0:X8}\n", this.int_2));
				}
				stringBuilder.Append(string.Format("       Disk Number: {0}\n", this.uint_0));
				if (this.long_4 > (long)((ulong)-1))
				{
					stringBuilder.Append(string.Format("   Relative Offset: 0x{0:X16}\n", this.long_4));
				}
				else
				{
					stringBuilder.Append(string.Format("   Relative Offset: 0x{0:X8}\n", this.long_4));
				}
				stringBuilder.Append(string.Format("         Bit Field: 0x{0:X4}\n", this.short_7)).Append(string.Format("        Encrypted?: {0}\n", this.bool_8)).Append(string.Format("          Timeblob: 0x{0:X8}\n", this.int_1)).Append(string.Format("              Time: {0}\n", Class16.smethod_324(this.int_1)));
				stringBuilder.Append(string.Format("         Is Zip64?: {0}\n", this.bool_10));
				if (!string.IsNullOrEmpty(this.string_2))
				{
					stringBuilder.Append(string.Format("           Comment: {0}\n", this.string_2));
				}
				stringBuilder.Append("\n");
				return stringBuilder.ToString();
			}
		}

		public DateTime LastModified
		{
			get
			{
				return this.dateTime_0.ToLocalTime();
			}
			set
			{
				this.dateTime_0 = ((value.Kind == DateTimeKind.Unspecified) ? DateTime.SpecifyKind(value, DateTimeKind.Local) : value.ToLocalTime());
				this.dateTime_1 = Class16.smethod_30(this.dateTime_0).ToUniversalTime();
				this.bool_6 = true;
			}
		}

		internal int BufferSize
		{
			get
			{
				return Class16.smethod_241(this.class8_0);
			}
		}

		public DateTime ModifiedTime
		{
			get
			{
				return this.dateTime_1;
			}
			set
			{
				DateTime dateTime = this.dateTime_3;
				DateTime dateTime2 = this.dateTime_2;
				Class16.smethod_144(dateTime, value, dateTime2, this);
			}
		}

		public DateTime AccessedTime
		{
			get
			{
				return this.dateTime_2;
			}
			set
			{
				DateTime dateTime = this.dateTime_3;
				DateTime dateTime2 = this.dateTime_1;
				Class16.smethod_144(dateTime, dateTime2, value, this);
			}
		}

		public DateTime CreationTime
		{
			get
			{
				return this.dateTime_3;
			}
			set
			{
				DateTime dateTime = this.dateTime_2;
				DateTime dateTime2 = this.dateTime_1;
				Class16.smethod_144(value, dateTime2, dateTime, this);
			}
		}

		public bool EmitTimesInWindowsFormatWhenSaving
		{
			get
			{
				return this.bool_1;
			}
			set
			{
				this.bool_1 = value;
				this.bool_6 = true;
			}
		}

		public bool EmitTimesInUnixFormatWhenSaving
		{
			get
			{
				return this.bool_2;
			}
			set
			{
				this.bool_2 = value;
				this.bool_6 = true;
			}
		}

		public Enum7 Timestamp
		{
			get
			{
				return this.enum7_0;
			}
		}

		public FileAttributes Attributes
		{
			get
			{
				return (FileAttributes)this.int_0;
			}
			set
			{
				this.int_0 = (int)value;
				this.short_0 = 45;
				this.bool_6 = true;
			}
		}

		internal string LocalFileName
		{
			get
			{
				return this.string_0;
			}
		}

		public string FileName
		{
			get
			{
				return this.string_1;
			}
			set
			{
				if (this.class8_0.gclass1_0 == null)
				{
					throw new ZipException("Cannot rename; this is not supported in ZipOutputStream/ZipInputStream.");
				}
				if (string.IsNullOrEmpty(value))
				{
					throw new ZipException("The FileName must be non empty and non-null.");
				}
				string b = Class16.smethod_504(value, null);
				if (this.string_1 == b)
				{
					return;
				}
				Class16.smethod_16(this.class8_0.gclass1_0, this);
				Class16.smethod_634(b, this, this.class8_0.gclass1_0);
				this.string_1 = b;
				this.class8_0.gclass1_0.bool_5 = true;
				this.bool_6 = true;
			}
		}

		public Stream InputStream
		{
			get
			{
				return this.stream_1;
			}
			set
			{
				if (this.enum0_0 != Enum0.const_2)
				{
					throw new ZipException("You must not set the input stream for this entry.");
				}
				this.bool_11 = true;
				this.stream_1 = value;
			}
		}

		public bool InputStreamWasJitProvided
		{
			get
			{
				return this.bool_11;
			}
		}

		public Enum0 Source
		{
			get
			{
				return this.enum0_0;
			}
		}

		public short VersionNeeded
		{
			get
			{
				return this.short_6;
			}
		}

		public string Comment
		{
			get
			{
				return this.string_2;
			}
			set
			{
				this.string_2 = value;
				this.bool_6 = true;
			}
		}

		public bool? RequiresZip64
		{
			get
			{
				return this.nullable_1;
			}
		}

		public bool? OutputUsedZip64
		{
			get
			{
				return this.nullable_2;
			}
		}

		public short BitField
		{
			get
			{
				return this.short_7;
			}
		}

		public CompressionMethod CompressionMethod
		{
			get
			{
				return (CompressionMethod)this.short_8;
			}
			set
			{
				if (value == (CompressionMethod)this.short_8)
				{
					return;
				}
				if (value != CompressionMethod.None && value != CompressionMethod.Deflate && value != CompressionMethod.BZip2)
				{
					throw new InvalidOperationException("Unsupported compression method.");
				}
				this.short_8 = (short)value;
				if (this.short_8 == 0)
				{
					this.enum20_0 = Enum20.const_0;
				}
				else if (this.enum20_0 == Enum20.const_0)
				{
					this.enum20_0 = Enum20.const_8;
				}
				if (this.class8_0.gclass1_0 != null)
				{
					this.class8_0.gclass1_0.bool_5 = true;
				}
				this.bool_7 = true;
			}
		}

		public Enum20 CompressionLevel
		{
			get
			{
				return this.enum20_0;
			}
			set
			{
				if (this.short_8 != 8 && this.short_8 != 0)
				{
					return;
				}
				if (value == Enum20.const_8 && this.short_8 == 8)
				{
					return;
				}
				this.enum20_0 = value;
				if (value == Enum20.const_0 && this.short_8 == 0)
				{
					return;
				}
				if (this.enum20_0 == Enum20.const_0)
				{
					this.short_8 = 0;
				}
				else
				{
					this.short_8 = 8;
				}
				if (this.class8_0.gclass1_0 != null)
				{
					this.class8_0.gclass1_0.bool_5 = true;
				}
				this.bool_7 = true;
			}
		}

		public long CompressedSize
		{
			get
			{
				return this.long_0;
			}
		}

		public long UncompressedSize
		{
			get
			{
				return this.long_2;
			}
		}

		public double CompressionRatio
		{
			get
			{
				if (this.long_2 == 0L)
				{
					return 0.0;
				}
				return 100.0 * (1.0 - 1.0 * (double)this.long_0 / (1.0 * (double)this.long_2));
			}
		}

		public int Crc
		{
			get
			{
				return this.int_2;
			}
		}

		public bool IsDirectory
		{
			get
			{
				return this.bool_4;
			}
		}

		public bool UsesEncryption
		{
			get
			{
				return this.enum2_1 != Enum2.const_0;
			}
		}

		public Enum2 Encryption
		{
			get
			{
				return this.enum2_0;
			}
			set
			{
				if (value == this.enum2_0)
				{
					return;
				}
				if (value == Enum2.const_4)
				{
					throw new InvalidOperationException("You may not set Encryption to that value.");
				}
				this.enum2_0 = value;
				this.bool_7 = true;
				if (this.class8_0.gclass1_0 != null)
				{
					this.class8_0.gclass1_0.bool_5 = true;
				}
			}
		}

		public string Password
		{
			private get
			{
				return this.string_3;
			}
			set
			{
				this.string_3 = value;
				if (this.string_3 == null)
				{
					this.enum2_0 = Enum2.const_0;
					return;
				}
				if (this.enum0_0 == Enum0.const_3 && !this.bool_8)
				{
					this.bool_7 = true;
				}
				if (this.enum2_0 == Enum2.const_0)
				{
					this.enum2_0 = Enum2.const_1;
				}
			}
		}

		internal bool IsChanged
		{
			get
			{
				return this.bool_7 | this.bool_6;
			}
		}

		public Enum3 ExtractExistingFile
		{
			get;
			set;
		}

		public Enum1 ZipErrorAction
		{
			get;
			set;
		}

		public bool IncludedInMostRecentSave
		{
			get
			{
				return !this.bool_9;
			}
		}

		public Delegate3 SetCompression
		{
			get;
			set;
		}

		public bool UseUnicodeAsNecessary
		{
			get
			{
				return this.AlternateEncoding == Encoding.GetEncoding("UTF-8") && this.AlternateEncodingUsage == Enum9.const_2;
			}
			set
			{
				if (value)
				{
					this.AlternateEncoding = Encoding.GetEncoding("UTF-8");
					this.AlternateEncodingUsage = Enum9.const_2;
					return;
				}
				this.AlternateEncoding = GClass1.encoding_1;
				this.AlternateEncodingUsage = Enum9.const_0;
			}
		}

		public Encoding ProvisionalAlternateEncoding
		{
			get;
			set;
		}

		public Encoding AlternateEncoding
		{
			get;
			set;
		}

		public Enum9 AlternateEncodingUsage
		{
			get;
			set;
		}

		public bool IsText
		{
			get
			{
				return this.bool_14;
			}
			set
			{
				this.bool_14 = value;
			}
		}

		internal Stream ArchiveStream
		{
			get
			{
				if (this.stream_0 == null)
				{
					if (this.class8_0.gclass1_0 != null)
					{
						GClass1 gclass1_ = this.class8_0.gclass1_0;
						gclass1_.method_0(false);
						this.stream_0 = Class16.smethod_148(this.uint_0, gclass1_);
					}
					else
					{
						this.stream_0 = this.class8_0.stream0_0.stream_0;
					}
				}
				return this.stream_0;
			}
		}

		internal long FileDataPosition
		{
			get
			{
				if (this.long_3 == -1L)
				{
					Class16.smethod_37(this);
				}
				return this.long_3;
			}
		}

		internal int LengthOfHeader
		{
			get
			{
				if (this.int_3 == 0)
				{
					Class16.smethod_37(this);
				}
				return this.int_3;
			}
		}

		internal string UnsupportedAlgorithm
		{
			get
			{
				string result = string.Empty;
				uint num = this.uint_1;
				if (num <= 26128u)
				{
					if (num <= 26115u)
					{
						if (num == 0u)
						{
							result = "--";
							return result;
						}
						switch (num)
						{
						case 26113u:
							result = "DES";
							return result;
						case 26114u:
							result = "RC2";
							return result;
						case 26115u:
							result = "3DES-168";
							return result;
						}
					}
					else
					{
						if (num == 26121u)
						{
							result = "3DES-112";
							return result;
						}
						switch (num)
						{
						case 26126u:
							result = "PKWare AES128";
							return result;
						case 26127u:
							result = "PKWare AES192";
							return result;
						case 26128u:
							result = "PKWare AES256";
							return result;
						}
					}
				}
				else if (num <= 26401u)
				{
					if (num == 26370u)
					{
						result = "RC2";
						return result;
					}
					switch (num)
					{
					case 26400u:
						result = "Blowfish";
						return result;
					case 26401u:
						result = "Twofish";
						return result;
					}
				}
				else
				{
					if (num == 26625u)
					{
						result = "RC4";
						return result;
					}
					if (num != 65535u)
					{
					}
				}
				result = string.Format("Unknown (0x{0:X4})", this.uint_1);
				return result;
			}
		}

		internal string UnsupportedCompressionMethod
		{
			get
			{
				string result = string.Empty;
				int num = (int)this.short_8;
				if (num <= 14)
				{
					switch (num)
					{
					case 0:
						result = "Store";
						return result;
					case 1:
						result = "Shrink";
						return result;
					default:
						switch (num)
						{
						case 8:
							result = "DEFLATE";
							return result;
						case 9:
							result = "Deflate64";
							return result;
						case 12:
							result = "BZIP2";
							return result;
						case 14:
							result = "LZMA";
							return result;
						}
						break;
					}
				}
				else
				{
					if (num == 19)
					{
						result = "LZ77";
						return result;
					}
					if (num == 98)
					{
						result = "PPMd";
						return result;
					}
				}
				result = string.Format("Unknown (0x{0:X4})", this.short_8);
				return result;
			}
		}

		public GClass0()
		{
			this.short_8 = 8;
			this.enum20_0 = Enum20.const_8;
			this.enum2_0 = Enum2.const_0;
			this.enum0_0 = Enum0.const_0;
			this.AlternateEncoding = Encoding.GetEncoding("IBM437");
			this.AlternateEncodingUsage = Enum9.const_0;
		}

		public override string ToString()
		{
			return string.Format("ZipEntry::{0}", this.string_1);
		}

		private void method_0(string string_4, object[] object_1)
		{
			lock (this.object_0)
			{
				int hashCode = Thread.CurrentThread.GetHashCode();
				Console.ForegroundColor = hashCode % 8 + ConsoleColor.DarkGray;
				Console.Write("{0:000} ZipEntry.Write ", hashCode);
				Console.WriteLine(string_4, object_1);
				Console.ResetColor();
			}
		}
	}
}
