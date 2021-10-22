using ns0;
using ns12;
using ns7;
using System;
using System.Runtime.CompilerServices;

namespace ns6
{
	internal sealed class Class33
	{
		internal sealed class Class34
		{
			public readonly bool[] bool_0 = new bool[256];

			public readonly byte[] byte_0 = new byte[256];

			public readonly int[] int_0 = new int[Class36.int_3];

			public readonly byte[] byte_1 = new byte[Class36.int_8];

			public readonly byte[] byte_2 = new byte[Class36.int_8];

			public readonly byte[] byte_3 = new byte[256];

			public byte[][] byte_4;

			public int[][] int_1;

			public readonly int[] int_2 = new int[Class36.int_5];

			public readonly short[] short_0 = new short[Class36.int_5];

			public int[][] int_3;

			public readonly byte[] byte_5 = new byte[Class36.int_5];

			public readonly bool[] bool_1 = new bool[16];

			public readonly int[] int_4 = new int[Class36.int_10];

			public readonly int[] int_5 = new int[Class36.int_10];

			public readonly int[] int_6 = new int[Class36.int_10];

			public readonly int[] int_7 = new int[256];

			public readonly int[] int_8 = new int[256];

			public readonly bool[] bool_2 = new bool[256];

			public int[] int_9 = new int[Class36.int_3 + 2];

			public int[] int_10 = new int[Class36.int_3 * 2];

			public int[] int_11 = new int[Class36.int_3 * 2];

			public readonly int[] int_12 = new int[65537];

			public byte[] byte_6;

			public int[] int_13;

			public char[] char_0;

			public char[] char_1;

			public Class34(int int_14)
			{
				int num = int_14 * Class36.int_0;
				this.byte_6 = new byte[num + 1 + Class36.int_9];
				this.int_13 = new int[num];
				this.char_0 = new char[2 * num];
				this.char_1 = this.char_0;
				this.byte_4 = Class36.smethod_0<byte>(Class36.int_5, Class36.int_3);
				this.int_1 = Class36.smethod_0<int>(Class36.int_5, Class36.int_3);
				this.int_3 = Class36.smethod_0<int>(Class36.int_5, Class36.int_3);
			}
		}

		private int int_0;

		internal int int_1 = -1;

		internal int int_2;

		internal int int_3;

		internal int int_4;

		internal Class33.Class34 class34_0;

		internal readonly GClass3 gclass3_0 = new GClass3(true);

		internal Class32 class32_0;

		internal int int_5;

		internal int int_6;

		internal int int_7;

		internal bool bool_0;

		internal bool bool_1;

		internal int int_8;

		internal int int_9;

		internal int int_10;

		internal static readonly int int_11 = 2097152;

		internal static readonly int int_12 = ~Class33.int_11;

		internal static readonly byte byte_0 = 15;

		internal static readonly byte byte_1 = 0;

		internal static readonly int int_13 = 20;

		internal static readonly int int_14 = 10;

		internal static readonly int int_15 = 30;

		internal static readonly int[] int_16 = new int[]
		{
			1,
			4,
			13,
			40,
			121,
			364,
			1093,
			3280,
			9841,
			29524,
			88573,
			265720,
			797161,
			2391484
		};

		[CompilerGenerated]
		private uint uint_0;

		public Class33(Class32 class32_1, int int_17)
		{
			this.int_0 = int_17;
			this.class32_0 = class32_1;
			this.int_4 = int_17 * Class36.int_0 - 20;
			this.class34_0 = new Class33.Class34(int_17);
			Class16.smethod_234(this);
		}

		[CompilerGenerated]
		public uint method_0()
		{
			return this.uint_0;
		}

		[CompilerGenerated]
		internal void method_1(uint uint_1)
		{
			this.uint_0 = uint_1;
		}
	}
}
