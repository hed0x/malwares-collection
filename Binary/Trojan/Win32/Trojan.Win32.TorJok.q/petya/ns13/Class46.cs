using ns11;
using ns12;
using ns15;
using System;

namespace ns13
{
	internal sealed class Class46
	{
		public byte[] byte_0;

		public byte[] byte_1;

		public int int_0;

		public int int_1;

		public int int_2;

		public int int_3;

		public int int_4;

		public GClass2 gclass2_0;

		public Class46(int int_5, Enum20 enum20_0, Enum21 enum21_0, int int_6)
		{
			this.byte_0 = new byte[int_5];
			int num = int_5 + (int_5 / 32768 + 1) * 5 * 2;
			this.byte_1 = new byte[num];
			this.gclass2_0 = new GClass2();
			Class16.smethod_513(enum20_0, this.gclass2_0, false);
			this.gclass2_0.byte_1 = this.byte_1;
			this.gclass2_0.byte_0 = this.byte_0;
			this.int_1 = int_6;
		}
	}
}
