using ns0;
using ns10;
using ns12;
using ns15;
using ns7;
using ns9;
using System;
using System.Runtime.InteropServices;

namespace ns11
{
	[ClassInterface(ClassInterfaceType.AutoDispatch), ComVisible(true), Guid("ebc25cf6-9120-4283-b972-0e5520d0000D")]
	public sealed class GClass2
	{
		public byte[] byte_0;

		public int int_0;

		public int int_1;

		public long long_0;

		public byte[] byte_1;

		public int int_2;

		public int int_3;

		public long long_1;

		public string string_0;

		internal Class39 class39_0;

		internal Class44 class44_0;

		internal uint uint_0;

		public Enum20 enum20_0 = Enum20.const_8;

		public int int_4 = 15;

		public Enum21 enum21_0;

		public int Adler32
		{
			get
			{
				return (int)this.uint_0;
			}
		}

		public GClass2()
		{
		}

		public GClass2(Enum22 enum22_0)
		{
			if (enum22_0 == Enum22.const_0)
			{
				int num = Class16.smethod_339(this);
				if (num != 0)
				{
					throw new GException0("Cannot initialize for deflate.");
				}
			}
			else
			{
				if (enum22_0 != Enum22.const_1)
				{
					throw new GException0("Invalid ZlibStreamFlavor.");
				}
				int num2 = Class16.smethod_75(this);
				if (num2 != 0)
				{
					throw new GException0("Cannot initialize for inflate.");
				}
			}
		}
	}
}
