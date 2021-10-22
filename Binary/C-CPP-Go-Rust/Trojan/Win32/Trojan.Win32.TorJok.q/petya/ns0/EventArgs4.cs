using ns15;
using ns4;
using ns8;
using System;

namespace ns0
{
	internal sealed class EventArgs4 : EventArgs0
	{
		private int int_1;

		internal string string_1;

		internal EventArgs4(string string_2, bool bool_1, int int_2, int int_3, GClass0 gclass0_1, string string_3) : base(string_2, bool_1 ? Enum6.const_17 : Enum6.const_18)
		{
			this.int_0 = int_2;
			this.gclass0_0 = gclass0_1;
			this.int_1 = int_3;
			this.string_1 = string_3;
		}

		internal EventArgs4(string string_2, Enum6 enum6_1) : base(string_2, enum6_1)
		{
		}

		internal EventArgs4()
		{
		}
	}
}
