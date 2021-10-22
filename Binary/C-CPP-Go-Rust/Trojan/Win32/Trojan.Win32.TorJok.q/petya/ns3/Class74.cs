using ns12;
using System;
using System.IO;

namespace ns3
{
	internal static class Class74
	{
		internal sealed class Class75
		{
			internal static readonly int[] int_0 = new int[]
			{
				3,
				4,
				5,
				6,
				7,
				8,
				9,
				10,
				11,
				13,
				15,
				17,
				19,
				23,
				27,
				31,
				35,
				43,
				51,
				59,
				67,
				83,
				99,
				115,
				131,
				163,
				195,
				227,
				258
			};

			internal static readonly int[] int_1 = new int[]
			{
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				1,
				1,
				1,
				1,
				2,
				2,
				2,
				2,
				3,
				3,
				3,
				3,
				4,
				4,
				4,
				4,
				5,
				5,
				5,
				5,
				0
			};

			internal static readonly int[] int_2 = new int[]
			{
				1,
				2,
				3,
				4,
				5,
				7,
				9,
				13,
				17,
				25,
				33,
				49,
				65,
				97,
				129,
				193,
				257,
				385,
				513,
				769,
				1025,
				1537,
				2049,
				3073,
				4097,
				6145,
				8193,
				12289,
				16385,
				24577
			};

			internal static readonly int[] int_3 = new int[]
			{
				0,
				0,
				0,
				0,
				1,
				1,
				2,
				2,
				3,
				3,
				4,
				4,
				5,
				5,
				6,
				6,
				7,
				7,
				8,
				8,
				9,
				9,
				10,
				10,
				11,
				11,
				12,
				12,
				13,
				13
			};

			internal int int_4;

			internal int int_5;

			internal int int_6;

			internal int int_7;

			internal int int_8;

			internal bool bool_0;

			internal Class74.Class76 class76_0;

			internal Class74.Class77 class77_0;

			internal Class74.Class79 class79_0;

			internal Class74.Class78 class78_0;

			internal Class74.Class78 class78_1;

			public Class75(byte[] byte_0)
			{
				this.class76_0 = new Class74.Class76();
				this.class77_0 = new Class74.Class77();
				this.int_4 = 2;
				Class16.smethod_81(byte_0.Length, 0, this.class76_0, byte_0);
			}
		}

		internal sealed class Class76
		{
			internal byte[] byte_0;

			internal int int_0;

			internal int int_1;

			internal uint uint_0;

			internal int int_2;
		}

		internal sealed class Class77
		{
			internal byte[] byte_0 = new byte[32768];

			internal int int_0;

			internal int int_1;
		}

		internal sealed class Class78
		{
			internal short[] short_0;

			public static readonly Class74.Class78 class78_0;

			public static readonly Class74.Class78 class78_1;

			static Class78()
			{
				byte[] array = new byte[288];
				int i = 0;
				while (i < 144)
				{
					array[i++] = 8;
				}
				while (i < 256)
				{
					array[i++] = 9;
				}
				while (i < 280)
				{
					array[i++] = 7;
				}
				while (i < 288)
				{
					array[i++] = 8;
				}
				Class74.Class78.class78_0 = new Class74.Class78(array);
				array = new byte[32];
				i = 0;
				while (i < 32)
				{
					array[i++] = 5;
				}
				Class74.Class78.class78_1 = new Class74.Class78(array);
			}

			public Class78(byte[] byte_0)
			{
				Class16.smethod_618(this, byte_0);
			}
		}

		internal sealed class Class79
		{
			internal static readonly int[] int_0 = new int[]
			{
				3,
				3,
				11
			};

			internal static readonly int[] int_1 = new int[]
			{
				2,
				3,
				7
			};

			internal byte[] byte_0;

			internal byte[] byte_1;

			internal Class74.Class78 class78_0;

			internal int int_2;

			internal int int_3;

			internal int int_4;

			internal int int_5;

			internal int int_6;

			internal int int_7;

			internal byte byte_2;

			internal int int_8;

			internal static readonly int[] int_9 = new int[]
			{
				16,
				17,
				18,
				0,
				8,
				7,
				9,
				6,
				10,
				5,
				11,
				4,
				12,
				3,
				13,
				2,
				14,
				1,
				15
			};
		}

		internal sealed class Class80
		{
			private static readonly int[] int_0;

			internal static readonly byte[] byte_0;

			private static readonly short[] short_0;

			private static readonly byte[] byte_1;

			private static readonly short[] short_1;

			private static readonly byte[] byte_2;

			static Class80()
			{
				Class74.Class80.int_0 = new int[]
				{
					16,
					17,
					18,
					0,
					8,
					7,
					9,
					6,
					10,
					5,
					11,
					4,
					12,
					3,
					13,
					2,
					14,
					1,
					15
				};
				Class74.Class80.byte_0 = new byte[]
				{
					0,
					8,
					4,
					12,
					2,
					10,
					6,
					14,
					1,
					9,
					5,
					13,
					3,
					11,
					7,
					15
				};
				Class74.Class80.short_0 = new short[286];
				Class74.Class80.byte_1 = new byte[286];
				int i = 0;
				while (i < 144)
				{
					Class74.Class80.short_0[i] = Class16.smethod_196(48 + i << 8);
					Class74.Class80.byte_1[i++] = 8;
				}
				while (i < 256)
				{
					Class74.Class80.short_0[i] = Class16.smethod_196(256 + i << 7);
					Class74.Class80.byte_1[i++] = 9;
				}
				while (i < 280)
				{
					Class74.Class80.short_0[i] = Class16.smethod_196(-256 + i << 9);
					Class74.Class80.byte_1[i++] = 7;
				}
				while (i < 286)
				{
					Class74.Class80.short_0[i] = Class16.smethod_196(-88 + i << 8);
					Class74.Class80.byte_1[i++] = 8;
				}
				Class74.Class80.short_1 = new short[30];
				Class74.Class80.byte_2 = new byte[30];
				for (i = 0; i < 30; i++)
				{
					Class74.Class80.short_1[i] = Class16.smethod_196(i << 11);
					Class74.Class80.byte_2[i] = 5;
				}
			}
		}

		internal sealed class Stream14 : MemoryStream
		{
			public Stream14(byte[] byte_0) : base(byte_0, false)
			{
			}
		}
	}
}
